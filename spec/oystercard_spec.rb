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

  describe '#in_journey' do
    it "it should return false" do
      expect(subject.in_journey).to eq(false)
    end
  end

end
