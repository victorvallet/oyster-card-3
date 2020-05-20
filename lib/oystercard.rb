class Oystercard

TOP_UP_LIMIT = 90
MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :exit_station

  def initialize
    @balance = 0
    @entry_station = []
    @exit_station = []
    @entry_station[0] = nil
    @num_journeys = 0
  end

  def top_up(value)
    fail "Error, card has limit of #{TOP_UP_LIMIT}" if  over_limit?(value)
    @balance += value
  end

  def touch_in(station)
    raise "No money" if balance < MINIMUM_FARE
    @entry_station[0] = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @num_journeys += 1
    @entry_station[@num_journeys] = nil
    @exit_station[@num_journeys - 1] = station
  end

  def my_trip
    [@entry_station[@num_journeys - 1], @exit_station[@num_journeys -1]]
  end

  def in_journey?
    !!@entry_station[@num_journeys]
  end

  private

  def over_limit?(value)
    value + balance > TOP_UP_LIMIT
  end

  def deduct(fare)
    @balance -= fare
  end

end
