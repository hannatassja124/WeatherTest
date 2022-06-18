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
    }
    
    private func addConstraints(){
        let marginGuide = view.layoutMarginsGuide
        
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
        
        
    }
}
