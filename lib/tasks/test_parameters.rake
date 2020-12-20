namespace :test_parameters do
  desc "To test parameters for smash gg api queries"
  task :launch => :environment do
    tournaments = SmashGgFetching::Tournaments.new.call(place: 'paris', radius: '', game: 'super_smash_bros_ultimate')
    events = tournaments.map do |tournament|
      SmashGgFetching::Events.new(events: tournament.events).call
    end

    pp events
  end
end