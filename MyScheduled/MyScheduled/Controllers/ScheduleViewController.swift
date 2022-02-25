//
//  ScheduleViewController.swift
//  MyScheduled
//
//  Created by Pavel Olegovich on 19.02.2022.
//

import UIKit
import FSCalendar

class ScheduleViewController: UIViewController {
    
    private var calendarHeightConstraint: NSLayoutConstraint!
    
    private var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.scope = .week
        return calendar
    }()
    
    private let showHideButton: UIButton = {
        let button = UIButton()
        button.setTitle("Открыть календарь", for: .normal)
        button.setTitleColor(.specicalButtonText, for: .normal)
        button.titleLabel?.font = .avenirNextDemiBold14()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: ScheduleTableViewCell.cellId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setDelegates()
        setConstraints()
        swipeAction()
    }
    
    private func setupViews() {
        title = "Расписание"
        view.backgroundColor = .white
        view.addSubview(calendar)
        view.addSubview(showHideButton)
        view.addSubview(tableView)
    }
    
    private func setDelegates() {
        calendar.delegate = self
        calendar.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func showHideButtonTapped() {
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            showHideButton.setTitle("Закрыть календарь", for: .normal)
        } else {
            calendar.setScope(.week, animated: true)
            showHideButton.setTitle("Открыть календарь", for: .normal)
        }
    }
    
//MARK: - SwipeGestureRecognizer
    private func swipeAction() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeUp.direction = .up
        calendar.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeDown.direction = .down
        calendar.addGestureRecognizer(swipeDown)
    }
    
    @objc private func handleSwipe(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .up:
            showHideButtonTapped()
        case .down:
            showHideButtonTapped()
        default: break
        }
    }

}

//MARK: - UITableViewDataSource
extension ScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.cellId, for: indexPath) as? ScheduleTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

//MARK: - FSCalendarDataSource
extension ScheduleViewController: FSCalendarDataSource {

}

//MARK: - FSCalendarDelegate
extension ScheduleViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }
}

//MARK: - setConstraints
extension ScheduleViewController {
    private func setConstraints() {
        calendarHeightConstraint = NSLayoutConstraint(item: calendar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        calendar.addConstraint(calendarHeightConstraint)
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            showHideButton.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 0),
            showHideButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            showHideButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: showHideButton.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
