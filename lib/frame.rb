require_relative '../lib/invalid_roll_score_exception'
class Frame

  def initialize(rolls)
    if rolls.length > 2
      raise "frame cannot have more than 2 rolls"
    end
    rolls.each {|roll| raise InvalidRollScoreException.new("roll score is invalid") if roll < 0 or roll > 10}
    @rolls = rolls
    @score = rolls.inject(0){|sum,pins| sum+pins}
    @bonus = -1
  end

  def score
    @score = spare_score if spare?
    @score
  end


  def spare?
    @score == 10 and @rolls[0]<10
  end

  def strike?
    @rolls[0] == 10
  end

  def bonus_score(next_rolls)
    @bonus = next_rolls[0]
  end

  private

  def spare_score
    @score = '/'
    @score = 10 + @bonus if @bonus > -1
    @bonus = -1
    @score
  end

end