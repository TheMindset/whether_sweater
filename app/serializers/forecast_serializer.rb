# frozen_string_literal: true

class ForecastSerializer
  # include FastJsonapi::ObjectSerializer
  def self.serialize(location_forecast)
    {
      data: {
        currently: {
          date: Time.at(location_forecast.currently[:time]).to_datetime.strftime('%m-%d'),
          time: Time.at(location_forecast.currently[:time]).to_datetime.strftime('%I:%M%p'),
          summary: location_forecast.currently[:summary],
          icon: location_forecast.currently[:icon],
          temperature: location_forecast.currently[:temperature].round,
          forecast_high: location_forecast.daily[0][:temperatureHigh].round,
          forecast_low: location_forecast.daily[0][:temperatureLow].round,
          feels_like: location_forecast.currently[:apparentTemperature].round,
          percent_humidity: (location_forecast.currently[:humidity] * 100).to_i,
          visibility_miles: location_forecast.currently[:visibility].round(2),
          uv_index: location_forecast.currently[:uvIndex]
        },
        hourly: [
          {
            time: Time.at(location_forecast.hourly[0][:time]).to_datetime.strftime('%I:%M%p'),
            temperature: location_forecast.hourly[0][:temperature].round
          },
          {
            time: Time.at(location_forecast.hourly[1][:time]).to_datetime.strftime('%I:%M%p'),
            temperature: location_forecast.hourly[1][:temperature].round
          },
          {
            time: Time.at(location_forecast.hourly[2][:time]).to_datetime.strftime('%I:%M%p'),
            temperature: location_forecast.hourly[2][:temperature].round
          },
          {
            time: Time.at(location_forecast.hourly[3][:time]).to_datetime.strftime('%I:%M%p'),
            temperature: location_forecast.hourly[3][:temperature].round
          },
          {
            time: Time.at(location_forecast.hourly[4][:time]).to_datetime.strftime('%I:%M%p'),
            temperature: location_forecast.hourly[4][:temperature].round
          },
          {
            time: Time.at(location_forecast.hourly[5][:time]).to_datetime.strftime('%I:%M%p'),
            temperature: location_forecast.hourly[5][:temperature].round
          },
          {
            time: Time.at(location_forecast.hourly[6][:time]).to_datetime.strftime('%I:%M%p'),
            temperature: location_forecast.hourly[6][:temperature].round
          },
          {
            time: Time.at(location_forecast.hourly[7][:time]).to_datetime.strftime('%I:%M%p'),
            temperature: location_forecast.hourly[7][:temperature].round
          }
        ],
        daily: [
          {
            day: Time.at(location_forecast.daily[1][:time]).to_datetime.strftime('%A'),
            summary: location_forecast.daily[1][:summary],
            icon: location_forecast.daily[1][:icon],
            percent_humidity: (location_forecast.daily[1][:humidity] * 100).to_i,
            forecast_high: location_forecast.daily[1][:temperatureHigh].round,
            forecast_low: location_forecast.daily[1][:temperatureLow].round
          },
          {
            day: Time.at(location_forecast.daily[2][:time]).to_datetime.strftime('%A'),
            summary: location_forecast.daily[2][:summary],
            icon: location_forecast.daily[2][:icon],
            percent_humidity: (location_forecast.daily[2][:humidity] * 100).to_i,
            forecast_high: location_forecast.daily[2][:temperatureHigh].round,
            forecast_low: location_forecast.daily[2][:temperatureLow].round
          },
          {
            day: Time.at(location_forecast.daily[3][:time]).to_datetime.strftime('%A'),
            summary: location_forecast.daily[3][:summary],
            icon: location_forecast.daily[3][:icon],
            percent_humidity: (location_forecast.daily[3][:humidity] * 100).to_i,
            forecast_high: location_forecast.daily[3][:temperatureHigh].round,
            forecast_low: location_forecast.daily[3][:temperatureLow].round
          },
          {
            day: Time.at(location_forecast.daily[4][:time]).to_datetime.strftime('%A'),
            summary: location_forecast.daily[4][:summary],
            icon: location_forecast.daily[4][:icon],
            percent_humidity: (location_forecast.daily[4][:humidity] * 100).to_i,
            forecast_high: location_forecast.daily[4][:temperatureHigh].round,
            forecast_low: location_forecast.daily[4][:temperatureLow].round
          },
          {
            day: Time.at(location_forecast.daily[5][:time]).to_datetime.strftime('%A'),
            summary: location_forecast.daily[5][:summary],
            icon: location_forecast.daily[5][:icon],
            percent_humidity: (location_forecast.daily[5][:humidity] * 100).to_i,
            forecast_high: location_forecast.daily[5][:temperatureHigh].round,
            forecast_low: location_forecast.daily[5][:temperatureLow].round
          }
        ]
      }
    }
  end
end
