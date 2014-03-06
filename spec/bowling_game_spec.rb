require 'rspec'
require_relative '../lib/bowling_game'

describe BowlingGame do
  context "In a game" do
    it 'should record a game with 10 frames only' do
      expect { subject.frame(11, [1,0]) }.to raise_error("game over")
    end
    it 'should not allow a frame with more than two rolls' do
      expect { subject.frame(1,[1,2,1]) }.to raise_error("frame cannot have more than 2 rolls")
    end

    it "allows the user to try again if the roll score is invalid" do
      subject.frame(1, [1,0])
      subject.frame(2, [-1,0])
      subject.frame(2, [1,0])
      subject.frame(3, [1,0])
      subject.frame(4, [1,0])
      subject.frame(5, [1,0])
      subject.frame(6, [1,0])
      subject.frame(7, [1,0])
      subject.frame(8, [1,0])
      subject.frame(9, [1,0])
      subject.frame(10, [1,0])
      expect(subject.score).to eq(10)

    end
  end

  context 'game without spare or strike' do
    it 'should calculate the score for the game after each frame' do
      subject.frame(1, [1,8])
      subject.frame(2, [1,8])
      expect(subject.score).to eq(18)
    end
  end
end