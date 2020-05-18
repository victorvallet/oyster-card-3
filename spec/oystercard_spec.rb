require 'oystercard'

describe Oystercard do

  it "has a balance" do
  expect(Oystercard.new.balance).not_to be nil
  end

end
