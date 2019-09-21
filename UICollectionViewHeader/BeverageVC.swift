//
//  ViewController.swift
//  CollectionViewHeader
//
//  Created by Banyar on 21/9/19.
//  Copyright © 2019 Banyar. All rights reserved.
//

import UIKit

class BeverageVC: UIViewController {
    let gap : CGFloat = 5
    let numberOfCol : CGFloat = 3
    let bevarageCategories = ["Beer", "Scotch whisky"]
    let bevarageList = Bevarage.generateBevarage()
    
    @IBOutlet weak var bevarageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bevarageCollectionView.delegate = self
        self.bevarageCollectionView.dataSource = self
    }
}

extension BeverageVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return bevarageCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.bevarageList[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((self.bevarageCollectionView.frame.size.width - 2) - ((numberOfCol + 1) * gap)) / numberOfCol
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath) as! BeverageCollectionReusableView
            headerView.backgroundColor = UIColor.green
            headerView.collectionHeaderTitleLabel.text = bevarageCategories[indexPath.section]
            return headerView
        }
        assert(false, "Unknow Element kind")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BeverageUICollectionViewCell
        cell.beverageImageView.image = UIImage(named: self.bevarageList[indexPath.section][indexPath.row].imageName)
        cell.beverageNameLabel.text = self.bevarageList[indexPath.section][indexPath.row].name
        return cell
    }
}
