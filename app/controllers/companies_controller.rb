class CompaniesController < ApplicationController

  before_action :get_company, only: [:edit, :update, :destroy, :show]

  def index
    @companies = Company.all().order(name: :asc)
  end


  def show
    @positions = Position.where(:company_id => @company.id)
  end

  def create
    company = current_user.companies.new(company_params)
    
    if company.save
      flash[:notice] = "New company created!"
      redirect_to :action => 'show', :id => company.id
    end
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
