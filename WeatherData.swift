//
//  JsonStruct.swift
//  Clima
//
//  Created by obss on 5.05.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
struct WeatherData: Decodable{
    
    //var windSpeed: Double
    //var windDirection: Int
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
}

struct Main: Decodable{
    var temp: Double
    var humidity: Int
    var pressure: Int
    var feels_like: Double
}
struct Weather: Decodable{
    var description: String
    var id: Int
}
struct Wind: Decodable{
    var speed: Double
    var deg: Int
    
}

extension WeatherData{
    func getCityName() -> String{
        let name: String = name
        return name
    }
    
    func getAdviceLabel() -> String{
        switch self.weather[0].id{
        case 200...202:
            return "Better have an umbrella with you"
        case 210...211:
            return "I think Zeus is a little angry today..."
        case 212...221:
            return "Wandering around in the open and under trees can be very risky!"
        case 230...231:
            return "It might be good to carry an umbrella."
        case 232:
            return "It's raining cats and dogs!"
        case 300:
            return "A raincoat will do the trick."
        case 301:
            return "A raincoat will do the trick."
        case 302:
            return "Better have an umbrella with you"
        case 310:
            return "Maybe it will turn to rain later on"
        case 311...321:
            return "Better have an umbrella with you"
        case 500...531:
            return "Better have an umbrella with you"
        case 600:
            return "If you don't want to be cold, dress warmly."
        case 601:
            return "I guess this snow will stay on the ground!"
        case 602:
            return "It's in your best interest not to go out unless it's very urgent."
        case 611...622:
            return "Make sure your shoes are sturdy and waterproof."
        case 701...751:
            return "I hope you don't encounter a monster in the mists"
        case 751, 752, 762:
            return "Damn dust! Make sure all windows are closed! And be sure to protect your face outside."
        case 781:
            return "YOU MUST FIND A SHELTER!"
        case 800:
            return "I hope you are enjoying this beautiful weather!"
        case 801:
            return "There is only a little cloud. If the temperature is right for you, why not lie down on the grass?"
        case 802:
            return "It's a bit cloudy, but for now everything is fine!"
        case 803:
            return "Clouds are gathering together, it might be good to check the air pressure. If there is a sudden fall, protect yourself!"
        case 804:
            return "I think it might start to drizzle soon..."
            
        default:
            return "404 Not Found Error!"
        }
        
    }
    
    func getTemperatureData() -> String{
        let temp: String = String(format: "%.1f", self.main.temp)
        return temp
    }
    
    func getConditionImage() -> String{
        switch self.weather[0].id {
        case 200...202:
            return "cloud.bolt.rain"
        case 210...211:
            return "cloud.bolt"
        case 212...221:
            return "cloud.bolt.fill"
        case 230...231:
            return "cloud.bolt.rain"
        case 232:
            return "cloud.bolt.rain.fill"
        case 300:
            return "cloud.sun.rain"
        case 301:
            return "cloud.drizzle"
        case 302:
            return "cloud.drizzle.fill"
        case 310:
            return "cloud.sun.rain"
        case 311...321:
            return "cloud.rain"
        case 500...531:
            return "cloud.rain.fill"
        case 600:
            return "cloud.snow"
        case 601:
            return "cloud.snow.fill"
        case 602:
            return "snow.circle"
        case 611...622:
            return "cloud.sleet.fill"
        case 701...751:
            return "fog"
        case 751, 752, 762:
            return "sun.dust"
        case 781:
            return "tornado"
        case 800:
            return "sun.max"
        case 801:
            return "cloud.sun"
        case 802:
            return "cloud.sun.fill"
        case 803:
            return "cloud"
        case 804:
            return "cloud.fill"
            
        default:
            return "sun.max"
        }
    }
    
    func getConditionName() -> String{
        switch self.weather[0].id {
        case 200:
            return "Thunderstorm with light rain"
        case 201:
            return "Thunderstorm with rain"
        case 202:
            return "Thunderstorm with heavy rain"
        case 210:
            return "Light thunderstorm"
        case 211:
            return "Thunderstorm"
        case 212:
            return "Heavy thunderstorm"
        case 221:
            return "Ragged thunderstorm"
        case 230:
            return "Thunderstorm with light drizzle"
        case 231:
            return "Thunderstorm with drizzle"
        case 232:
            return "Thunderstorm with heavy drizzle"
        case 300:
            return "Light intensity drizzle"
        case 301:
            return "Drizzle"
        case 302:
            return "Heavy intensity drizzle"
        case 310:
            return "Light intensity drizzle"
        case 311:
            return "Drizzle rain"
        case 312:
            return "heavy intensity drizzle rain"
        case 313:
            return "Shower rain and drizzle"
        case 314:
            return "Heavy shower rain and drizzle"
        case 321:
            return "Shower drizzle"
        case 500:
            return "Light rain"
        case 501:
            return "Moderate rain"
        case 502:
            return "Heavy intensity rain"
        case 503:
            return "Very heavy rain"
        case 504:
            return "Extreme rain"
        case 511:
            return "Freezing rain"
        case 520:
            return "Lightly intensity shower rain"
        case 521:
            return "Shower rain"
        case 522:
            return "Heavy intensity shower rain"
        case 531:
            return "Ragger shower rain"
        case 600:
            return "Light snow"
        case 601:
            return "Snow"
        case 602:
            return "Heavy snow"
        case 611:
            return "Sleet"
        case 612:
            return "Light shower sleet"
        case 613:
            return "Shower sleet"
        case 615:
            return "Light Rain and snow"
        case 616:
            return "Rain and snow"
        case 620:
            return "Light shower snow"
        case 621:
            return "Shower snow"
        case 622:
            return "Heavy shower snow"
        case 701:
            return "Mist"
        case 711:
            return "Smoke"
        case 721:
            return "Haze"
        case 731:
            return "Sand/Dust whirls"
        case 741:
            return "Fog"
        case 751:
            return "Sand"
        case 761:
            return "Dust"
        case 762:
            return "Volcanic ash"
        case 771:
            return "Squalls"
        case 781:
            return "TORNADO!"
        case 800:
            return "Clear sky"
        case 801:
            return "Few clouds: 11-25%"
        case 802:
            return "Scattered clouds: 25-50%"
        case 803:
            return "Broken clouds: 51-84%"
        case 804:
            return "Overcast clouds: 85-100%"
        default:
            return "Have a nice day!"
        }
    }
    
}

