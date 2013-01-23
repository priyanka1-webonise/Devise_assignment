class RegistrationsController < Devise::RegistrationsController
  def create
    begin
      super # this calls Devise::RegistrationsController#create
      @user = resource
      UserMailer.registration_confirmation(@user).deliver
    end
  end

end
