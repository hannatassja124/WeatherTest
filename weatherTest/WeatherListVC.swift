//
//  ViewController.swift
//  weatherTest
//
//  Created by Hannatassja Hardjadinata on 16/06/22.
//

import UIKit

class WeatherListVC: UIViewController {
    
    private let weatherTableView = UITableView()
    private let search = UISearchController(searchResultsController: nil)
    
    var safeArea: UILayoutGuide!
    
    var animal = ["cat", "dog", "woman"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        createSubview()
        addConstraints()
    }
    
    private func setupView(){
        self.navigationItem.searchController = search
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        weatherTableView.register(WeatherListTableViewCell.self, forCellReuseIdentifier: "cell")
        
        weatherTableView.separatorStyle = .none
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
        return animal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherListTableViewCell
        cell.info = animal[indexPath.row]
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

