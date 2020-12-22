# frozen_string_literal: true

namespace :test_parameters do
  desc 'To test parameters for smash gg api queries'
  task launch: :environment do
    tournaments = SmashGgFetching::Tournaments.new.call(place: 'paris', radius: '', game: 'super_smash_bros_ultimate')

    list_events_per_tournament = tournaments.map do |tournament|
      SmashGgFetching::Events.new(events: tournament.events).call
    end

    # Should add this in specific service
    list_events_per_tournament.each do |list_events|
      list_events.each do |event|
        current_event = Events::EventRepository.new.create(name: event.id.to_s)
        event.matches.each do |match|
          next if match['displayScore'] == 'DQ' || match['displayScore'].nil?

          display_score = Regex::DisplayScore.new.call(expression: match['displayScore'])

          adapted_contract = Matches::Contracts::Adaptators::AdaptedContract.new.call(contract:
                                                                            Matches::Contracts::Match.new.call(
                                                                              player1_name: display_score[:player1_name],
                                                                              player1_score: display_score[:player1_score],
                                                                              player2_name: display_score[:player2_name],
                                                                              player2_score: display_score[:player2_score]
                                                                            ))
          new_match = Matches::Entities::Match.from_contract(contract: adapted_contract)

          adapted_contract = Matches::Contracts::Adaptators::AdaptedContract.new.call(contract:
                                                                                        Matches::Contracts::Player.new.call(
                                                                                          id: Players::PlayerRepository.new.player_id(name: new_match.player1_name),
                                                                                          name: new_match.player1_name,
                                                                                          score: new_match.player1_score
                                                                                        ))
          player1 = Matches::Entities::Player.from_contract(contract: adapted_contract)

          adapted_contract = Matches::Contracts::Adaptators::AdaptedContract.new.call(contract:
                                                                                        Matches::Contracts::Player.new.call(
                                                                                          id: Players::PlayerRepository.new.player_id(name: new_match.player2_name),
                                                                                          name: new_match.player2_name,
                                                                                          score: new_match.player2_score
                                                                                        ))
          player2 = Matches::Entities::Player.from_contract(contract: adapted_contract)

          adapted_contract = Matches::Contracts::Adaptators::AdaptedContract.new.call(contract:
                                                                                        Matches::Contracts::Result.new.call(
                                                                                          winner_id: Matches::PlayerRole.new(player1: player1, player2: player2).winner,
                                                                                          looser_id: Matches::PlayerRole.new(player1: player1, player2: player2).looser
                                                                                        ))

          match_result = Matches::Entities::Result.from_contract(contract: adapted_contract)
          current_match = Matches::MatchRepository.new.create(event_id: current_event.id, winner_id: match_result.winner_id, looser_id: match_result.looser_id)

          consequences = Matches::Consequences.new(result: match_result).call
          Elos::EloRepository.new.create(player_id: match_result.winner_id, level: consequences[:winner], match_id: current_match.id)
          Elos::EloRepository.new.create(player_id: match_result.looser_id, level: consequences[:looser], match_id: current_match.id)
        end
      end
    end
  end
end
