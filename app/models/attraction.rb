class Attraction < ApplicationRecord

    has_many :rides
    has_many :users, through: :rides

    def to_s
        return name
    end

end
