module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_local, :only => [:import, :do_import]

    def import
      render locals: {
        anon: @anon,
        page: @page,
        resources: @resources
      }
    end
    def do_import
      anon = Anon.new( anon_params )
      if anon.save(:value_converters => { :group_ids => GroupIdsConverter })
        redirect_to '/admin/users', notice: 'Records was successfully imported.'
      else
        render :import, locals: {
          anon: anon,
          page: @page,
          resources: @resources
        }
      end
    end

    private
      def set_local
        @anon = Anon.new
        @anon.objname = 'user'
        @page = Administrate::Page::Form.new(dashboard, resource_class.new)
        @resources = scoped_resource.includes(*resource_includes) if resource_includes.any?
      end
      def user_params
        params.require(:user).permit(:name, :group_ids => [])
      end
  end
end
