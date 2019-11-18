# frozen_string_literal: true

class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type :foracast_location

  attributes :address,
             :summary,
             :icon

  attribute :date do |object|
    Time.at(object.time_units).to_datetime.strftime('%D')
  end

  attribute :time do |object|
    Time.at(object.time_units).to_datetime.strftime('%I:%M %p')
  end

  attribute :temperature do |object|
    object.temp.round
  end

  attribute :feels_like do |object|
    object.feels_like.round
  end

  attribute :forecast_high do |object|
    object.forecast_high.round
  end

  attribute :forecast_low do |object|
    object.forecast_low.round
  end

  attribute :percent_humidity do |object|
    (object.percent_humidity * 100).to_i
  end

  attribute :visibility_miles do |object|
    object.visibility_miles.round(2)
  end

  attribute :uv_index

  attribute :hourly_forecast do |object|
    object.hourly.map do |forecast|
      {
        time: Time.at(forecast[:time]).to_datetime.strftime('%I:%M %p'),
        temperature: forecast[:temperature].round,
        uv_index: forecast[:uvIndex]
      }
    end
  end

  attribute :daily_forecast do |object|
    object.daily.map do |forecast|
      {
        day: Time.at(forecast[:time]).to_datetime.strftime('%A'),
        summary: forecast[:summary],
        icon: forecast[:icon],
        percent_humidity: (forecast[:humidity] * 100).to_i,
        forecast_high: forecast[:temperatureHigh].round,
        forecast_low: forecast[:temperatureLow].round
      }
    end
  end
end
