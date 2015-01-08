class UsersController < ApplicationController
  
  before_action :get_user, only: [:edit, :update, :destroy, :show]
  before_action :check_auth

  def check_auth
    # user_role = current_user.role
    if current_user == nil 
      flash[:notice] = "Please log in!"
      redirect_to(root_path)
      return
    end
    # if current_user !=  @user && current_user.role != 'admin'
    #    flash[:notice] = "You may only view your own profile!"
    #    redirect_to(users_path)
    # end
  end

  def index
    @users_with_lang_profs = User.search(params[:search])
    @users = @users_with_lang_profs
    @languages = Language.all
  end

  def edit
    @categories = ProfCategory.all
    @langprof = LanguageProf.new(:user_id => @user.id, :primary => true)
    @companies = Company.all().order(name: :asc)
    @company = Company.new()
    @agent_association = AgentAssociation.new(:user_id => @user.id)
  end


  def update
    # for the case where the primary language is being set
    if !params[:primary].nil?
      LanguageProf.where(:user_id => @user.id).update_all(primary: false)
      LanguageProf.find(params[:primary]).update(primary: true)
    end

    if @user.role == 'member'
      if @user.update_attributes(
        {
        :first_name => user_params[:first_name].capitalize,
        :last_name => user_params[:last_name].capitalize,
        :language_profs_attributes => user_params[:language_profs_attributes]
        })
        flash[:notice] = "Member details updated"
        redirect_to :action => 'show', :id => @user
      else
        flash[:notice] = "There was a problem updating user"
        redirect_to :back
      end
    elsif @user.role == 'agent'
      clean_params
      if @user.update_attributes({
        :first_name => user_params[:first_name].capitalize,
        :last_name => user_params[:last_name].capitalize
        # ,
        # :agent_associations_attributes => user_params[:agent_associations_attributes]
        })
        flash[:notice] = "Agent details updated"
        redirect_to :action => 'show', :id => @user
      end
    end
  end

  protected
    def clean_params
      params[:user][:agent_associations_attributes][:user_id] = params[:user][:agent_associations_attributes][:user_id].to_i
      params[:user][:agent_associations_attributes][:company_id] = params[:user][:agent_associations_attributes][:company_id].to_i
    end

  def user_params
    params.required(:user).permit(
      # :id,
      :first_name,
      :last_name,
      :first_language, 
      :language_profs_attributes => [
        :id,
        :user_id,
        :prof_category_id,
        :language_id,
        :primary,
        :_destroy
      ],
      :agent_associations_attributes => [
        :id,
        :user_id,
        :company_id,
        :permissions
      ]
    )
  end

  def get_user
    @user = User.find(params[:id]) 
    @languages = Language.all
  end
end
