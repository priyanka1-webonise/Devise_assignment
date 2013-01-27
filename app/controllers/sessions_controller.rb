class SessionsController < Devise::SessionsController

  def create

    resource = warden.authenticate!(:scope => resource_name)
    sign_in(resource_name, resource)

    if current_user.present?

      redirect_to products_path

    else


    end

  end
end



