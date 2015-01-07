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


  end

  protected
  def get_company
    @company = Company.find(params[:id]) 
  end

end
