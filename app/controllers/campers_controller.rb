class CampersController < ApplicationController
  before_action :find_camper, only: [:show]
  def index
    @campers = Camper.all
  end

  def show
  end

  def create
    @camper = Camper.create(camper_params(:name, :age))
    if @camper.valid?
      redirect_to camper_path(@camper)
    else
      flash[:errors] = @camper.errors.full_messages
      redirect_to new_camper_path
    end
  end

  def new 
    @camper = Camper.new
  end



  private

  def find_camper
    @camper = Camper.find(params[:id])
  end

  def camper_params(*args)
    params.require(:camper).permit(*args)
  end
end
