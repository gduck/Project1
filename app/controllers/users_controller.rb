class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
    
    @languages = Language.all
    @lang_profs = LanguageProf.all
  end


end
