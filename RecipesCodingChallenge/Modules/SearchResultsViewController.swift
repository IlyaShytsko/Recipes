//
//  SearchResultsViewController.swift
//  RecipesCodingChallenge
//
//  Created by Ilya Shytsko on 15.03.24.
//

import UIKit

final class SearchResultsViewController: UIViewController, Storyboarded, UITableViewDelegate {
    static func instance(model: SearchModel) -> SearchResultsViewController {
        let vc = instantiate(from: .main)
        vc.model = model
        return vc
    }
    
    @IBOutlet private weak var tableView: UITableView!
    
    private enum Sections { case main }
    private var dataSource: UITableViewDiffableDataSource<Sections, SearchModel.Recipe>!
    private var model: SearchModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        tableView.delegate = self
        tableView.contentInset = .init(top: 8, left: 0, bottom: 8, right: 0)
        configureDataSource()
        updateDataSource(with: model.hits.map{ $0.recipe })
    }
}

extension SearchResultsViewController {
    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Sections, SearchModel.Recipe>(tableView: tableView) {
            tableView, indexPath, viewModel in
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultCell.reuseIdentifier, for: indexPath) as! SearchResultCell
            cell.model = viewModel
            return cell
        }
        dataSource.defaultRowAnimation = .fade
    }
    
    private func updateDataSource(with model: [SearchModel.Recipe]) {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, SearchModel.Recipe>()
        snapshot.appendSections([.main])
        snapshot.appendItems(model)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
