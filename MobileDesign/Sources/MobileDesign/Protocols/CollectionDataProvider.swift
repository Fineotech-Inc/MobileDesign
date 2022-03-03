//
//  CollectionDataProvider.swift
//  PlatformUI
//
//  Created by smitesh patel on 2020-05-25.
//  Copyright © 2020 Rogers. All rights reserved.
//

import UIKit

public protocol CollectionDataProvider {

    associatedtype T
    var isEmpty: Bool { get }
    var numberOfCellsInRow: Int { get }
    var numberOfSections: Int { get }
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> T?
}
