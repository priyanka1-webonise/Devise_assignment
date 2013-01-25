class Admin::HomesController < ApplicationController
  before_filter :authenticate_admin! , :only => [:home ]
  def home
   # @admin = Admin.find(params[:id])
  end
end
