require_relative '../lib/invalid_roll_score_exception'
class Frame
  attr_accessor :score
  def initialize(rolls)
    if rolls.length > 2
      raise "frame cannot have more than 2 rolls"
    end
    rolls.each {|roll| raise InvalidRollScoreException.new("roll score is invalid") if roll < 0 or roll > 10}
    @rolls = rolls
    @score = rolls.inject(0){|sum,pins| sum+pins}
  end


end