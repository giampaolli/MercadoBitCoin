//
//  ExchangeDetailsRowView.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import UIKit

class ExchangeDetailsRowView: UIView {

    static func instantiate() -> ExchangeDetailsRowView {
        let view = ExchangeDetailsRowView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.1)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    func configValues(title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }

    private func setupView() {
        buildLayout()
        setupConstraints()
    }

    private func buildLayout() {
        addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
        contentView.addSubview(dividerView)
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
        ])

        NSLayoutConstraint.activate([
            valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            valueLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            dividerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            dividerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            dividerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
        ])

    }
}
