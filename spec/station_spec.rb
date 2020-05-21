require 'station'
describe Station do

  it "return the name of the station" do
    station = Station.new("Cricklewood", 1)
    expect(station.name).to eq "Cricklewood"
  end
  it 'returns the zone number of the station' do
    station = Station.new("bank", 1)
    expect(station.zone).to eq 1
  end
end
