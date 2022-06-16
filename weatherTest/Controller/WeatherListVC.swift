//
//  ViewController.swift
//  weatherTest
//
//  Created by Hannatassja Hardjadinata on 16/06/22.
//

import UIKit

class WeatherListVC: UIViewController {
    
    let weatherListView = WeatherListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(weatherListView)
        
        let height = UIApplication.shared.statusBarFrame ?? CGRect.zero
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: height.height, width: UIScreen.main.bounds.width, height: 44))
        let navItem = UINavigationItem(title: "Weather")
        navItem.titleView?.tintColor = .accent
        navBar.setItems([navItem], animated: false)
        view.addSubview(navBar)
    }


}

