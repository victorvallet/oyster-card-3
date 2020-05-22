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
    @exit_station = station
    add_last_trip
    @entry_station = nil
  end

  def complete?
    true
  end

  def in_journey?
    @entry_station != nil
  end

  def fare
    if @my_trips[-1][:entry_station] == nil
      return Oystercard::PENALTY_FARE
    elsif @my_trips[-1][:exit_station] == nil
      return Oystercard::PENALTY_FARE
    else
      Oystercard::MINIMUM_FARE
    end
  end

  private

  def add_last_trip
    @my_trips << { :entry => @entry_station, :exit => @exit_station }
  end

end
