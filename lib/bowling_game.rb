require_relative './frame'
class BowlingGame
  attr_reader :score

  def initialize
    @score=0
    @frame = []
  end

  def frame(frame_index, rolls)
    if frame_index > 10
      raise "game over"
    end
    frame = Frame.new(rolls)
    rescue InvalidRollScoreException
      puts 'Frame ignored. Please try again'
    else
      @frame.push(frame)
      @score += @frame[-1].score
  end


end