module Admin
  class TicketSlasController < Admin::ApplicationController
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
      if anon.save(:value_converters => { :service_level_id => ServiceLevelConverter, :ticket_type_id => TicketTypeConverter, :contact_type_id => ContactTypeConverter, :priority_id => PriorityConverter, :user_id => UserConverter })
        redirect_to '/admin/ticket_slas', notice: 'Records was successfully imported.'
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
        @anon.objname = 'ticket_sla'
        @page = Administrate::Page::Form.new(dashboard, resource_class.new)
        @resources = scoped_resource.includes(*resource_includes) if resource_includes.any?
      end
  end
end
