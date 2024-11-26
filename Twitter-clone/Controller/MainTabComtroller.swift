//
//  MainTabComtroller.swift
//  Twitter-clone
//
//  Created by MANSUB SHIN on 2024/11/26.
//

import UIKit

class MainTabComtroller: UITabBarController {
    // MARK: - Properties

    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        guard let buttonImage = UIImage(named: "new_tweet") else { fatalError("Not found image.") }

        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(buttonImage, for: .normal)
        button.addAction(.init { _ in
            print("new tweet")
        }, for: .touchUpInside)

        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewControllers()
        configureUI()
    }

    // MARK: - Helpers

    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 17, width: 56, height: 56)
    }

    func configureViewControllers() {
        let feed = FeedController()
        guard let feedTabImage = UIImage(named: "home_unselected") else { fatalError("Not found image.") }
        let feedNav = templateNavigationController(image: feedTabImage, rootViewController: feed)

        let explore = ExploreController()
        guard let exploreTabImage = UIImage(named: "search_unselected") else { fatalError("Not found image.") }
        let exploreNav = templateNavigationController(image: exploreTabImage, rootViewController: explore)

        let notification = NotificationsController()
        guard let notificationTabImage = UIImage(named: "like_unselected") else { fatalError("Not found image.") }
        let notificationNav = templateNavigationController(image: notificationTabImage, rootViewController: notification)

        let conversation = ConversationsController()
        guard let conversationTabImage = UIImage(named: "ic_mail_outline_white_2x-1") else { fatalError("Not found image.") }
        let conversationNav = templateNavigationController(image: conversationTabImage, rootViewController: conversation)

        viewControllers = [feedNav, exploreNav, notificationNav, conversationNav]

        uiSetting()
    }

    func templateNavigationController(image: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image

        return nav
    }

    func uiSetting() {
        if #available(iOS 15.0, *) {
            // Navigation Bar background color
            let uiNavBarappearance = UINavigationBarAppearance()
            uiNavBarappearance.configureWithTransparentBackground()
            uiNavBarappearance.backgroundColor = .white
            UINavigationBar.appearance().standardAppearance = uiNavBarappearance
            UINavigationBar.appearance().scrollEdgeAppearance = uiNavBarappearance

            // Tab Bar background color
            let uiTabBarappearance = UITabBarAppearance()
            uiTabBarappearance.configureWithOpaqueBackground()
            uiTabBarappearance.backgroundColor = .white
            tabBar.standardAppearance = uiTabBarappearance
            tabBar.scrollEdgeAppearance = uiTabBarappearance
        }
    }
}
