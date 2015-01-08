class PositionsController < ApplicationController

  def index
    @positions = Position.search(params[:search])
  end

end
