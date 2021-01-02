# frozen_string_literal: true

namespace :scheduler do
  desc 'Those tasks are called by the Heroku scheduler add-on'
  task update_tournaments: %i[
    update_paris_smbu
    update_paris_tekken7
    update_paris_dead_or_alive6
    update_paris_mortal_kombat11
  ] do
    puts 'Tournaments for Paris are done'
  end

  task update_paris_smbu: :environment do
    puts 'Updating paris smbu...'
    UpdateTournamentsJob
      .set(queue: 'super_smash_bros_ultimate')
      .perform_now('paris', '', 'super_smash_bros_ultimate')
    puts 'done.'
  end

  task update_paris_tekken7: :environment do
    puts 'Updating paris tekken7...'
    UpdateTournamentsJob
      .set(queue: 'tekken7')
      .perform_now('paris', '', 'tekken7')
    puts 'done.'
  end

  task update_paris_dead_or_alive6: :environment do
    puts 'Updating paris dead_or_alive6...'
    UpdateTournamentsJob
      .set(queue: 'dead_or_alive6')
      .perform_now('paris', '', 'dead_or_alive6')
    puts 'done.'
  end

  task update_paris_mortal_kombat11: :environment do
    puts 'Updating paris mortal_kombat11...'
    UpdateTournamentsJob
      .set(queue: 'mortal_kombat11')
      .perform_now('paris', '', 'mortal_kombat11')
    puts 'done.'
  end
end
