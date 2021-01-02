class ContestantsController < ApplicationController
  def index
    @bach = Bachelorette.find(params[:bachelorette_id])
  end

  def show
    @cont = Contestant.find(params[:id])
  end
end