//
//  ViewController.swift
//  OrderStatus
//
//  Created by Praveen Kumar on 22/05/19.
//  Copyright © 2019 FriendsAdda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
//        self.collectionView.reloadWithAnimation()
    }

    //--------------------------------------------------
    // MarK : setupCollectionView
    //--------------------------------------------------
    private func setupCollectionView() {
        self.collectionView.register(UINib(nibName: "StatusCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StatusCollectionViewCell")
        
    }
}

//--------------------------------------------------
// MarK : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
//--------------------------------------------------

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatusCollectionViewCell", for: indexPath as IndexPath) as! StatusCollectionViewCell
        cell.delayTime = Double(indexPath.row+2)
        cell.item = indexPath.row
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let delayTime = Float(indexPath.row)
        DispatchQueue.main.asyncAfter(wallDeadline: .now()+5) {
            
        }
        
        
        //        let delayCounter = indexPath.row
        //        UIView.animate(withDuration: 2.0, delay: 2 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
        //            cell.transform = CGAffineTransform.identity
        //        }, completion: nil)
        //        delayCounter += 1

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.bounds.width , height: 125)
        
    }

    
    
}
extension UICollectionView {
    func reloadWithAnimation() {
        self.reloadData()
        let tableViewHeight = self.bounds.size.height
        let cells = self.visibleCells
        var delayCounter = 0
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        for cell in cells {
            UIView.animate(withDuration: 1.6, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
