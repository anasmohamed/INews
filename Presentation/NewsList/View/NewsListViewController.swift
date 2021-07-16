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
