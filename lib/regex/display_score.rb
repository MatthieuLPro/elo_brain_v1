# frozen_string_literal: true

module Regex
  class DisplayScore
    REGEX = /(.+?(?=\s\d\s-\s\S))(\s\d\s-\s)((?<=\s\d -\s).+?(?=\s\d))(\s\d\z)/.freeze
    def call(expression:)
      to_hash(expression.scan(REGEX).flatten)
    end

    private

    def to_hash(display_score)
      {
        player1_name: STRING::NameInDisplayScore.new.call(expression: display_score[0]),
        player1_score: Regex::ScoreInDisplayScore.new.call(expression: display_score[1]),
        player2_name: STRING::NameInDisplayScore.new.call(expression: display_score[2]),
        player2_score: Regex::ScoreInDisplayScore.new.call(expression: display_score[3])
      }
    end
  end
end
