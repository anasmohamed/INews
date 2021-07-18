//
//  NewsDetailsViewModel.swift
//  INews
//
//  Created by no one on 17/07/2021.
//

import Foundation
class NewsDetailsViewModel {
    func getFormattedDate(date:String) -> String {
        let finalDate = date.replacingOccurrences(of: "T", with: " ").replacingOccurrences(of: "Z", with: "")
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy HH:mm"

        let date = dateFormatterGet.date(from: finalDate)
        return dateFormatterPrint.string(from: date!)
    }
}
