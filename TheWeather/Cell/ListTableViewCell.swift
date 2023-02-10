//
//  ListTableViewCell.swift
//  TheWeather
//
//  Created by Айдар Оспанов on 07.02.2023.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel(text: "Название", font: nil)
    let statusLabel = UILabel(
        text: "Статус",
        font: UIFont.systemFont(ofSize: 12),
        textAlignment: .right,
        textColor: .systemGray3
    )
    
    var stackView: UIStackView!
    
    let temperatureLabel = UILabel(text: "99", font: nil)
    let measureLabel = UILabel(text: "ºC", font: nil, textAlignment: .right)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func setupView() {
        setupStackView()
        addSubViews()
        setupLayout()
    }
    
    private func addSubViews() {
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(stackView)
    }
    
    private func setupStackView() {
        stackView = UIStackView(
            arrangedSubviews: [temperatureLabel, measureLabel],
            axis: .horizontal,
            spacing: 0
        )
    }
    
    func configure(_ weather: TheWeatherModel) {
        nameLabel.text = weather.name
        statusLabel.text = weather.conditionString
        temperatureLabel.text = "\(weather.temperature)"
    }
    
}

extension ListTableViewCell {
    func setupLayout() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            statusLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -7),
        ])
    }
}
