//
//  ExchangeDetailsViewController.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import UIKit

class ExchangeDetailsViewController: BaseViewController {

    private var viewModel: ExchangeDetailsViewModelProtocol

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        view.layer.borderWidth = 1
        return view
    }()

    private lazy var websiteView = ExchangeDetailsRowView.instantiate()

    private lazy var startDateView = ExchangeDetailsRowView.instantiate()

    private lazy var endDateView = ExchangeDetailsRowView.instantiate()

    private lazy var quoteStartDateView = ExchangeDetailsRowView.instantiate()

    private lazy var quoteEndDateView = ExchangeDetailsRowView.instantiate()

    private lazy var orderbookStartView = ExchangeDetailsRowView.instantiate()

    private lazy var orderbookEndView = ExchangeDetailsRowView.instantiate()

    private lazy var tradeStartView = ExchangeDetailsRowView.instantiate()

    private lazy var tradeEndView = ExchangeDetailsRowView.instantiate()

    private lazy var symbolsCountView = ExchangeDetailsRowView.instantiate()

    private lazy var hrsUsdView = ExchangeDetailsRowView.instantiate()

    private lazy var daysUsdView = ExchangeDetailsRowView.instantiate()

    private lazy var mthUsdView = ExchangeDetailsRowView.instantiate()

    init(viewModel: ExchangeDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.exchangeName
    }

    override func buildViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(websiteView)
        contentView.addSubview(startDateView)
        contentView.addSubview(endDateView)
        contentView.addSubview(quoteStartDateView)
        contentView.addSubview(quoteEndDateView)
        contentView.addSubview(orderbookStartView)
        contentView.addSubview(orderbookEndView)
        contentView.addSubview(tradeStartView)
        contentView.addSubview(tradeEndView)
        contentView.addSubview(symbolsCountView)
        contentView.addSubview(hrsUsdView)
        contentView.addSubview(daysUsdView)
        contentView.addSubview(mthUsdView)
    }

    override func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),

            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            websiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.0),
            websiteView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            websiteView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            startDateView.topAnchor.constraint(equalTo: websiteView.bottomAnchor),
            startDateView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            startDateView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            endDateView.topAnchor.constraint(equalTo: startDateView.bottomAnchor),
            endDateView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            endDateView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            quoteStartDateView.topAnchor.constraint(equalTo: endDateView.bottomAnchor),
            quoteStartDateView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            quoteStartDateView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            quoteEndDateView.topAnchor.constraint(equalTo: quoteStartDateView.bottomAnchor),
            quoteEndDateView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            quoteEndDateView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            orderbookStartView.topAnchor.constraint(equalTo: quoteEndDateView.bottomAnchor),
            orderbookStartView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            orderbookStartView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            orderbookEndView.topAnchor.constraint(equalTo: orderbookStartView.bottomAnchor),
            orderbookEndView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            orderbookEndView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            tradeStartView.topAnchor.constraint(equalTo: orderbookEndView.bottomAnchor),
            tradeStartView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tradeStartView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            tradeEndView.topAnchor.constraint(equalTo: tradeStartView.bottomAnchor),
            tradeEndView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tradeEndView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            symbolsCountView.topAnchor.constraint(equalTo: tradeEndView.bottomAnchor),
            symbolsCountView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            symbolsCountView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            hrsUsdView.topAnchor.constraint(equalTo: symbolsCountView.bottomAnchor),
            hrsUsdView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            hrsUsdView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            daysUsdView.topAnchor.constraint(equalTo: hrsUsdView.bottomAnchor),
            daysUsdView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            daysUsdView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

            mthUsdView.topAnchor.constraint(equalTo: daysUsdView.bottomAnchor),
            mthUsdView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mthUsdView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mthUsdView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12.0),
        ])
    }

    override func configureViews() {
        view.backgroundColor = .white

        websiteView.configValues(title: "Website", value: viewModel.website)
        startDateView.configValues(title: "Start Date", value: viewModel.startDate)
        endDateView.configValues(title: "End Date", value: viewModel.endDate)
        quoteStartDateView.configValues(title: "Quote start date", value: viewModel.quoteStartDate)
        quoteEndDateView.configValues(title: "Quote end date", value: viewModel.quoteEndDate)
        orderbookStartView.configValues(title: "Orderbook Start", value: viewModel.orderbookStart)
        orderbookEndView.configValues(title: "Orderbook End", value: viewModel.orderbookEnd)
        tradeStartView.configValues(title: "Trade Start", value: viewModel.tradeStart)
        tradeEndView.configValues(title: "Trade End", value: viewModel.tradeEnd)
        symbolsCountView.configValues(title: "Symbols Count", value: viewModel.symbolsCount)
        hrsUsdView.configValues(title: "Hours USD", value: viewModel.hoursUSD)
        daysUsdView.configValues(title: "Days USD", value: viewModel.daysUSD)
        mthUsdView.configValues(title: "Month USD", value: viewModel.monthsUSD)
    }

}
