class Oystercard

TOP_UP_LIMIT = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "Error, card has limit of #{TOP_UP_LIMIT}" if value + balance > TOP_UP_LIMIT
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    false
  end

end
