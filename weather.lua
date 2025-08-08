local http = require('socket.http')
local json = require('dkjson')

function conky_get_weather()
    local settings_path = os.getenv("HOME") .. "/.config/conky/weather_settings.lua"
    local settings = dofile(settings_path)

    local api_key = settings.api_key
    local city = settings.city
    local units = settings.units
    local url = string.format(
        "http://api.openweathermap.org/data/2.5/weather?q=%s&units=%s&appid=%s",
        city, units, api_key
    )

    local response, code = http.request(url)
    if not response or code ~= 200 then
        _G.weather_data = {err = "Weather Unavailable (code: "..tostring(code)..")"}
        return ""
    end

    local weather_json, pos, err = json.decode(response)
    if err or not weather_json or not weather_json.main then
        _G.weather_data = {err = "Weather Parse Error: "..tostring(err)}
        return ""
    end

    _G.weather_data = {
        temp = weather_json.main.temp,
        feels_like = weather_json.main.feels_like,
        humidity = weather_json.main.humidity,
        desc = weather_json.weather[1].description,
        wind = weather_json.wind.speed,
        city = weather_json.name,
        country = weather_json.sys.country
    }
    return ""
end

function conky_weather_info()
    if not _G.weather_data then return "Loading weather..." end
    if _G.weather_data.err then return "Error: " .. _G.weather_data.err end

    return string.format(
        "${color1}%s, %s${color}\nTemp: %.1f°C (Feels: %.1f°C)\nHumidity: %d%%\nWind: %.1f m/s\n%s",
        _G.weather_data.city,
        _G.weather_data.country,
        _G.weather_data.temp,
        _G.weather_data.feels_like,
        _G.weather_data.humidity,
        _G.weather_data.wind,
        _G.weather_data.desc:gsub("^%l", string.upper)
    )
end
