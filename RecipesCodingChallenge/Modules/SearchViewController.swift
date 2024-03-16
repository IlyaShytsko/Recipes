//
//  SearchViewController.swift
//  RecipesCodingChallenge
//
//  Created by Ilya Shytsko on 14.03.24.
//

import UIKit

final class SearchViewController: UIViewController, Storyboarded {
    static func instance() -> SearchViewController {
        return instantiate(from: .main)
    }
    
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var searchTextField: UITextField!
    
    private var isLoading: Bool = false
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchTextField.text = ""
    }
    
    // MARK: - Private
    
    private func setupView() {
        searchTextField.accessibilityIdentifier = "searchTextField"
        searchButton.accessibilityIdentifier = "searchButton"
        
        UIView.animate(withDuration: 0.7) { [weak self] in
            self?.searchButton.alpha = 1
        }
        
        searchButton.configurationUpdateHandler = { [unowned self] button in
            var config = button.configuration
            config?.showsActivityIndicator = isLoading
            config?.title = isLoading ? "" : "Search"
            button.isEnabled = !isLoading && !searchTextField.text.isNilOrEmpty
            button.configuration = config
        }
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    private func loadRecipies() {
        guard let searchText = searchTextField.text else { return }
        isLoading = true
        
        Task {
            do {
                let model: SearchModel = try await ApiClient.request(.recipeSearch(searchText))
                updateUIWithSearchResults(model)
            } catch {
                showError(error)
            }
            isLoading = false
            searchTextField.isEnabled = true
        }
    }
    
    private func updateUIWithSearchResults(_ model: SearchModel) {
        DispatchQueue.main.async { [weak self] in
            if model.hits.isNotEmpty {
                self?.showSearchResults(for: model)
            } else {
                self?.showAlert(title: "Nothing was found", message: "Try changing the query")
            }
        }
    }
    
    @objc private func hideKeyboard() {
        searchTextField.resignFirstResponder()
    }
    
    @IBAction private func textFieldEditingDidChange(_ sender: UITextField) {
        searchButton.setNeedsUpdateConfiguration()
    }
    
    private func showSearchResults(for model: SearchModel) {
        let vc = SearchResultsViewController.instance(model: model)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction func searchAction(_ sender: UIButton) {
        searchTextField.isEnabled = false
        loadRecipies()
    }
}
