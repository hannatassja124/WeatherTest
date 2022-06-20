//
//  WeatherInfo.swift
//  weatherTest
//
//  Created by Hannatassja Hardjadinata on 19/06/22.
//

import UIKit

class WeatherInfoView: UIView {

    private let attributeNumber: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16, weight: .semibold)
        lbl.textAlignment = .center
        lbl.textColor = .accent
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let attributeImg: UIImageView = {
        let img = UIImageView(image: UIImage(systemName: "humidity"))
        img.contentMode = .scaleAspectFit
        img.tintColor = .accent
        return img
    }()
    
    private let attributeText: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 11, weight: .light)
        lbl.textAlignment = .center
        lbl.textColor = .body
        return lbl
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 7.0
        [self.attributeNumber, self.attributeImg, self.attributeText].forEach{stack.addArrangedSubview($0)}
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        attributeNumber.text = "7 mph"
        attributeText.text = "Wind"
        
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
        
        self.stackView.addSubview(attributeNumber)
        self.stackView.addSubview(attributeImg)
        self.stackView.addSubview(attributeText)
    }
    
    private func addConstraints(){
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }

}

