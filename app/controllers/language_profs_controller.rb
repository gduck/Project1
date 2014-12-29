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

  def show
    @language_prof = LanguageProf.find(params[:id])
  end


  def update
    @lang_prof = LanguageProf.find(params[:id])
    if @lang_prof.update_attributes(
      :language_id => langprofs_params[:language_id],
      :prof_category_id => langprofs_params[:prof_category_id])
      flash[:notice] = "Language updated!"
      redirect_to :back
    else
      flash[:notice] = "There was a problem in update"
      redirect_to :back
    end
  end

  protected
  def langprofs_params
    params.required(:language_prof).permit( :language_id, :prof_category_id)
  end

end
