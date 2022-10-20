
import Foundation
struct WeatherManager {
    let apiKey = "" //apiKey should be included
    let siteUrl = "https://api.openweathermap.org/data/2.5/weather?&appid=\(apiKey)&units=metric"
    var decode: String?
    
    func fetchWeather(cityName: String, completion: @escaping ((_ response: WeatherData?) -> Void?)) {
        let urlString = "\(siteUrl)&q=\(cityName)"
        performingRequest(urlString: urlString, completion: completion)
    }
    
    func fetchCoord(coordLat: Float, coordLon: Float, completion: @escaping((_ response: WeatherData?) -> Void?)){
        let newUrlString = "\(siteUrl)&lat=\(coordLat)&lon=\(coordLon)"
        performingRequest(urlString: newUrlString, completion: completion)
    }
    
    func performingRequest(urlString: String, completion: @escaping ((_ response: WeatherData?) -> Void?)){
        
        if let url = URL(string: urlString){
            //create a url
            let session = URLSession(configuration: .default)
            // create a urlSession
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data {
                    let weatherdata = parseJSON(weatherData: safeData)
                    completion(weatherdata)
                }
            }
            // create a url task
            task.resume()
            // start the task
        }else{
            
        }
        
    }
    func parseJSON(weatherData: Data) -> WeatherData? {
        let decoder = JSONDecoder()
            
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            //print(decodedData)
            return decodedData
            
        } catch{
            print(error)
            return nil
        }
    }
    
}
