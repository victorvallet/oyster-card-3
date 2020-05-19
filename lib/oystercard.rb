class Oystercard

TOP_UP_LIMIT = 90

  attr_reader :balance, :in_use

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(value)
    fail "Error, card has limit of #{TOP_UP_LIMIT}" if value + balance > TOP_UP_LIMIT
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use
  end

end
