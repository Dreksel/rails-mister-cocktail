class DosesController < ApplicationController
  def create
    # NOT DONE!!
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:name, :ingredient_id)
  end

end
