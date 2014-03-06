require 'rspec'
require_relative '../lib/frame'
describe Frame do
  it "should not allow any roll to be < 0 or > 10" do
    expect { Frame.new([-3,33])}.to raise_exception("roll score is invalid")
    expect { Frame.new([33,-3])}.to raise_exception("roll score is invalid")
  end
end