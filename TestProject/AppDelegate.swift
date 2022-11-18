//
//  AppDelegate.swift
//  TestProject
//
//  Created by Evgeniy on 15.11.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let usersApiSerivce = UsersApiService()
        let postsApiSerivce = PostsApiService()
        let controller = UsersScreenController()
        let router = UsersScreenRouter()

        controller.viewModel = UsersScreenViewModel(
            router: router,
            usersApiService: usersApiSerivce,
            postsApiService: postsApiSerivce
        )

        router.viewController = controller

        window.rootViewController = UINavigationController(rootViewController: controller)
        window.makeKeyAndVisible()

        setupTheme()

        return true
    }

    private func setupTheme() {
        let style = UserDefaults.standard.string(forKey: .themeValue)
        window?.overrideUserInterfaceStyle = style == String.dark ? .dark : .light
    }
}

