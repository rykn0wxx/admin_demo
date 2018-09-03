class AdminImport
  
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
  def self.init(model_name, file_param, other_options = {})
    @model_name = model_name
    @model = model_name.classify.constantize
    @file = file_param
    assign_to_options(other_options)
    import
  end
  def self.import
    process_file
    @imp_res = import_result
    @imp_res[0]
  end
  def self.import_result
    Parallel.map(@lines) do |record|
      csv_worker(record)
    end
  end
  protected
    def self.csv_worker(record)
      @model.import record, :batch_size => 1000
    end
    def self.process_file
      @lines = SmarterCSV.process(@file.path, @options)
    end
    def self.assign_to_options(options)
      @options = {
        :strip_chars_from_headers => /[\-"]/,
        :force_simple_split => true,
        :chunk_size => 1000,
        :remove_unmapped_keys => true,
        :verbose => true
      }.merge(options.slice(*OPTIONS))
    end
end
