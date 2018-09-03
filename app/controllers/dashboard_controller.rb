class DashboardController < ApplicationController

  def index
    @search = ransack_params
    @fact_phones  = ransack_result
    @search.build_condition if @search.conditions.empty?
  end
  def landing
  end

  private
    def ransack_params
      FactPhone.ransack(params[:q])
    end

    def ransack_result
      @search.result(distinct: user_wants_distinct_results?)
    end

    def user_wants_distinct_results?
      params[:distinct].to_i == 1
    end

end
