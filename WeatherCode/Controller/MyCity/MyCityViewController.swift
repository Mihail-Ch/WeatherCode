//
//  MyCityViewController.swift
//  WeatherCode
//
//  Created by Михаил Чертов on 17.05.2023.
//

import UIKit


// передаем с помощью делегата
protocol CityUpdateProtocol {
    func onCityAdd(city: String)
}

class MyCityViewController: UIViewController, CityUpdateProtocol {
    
    let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)
    
    var myCities: [String] = []
    
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCityButton))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    @objc func addCityButton() {
        let allCityController = storyboardInstance.instantiateViewController(withIdentifier: "allCityController") as! AllCityViewController
        allCityController.handleUpdatedDataDelegate = self
        navigationController?.pushViewController(allCityController, animated: true)
        print("Look cities--")
    }
    
    // delegate
    func onCityAdd(city: String) {
        if !myCities.contains(city) {
            myCities.append(city)
        }
    }
}
