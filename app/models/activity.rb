class Activity < ApplicationRecord
    has_many :signups
    has_many :campers, through: :signups 

    def sign_up_times
        self.signups.map {|signup| signup.time}
    end

    def sign_up_by_time
        self.signups.sort_by {|signup| signup.time}
    end
end
