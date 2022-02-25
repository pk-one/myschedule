//
//  ScheduleTableViewCell.swift
//  MyScheduled
//
//  Created by Pavel Olegovich on 20.02.2022.
//

import Foundation
import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    static let cellId = "ScheduleTableViewCell"
    private let lessonNameLabel = UILabel(text: "Программирование", textColor: .black, font: .avenirNextDemiBold20(), textAlignment: .left)
    private let teacherNameLabel = UILabel(text: "Антонов Антон Анатольевич", textColor: .black, font: .avenirNext20(), textAlignment: .right)
    private let lessonTimeLabel = UILabel(text: "08:00", textColor: .black, font: .avenirNextDemiBold20(), textAlignment: .left)
    private let typeLabel = UILabel(text: "Тип:", textColor: .black, font: .avenirNext14(), textAlignment: .right)
    private let lessonTypeLabel = UILabel(text: "Лекция", textColor: .black, font: .avenirNextDemiBold14(), textAlignment: .left)
    private let buildingLabel = UILabel(text: "Корпус:", textColor: .black, font: .avenirNext14(), textAlignment: .right)
    private let lessonBuildingLabel = UILabel(text: "1", textColor: .black, font: .avenirNextDemiBold14(), textAlignment: .left)
    private let auditoryLabel = UILabel(text: "Аудитория:", textColor: .black, font: .avenirNext14(), textAlignment: .right)
    private let lessonAuditoryLabel = UILabel(text: "101", textColor: .black, font: .avenirNextDemiBold14(), textAlignment: .left)

    private var topStackView = UIStackView()
    private var bottomStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.selectionStyle = .none
        topStackView = UIStackView(arrangedSubviews: [lessonNameLabel,
                                                  teacherNameLabel],
                                axis: .horizontal,
                                spacing: 10,
                                distribution: .fillEqually)
        
        self.addSubview(topStackView)
        self.addSubview(lessonTimeLabel)
        
        bottomStackView = UIStackView(arrangedSubviews: [typeLabel,
                                                         lessonTypeLabel,
                                                         buildingLabel,
                                                        lessonBuildingLabel,
                                                        auditoryLabel,
                                                        lessonAuditoryLabel],
                                      axis: .horizontal,
                                      spacing: 5,
                                      distribution: .fillProportionally)
        self.addSubview(bottomStackView)
    }
}


//MARK: - setConstraints
extension ScheduleTableViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            lessonTimeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            lessonTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            lessonTimeLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            bottomStackView.leadingAnchor.constraint(equalTo: lessonTimeLabel.trailingAnchor, constant: 5),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
