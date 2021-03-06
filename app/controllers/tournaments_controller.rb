class TournamentsController < ApplicationController
  
  before_filter :ensure_admin, :only => :destroy
  
  def new
    @tournament = Tournament.new
  end
  
  def create
    @tournament = Tournament.new(params[:tournament])
    if @tournament.save
      redirect_to @tournament
    else
      render :action => :new
    end
  end
  
  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy
    redirect_to root_path
  end
  
  def show
    @tournament = Tournament.find(params[:id])
  end
  
  def upcoming
    @tournaments = Tournament.upcoming
  end
  
  def in_progress
    @tournaments = Tournament.started_or_should_start
  end
  
  def finished
    @tournaments = Tournament.ended
  end
  
end