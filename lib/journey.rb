require_relative 'oystercard'

class Journey

  attr_reader :entry_station, :my_trips

  def initialize
    @entry_station = nil
    @my_trips = []
  end

  def touch_in(station)
    @entry_station = station
  end

  def touch_out(station)
    add_last_trip(station)
    @entry_station = nil
  end

  def complete?
    true
  end

  def in_journey?
    @entry_station != nil
  end

  def fare
    if @my_trips[-1][:exit] == nil || @my_trips[-1][:entry] == nil
      return Oystercard::PENALTY_FARE
    else
      return Oystercard::MINIMUM_FARE
    end
  end

  private

  def add_last_trip(station)
    @my_trips << { :entry => @entry_station, :exit => station }
  end

end
