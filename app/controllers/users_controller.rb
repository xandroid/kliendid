class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def show
    @user = User.find(params[:id])
	unless @user.aadresses.first.nil?
	  @def = @user.aadresses.first.maja + ", " + @user.aadresses.first.linn
	  @user.update_attribute(:aadress, @def)
	end
	if @user.aadresses.first.nil?
	  @user.update_attribute(:aadress, '')
	end
	@aadresses = @user.aadresses.paginate(page: params[:page])
	@aadress = @user.aadresses.build if signed_in?
	
  end
  
  def new
	@user = User.new
  end
  
  def index
    @search = User.search(params[:q])
    @users = @search.result.order('updated_at DESC')
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
	  sign_in @user
	  flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end	
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :aadress, :password,
                                   :password_confirmation)
    end
	
	# Before filters


    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.admin?
    end
	def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
