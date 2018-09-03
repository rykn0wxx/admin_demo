module Admin
  class ClientsController < Admin::ApplicationController
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
      if anon.save
        redirect_to '/admin/clients', notice: 'Records was successfully imported.'
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
        @anon.objname = 'client'
        @page = Administrate::Page::Form.new(dashboard, resource_class.new)
        @resources = scoped_resource.includes(*resource_includes) if resource_includes.any?
      end
  end
end
