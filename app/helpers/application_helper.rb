module ApplicationHelper

  #this method checks to make sure that the url 
  #controller that's being called is the one that's 
  #the controller name that's being referenced 
  
  def controller?(*controller)
    controller.include?(params[:controller])
  end


end
