# espower-emon
ESP8266 based device to count flashes from a power meter and log them to EmonCMS.

This project uses a small circuit to convert the flashes from the LED into pulses we can detect on a GPIO pin. The circuit is based on an LDR as one half of a voltage divider to trigger a transistor which is connected to a GPIO pin on the ESP8266.

The circuit is documented here: http://pyevolve.sourceforge.net/wordpress/?p=2383

It's written for an ESP8266 running NodeMCU firmware, everything is contained within init.lua. Plug in your wifi details and emoncms url/api key and you're away.

