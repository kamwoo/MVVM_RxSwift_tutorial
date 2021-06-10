//
//  RootViewController.swift
//  MVVM_RxSwift_tutorial
//
//  Created by wooyeong kam on 2021/06/10.
//

import UIKit

class RootViewController: UIViewController {
    
    // MARK: Properties
    
    
    // MARK: LiftCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

    }
    
    // MARK: Configures
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
}
