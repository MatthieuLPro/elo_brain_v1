# frozen_string_literal: true

namespace :clean_database do
  desc 'clean all the database'
  task launch: :environment do
    TABLES_TO_REMOVE = %w[players elos events matches].freeze
    TABLES_TO_REMOVE.each do |table|
      ActiveRecord::Base.connection.execute("TRUNCATE #{table} RESTART IDENTITY CASCADE")
      pp "Clean table #{table}"
    end
  end
end
