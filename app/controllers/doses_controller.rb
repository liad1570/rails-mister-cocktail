class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  def new
  	 @dose = Dose.new
  end

  def create
  	@dose = Dose.new(dose_params)
  	@dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
  	@dose = Dose.find(params[:cocktail_id])
  	@dose = @dose.ingredient_id
  	@dose = Dose.find_by_ingredient_id(@dose)
  	@dose.destroy
    redirect_to cocktails_path
  end
  
  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id,:cocktail_id)
  end
end
