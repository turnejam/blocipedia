class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:user_id])
    @collaborator = Collaborator.new(user: @user, wiki: @wiki)

    if @collaborator.save
      flash[:notice] = "New collaborator added"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error adding the collaborator. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "You have successfully removed a collaborator."
      redirect_to @wiki
    else
      flash[:error] = "There was an error removing the collaborator. Please try again."
      render :show
    end
  end
end
