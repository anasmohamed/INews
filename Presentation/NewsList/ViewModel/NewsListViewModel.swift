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
    private var filterdNewsList: [NewsModel] = [NewsModel]()

    private var cellViewModels: [NewsListCellViewModel] = [NewsListCellViewModel]() {
        didSet {
            reloadTableView.value = true
        }
    }
    private var searchedCellViewModels: [NewsListCellViewModel] = [NewsListCellViewModel]() {
        didSet {
            reloadTableView.value = true
        }
    }
    var selectedNews : NewsModel?
    var getNewsSuccess: Observable<[NewsModel]> = Observable([])
    var reloadTableView: Observable<Bool> = Observable(false)
    var getNewsError: Observable<String> = Observable("")
    
    
    func initFetch() {
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
    func searchBy(searchText:String)  {
        self.filterdNewsList = newsList.filter({$0.title!.lowercased().prefix(searchText.count) == searchText.lowercased()})
        var newsListCellViewModels = [NewsListCellViewModel]()
        for news in filterdNewsList {
            newsListCellViewModels.append( createCellViewModel(news: news) )
        }
        self.searchedCellViewModels = newsListCellViewModels
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    var numberOfSearchedCells: Int {
        return searchedCellViewModels.count
    }
    func getCellViewModel( at indexPath: IndexPath ) -> NewsListCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func getSearchedCellViewModel( at indexPath: IndexPath ) -> NewsListCellViewModel {
        return searchedCellViewModels[indexPath.row]
    }
    
    func createCellViewModel( news: NewsModel ) -> NewsListCellViewModel {
        return NewsListCellViewModel(titleText:news.title! , sourceText:news.source?.name ?? ""  , imageUrl:news.image ?? "")
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
extension NewsListViewModel {
    func userPressed( at indexPath: IndexPath ,isSearching:Bool){
        if isSearching{
            let news = self.filterdNewsList[indexPath.row]
            self.selectedNews = news
        }else{
            let news = self.newsList[indexPath.row]
            self.selectedNews = news
        }
        
        
        }
        
    }

