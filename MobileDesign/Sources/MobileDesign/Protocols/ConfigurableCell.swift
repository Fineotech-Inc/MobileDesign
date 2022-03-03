//
//  ConfigurableCell.swift
//  PlatformUI
//
//  Created by smitesh patel on 2020-05-25.
//  Copyright © 2020 Rogers. All rights reserved.
//

import UIKit

public protocol ConfigurableCell: Reusable {
    
    associatedtype T
    
    func configure(_ item: T)
}
