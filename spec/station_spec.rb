require 'station'
describe Station do
  it { is_expected.to be_instance_of Station}

  it 'show the zone of the station' do
    expect(subject.zone).to eq 1
  end
end
