//
//  WeatherListTableViewCell.swift
//  weatherTest
//
//  Created by Hannatassja Hardjadinata on 19/06/22.
//

import UIKit

class WeatherListTableViewCell: UITableViewCell {
    
    var info: String? {
        didSet {
            locationLabel.text = info
        }
    }
    
    private let locationLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textAlignment = .left
        lbl.textColor = .accent
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let weatherIcon: UIImageView = {
        let img = UIImageView(image: UIImage(systemName: "sun.haze"))
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let descWeatherLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 11, weight: .light)
        lbl.textAlignment = .left
        lbl.textColor = .accent
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let pressureLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12, weight: .medium)
        lbl.textAlignment = .left
        lbl.textColor = .accent
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let temperatureLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 48, weight: .regular)
        lbl.textAlignment = .left
        lbl.textColor = .accent
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 6.0
        [self.locationLabel, self.descWeatherLabel, self.pressureLabel].forEach{stack.addArrangedSubview($0)}
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        createSubviews()
        addConstraints()
        
        descWeatherLabel.text = "Sunny"
        pressureLabel.text = "hot"
        temperatureLabel.text = "21°C"
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0))
    }
    
    private func setupView(){
        self.contentView.layer.cornerRadius = 24
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = .secondary
        self.selectionStyle = .none
    }
    
    private func createSubviews(){
        self.contentView.addSubview(stackView)
        
        self.contentView.addSubview(weatherIcon)
        self.stackView.addSubview(locationLabel)
        self.stackView.addSubview(descWeatherLabel)
        self.stackView.addSubview(pressureLabel)

        self.contentView.addSubview(temperatureLabel)
    }
    
    private func addConstraints(){
        
        let marginGuide = contentView.layoutMarginsGuide
        
        weatherIcon.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        weatherIcon.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant: 16).isActive = true
        weatherIcon.widthAnchor.constraint(equalToConstant:72).isActive = true
        weatherIcon.heightAnchor.constraint(equalToConstant:72).isActive = true
        
        stackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: weatherIcon.trailingAnchor, constant: 13).isActive = true
        
        temperatureLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -1).isActive = true
    }
    
}
