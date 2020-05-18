require 'oystercard'

describe Oystercard do

  it "has a balance" do
  expect(subject.balance).to eq(0)
  end

  it "tops up balance with" do
  expect(subject.top_up(10)).to eq 10
  end

  it "errors with over limit" do
    expect { subject.top_up(91) }.to raise_error "reached max limit"
  end

end
