class SessionsController < Devise::SessionsController

  def create

    resource = warden.authenticate!(:scope => resource_name)
    sign_in(resource_name, resource)

    if current_user.admin?

      redirect_ product_index_path

    else


    end

  end
end



