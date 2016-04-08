class Oauth::ApplicationsController < Doorkeeper::ApplicationsController

  http_basic_authenticate_with name: ENV.fetch("http_user"), password: ENV.fetch("http_password")

  # https://github.com/doorkeeper-gem/doorkeeper/wiki/Associate-users-to-OAuth-applications-(ownership)

  # def index
  #   @applications = current_user.oauth_applications
  # end

  # # only needed if each application must have some owner
  # def create
  #   @application = Doorkeeper::Application.new(application_params)
  #   @application.owner = current_user if Doorkeeper.configuration.confirm_application_owner?
  #   if @application.save
  #     flash[:notice] = I18n.t(:notice, :scope => [:doorkeeper, :flash, :applications, :create])
  #     redirect_to oauth_application_url(@application)
  #   else
  #     render :new
  #   end
  # end

end
