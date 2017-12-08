wifi.setmode(wifi.STATION)
station_cfg={}
station_cfg.ssid="YourSSID"
station_cfg.pwd="YourPassword"
station_cfg.save=true
wifi.sta.config(station_cfg)

pin=4
count=0
power=0
tmrlast=0

function onChange()
    if (tmr.now() - tmrlast > 100000) then
        count = count + 1;
        tmrlast = tmr.now()
        print(count)
    end
end

function submit()
    power = count * 60;
    count = 0;
    -- print (power)
    http.get("http://<your emoncms url>/emoncms/input/post.json?node=1&json={power:"..power.."}&apikey=<your apikey>", nil, function(code, data)
    if (code < 0) then
      print("HTTP request failed")
          else
      print(code, data, power)
      end
  end)
end

gpio.mode(pin, gpio.INT)
gpio.trig(pin, "both", onChange)

tmr.alarm(0, 60000, 1, function() submit() end )
