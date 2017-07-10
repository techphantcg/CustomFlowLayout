//
//  GalleryListFlowLayout.swift
//  CustomFlowLayout
//
//  Created by TPCG II on 10/07/17.
//  Copyright © 2017 TPCG II. All rights reserved.
//

import UIKit

class GalleryListFlowLayout: UICollectionViewFlowLayout {
    
       
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    func setupLayout(){
        minimumInteritemSpacing = 0
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }
    
    func itemWidth() -> CGFloat {
        return (collectionView!.frame).width
    }
    
    func itemHeight() -> CGFloat {
        return itemWidth() * 9 / 16
    }
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: itemWidth(), height: itemHeight())
        }
        get {
            return CGSize(width: itemWidth(), height: itemHeight())
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }

}
