class AadressesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @aadress = current_user.aadresses.build(aadress_params)
	#@def = aadress_params[:maja] + ", " + aadress_params[:linn]
	#@aadress2 = current_user.update_attribute(:aadress, @def)
    if @aadress.save
      flash[:success] = "Aadress lisatud!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @aadress.destroy
    redirect_to current_user
  end

  private

    def aadress_params
      params.require(:aadress).permit(:maja, :linn)
    end
	
	def aadress2_params
      params.require(:aadress).permit(:maja)
    end
	
	def correct_user
      @aadress = current_user.aadresses.find_by(id: params[:id])
      redirect_to root_url if @aadress.nil?
    end
end