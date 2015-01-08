class StaticPagesController < ApplicationController  
  def index
    @users_with_lang_profs = User.search(params[:search])
    @users = @users_with_lang_profs
    @languages = Language.all
  end
end
