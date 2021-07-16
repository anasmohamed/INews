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
            newsPhotoImageView?.sd_setImage(with: URL( string: newsListCellViewModel?.imageUrl ?? "" ), completed: nil)
          }
      }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
