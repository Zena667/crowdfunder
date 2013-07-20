class PledgesController < ApplicationController
  before_filter :require_login

  def new
    @pledge = Pledge.new
    @project = Project.find(params[:project_id])
  end

  def create
    #grabbing :project_id from the url of the path and matching it 
    #against the project.id value for all the entries in the Project table, 
    #when find match, assign this object to the variable
    @project = Project.find(params[:project_id])
    #in the form_for on the new page the :amount parameter gets assigned to :pledge, 
    #in the params hash, assign it's value to the :amount variable in the pledge object
    #@when building a pledge, assign the amount value, and build in format below due to nested
    #association.  @project.pledges.build assigns the project_id to the @pledge object.
    @pledge = @project.pledges.build(params[:pledge])
    #manually assign the user_id value inside pledges to the id of the user currently logged in
    @pledge.user_id = current_user.id
    if @pledge.save
      UserMailer.new_pledge(@pledge).deliver
       # @project.user.email
      redirect_to project_path(@project), :notice => "Thanks for pledging"
    else
      render 'new'
    end
  end

  def destroy
  end
end
