class CampersController < ApplicationController
    
    def index 
        render json: Camper.all, status: :ok
    end 

    def show
        camper = Camper.find_by(id: params[:id])
        if camper.present?
            render json: camper, serializer: CamperActivitiesSerializer, status: :ok
           
        else 
            render_not_found_response
        end
    end

    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end 

    private 
    def camper_params 
        params.permit(:name, :age)
    end 

    def render_not_found_response
        render json: {error: "Camper not found"}, status: :not_found
      end
    


end
