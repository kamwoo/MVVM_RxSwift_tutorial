//
//  Coordinator.swift
//  MVVM_RxSwift_tutorial
//
//  Created by wooyeong kam on 2021/06/10.
//

import Foundation
import UIKit

// RootViewController가 진입점이 되도록 만드는 역할
class Coordinator {
    let window : UIWindow
    
    init(window : UIWindow) {
        self.window = window
    }
    
    func start() {
        let rootViewController = RootViewController(viewModel: RootViewModel(articleService: ArticleService()))
        let navigationRootViewController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = navigationRootViewController
        window.makeKeyAndVisible()
    }
}
