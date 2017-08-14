//
//  WeatherVC.swift
//  weatherApp
//
//  Created by Bondan Eko Prasetyo on 3/25/17.
//  Copyright © 2017 B-Soft. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.tintColor = UIColor(red: 204/256, green: 153/256, blue: 0/256, alpha: 1.0)
        refreshControl.addTarget(self, action:#selector(WeatherVC.refreshData), for: .valueChanged)
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.addSubview(refreshControl)
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
                //Code to update UI
                self.updateMainUI()
                
            }
        }
        
    }
    
    func refreshData()
    {
        self.downloadForecastData {
            self.refreshControl.endRefreshing()
        }
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete){
        //Downloading forecast weather data for TableView
        let forecastURL = URL(string: FORECAST_URL)
        
        Alamofire.request(forecastURL!).responseJSON {response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let list = dict["list"] as? [Dictionary<String,AnyObject>]{
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                    
                    self.tableView.reloadData()
                    
                }
            }
            completed()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            
            let forecast = forecasts[indexPath.row]
            
            cell.configureCell(forecast: forecast)
            
            return cell
        } else {
            return WeatherCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func updateMainUI(){
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text =  currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
}

