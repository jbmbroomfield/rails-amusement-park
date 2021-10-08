class Ride < ApplicationRecord

    belongs_to :user
    belongs_to :attraction

    def take_ride
        get_error_message
        @error_message.length > 0 ? "Sorry.#{@error_message}" : successfully_take_ride
    end

    private

    def get_error_message
        @error_message = ''
        @error_message += " You do not have enough tickets to ride the #{attraction}." if user.tickets < attraction.tickets
        @error_message += " You are not tall enough to ride the #{attraction}." if user.height < attraction.min_height
    end

    def successfully_take_ride
        user.tickets -= attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness += attraction.happiness_rating
        user.save
    end

end
