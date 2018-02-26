class UsersController < ApplicationController
  def update
    @user = current_user
    @user.member!


    if @user.save
      flash[:notice] = "You have been downgraded to a regular membership."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error. Please try again."
    end
  end
end
