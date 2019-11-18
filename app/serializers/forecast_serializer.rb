# frozen_string_literal: true

class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type :foracast_location

  attributes :address,
             :date,
             :time,
             :summary,
             :icon,
             :temperature,
             :forecast_high,
             :forecast_low,
             :feels_like,
             :percent_humidity,
             :visibility_miles,
             :uv_index,
             :hourly_forecast,
             :daily_forecast
end
