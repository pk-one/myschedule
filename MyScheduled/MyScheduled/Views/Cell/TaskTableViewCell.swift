//
//  TaskTableViewCell.swift
//  MyScheduled
//
//  Created by Pavel Olegovich on 24.02.2022.
//

import Foundation
import UIKit

protocol TaskTableViewCellDelegate: AnyObject {
    func readyButtonTapped(for indexPath: IndexPath)
}

class TaskTableViewCell: UITableViewCell {
    static let cellId = "TaskTableViewCell"
    
    let taskNameLabel = UILabel(text: "Программирование", textColor: .black, font: .avenirNextDemiBold20())
    let taskDescription = UILabel(text: "Научиться писать extension и правильно их применять. Научиться писать extension и правильно их применять", textColor: .black, font: .avenirNext14())
    
    private let readyButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "chevron.down.circle"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(readyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: TaskTableViewCellDelegate?
    var index: IndexPath?
    
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
        self.contentView.addSubview(readyButton)
        self.addSubview(taskNameLabel)
        taskDescription.numberOfLines = 2
        taskDescription.minimumScaleFactor = 0.8
        self.addSubview(taskDescription)
    }
    
    @objc private func readyButtonTapped() {
        guard let index = index else { return }
        delegate?.readyButtonTapped(for: index)
    }
}


//MARK: - setConstraints
extension TaskTableViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            readyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            readyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            readyButton.heightAnchor.constraint(equalToConstant: 40),
            readyButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            taskNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            taskNameLabel.trailingAnchor.constraint(equalTo: readyButton.leadingAnchor, constant: -5),
            taskNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5)
        ])

        NSLayoutConstraint.activate([
            taskDescription.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: 5),
            taskDescription.trailingAnchor.constraint(equalTo: readyButton.leadingAnchor, constant: -5),
            taskDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            taskDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
}

