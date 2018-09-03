module MudPorter
  class CsvImporter
    OPTIONS = [
      :chunk_size,
      :key_mapping,
      :col_sep,
      :row_sep,
      :comment_regexp,
      :value_converters,
      :quote_char,
      :convert_values_to_numeric
    ].freeze
    def initialize(model_name, file_param, other_options = {})
      @model_name = model_name
      @model = model_name.classify.constantize
      @file_param = file_param
      assign_to_options(other_options)
    end
    def import
    end
    protected
      def assign_to_options(options)
        @options = {
          :strip_chars_from_headers => /[\-"]/,
          :force_simple_split => true,
          :chunk_size => 1000,
          :remove_unmapped_keys => true,
          :verbose => true
        }.merge(options.slice(*OPTIONS))
        puts '*************************'
        puts @options.inspect
        detect_csv_options
      end
      def detect_csv_options
        @csv_options = if @model.respond_to?(:csv_options)
          @model.csv_options
        else
          @options[:csv_options] || {}
        end.reject { |_, value| value.nil? || value == '' }
      end
  end
end
#
# class ZsvImporter
#   class << self
#     def import_save(mode_name, file, args = {})
#       @target_model = mode_name.classify.constantize
#       imported_records = get_smarter(file, args)
#       final_data = parallel_import(imported_records)
#       final_data.flatten
#     end
#     protected
#       def parallel_import(records)
#         result = []
#         Parallel.map(records) do |record|
#           result << csv_worker(record)
#         end
#       end
#       def get_smarter(file, args)
#         options = {}.merge(import_options)
#         options = options.merge(args[:csv_opt]) if args[:csv_opt].present?
#         SmarterCSV.process(file.path, options)
#       end
#       def import_options
#         { :col_sep => ",", :row_sep => "\n", :chunk_size => 1000 }
#       end
#       def csv_worker(arr_data)
#         puts arr_data
#         arr_data
#         # ActiveRecord::Base.connection.reconnect!
#         # worked = @target_model.create(arr_data)
#         # unworked = worked.select { |w| w.errors.any? }
#       end
#   end
# end
#
# class RegionConverter
#   def self.convert(value)
#     Region.where(:name => value)[0]
#   end
# end
# class ProjectConverter
#   def self.convert(value)
#     Project.where(:name => value)[0]
#   end
# end
# class LanguageConverter
#   def self.convert(value)
#     Language.where(:name => value)[0]
#   end
# end
