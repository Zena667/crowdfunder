class UserMailer < ActionMailer::Base
  default from: "admin@crowdfunder.com"

  def new_pledge(pledge)
    @pledge = pledge
    mail(to: @pledge.project.user.email, subject: "Your project received some backing on CrowdFunder.")
  end

end
