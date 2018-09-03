class Dater
  attr_reader :start_date, :end_date, :model

  def initialize(params)
    params ||= {}
    @start_date = parsed_date(params[:start_date], 7.days.ago.to_date)
    @end_date = parsed_date(params[:end_date], Date.today)
    @model = params[:model]
  end

  def start_date
    @start_date.beginning_of_day
  end

  def end_date
    @end_date.end_of_day
  end

  def resource_class
    parsed_model(@model)
  end

  def this_month_range
    @start_date.beginning_of_month.strftime('%Y-%b-%d %T')..@start_date.end_of_month.end_of_day.strftime('%Y-%b-%d %T')
  end

  def prev_month_range
    @start_date.prev_month.beginning_of_month.strftime('%Y-%b-%d %T')..@start_date.prev_month.end_of_month.end_of_day.strftime('%Y-%b-%d %T')
  end

  def last_week
    sdate = Date.today.wday == 1 ? Date.today : 1.week.ago.to_date.next_week
    get_week_range(sdate)
  end

  def custom_week
    get_week_range(@start_date)
  end

  def custom_range
    start_date.strftime('%Y-%b-%d %T')..end_date.strftime('%Y-%b-%d %T')
  end

  private

    def get_week_range(zdate)
      prev_start_date = zdate.beginning_of_week
      prev_end_date = prev_start_date.next_week - 1.day
      prev_start_date.beginning_of_day.strftime('%Y-%b-%d %T')..prev_end_date.end_of_day.strftime('%Y-%b-%d %T')
    end
    def parsed_model(model_name)
      Object.const_get(model_name.singularize.camelize) unless model_name.nil?
    end
    def parsed_date(date_string, default)
      Date.parse(date_string)
      rescue ArgumentError, TypeError
        default
    end
end
