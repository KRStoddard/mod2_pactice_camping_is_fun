class Activity < ApplicationRecord
    has_many :signups
    has_many :campers, through: :signups 

    def act_time_hash
        @time_hash = {}
        self.signups.each do |signup|
            if !@time_hash[signup.time]
                @time_hash[signup.time] = []
                @time_hash[signup.time] << signup.camper
            else
                @time_hash[signup.time] << signup.camper 
            end
        end
        @time_hash 
    end
end
