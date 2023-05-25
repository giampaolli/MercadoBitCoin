//
//  ExchangeCell.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import UIKit

class ExchangeCell: UITableViewCell {

    //MARK: - Constantes

    static let reusebleIdentifier = "ExchangeCell"

    //MARK: - Properties

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.1)
        view.layer.cornerRadius = 8
        return view
    }()

    private lazy var exchangeName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var exchangeId: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var exchangeValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        buildLayout()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configCell(exchange: Exchange) {
        exchangeName.text = exchange.name ?? " - "
        exchangeId.text = exchange.exchangeID ?? " - "
        if let value = exchange.volume1DayUsd {
            exchangeValue.text = value.toCurrency()
        }
    }

    private func buildLayout() {
        selectionStyle = .none
        contentView.isUserInteractionEnabled = true

        containerView.addSubview(exchangeName)
        containerView.addSubview(exchangeId)
        containerView.addSubview(exchangeValue)

        addSubview(containerView)
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])

        NSLayoutConstraint.activate([
            exchangeName.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            exchangeName.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12)
        ])

        NSLayoutConstraint.activate([
            exchangeId.topAnchor.constraint(equalTo: exchangeName.bottomAnchor, constant: 8),
            exchangeId.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            exchangeId.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12)
        ])

        NSLayoutConstraint.activate([
            exchangeValue.topAnchor.constraint(equalTo: exchangeName.bottomAnchor, constant: 8),
            exchangeValue.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            exchangeValue.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12)
        ])
        
    }
}
