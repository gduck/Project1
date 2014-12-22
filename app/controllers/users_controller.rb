class UsersController < ApplicationController
  def index
    
    # only users with some language proficiency needed
    # limit to 5 for the front page, most recent
    @users_with_lang_profs =  User.order(created_at: :desc).joins(:language_profs).includes(:language_profs).limit(5)
  end



  def show
    @user = User.find(params[:id]) 
  end

  def edit
    @user = User.find(params[:id])
  end

end
