# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    before_action :authenticate_admin
    helper LayoutHelper

    def authenticate_admin
      # TODO Add authentication logic here.
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end

    def anon_params
      {
        :file => params[:file],
        :objname => params[:objname]
      }
    end

    private
      def present(object, klass = 'index')
        klass = "Admin::#{klass.camelize}Presenter".constantize
        klass.new(object, view_context)
      end

    protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :name, :snow_user, :phone_user, :quality_user, :group_ids => [] ])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
      end
  end
end
