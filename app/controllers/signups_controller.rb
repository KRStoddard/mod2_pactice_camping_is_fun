class SignupsController < ApplicationController
    
    def create
        @signup = Signup.create(signup_params(:activity_id, :camper_id, :time))
        if @signup.valid?
            redirect_to camper_path(@signup.camper)
        else
            flash[:errors] = @signup.errors.full_messages
            redirect_to new_signup_path
        end
    end

    def new 
        @signup = Signup.new
    end

    private

    def signup_params(*args)
        params.require(:signup).permit(*args)
    end

end