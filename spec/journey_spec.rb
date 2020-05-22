require 'journey'
require 'oystercard'
describe Journey do

    # it "complete the journey" do
    #     journey = Journey.new("Bank")
    #   expect(journey.complete?).to be true
    # end

  it "create an empty array on initialize" do
    expect(subject.my_trips).to eq ([])
  end

  it 'should show as in_journey? false to start with' do
    expect(subject.in_journey?).to be false
  end
end
