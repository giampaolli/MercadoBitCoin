//
//  TableView+Extensions.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 24/05/23.
//

import Foundation

import UIKit

extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .gray
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
//        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
//        self.separatorStyle = .singleLine
    }
}
