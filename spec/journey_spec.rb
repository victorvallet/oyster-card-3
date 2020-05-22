require 'journey'
require 'oystercard'
describe Journey do

  let(:exit_station) { exit_station = double(:station) }

  it "create an empty array on initialize" do
    expect(subject.my_trips).to eq ([])
  end

  it 'should show as in_journey? false to start with' do
    expect(subject.in_journey?).to be false
  end

  it 'should store exit_station' do
    expect(subject.touch_out(exit_station)).to eq(nil)
  end
end
