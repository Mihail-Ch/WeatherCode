//
//  CitiesTableViewCell.swift
//  WeatherCode
//
//  Created by Михаил Чертов on 31.05.2023.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {
    
    static let reuseId = "cityCell"
    
    lazy var cityName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cityName)
        createConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func createConstraint() {
        NSLayoutConstraint.activate([
            cityName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cityName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cityName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10)
        ])
    }

}
