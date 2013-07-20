class My::ProjectsController < My::BasesController
before_filter :require_login

  def index
    @user = current_user
    @projects = current_user.projects.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      redirect_to my_projects_path
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
    @user = current_user
    if @project.user_id == @user.id
       @project
    else 
      redirect_to my_projects_path, notice: "doesn't exist"
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      @project.save
      redirect_to my_projects_path, notice: "Updated Successfully"
    else
      render 'edit'
    end
  end

  def delete
  end

end
