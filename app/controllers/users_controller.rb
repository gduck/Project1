class UsersController < ApplicationController
  def index
    #@users = User.all
    #user = User.new

    # @languages = Language.all
    @langprofs = LanguageProf.all.order(:user_id)
    #@langprof = LanguageProf.select("DISTINCT(user_id)").merge(LanguageProf.group(:user_id, :language_id)).order(:user_id)

    # get unique userIDs that have lang profs
    userIDs = LanguageProf.group(:user_id)
    @users = User.select(userIDs)



    @prof_name = [
      'Beginner', 'Conversational', 'Fluent', 'Native' ]

  def show
    
    @user = User.find(params[:id])
    
  end


  end


end
