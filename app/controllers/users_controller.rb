class UsersController < ApplicationController
  
  before_action :get_user, only: [:edit, :update, :destroy, :show]
  before_action :check_auth, only: [:edit, :update, :destroy, :show]
  $prof_name = ['Beginner', 'Conversational', 'Fluent', 'Native' ]


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

  def new
    # this is only here because I'm having trouble with nested forms
    @user = User.new
    @user.build_language_prof
    #langprof = @user.build_language_prof
  end


  def show
    
  end

  def edit
    @languages = Language.all
    @categories = ProfCategory.all
    #@user = User.find(params[:id])
    #@user.build_language_prof
    puts ">>>>>>>> in edit, user params is #{params}"
    puts ">>>>>>> in edit, langprofs is #{@user.language_profs}"
  end

  def update

    lang = Language.find(user_params[:first_language]).name
    puts ">>>>>>>>>>>>langprofs in params is #{user_params[:language_profs]}"
    puts ">>>>>> @user.langprofs is #{@user.language_profs}"
    if @user.update_attributes({
      :first_name => user_params[:first_name],
      :last_name => user_params[:last_name],
      :first_language => lang})
      flash[:notice] = "Details updated"
      redirect_to :action => 'show', :id => @user
    else
      flash[:notice] = "There was a problem updating user"
      redirect_to :back
    end

    
  end

  protected
  def user_params
    params.required(:user).permit(:id, :first_name, :last_name, :first_language, language_prof: [ :user_id, :language_id, :prof_category_id])
  end

end
