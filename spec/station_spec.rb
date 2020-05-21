require 'station'
describe Station do

  it 'initialize a station with zone value' do
    station = Station.new(num)
    expect(station.zone).to eq num
  end

  it 'show the zone of the station' do
    station = Station.new(1)
    expect(station.zone).to eq 1
  end
end
