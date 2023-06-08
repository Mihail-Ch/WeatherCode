//
//  AllCityViewController.swift
//  WeatherCode
//
//  Created by Михаил Чертов on 17.05.2023.
//

import UIKit

class AllCityViewController: UIViewController {
    
    let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)
    var handleUpdatedDataDelegate: CityUpdateProtocol?
    
    let cities = [
        "Moscow",
        "London",
        "Paris",
        "Sochi",
        "Volgograd",
        "Kaliningrad"
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CitiesTableViewCell.self, forCellReuseIdentifier: CitiesTableViewCell.reuseId)
        return tableView
    }()

    override func loadView() {
        super.loadView()
        view.addSubview(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
    

}
