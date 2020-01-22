# Whether, Sweater?

![Whether, Sweater? Screenshot](/whether_sweater_front.png?raw=true "Whether, Sweater? Screenshot")

## About

_Whether, Sweater?_ is a [Turing School of Software & Design](https://turing.io/) project of the backend engineering program. _Whether, Sweater?_ is an API with endpoints that produce weather data for specific locations, meant to be consumed by a hypothetical front end, pictured above. It utilizes APIs from Google, Dark Sky and Flickr to gather relevant information, and formats it for consumption according to JSON:API specs.


The deployed site's endpoints can be consumed at:

https://whether-sweater-check.herokuapp.com/

## Endpoints

### GET /api/v1/forecast?location=Kigali

Returns the current weather for a location, as well as both 8-hour and 5-day forecasts.

Example of expected output:
```json
{
    "data": {
        "id": null,
        "type": "foracast_location",
        "attributes": {
            "address": "Kigali, Rwanda",
            "summary": "Ciel Nuageux",
            "icon": "partly-cloudy-night",
            "date": "11/18/19",
            "time": "09:20 PM",
            "temperature": 21,
            "feels_like": 21,
            "forecast_high": 27,
            "forecast_low": 14,
            "percent_humidity": 72,
            "visibility_miles": 10.16,
            "uv_index": 0,
            "hourly_forecast": [
                {
                    "time": "09:00 PM",
                    "temperature": 22,
                    "uv_index": 0
                },
                {
                    "time": "10:00 PM",
                    "temperature": 21,
                    "uv_index": 0
                },
                {
                    "time": "11:00 PM",
                    "temperature": 18,
                    "uv_index": 0
                },
                {
                    "time": "12:00 AM",
                    "temperature": 16,
                    "uv_index": 0
                },
                {
                    "time": "01:00 AM",
                    "temperature": 16,
                    "uv_index": 0
                },
                {
                    "time": "02:00 AM",
                    "temperature": 15,
                    "uv_index": 0
                },
                {
                    "time": "03:00 AM",
                    "temperature": 15,
                    "uv_index": 0
                },
                {
                    "time": "04:00 AM",
                    "temperature": 15,
                    "uv_index": 0
                }
            ],
            "daily_forecast": [
                {
                    "day": "Monday",
                    "summary": "Pluie faible possible dans l’après-midi et la soirée.",
                    "icon": "rain",
                    "percent_humidity": 88,
                    "forecast_high": 27,
                    "forecast_low": 14
                },
                {
                    "day": "Tuesday",
                    "summary": "Bruine possible dans l’après-midi.",
                    "icon": "rain",
                    "percent_humidity": 86,
                    "forecast_high": 26,
                    "forecast_low": 16
                },
                {
                    "day": "Wednesday",
                    "summary": "Pluie faible possible commençant dans l’après-midi.",
                    "icon": "rain",
                    "percent_humidity": 88,
                    "forecast_high": 28,
                    "forecast_low": 16
                },
                {
                    "day": "Thursday",
                    "summary": "Pluie faible et temps humide toute la journée.",
                    "icon": "rain",
                    "percent_humidity": 97,
                    "forecast_high": 26,
                    "forecast_low": 16
                },
                {
                    "day": "Friday",
                    "summary": "Pluie faible dans la matinée et l’après-midi.",
                    "icon": "rain",
                    "percent_humidity": 100,
                    "forecast_high": 21,
                    "forecast_low": 16
                }
            ]
        }
    }
}
```

### GET /api/v1/backgrounds?location=Shangai

Returns 10 background images for a specified location.

Example of expected output:
```json
{
    "data": [
        {
            "id": null,
            "type": "background_images",
            "attributes": {
                "alt": "Shanghai skyline",
                "url": "https://farm66.staticflickr.com/65535/48662736608_c24476f5de.jpg"
            }
        },
        {
            "id": null,
            "type": "background_images",
            "attributes": {
                "alt": "island 孤島",
                "url": "https://farm66.staticflickr.com/65535/47773103122_9a993cd756.jpg"
            }
        },
        {
            "id": null,
            "type": "background_images",
            "attributes": {
                "alt": "Shanghai city",
                "url": "https://farm66.staticflickr.com/65535/47732078721_7da114e9bf.jpg"
            }
        },
        {
            "id": null,
            "type": "background_images",
            "attributes": {
                "alt": "Shanghai & Lights",
                "url": "https://farm8.staticflickr.com/7899/47440852212_498d3e72f8.jpg"
            }
        },
        {
            "id": null,
            "type": "background_images",
            "attributes": {
                "alt": "Shanghai city",
                "url": "https://farm8.staticflickr.com/7843/46653252414_1b232ffd2b.jpg"
            }
        },
        {
            "id": null,
            "type": "background_images",
            "attributes": {
                "alt": "Shanghai city skyline",
                "url": "https://farm8.staticflickr.com/7881/32434322507_d8a5f49407.jpg"
            }
        },
        {
            "id": null,
            "type": "background_images",
            "attributes": {
                "alt": "Shanghai city skyline",
                "url": "https://farm8.staticflickr.com/7882/32432107337_53a58106b7.jpg"
            }
        },
        {
            "id": null,
            "type": "background_images",
            "attributes": {
                "alt": "Dawn of Shanghai",
                "url": "https://farm8.staticflickr.com/7800/47005089182_45050b9ca1.jpg"
            }
        },
        {
            "id": null,
            "type": "background_images",
            "attributes": {
                "alt": "Shanghai city skyline",
                "url": "https://farm8.staticflickr.com/7857/46975249071_5d418ccb0a.jpg"
            }
        },
        {
            "id": null,
            "type": "background_images",
            "attributes": {
                "alt": "Shanghai city skyline",
                "url": "https://farm8.staticflickr.com/7891/39754268623_9f93d388ef.jpg"
            }
        },
        {
            "id": null,
            "type": "background_images",
            "attributes": {
                "alt": "YOUNGMAN JNP6120BEV1_HuD96397_1",
                "url": "https://farm5.staticflickr.com/4810/44732493350_e1925c5d5d.jpg"
            }
        }
    ]
}
```

### POST /api/v1/users

Creates a user account, using an email, password, and password_confirmation passed in as form data in the body of the request.

Request:
```json

Content-Type: application/json
Accept: application/json

body:
{
  "email": "my_email@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

Example of expected output:
```json
{
    "api_key": "bb4ad4d94fb2a56752ad137b2616f023"
}
```

### POST /api/v1/sessions

Authenticates a user, using an email and password passed in as form data in the body of the request.

Request:
```json
Content-Type: application/json
Accept: application/json

body:
{
  "email": "my_email@example.com",
  "password": "password"
}
```

Example of expected output:
```json
{
    "api_key": "bb4ad4d94fb2a56752ad137b2616f023"
}
```

### POST /api/v1/road_trip

Returns the forecast for the destination at the time of arrival, using form data passed in the body of the request.

Request:
```json
Content-Type: application/json
Accept: application/json

body:
{
  "origin": "Kigali", 
  "destination": "Nairobi",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

Example of expected output:
```json
{
    "data": {
        "id": null,
        "type": "road_trip_forecast",
        "attributes": {
            "origin": "Kigali, Rwanda",
            "destination": "Nairobi, Kenya",
            "trip_duration_text": "20 hours 14 mins",
            "icon": "partly-cloudy-night",
            "summary": "Faibles Passages Nuageux",
            "temperature": 18,
            "feels_like": 18,
            "visibility_miles": 11.04,
            "uv_index": 0
        }
    }
}
```

## Get Started

### Requirements

* [Ruby 2.6.3](https://www.ruby-lang.org/en/downloads/) - Ruby Version
* [Rails 5.2.3](https://rubyonrails.org/) - Rails Version

```
$ git clone git@github.com:TheMindset/whether_sweater.git
$ cd whether_sweater
$ bundle install
```

### Setup Database

```
$ rails db:create db:migrate
```

Additionally, you'll need:
* A [Dark Sky api key](https://darksky.net/dev/), and have it defined within `ENV['DARKSKY_API_KEY']`
* A [Flickr api key](https://www.flickr.com/services/api/), and have it defined within `ENV['FLICKR_API_KEY']`
* A [Google api key](https://developers.google.com/maps/documentation/embed/get-api-key/), and have it defined within `ENV['GOOGLE_MAPS_API_KEY']`

### API Exploration

Once installation and database setup are complete, explore the various API endpoints with the following steps:
* `$ rails s`
* Open your browser, and visit `http://localhost:3000/`
* In a separate terminal window, query the available endpoints by running `rails routes`
* Copy any of the URIs displayed and append to `http://localhost:3000/` in your browser

### Running Tests

`$ rails rspec`.
