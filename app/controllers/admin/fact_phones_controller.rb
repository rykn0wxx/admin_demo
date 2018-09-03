module Admin
  class FactPhonesController < Admin::ApplicationController
    before_action :set_local

    def import
      render locals: {
        anon: @anon,
        page: @page,
        resources: @resources
      }
    end
    def do_import
      anon = Anon.new( anon_params )
      if anon.save(:value_converters => { :project_id => ProjectConverter, :dim_time_id => DimTimeConverter, :language_id => LanguageConverter, :timezone_id => TimezoneConverter })
        redirect_to '/admin/fact_phones', notice: 'Records was successfully imported.'
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
        @anon.objname = 'fact_phone'
        @page = Administrate::Page::Form.new(dashboard, resource_class.new)
        @resources = scoped_resource.includes(*resource_includes) if resource_includes.any?
      end
  end
end
