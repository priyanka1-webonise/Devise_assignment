class Admin::SessionsController < Devise::SessionsController
  #before_filter :my_filter, :only => [:new ]

  def create
    resource = warden.authenticate!(:scope => resource_name)
    sign_in(resource_name, resource)
    if current_admin.present?
      redirect_to home_admin_homes_path
    else
    end
  end

  def my_filter
    if current_user.present
      logger.info("##########Else")
     redirect_to root_path
    end
  end

end


