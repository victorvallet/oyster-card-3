require 'station'
describe Station do

  it "return the name of the station" do
    station = Station.new("Cricklewood")
    expect(station.name).to eq "Cricklewood"
  end
end
