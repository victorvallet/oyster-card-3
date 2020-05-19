class Oystercard

TOP_UP_LIMIT = 90

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    fail "Error, card has limit of #{TOP_UP_LIMIT}" if value + balance > TOP_UP_LIMIT
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

end
