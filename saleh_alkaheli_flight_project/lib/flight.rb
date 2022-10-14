
require "passenger"

class Flight

    attr_reader :passengers

    def initialize(str, capacity)
        @flight_number = str
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity
            true
        else
            false
        end
    end

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && !full?
            @passengers << passenger
        end
    end

    def list_passengers
        @passengers.map {|ele| ele.name}
    end

    def [](i)
        @passengers[i]
    end

    def <<(passenger)
        board_passenger(passenger)
    end

end
