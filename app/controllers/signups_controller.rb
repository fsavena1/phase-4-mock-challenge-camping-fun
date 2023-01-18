class SignupsController < ApplicationController
    



    def create 
        signup = Signup.create!(signup_params)
        
            render json: signup,  serializer: SignupActivitySerializer, status: :created
        rescue ActiveRecord::RecordInvalid => e
            render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity

    end 

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    

end
