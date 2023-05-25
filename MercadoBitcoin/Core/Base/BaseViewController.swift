//
//  BaseViewController.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import UIKit

protocol ViewConfiguration: AnyObject {
    func buildViewHierarchy()
    func setupConstraints()
    func buildLayout()
    func configureViews()
}

extension ViewConfiguration {
    func buildLayout() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
}

class BaseViewController: UIViewController, ViewConfiguration {

    override open func viewDidLoad() {
        super.viewDidLoad()

        buildLayout()
    }

    func buildViewHierarchy() { }

    func setupConstraints() { }

    func configureViews() { }
}
