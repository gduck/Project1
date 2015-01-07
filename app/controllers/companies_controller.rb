class CompaniesController < ApplicationController

  before_action :get_company, only: [:edit, :update, :destroy, :show]

  def index
    @companies = Company.all
  end


  def show
  end

  def edit
  end

  def new
    @company = Company.new()
  end

  def update
    if @company.update_attributes(company_params)
      flash[:notice] = "Company details updated"
      redirect_to :action => 'show', :id => @company
    end
  end

  protected
  def get_company
    @company = Company.find(params[:id]) 
  end

  def company_params
    params.required(:company).permit(
      :id,
      :name,
      :website
      )
  end
end
