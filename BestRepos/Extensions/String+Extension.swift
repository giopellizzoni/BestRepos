//
//  String+Extension.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 02/01/20.
//  Copyright © 2020 Giovanni Pellizzoni. All rights reserved.
//

import Foundation

extension String {
    func formatDate() -> String {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        
        if let date = dateFormatterGet.date(from: self){
            return dateFormatterPrint.string(from: date)
        }
        else {
            return ("NO DATE")
        }
    }
}
