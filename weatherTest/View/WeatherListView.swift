//
//  WeatherListView.swift
//  weatherTest
//
//  Created by Hannatassja Hardjadinata on 17/06/22.
//

import UIKit

class WeatherListView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        createSubViews()
    }
    
    init(){
        super.init(frame: .zero)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    private func createSubViews(){
        
    }
}
