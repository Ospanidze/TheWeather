//
//  DescriptionViewController.swift
//  TheWeather
//
//  Created by Айдар Оспанов on 08.02.2023.
//

import UIKit
import SwiftSVG
 
class DescriptionViewController: UIViewController {
    
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    var weatherModel: TheWeatherModel?
    
    let nameCityLabel = UILabel(text: "Название",
                                font: UIFont.systemFont(ofSize: 20),
                                textAlignment: .center)
    
    let descriptionLabel = UILabel(text: "Ясно",
                                   font: UIFont.systemFont(ofSize: 20),
                                   textAlignment: .center)
    
    let tempCityLabel = UILabel(text: "88",
                                  font: UIFont.systemFont(ofSize: 20),
                                  textAlignment: .right)
    
    let measureCityLabel = UILabel(text: "ºC",
                                   font: UIFont.systemFont(ofSize: 20))
    
    let pressureLabel = UILabel(text: "1000",
                                font: UIFont.systemFont(ofSize: 14),
                                textAlignment: .right)
    
    let measurePressLabel = UILabel(text: "мм.рт.ст",
                                    font: UIFont.systemFont(ofSize: 14))
    
    let speedWindLable = UILabel(text: "1000",
                                 font: UIFont.systemFont(ofSize: 14),
                                 textAlignment: .right)
    
    let measureSpeedWindLabel = UILabel(text: "м/с",
                                        font: UIFont.systemFont(ofSize: 14))
    
    let minTemperatureLabel = UILabel(text: "1000",
                                      font: UIFont.systemFont(ofSize: 14),
                                      textAlignment: .right)
    
    let measureMinTempLabel = UILabel(text: "ºC",
                                      font: UIFont.systemFont(ofSize: 14))
    
    
    let maxTemperatureLabel = UILabel(text: "1000",
                                      font: UIFont.systemFont(ofSize: 14),
                                      textAlignment: .right)
    
    let measureMaxTempLabel = UILabel(text: "ºC",
                                      font: UIFont.systemFont(ofSize: 14))
    
    
    let viewCity: UIView = {
        let view = UIView()
        //view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptions = ["Давление:", "Cкорость ветра:", "Min температура днем:", "Max температура днем:"]
    
    var stackView: UIStackView!
    var mainStackView: UIStackView!
    var leftStackView: UIStackView!
    
    var pressureStackView: UIStackView!
    var speedWindStackView: UIStackView!
    var minTempStackView: UIStackView!
    var maxTempStackView: UIStackView!
    
    var rightStackView: UIStackView!
    var bottomStacKView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        refreshLabels()
    }
    
    private func setupView() {
        setupStackViews()
        addSubViews()
        setupLayout()
        
    }
    
    private func addSubViews() {
        view.addSubview(mainStackView)
        view.addSubview(bottomStacKView)
    }
    
    private func setupStackViews() {
    
        stackView = UIStackView(
            arrangedSubviews: [tempCityLabel, measureCityLabel],
            axis: .horizontal,
            spacing: 0
        )
        
        mainStackView = UIStackView(
            arrangedSubviews: [nameCityLabel, viewCity, descriptionLabel, stackView],
            axis: .vertical,
            spacing: 10,
            distribution: .fill
        )
        
        leftStackView = UIStackView(
            arrangedSubviews: descriptions.map { makeLabel($0) },
            axis: .vertical,
            spacing: 10,
            distribution: .fillProportionally
        )
        
        pressureStackView = UIStackView(
            arrangedSubviews: [pressureLabel, measurePressLabel],
            axis: .horizontal,
            spacing: 0
        )
        
        speedWindStackView = UIStackView(
            arrangedSubviews: [speedWindLable, measureSpeedWindLabel],
            axis: .horizontal,
            spacing: 0
        )
        
        minTempStackView = UIStackView(
            arrangedSubviews: [minTemperatureLabel, measureMinTempLabel],
            axis: .horizontal,
            spacing: 0
        )
        
        maxTempStackView = UIStackView(
            arrangedSubviews: [maxTemperatureLabel, measureMaxTempLabel],
            axis: .horizontal,
            spacing: 0
        )
        
        rightStackView = UIStackView(
            arrangedSubviews: [pressureStackView, speedWindStackView, minTempStackView, maxTempStackView],
            axis: .vertical,
            spacing: 10,
            distribution: .fillProportionally
        )
        
        bottomStacKView = UIStackView(
            arrangedSubviews: [leftStackView, rightStackView],
            axis: .horizontal,
            spacing: 30
        )

    }
    
    func refreshLabels() {
        nameCityLabel.text = weatherModel?.name

        guard let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(weatherModel!.iconCode).svg") else {
            return
            
        }

        let weatherImage = UIView(SVGURL: url) { image in
            image.resizeToFit(self.viewCity.bounds)
        }

        self.viewCity.addSubview(weatherImage)
        
        descriptionLabel.text = weatherModel?.conditionString
        tempCityLabel.text = "\(weatherModel?.temperature ?? 0)"
        pressureLabel.text = "\(weatherModel?.pressureMm ?? 0)"
        speedWindLable.text = String(format: "%.0f", weatherModel?.windSpeed ?? 0)
        minTemperatureLabel.text = "\(weatherModel?.tempMin ?? 0)"
        maxTemperatureLabel.text = "\(weatherModel?.tempMax ?? 0)"
    }
}

extension DescriptionViewController {
    func makeLabel(_ description: String) -> UILabel {
        let label = UILabel()
        label.text = description
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }
}

extension DescriptionViewController {
    func setupLayout() {

        
        NSLayoutConstraint.activate([
//            viewCity.widthAnchor.constraint(equalToConstant: 150),
//            viewCity.heightAnchor.constraint(equalToConstant: 150),
            
            //rightStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.125),
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35),
            mainStackView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            bottomStacKView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 30),
            bottomStacKView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomStacKView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
