//
//  ViewController.swift
//  weatherTest
//
//  Created by Hannatassja Hardjadinata on 16/06/22.
//

import UIKit
import Alamofire
import MapKit
import CoreLocation

class WeatherListVC: UIViewController, CLLocationManagerDelegate {
    
    private let weatherTableView = UITableView()
    
    private var weatherSearchTableVC = WeatherSearchTableVC()
    
    var safeArea: UILayoutGuide!
    
    var locManager = CLLocationManager()
    var currLocation = CLLocation()
    
    var weatherList = [Weather]()
    
    //var animal = ["animal", "test"]

    override func viewDidLoad() {
        super.viewDidLoad()
    
        //fetchData()
        
        setupView()
        fetchLocation()
        
        createSubview()
        addConstraints()
        
        print("test 2", weatherList.count)
    }
    
//    private func fetchYourLocation(){
//        locManager.delegate = self
//
//        locManager.requestAlwaysAuthorization()
//        locManager.requestWhenInUseAuthorization()
//
//        locManager.startUpdatingLocation()
//
//        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
//            guard let currLocation = locManager.location else {
//                return
//            }
//
//            let req = AF.request("https://api.openweathermap.org/data/2.5/onecall?lat=\(currLocation.coordinate.latitude)&lon=\(currLocation.coordinate.longitude)&exclude=minutely,hourly&appid=5d10f44082fed78e8349fc49ee313386").validate()
//
//            req.responseDecodable(of: Weather.self) { (response) in
//                guard let test = response.value else {return}
//                self.weatherList.append(test)
//                //print(test)
//                print("test")
//            }
//        }
//    }
    
    private func fetchLocation() {
        
        var url: URL!

        locManager.delegate = self

        locManager.requestAlwaysAuthorization()
        locManager.requestWhenInUseAuthorization()

        locManager.startUpdatingLocation()
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            guard let currLocation = locManager.location else {
                return
            }

            url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(currLocation.coordinate.latitude)&lon=\(currLocation.coordinate.longitude)&exclude=minutely,hourly&appid=5d10f44082fed78e8349fc49ee313386")!
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let res = try JSONDecoder().decode(Weather.self, from: data)
                    DispatchQueue.main.async{
                        self.weatherList.append(res)
                        self.weatherTableView.reloadData()
                    }
                    print("res", res.lat)
                } catch let error {
                    print("error", error)
                }
            }
        }
        task.resume()
        
        
        print("test 3", weatherList.count)
    }
    
    private func fetchData(){
        
        let req = AF.request("https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=minutely,hourly&appid=5d10f44082fed78e8349fc49ee313386").validate()
        
        req.responseDecodable(of: Weather.self) { (response) in
            
            guard let test = response.value else {return}
            print(test.daily)
            
        }

    }
    
    private func setupView(){
        
        let search = UISearchController(searchResultsController: weatherSearchTableVC)
        
        search.searchResultsUpdater = weatherSearchTableVC
        self.navigationItem.searchController = search
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        definesPresentationContext = true
        
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        weatherTableView.register(WeatherListTableViewCell.self, forCellReuseIdentifier: "cell")
        
        weatherTableView.separatorStyle = .none
        
        self.view.backgroundColor = .primary
        weatherTableView.backgroundColor = .primary
    }
    
    private func createSubview(){
        view.addSubview(weatherTableView)
    }
    
    private func addConstraints(){
        let marginGuide = view.layoutMarginsGuide
        
        weatherTableView.translatesAutoresizingMaskIntoConstraints = false
          
        NSLayoutConstraint.activate([
            weatherTableView.topAnchor.constraint(equalTo: marginGuide.topAnchor),
            weatherTableView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            weatherTableView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            weatherTableView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor)
        ])
    }

}

extension WeatherListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherListTableViewCell
        cell.info = animal[indexPath.row]
        cell.backgroundColor = .primary
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WeatherDetailVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

