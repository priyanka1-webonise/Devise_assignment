class Admin::SessionsController < Devise::SessionsController
  def create
    resource = warden.authenticate!(:scope => resource_name)
    sign_in(resource_name, resource)
    if current_admin.present?
      redirect_to home_admin_homes_path
    else
    end
  end
end


