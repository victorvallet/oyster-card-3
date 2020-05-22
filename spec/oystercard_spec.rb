require 'oystercard'

describe Oystercard do

  let(:entry_station) { entry_station = double(:station) }
  let(:exit_station) { exit_station = double(:station) }


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

  context "no top up" do
    describe "#touch_in" do
      it "should raise_error 'No money' if balance is below min_fare" do
        expect { subject.touch_in(entry_station) }.to raise_error( "No money" )
      end
    end
  end

  context "top_up 5" do

    describe '#touch_in' do
      it "stores current entry station" do
        subject.top_up(5)
        expect(subject.touch_in(entry_station)).to eq(entry_station)
      end
    end

    describe '#touch_out' do
   
      it 'should deduct a PENALTY_FARE when no entry_station or exit_station' do
        subject.top_up(10)
        expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::PENALTY_FARE)
      end

      it "should deduct the minimum fare from the card" do 
        subject.top_up(10)
        subject.touch_in(entry_station)
        expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
      end
    end
  end
end
