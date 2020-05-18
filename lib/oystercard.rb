class Oystercard

TOP_UP_LIMIT = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(value)
   fail "reached max limit" if value + balance > 90
   @balance += value
  end

end
