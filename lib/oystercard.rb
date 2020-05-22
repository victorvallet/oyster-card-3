require_relative 'journey'

class Oystercard

TOP_UP_LIMIT = 90
MINIMUM_FARE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @journeys =Journey.new
  end

  def top_up(value)
    fail "Error, card has limit of #{TOP_UP_LIMIT}" if  over_limit?(value)
    @balance += value
  end

  def touch_in(station)
    raise "No money" if balance < MINIMUM_FARE
    @journeys.touch_in(station)
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journeys.touch_out(station)
  end

  def in_journey?
    @journeys.in_journey?
  end

  private

  def over_limit?(value)
    value + balance > TOP_UP_LIMIT
  end

  def deduct(fare)
    @balance -= fare
  end

end
