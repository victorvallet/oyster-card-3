require 'oystercard'

describe Oystercard do


  it "has a balance" do
  expect(subject.balance).to eq(0)
  end

  it "tops up balance with" do
  expect(subject.top_up(10)).to eq 10
  end

  it "errors with over limit" do
    limit = Oystercard::TOP_UP_LIMIT
    expect { subject.top_up(limit + 1) } .to raise_error "Error, card has limit of #{limit}"
  end

  describe '#deduct' do
    [3,5,7].each do |num|
      it "should reduced the balane by the given argument" do
        subject.deduct(num)
        expect(subject.balance).to eq(-num)
      end
    end
  end

  describe '#in_journey?' do
    it "should return false" do
      expect(subject).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    it "should change #in_journey to true" do
      subject.top_up(5)
      subject.touch_in
      expect(subject).to be_in_journey
    end
    it "should raise_error 'No money' if balance is below min_fare" do
      expect { subject.touch_in }.to raise_error( "No money" )
    end
  end

  describe '#touch_out' do
    it "should change #in_journey to false" do
      subject.top_up(5)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end
end
