//
//  Resource.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 05/10/19.
//  Copyright © 2019 Giovanni Pellizzoni. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}
