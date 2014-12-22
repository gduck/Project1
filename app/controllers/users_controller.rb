class UsersController < ApplicationController
  def index
    #@users = User.all
    #user = User.new

    # @languages = Language.all
    @langprofs = LanguageProf.all.order(:user_id)
    #@langprof = LanguageProf.select("DISTINCT(user_id)").merge(LanguageProf.group(:user_id, :language_id)).order(:user_id)


    # userIDs = LanguageProf.find(:user_id).unique;
    # @users = User.where("user_id = ?", userIDs)

    @users_with_lang_profs =  User.joins(:language_profs).includes(:language_profs)


    @prof_name = [
      'Beginner', 'Conversational', 'Fluent', 'Native' ]

  def show
    
    @user = User.find(params[:id])
    
  end


  end


end
