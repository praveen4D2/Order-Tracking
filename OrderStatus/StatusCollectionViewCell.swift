//
//  StatusCollectionViewCell.swift
//  OrderStatus
//
//  Created by Praveen Kumar on 22/05/19.
//  Copyright © 2019 FriendsAdda. All rights reserved.
//

import UIKit

class StatusCollectionViewCell: CollectionViewCell {
    weak var shapeLayer: CAShapeLayer?
    @IBOutlet weak var imgView: UIImageView!
    var delayTime:Double = 0.0
    var index:Int = 0
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var lblAddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        self.imgView.tintColor = .orange
        self.progressView.backgroundColor = .orange
//        self.addShapeLayer()
    }

    override func configure(_ item: Any?) {

        guard let delay = item as? Int else { return  }
        let delayTime = Double(delay * 3)
        if delay <= 2{
            print("below 3")
            DispatchQueue.main.asyncAfter(wallDeadline: .now()+delayTime) {
                self.imgView.tintColor = .purple
                self.lblAddress.text = "H.No.- 1-98/8/9/A/1, Plot No.- 8, Survey No. 7, Jai Hind Gandhi Rd, VIP Hills, Silicon Valley, Madhapur, Hyderabad, Telangana 500081"
                self.addShapeLayer()
            }
            
        }else{
            print("more than 3")
        }
        
    }
    
    func addShapeLayer() {

        self.shapeLayer?.removeFromSuperlayer()
        
        let path = UIBezierPath()
        
        // Mark: Horizontal animation
        /*
        path.move(to: CGPoint(x: 0, y: self.progressView.bounds.origin.y))
        path.addLine(to: CGPoint(x: self.progressView.bounds.width, y: self.progressView.bounds.origin.y))
        */
        // Mark :- Vertical animation
        path.move(to: CGPoint(x: 0, y: self.progressView.bounds.origin.y))
        path.addLine(to: CGPoint(x: 0, y: self.progressView.bounds.height))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor =  UIColor.white.cgColor
        shapeLayer.strokeColor =  UIColor.systemTeal.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.path = path.cgPath
        
        self.progressView.layer.addSublayer(shapeLayer)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.duration = 3
        shapeLayer.add(animation, forKey: "MyAnimation")
        
        self.shapeLayer = shapeLayer
    }
}
