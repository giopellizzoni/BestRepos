//
//  TableViewDataSource.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 05/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<CellType, Source>: NSObject, UITableViewDataSource where CellType: UITableViewCell {
    
    let cellIdentifier: String
    var items: [Source]
    let configureCell: (CellType, Source) -> ()
    
    init(cellIdentifier: String, items: [Source], configureCell: @escaping (CellType, Source) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellType else { return UITableViewCell()}
        
        let item = self.items[indexPath.row]
        
        self.configureCell(cell, item)
        
        return cell
    }
    
}
