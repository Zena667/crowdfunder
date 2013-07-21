class ProjectsController < ApplicationController
  #for pagination, the page parameter is passed in by the user to view
  #that particular page number
  def index
    @projects = Project.order("created_at DESC").page(params[:page]).per(8)

  end

  def home
  end

  def show
    @project = Project.find(params[:id])
  end

end

