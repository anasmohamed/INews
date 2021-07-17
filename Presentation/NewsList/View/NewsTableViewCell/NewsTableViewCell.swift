//
//  NewsTableViewCell.swift
//  INews
//
//  Created by no one on 16/07/2021.
//

import UIKit
import SDWebImage
class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var newsSourceLbl: UILabel!
    @IBOutlet weak var newsPhotoImageView: UIImageView!
    @IBOutlet weak var newsTitleLbl: UILabel!
    var newsListCellViewModel : NewsListCellViewModel? {
        didSet {
            newsSourceLbl.text = newsListCellViewModel?.sourceText
            newsTitleLbl.text = newsListCellViewModel?.titleText
            newsPhotoImageView?.sd_setImage(with: URL( string: (newsListCellViewModel?.imageUrl)!),placeholderImage: UIImage(named: "noImage"), completed: nil)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        
        containerView.layer.cornerRadius = 10.0
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        containerView.layer.shadowRadius = 10.0
        containerView.layer.shadowOpacity = 0.4
        
        mainView.layer.cornerRadius = 10.0
        mainView.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
