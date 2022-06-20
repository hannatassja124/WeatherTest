//
//  WeatherDailyView.swift
//  weatherTest
//
//  Created by Hannatassja Hardjadinata on 19/06/22.
//

import Foundation
import UIKit

class WeatherDailyView: UIView {
    
    private let dayLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16, weight: .medium)
        lbl.textAlignment = .center
        lbl.textColor = .accent
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let weatherIcon: UIImageView = {
        let img = UIImageView(image: UIImage(systemName: "sun.haze"))
        img.sizeToFit()
        img.contentMode = .scaleAspectFit
        img.tintColor = .accent
        img.translatesAutoresizingMaskIntoConstraints = false
        img.widthAnchor.constraint(equalToConstant: 40).isActive = true
        img.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return img
    }()
    
    private let weatherDescLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 11, weight: .light)
        lbl.textAlignment = .center
        lbl.textColor = .body
        return lbl
    }()
    
    private let temperatureLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        lbl.textAlignment = .center
        lbl.textColor = .accent
        return lbl
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 15.0
        [self.dayLabel, self.weatherIcon, self.weatherDescLabel, self.temperatureLabel].forEach{stack.addArrangedSubview($0)}
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        dayLabel.text = "Mon"
        weatherDescLabel.text = "Wind"
        temperatureLabel.text = "21°C"
        
        self.backgroundColor = .secondary
        
        createSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
        addConstraints()
    }
    
    private func createSubviews(){
        self.addSubview(stackView)
        
        self.stackView.addSubview(dayLabel)
        self.stackView.addSubview(weatherIcon)
        self.stackView.addSubview(weatherDescLabel)
        self.stackView.addSubview(temperatureLabel)
    }
    
    private func addConstraints(){
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
