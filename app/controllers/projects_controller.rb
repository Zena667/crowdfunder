class ProjectsController < ApplicationController
  #for pagination, the page parameter is passed in by the user to view
  #that particular page number
  def index
    @projects = Project.order("created_at DESC").page(params[:page]).per(8)

  end

  def home
  end

  def search
    @projects = Project.where("title ILIKE '%#{params[:query]}%'")

    respond_to do |format|
      format.json { render :json => @projects.map { |p| p.title }}
    end
  end

  def show
    @project = Project.find(params[:id])
  end

end

