# Weatha
Wetha IOS Weather App that tells you the current weather in your current location.

![Alt Text](https://media.giphy.com/media/WR3FhsM74tB8prOSwI/giphy.gif)

the Weatha App takes a Location permission to be able to detect your current location.
the app talks with the OpenWeatherMap API (https://openweathermap.org/api) to grab the weather data.

According to Your Current Location it sends a request to the OpenWeatherMap API to grab your location weather data, then display it on the Screen.

you can see the weather of a specific country, by going to the "ChangeCity" screen and typing the country name, after pressing the "Get Weather" button you will get the typed country weather.

NOTE: before running the app on your machine.

- Create an account on OpenWeatherMap and generate your own API Key.
- inside the projcet in Xcode, navigate to the "Controller" folder, then "ViewController.swift file", you will find a constant named "APIKey"
- copy and paste your OpenWeatherMap Account API key inside the "APIKey" constant double quotes.
<img width="1154" alt="Screen Shot 2019-05-10 at 5 32 11 PM" src="https://user-images.githubusercontent.com/47824055/57541674-dda99580-734f-11e9-881c-007130fef7b3.png">
