class ChartsController < ActionController::Base

  def telephony_week
    dater = Dater.new({:model => 'FactPhone'})
    result = FactPhone.where(:record_date => dater.last_week)
    if result.size != 0
      result = result.group(:record_date)
      result = result.select('record_date, sum(calls_off) as ttl_offered')
      result = result.map do |r|
        [r.record_date.to_date, r.ttl_offered]
      end
      render json: [{name: 'CallsOffered', data: result}]
    else
      render json: []
    end
  end

end
