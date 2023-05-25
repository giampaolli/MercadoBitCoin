//
//  ExchangeListViewController.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import UIKit

protocol ExchangeListViewControllerDelegate: AnyObject {
    func reloadTableView()
    func showError(error: NetworkError)
    func startLoading()
    func stopLoading()
}

class ExchangeListViewController: BaseViewController {

    private lazy var refreshControl = UIRefreshControl()

    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activeIndicator = UIActivityIndicatorView(style: .medium)
        activeIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activeIndicator
    }()
    private var searchBar: UISearchController = {
        let sb = UISearchController()
        sb.searchBar.placeholder = "Search exchange"
        sb.searchBar.searchBarStyle = .minimal
        return sb
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ExchangeCell.self, forCellReuseIdentifier: ExchangeCell.reusebleIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.refreshControl = refreshControl
        return tableView
    }()

    private var viewModel: ExchangeListViewModelProtocol

    init(viewModel: ExchangeListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.loadExchanges()
        viewModel.delegate = self

        title = "Exchanges"

        searchBar.searchResultsUpdater = self
        navigationItem.searchController = searchBar

        tableView.accessibilityIdentifier = "exchangeTableView"

    }

    override func buildViewHierarchy() {
        view.addSubview(tableView)
        view.addSubview(activityIndicatorView)

    }

    override func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])

        NSLayoutConstraint.activate([
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    override func configureViews() {
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        refreshControl.addTarget(self, action: #selector(updateTableview), for: .valueChanged)
    }

    @objc
    func updateTableview() {
        viewModel.loadExchanges()
    }
}

//MARK: - UITableViewDataSource
extension ExchangeListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let list = viewModel.isFilterMode ? viewModel.filterExchangeList : viewModel.exchangeList
        if list.count > 0 {
            tableView.restore()
        } else {
            tableView.setEmptyMessage("Sorry!\n We don't find any exchange")
        }

        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let list = viewModel.isFilterMode ? viewModel.filterExchangeList : viewModel.exchangeList
        let exchange = list[indexPath.row]

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExchangeCell.reusebleIdentifier, for: indexPath) as? ExchangeCell else {
            return UITableViewCell()
        }

        cell.configCell(exchange: exchange)
        cell.accessibilityIdentifier = "exchangeCell_\(indexPath.row)"
        cell.layoutIfNeeded()

        return cell
    }
}

extension ExchangeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let list = viewModel.isFilterMode ? viewModel.filterExchangeList : viewModel.exchangeList
        let exchange = list[indexPath.row]

        viewModel.showDetails(exchange: exchange)
    }
}

//MARK: - ExchangeListViewControllerDelegate
extension ExchangeListViewController: ExchangeListViewControllerDelegate {

    func reloadTableView() {
        refreshControl.endRefreshing()
        tableView.reloadData()
        activityIndicatorView.stopAnimating()
    }

    func showError(error: NetworkError) {
        activityIndicatorView.stopAnimating()

        let dialogMessage = UIAlertController(title: "Error", message: error.rawValue, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Try again", style: .default, handler: { [weak self]_ in
            self?.viewModel.loadExchanges()
        })
        dialogMessage.addAction(ok)
        present(dialogMessage, animated: true)
    }

    func startLoading() {
        activityIndicatorView.startAnimating()
    }

    func stopLoading() {
        activityIndicatorView.stopAnimating()
    }
}

extension ExchangeListViewController: UISearchResultsUpdating{

    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else { return }
        viewModel.filterExchange(query)
    }

}
