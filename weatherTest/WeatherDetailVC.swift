//
//  File.swift
//  weatherTest
//
//  Created by Hannatassja Hardjadinata on 18/06/22.
//

import Foundation
import UIKit

class WeatherDetailVC: UIViewController {
    
    private let locationLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        lbl.textColor = .accent
        return lbl
    }()
    
    private let weatherIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "cloud.drizzle"))
        return imageView
    }()
    
    private let temperatureLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 48, weight: .regular)
        lbl.textColor = .accent
        return lbl
    }()
    
    private let descWeatherLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 20, weight: .light)
        lbl.textColor = .accent
        return lbl
    }()
    
    private let weatherInfoBox: UIView = {
        let view = UIView()
        view.backgroundColor = .secondary
        view.layer.cornerRadius = 24
        return view
    }()
    
    private let dailyWeatherBox: UIView = {
        let view = UIView()
        view.backgroundColor = .secondary
        view.layer.cornerRadius = 24
        return view
    }()
    
    let windView = WeatherInfoView()
    let humidityView = WeatherInfoView()
    let pressureView = WeatherInfoView()
    
    let dayOneView = WeatherDailyView()
    let dayTwoView = WeatherDailyView()
    let dayThreeView = WeatherDailyView()
    let dayFourView = WeatherDailyView()
    let dayFiveView = WeatherDailyView()
    
    lazy var stackViewInfo: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.layer.cornerRadius = 24
        stack.distribution = .fillEqually
        stack.spacing = 1.0
        stack.clipsToBounds = true
        stack.backgroundColor = .accessories
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var stackViewDaily: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.layer.cornerRadius = 24
        stack.distribution = .fillEqually
        stack.spacing = 1.0
        stack.clipsToBounds = true
        stack.backgroundColor = .accessories
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        createSubview()
        addConstraints()
    }
    
    private func setupView(){
        locationLabel.text = "Miami, Indonesia"
        temperatureLabel.text = "21°C"
        descWeatherLabel.text = "Mostly Shower"
        
        self.view.backgroundColor = .primary
        self.navigationItem.largeTitleDisplayMode = .never
    
    }
    
    private func createSubview(){
        view.addSubview(locationLabel)
        view.addSubview(weatherIcon)
        view.addSubview(temperatureLabel)
        view.addSubview(descWeatherLabel)
        
        view.addSubview(weatherInfoBox)
        view.addSubview(dailyWeatherBox)
        
        view.addSubview(stackViewInfo)
        
        stackViewInfo.addArrangedSubview(windView)
        stackViewInfo.addArrangedSubview(humidityView)
        stackViewInfo.addArrangedSubview(pressureView)
        
        view.addSubview(stackViewDaily)
        
        stackViewDaily.addArrangedSubview(dayOneView)
        stackViewDaily.addArrangedSubview(dayTwoView)
        stackViewDaily.addArrangedSubview(dayThreeView)
        stackViewDaily.addArrangedSubview(dayFourView)
        stackViewDaily.addArrangedSubview(dayFiveView)
    }
    
    private func addConstraints(){
        let marginGuide = view.layoutMarginsGuide
        
        weatherInfoBox.translatesAutoresizingMaskIntoConstraints = false
        dailyWeatherBox.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        descWeatherLabel.translatesAutoresizingMaskIntoConstraints = false
        
        locationLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        locationLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 34).isActive = true
        
        weatherIcon.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 28.45).isActive = true
        weatherIcon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        weatherIcon.heightAnchor.constraint(equalToConstant: 131).isActive = true
        weatherIcon.widthAnchor.constraint(equalToConstant: 131).isActive = true

        temperatureLabel.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 24).isActive = true
        temperatureLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        descWeatherLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 20).isActive = true
        descWeatherLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        weatherInfoBox.topAnchor.constraint(equalTo: descWeatherLabel.bottomAnchor, constant: 30).isActive = true
        weatherInfoBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        weatherInfoBox.widthAnchor.constraint(equalToConstant: 380).isActive = true
        weatherInfoBox.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        stackViewInfo.topAnchor.constraint(equalTo: weatherInfoBox.topAnchor, constant: 18).isActive = true
        stackViewInfo.leadingAnchor.constraint(equalTo: weatherInfoBox.leadingAnchor, constant: 0).isActive = true
        stackViewInfo.trailingAnchor.constraint(equalTo: weatherInfoBox.trailingAnchor, constant: 0).isActive = true
        stackViewInfo.bottomAnchor.constraint(equalTo: weatherInfoBox.bottomAnchor, constant: -18).isActive = true
        
        dailyWeatherBox.topAnchor.constraint(equalTo: weatherInfoBox.bottomAnchor, constant: 30).isActive = true
        dailyWeatherBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dailyWeatherBox.widthAnchor.constraint(equalToConstant: 380).isActive = true
        dailyWeatherBox.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        stackViewDaily.topAnchor.constraint(equalTo: dailyWeatherBox.topAnchor, constant: 18).isActive = true
        stackViewDaily.leadingAnchor.constraint(equalTo: dailyWeatherBox.leadingAnchor, constant: 0).isActive = true
        stackViewDaily.trailingAnchor.constraint(equalTo: dailyWeatherBox.trailingAnchor, constant: 0).isActive = true
        stackViewDaily.bottomAnchor.constraint(equalTo: dailyWeatherBox.bottomAnchor, constant: -18).isActive = true
    }
}

