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
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item
        return navigationController
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = #colorLiteral(red: 0.8039215686, green: 0.7803921569, blue: 0.7019607843, alpha: 1)
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = #colorLiteral(red: 0.7098039216, green: 0.6901960784, blue: 0.6196078431, alpha: 1).cgColor
    }

    private func setupItems() {
        let scheduleViewController = createNavController(viewController: ScheduleViewController(), itemName: "Shedule", itemImage: "calendar.badge.clock")
        let tasksViewController = createNavController(viewController: TasksViewController(), itemName: "Tasks", itemImage: "text.badge.checkmark")
        let contactsViewController = createNavController(viewController: ContactsViewController(), itemName: "Contacts", itemImage: "rectangle.stack.person.crop")
     
        setViewControllers([scheduleViewController, tasksViewController, contactsViewController], animated: true)
        
        tasksViewController.loadViewIfNeeded()
        contactsViewController.loadViewIfNeeded()
    }

}

