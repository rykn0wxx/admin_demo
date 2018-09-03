class CsvController < ApplicationController

  def import
    render locals: {
      resource_class: resource_class,
      resource_fields: resource_fields
    }
  end
  def do_import
    respond_to do |format|
      if imported_records.failed_instances.any?
        format.html { render 'import' }
        format.js
      else
        format.html { redirect_to resource_index_path }
      end
    end
    # @import = AdminImport.init(params[:model_name], params[resource_model_name.singular.to_sym][:file])
    # respond_to do |format|
    #   if @import.failed_instances.any?
    #     format.js
    #   else
    #     format.html { redirect_to resource_index_path }
    #   end
    # end
  end

  private

    def imported_records
      if params[:action] == 'do_import'
        @imported_records ||= load_imported_records
      end
    end

    def load_imported_records
      AdminImport.init(params[:model_name], params[resource_model_name.singular.to_sym][:file])
    end

    def resource_index_path
      '/admin/' + resource_model_name.route_key
    end

    def resource_model_name
      resource_class.model_name
    end

    def resource_class
      @resource_class ||= Object.const_get(params[:model_name].camelize)
    end
    def resource_fields
      @flds = {}
      flds_enum.each do |k, v|
        if fld_assoc.include?(k.to_s)
          @flds[k.to_s.gsub(/_id/, '').to_sym] = 'association'
        else
          @flds[k.to_s.gsub(/_id/, '').to_sym] = v.to_s
        end
      end
      @flds
    end
    def flds_enum
      model_attrs = resource_class.attribute_names.map {|n| [n.to_sym, resource_class.type_for_attribute(n).type]}.to_h
      model_attrs.delete_if { |k, v| [:id, :created_at, :updated_at].include?(k) }
    end
    def fld_assoc
      resource_class.reflect_on_all_associations.select { |a| a.macro == :belongs_to }.map(&:foreign_key)
    end
end
