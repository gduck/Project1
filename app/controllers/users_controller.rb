class UsersController < ApplicationController
  
  before_action :get_user, only: [:edit, :update, :destroy, :show]
  before_action :check_auth, only: [:edit, :update, :destroy, :show]

  def get_user
    @user = User.find(params[:id]) 
  end

  def check_auth
    #if session[:user_id] != @user.user_id
      # flash[:notice] = "Sorry, you can't edit this"
      # redirect_to(show_path)
  end

  def index
    
    # only users with some language proficiency needed
    # limit to 5 for the front page, most recent
    @users_with_lang_profs =  User.order(created_at: :desc).joins(:language_profs).includes(:language_profs).limit(5)
  end



  def show
    #@user = User.find(params[:id]) 
  end

  def edit
    @languages = Language.all
  end

end
