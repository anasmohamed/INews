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
        return 300
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsDetailsStoryboard = UIStoryboard.init(name:"NewsDetailsView" , bundle: nil)
        let newsDetailsViewController = newsDetailsStoryboard.instantiateViewController(identifier: "NewsDetailsViewController") as! NewsDetailsViewController
        viewModel.userPressed(at: indexPath, isSearching: isSearching)
        newsDetailsViewController.newsDetails = viewModel.selectedNews
        
        self.navigationController?.pushViewController(newsDetailsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return viewModel.numberOfSearchedCells
        }
        return viewModel.numberOfCells
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard scrollView == newsListTableView,
              (scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height, pageNumber < totalPages
        else { return }
        print("anasnew")
        pageNumber = pageNumber + 1
        viewModel.initFetchWith(pageNumber:pageNumber)
        
    }
    
    
}

