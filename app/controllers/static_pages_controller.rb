class StaticPagesController < ApplicationController
  def home
    @aadress = current_user.aadresses.build if signed_in?
  end

  def help
  end
  
  def about
  end
    
  def contact
  end
end
