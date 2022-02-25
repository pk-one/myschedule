//
//  ViewController.swift
//  MyScheduled
//
//  Created by Pavel Olegovich on 19.02.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupItems()
    }
    
    private func createNavController(viewController: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), tag: 0)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item
        return navigationController
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = #colorLiteral(red: 0.9607843757, green: 0.9607843757, blue: 0.9607843757, alpha: 1)
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = #colorLiteral(red: 0.7098039216, green: 0.6901960784, blue: 0.6196078431, alpha: 1).cgColor
    }

    private func setupItems() {
        let scheduleViewController = createNavController(viewController: ScheduleViewController(), itemName: "Расписание", itemImage: "calendar.badge.clock")
        let tasksViewController = createNavController(viewController: TasksViewController(), itemName: "Задания", itemImage: "text.badge.checkmark")
        let contactsViewController = createNavController(viewController: ContactsViewController(), itemName: "Контакты", itemImage: "rectangle.stack.person.crop")
     
        viewControllers = [scheduleViewController, tasksViewController, contactsViewController]
    }

}

