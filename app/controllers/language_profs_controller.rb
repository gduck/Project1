class LanguageProfsController < ApplicationController

  def destroy
    @lang_prof = LanguageProf.find(params[:id])
    if @lang_prof.destroy 
      flash[:notice] = "Language removed!"
      redirect_to :back
    else
      flash[:notice] = "There was a problem in destroy"
      redirect_to :back
    end
  end

  def update
    @lang_prof = LanguageProf.find(params[:id])
    if @lang_prof.update_attributes(params[:lang_prof])
      flash[:notice] = "Language updated!"
      redirect_to :back
    else
      flash[:notice] = "There was a problem in update"
      redirect_to :back
    end
  end

end
