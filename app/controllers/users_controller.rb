class UsersController < ApplicationController
  
  before_action :get_user, only: [:edit, :update, :destroy, :show]
  before_action :check_auth, only: [:edit, :update, :destroy, :show]
  $prof_name = ['Beginner', 'Conversational', 'Fluent', 'Native' ]


  def get_user
    @user = User.find(params[:id]) 
    @languages = Language.all
  end

  def check_auth
    #if session[:user_id] != @user.user_id
      # flash[:notice] = "Sorry, you can't edit this"
      # redirect_to(show_path)
  end

  def index
    
    @users_with_lang_profs = User.search(params[:search])
    
    @languages = Language.all
  end

  def new
  end


  def show
  end

  def edit
    @categories = ProfCategory.all
  end

  def update
    if @user.update_attributes(
      {
      :first_name => user_params[:first_name],
      :last_name => user_params[:last_name],
      # :primary_language => user_params[:primary_language],
      :language_profs_attributes => user_params[:language_profs_attributes]
      })

      flash[:notice] = "Details updated"
      redirect_to :action => 'show', :id => @user
    else
      flash[:notice] = "There was a problem updating user"
      redirect_to :back
    end

    
  end

  protected
  def user_params
    params.required(:user).permit(:id, :first_name, :last_name, :primary_language, :language_profs_attributes => [:id, :prof_category_id, :language_id, :primary, :_destroy], )
  end

end
