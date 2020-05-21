class Oystercard

TOP_UP_LIMIT = 90
MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :exit_station, :my_trips

  def initialize
    @balance = 0
    @entry_station = nil
    @my_trips = []
  end

  def top_up(value)
    fail "Error, card has limit of #{TOP_UP_LIMIT}" if  over_limit?(value)
    @balance += value
  end

  def touch_in(station)
    raise "No money" if balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    add_last_trip
    @entry_station = nil
  end

  private

  def in_journey?
    !!@entry_station
  end

  def add_last_trip
    @my_trips << { :entry => @entry_station, :exit => @exit_station }
  end

  def over_limit?(value)
    value + balance > TOP_UP_LIMIT
  end

  def deduct(fare)
    @balance -= fare
  end

end
