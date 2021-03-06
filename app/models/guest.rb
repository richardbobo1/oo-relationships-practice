class Guest

    attr_reader :name
    @@all = []
    

    def initialize(name)
        @name = name
        @@all << self
    end

    def listings
        visited_listings = Trip.all.select {|trips| trips.guest == self}
        visited_listings.map do |trips| trips.listing_name
        end 

        # #listings
        # returns an array of all listings a guest has stayed at
    end

    def trips
        visited_trips = Trip.all.select {|trips| trips.guest == self}
        visited_trips

    end

    def trip_count
        self.trips.count 

        #solution two - this should work if previous doesn't. 
            #visited_trips = Trip.all.select {|trips| trips.guest == self}
           # visited_trips.count 
        # #trip_count
        # returns the number of trips a guest has taken
    end

    def self.all
        @@all
    end

    def self.pro_traveller
        pro_travellers = self.all.select do |travelers|
            travelers.trips.count > 1
        end
        pro_travellers
    end

    def self.find_all_by_name(given_name)
        guests_by_name = self.all.select do |guests|
            guests.name == given_name
        end
        guests_by_name
    end



end

# Guest
# #listings
# returns an array of all listings a guest has stayed at
# #trips
# returns an array of all trips a guest has made
# #trip_count
# returns the number of trips a guest has taken

# .all
# returns an array of all guests
# .pro_traveller
# returns an array of all guests who have made over 1 trip
# .find_all_by_name(name)
# takes an argument of a name (as a string), returns the all guests with that name