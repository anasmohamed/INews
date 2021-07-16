//
//  NewsListViewModel.swift
//  INews
//
//  Created by no one on 16/07/2021.
//

import Foundation
class NewsListViewModel {
    let newsAPIService: NewsAPIProtocol = NewsAPI()
    private var newsList: [NewsModel] = [NewsModel]()
    
    private var cellViewModels: [NewsListCellViewModel] = [NewsListCellViewModel]() {
        didSet {
            reloadTableView.value = true
        }
    }
    var getNewsSuccess: Observable<[NewsModel]> = Observable([])
    var reloadTableView: Observable<Bool> = Observable(false)
    var getNewsError: Observable<String> = Observable("")
    func initFetch() {
        //            state = .loading
        newsAPIService.getNews { (result) in
            switch result {
            case .success(let response):
                let news = response?.data
                self.processFetchedNews(newsList: news!)
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
            }
        }
    }
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> NewsListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    func createCellViewModel( news: NewsModel ) -> NewsListCellViewModel {
        print(news.authorName)
        return NewsListCellViewModel(titleText:news.title! , sourceText:news.source ?? ""  , imageUrl:news.image ?? "")
    }
    private func processFetchedNews( newsList: [NewsModel] ) {
        self.newsList = newsList // Cache
        var newsListCellViewModels = [NewsListCellViewModel]()
        for news in newsList {
            newsListCellViewModels.append( createCellViewModel(news: news) )
        }
        self.cellViewModels = newsListCellViewModels
    }
}
