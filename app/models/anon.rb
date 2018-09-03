class Anon
  extend ActiveModel::Naming
  include ActiveModel::Model
  include ActiveRecord::Import

  attr_accessor :file, :objname

  OPTIONS = [
    :value_converters
  ].freeze

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def save(options = {})
    @options = options
    if imported_records.failed_instances.any?
      imported_records.failed_instances.each_with_index do |obj_model, index|
        obj_model.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+1}: #{message}"
        end
      end
      false
    else
      true
    end
  end

  def index_path
    '/admin/' + objname.pluralize
  end

  def persisted?
    false
  end

  protected

    def imported_records
      @imported_records ||= load_imported_records
    end

    def load_imported_records
      smarter_records = process_file
      smarter_records[0]
    end

    def process_file
      raw_csv_data = SmarterCSV.process(file.path, smart_opts)
      import_results = start_parallel_import(raw_csv_data)
      import_results
    end

    def start_parallel_import(data_to_import)
      Parallel.map(data_to_import) do |batch_import|
        csv_worker(batch_import)
      end
    end

    def csv_worker(batch_import)
      resource_model.import batch_import, :batch_size => 1000
    end

    def smart_opts
      {
        :col_sep => ',',
        :row_sep => "\n",
        :strip_chars_from_headers => /[\-"]/,
        :force_simple_split => true,
        :chunk_size => 1000,
        :remove_unmapped_keys => true,
        :verbose => true
      }.merge(@options.slice(*OPTIONS))
    end

    def resource_class
      Object.const_get(objname.singularize.camelize)
    end

    def resource_model
      @resource_model = objname.classify.constantize
    end

    def resource_fields
      @resource_fields = resource_class.attribute_names.map do |n|
        [n.to_sym, resource_class.type_for_attribute(n).type] unless %w[id created_at updated_at].include?(n)
      end
      @resource_fields.to_h
    end

end

class RegionConverter
  def self.convert(value)
    Region.where(:name => value).pluck(:id)[0]
  end
end
class ProjectConverter
  def self.convert(value)
    Project.where(:name => value).pluck(:id)[0]
  end
end
class ClientConverter
  def self.convert(value)
    Client.where(:name => value).pluck(:id)[0]
  end
end
class LanguageConverter
  def self.convert(value)
    Language.where(:name => value).pluck(:id)[0]
  end
end
class TimezoneConverter
  def self.convert(value)
    Timezone.where(:name => value).pluck(:id)[0]
  end
end
class DimTimeConverter
  def self.convert(value)
    DimTime.where(:dt_num => value).pluck(:id)[0]
  end
end
class DimDeskConverter
  def self.convert(value)
    DimDesk.where(:name => value).pluck(:id)[0]
  end
end
class ServiceLevelConverter
  def self.convert(value)
    ServiceLevel.where(:name => value).pluck(:id)[0]
  end
end
class TicketTypeConverter
  def self.convert(value)
    TicketType.where(:name => value).pluck(:id)[0]
  end
end
class ContactTypeConverter
  def self.convert(value)
    ContactType.where(:name => value).pluck(:id)[0]
  end
end
class UserConverter
  def self.convert(value)
    User.where(:snow_user => value).pluck(:id)[0]
  end
end
class PriorityConverter
  def self.convert(value)
    Priority.where(:name => value).pluck(:id)[0]
  end
end
