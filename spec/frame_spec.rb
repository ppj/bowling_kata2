require 'rspec'
require_relative '../lib/frame'
describe Frame do
  it "should not allow any roll to be < 0 or > 10" do
    expect { Frame.new([-3,33])}.to raise_exception("roll score is invalid")
    expect { Frame.new([33,-3])}.to raise_exception("roll score is invalid")
  end

  context 'calculates score' do
    let(:subject) do
      Frame.new([3,3])
    end
    it 'gives the score for the simple frame' do
      expect(subject.score).to eq(6)
    end
    it 'gives the score for the spare' do
      subject = Frame.new([5,5])
      subject.bonus_score([2])
      expect(subject.score).to eq(12)
    end
  end
  context 'for a spare' do
    it 'cannot give the score without bonus' do
      subject = Frame.new([5,5])
      expect(subject.score).to eq('/')
    end

  end
  context 'knows about spare or strike' do
    it 'knows if its a spare' do
      subject = Frame.new([5,5])
      expect(subject.spare?).to be true
      subject = Frame.new([0,10])
      expect((Frame.new([0,10])).spare?).to be true

    end
    it 'knows if its a strike' do
      subject = Frame.new([10,0])
      expect(subject.strike?).to be true
      expect(subject.spare?).to be false
    end
  end
end