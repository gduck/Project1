class UsersController < ApplicationController
  
  before_action :get_user, only: [:edit, :update, :destroy, :show]
  before_action :check_auth, only: [:edit, :update, :destroy, :show]
  #$prof_name = ['Beginner', 'Conversational', 'Fluent', 'Native' ]
  #user_role

  def get_user
    @user = User.find(params[:id]) 
    @languages = Language.all
  end

  def check_auth
    user_role = current_user.role
    if current_user !=  @user && user_role != 'admin'
       flash[:notice] = "You may only view your own profile!"
       redirect_to(users_path)
    end
  end

  def index
    @users_with_lang_profs = User.search(params[:search])
    @languages = Language.all
  end

  def edit
    @languages = Language.all
    @categories = ProfCategory.all
    @langprof = LanguageProf.new(:user_id => @user.id)
  end

  def create
    if user_params[:role] == 'nil'
      flash[:notice] = "Please choose your category!"
      redirect_to :back
      return
    end
  end

  def new
    if user_params[:role] == 'nil'
      flash[:notice] = "Please choose your category!"
      redirect_to :back
      return
    end
  end



  def update
    if user_params[:role].nil?
      flash[:notice] = "Please choose your category!"
      redirect_to :back
      return
    end
    if !user_params[:primary].nil?
      LanguageProf.where(:user_id => @user.id).update_all(primary: false)
      LanguageProf.find(params[:primary]).update(primary: true)
    end
    # error
    if @user.update_attributes(
      {
      :first_name => user_params[:first_name],
      :last_name => user_params[:last_name],
      :role => user_params[:role],
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
    params.required(:user).permit(:id, :first_name, :last_name, :first_language, :role, :language_profs_attributes => [:id, :user_id, :prof_category_id, :language_id, :primary, :_destroy], )
  end

end
