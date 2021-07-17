//
//  NewsListViewController + UITableView.swift
//  INews
//
//  Created by no one on 16/07/2021.
//

import Foundation
import UIKit
extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {
            fatalError("Cell not exists in storyboard")
        }
        if isSearching{
            let cellVM = viewModel.getSearchedCellViewModel( at: indexPath )
            cell.newsListCellViewModel = cellVM
        }else{
            let cellVM = viewModel.getCellViewModel( at: indexPath )
            cell.newsListCellViewModel = cellVM
        }
    
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return viewModel.numberOfSearchedCells
        }
        return viewModel.numberOfCells
    }
    
    
    
}
