//
//  NewsDetailsViewController.swift
//  INews
//
//  Created by no one on 17/07/2021.
//

import UIKit
import SDWebImage
class NewsDetailsViewController: UITableViewController {

    
    @IBOutlet weak var navigateToSourceBtn: UIButton!
    @IBOutlet weak var newsDetatilsDescriptionLbl: UILabel!
    @IBOutlet weak var newsDetailsContentLbl: UILabel!
    @IBOutlet weak var newsDetailsDateLbl: UILabel!
    @IBOutlet weak var newsDetailsSourceLbl: UILabel!
    @IBOutlet weak var newsDetailsAuthorLbl: UILabel!
    @IBOutlet weak var newsDetailsTitleLbl: UILabel!
    @IBOutlet weak var newsDetailsImageView: UIImageView!
    var newsDetails : NewsModel?
    
    
    lazy var viewModel: NewsDetailsViewModel = {
        return NewsDetailsViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    func initView()  {
        newsDetailsImageView.sd_setImage(with: URL( string: (newsDetails?.image)!),placeholderImage: UIImage(named: "noImage"), completed: nil)
        newsDetailsDateLbl.text = "Date : \(viewModel.getFormattedDate(date: (newsDetails?.date)!))"
        newsDetailsSourceLbl.text = "source : \((newsDetails!.source?.name!)!)"
        newsDetailsTitleLbl.text = newsDetails?.title
        newsDetailsAuthorLbl.text = "author : \(newsDetails!.authorName!)"
        newsDetailsContentLbl.text = newsDetails?.content
        newsDetatilsDescriptionLbl.text = newsDetails?.description
        
        navigateToSourceBtn.layer.cornerRadius = 8
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    @IBAction func navigateToSourceBtnDidTapped(_ sender: Any) {
        if let url = URL(string: (newsDetails?.urlSource)!) {
            UIApplication.shared.open(url)
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return UITableView.automaticDimension
      }

}
