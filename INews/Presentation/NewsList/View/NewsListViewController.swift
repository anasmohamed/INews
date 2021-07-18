//
//  NewsListViewController.swift
//  INews
//
//  Created by no one on 16/07/2021.
//

import UIKit

class NewsListViewController: UIViewController {
    
    @IBOutlet weak var newsSearchBar: UISearchBar!
    @IBOutlet weak var newsListTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var isSearching = false
    var pageNumber = 1
    var totalPages = 5
    lazy var viewModel: NewsListViewModel = {
        return NewsListViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initVM()
    }
    
    
    func initView() {
        newsListTableView.delegate = self
        newsListTableView.dataSource = self
        newsSearchBar.delegate = self
        setupTableView()
    }
    func initVM() {
        viewModel.reloadTableView.bind{status in
            if status{
                self.newsListTableView.reloadData()
            }
        }
        viewModel.getStatus.bind{ state in
            switch state
            {
            
            case .loading:
                self.activityIndicator.startAnimating()
                UIView.animate(withDuration: 0.2, animations: {
                    self.newsListTableView.alpha = 0.0
                })
                
            case .populated:
                self.activityIndicator.stopAnimating()
                UIView.animate(withDuration: 0.2, animations: {
                    self.newsListTableView.alpha = 1.0
                })
            case .empty,.error:
                self.activityIndicator.stopAnimating()
                UIView.animate(withDuration: 0.2, animations: {
                    self.newsListTableView.alpha = 0.0
                })
            }
            
        }
        viewModel.initFetchWith(pageNumber:pageNumber)
    }
    func setupTableView()  {
        newsListTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }
    
    
}
extension NewsListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchBy(searchText: searchText)
        isSearching = true
        newsListTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        newsListTableView.reloadData()
    }
}

