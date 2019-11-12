//
//  CollectionViewCell.swift
//  OrderStatus
//
//  Created by Praveen Kumar on 22/05/19.
//  Copyright © 2019 FriendsAdda. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }
    
    weak var delegate: NSObjectProtocol? = nil
    
    func configure(_ item: Any?) { }
}
