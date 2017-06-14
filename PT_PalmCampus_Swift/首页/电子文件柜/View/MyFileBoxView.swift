//
//  MyFileBoxView.swift
//  PT_PalmCampus_Swift
//
//  Created by 师悦科技 on 04/05/2017.
//  Copyright © 2017 Kbird. All rights reserved.
//

import UIKit

class MyFileBoxView: UIView {

    weak var delegate:MyFileBoxViewProtocol?    //var delegate:MyFileBoxViewProtocol! = nil
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame:CGRect) {
        super.init(frame: frame)
        first_bk.addSubview(totalSpace)
        first_bk.addSubview(usedSpace)
        self.addSubview(first_bk)
        self.addSubview(collectionView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var first_bk: UIView = {
       let first = UIView.init(frame: CGRect.init(x: 0, y: 0, width: KWIDTH, height: 50))
        first.backgroundColor = UIColor.lightGray
        return first
    }()
    
    lazy var totalSpace:UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 10, y: 10, width: 100, height: 30))
        label.text = "总容量：\(1000)M"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    lazy var usedSpace:UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: self.totalSpace.frame.maxX + 20, y: self.totalSpace.frame.origin.y, width: 100, height: 30))
        label.text = "已用容量：\(500)M"
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    lazy var collectionView:UICollectionView = {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize  = CGSize.init(width: KWIDTH / 5, height: 40)
        flowLayout.minimumInteritemSpacing = 0
        let collection = UICollectionView.init(frame: CGRect.init(x: 0, y: self.first_bk.frame.maxY, width: KWIDTH, height: 40), collectionViewLayout: flowLayout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: "TagCollectionViewCell")
        return collection
    }()
    
}

protocol MyFileBoxViewProtocol: UICollectionViewDelegate , UICollectionViewDataSource{
    
}
