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
    
    var isSearching = false

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
        viewModel.initFetch()
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
