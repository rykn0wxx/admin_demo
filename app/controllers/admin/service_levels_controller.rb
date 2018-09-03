module Admin
  class ServiceLevelsController < Admin::ApplicationController
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
      if anon.save(:value_converters => { :dim_desk_id => DimDeskConverter })
        redirect_to '/admin/service_levels', notice: 'Records was successfully imported.'
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
        @anon.objname = 'service_level'
        @page = Administrate::Page::Form.new(dashboard, resource_class.new)
        @resources = scoped_resource.includes(*resource_includes) if resource_includes.any?
      end

  end
end
