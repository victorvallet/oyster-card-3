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

  describe '#in_journey?' do
    it "should return false" do
      expect(subject).not_to be_in_journey
    end
  end

  context "no top up" do
    describe "#touch_in" do
      it "should raise_error 'No money' if balance is below min_fare" do
        expect { subject.touch_in(entry_station) }.to raise_error( "No money" )
      end
    end
  end

  context "top_up 5" do
    before do
      subject.top_up(5)
      subject.touch_in(entry_station)
    end

    describe '#touch_in' do
      it "should change #in_journey to true" do
        expect(subject).to be_in_journey
      end
      it "stores current entry station" do
        expect(subject.entry_station).to eq(entry_station)
      end
    end

    describe '#touch_out' do
      it "should change #in_journey to false" do
        subject.touch_out(exit_station)
        expect(subject).not_to be_in_journey
      end
      it "should deduct the minimum fare from the card" do
        min_fare = Oystercard::MINIMUM_FARE
        expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-min_fare)
      end
      it 'should store exit_station' do
        subject.touch_out(exit_station)
        expect(subject.exit_station).to eq(exit_station)
      end
    end
    describe '#my_trip' do
      it 'should print my trip' do
        subject.touch_out(exit_station)
        expect(subject.my_trip).to eq([entry_station, exit_station])
      end
    end
  end
end
