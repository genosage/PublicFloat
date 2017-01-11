//
//  MapViewController.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/9/25.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//


import UIKit
import AFNetworking
import OHHTTPStubs
import ObjectMapper
//import RxCocoa
//import RxSwift

class MapViewController: UIViewController {
    
    var imageView = UIImageView()
    var expanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MapViewController.tap(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 2
        
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(MapViewController.pinch(_:)))
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(MapViewController.pan(_:)))
        
        let rotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(MapViewController.rotation(_:)))
        
        imageView = UIImageView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        imageView.image = UIImage(named: "map")
        self.view.addSubview(imageView)
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        imageView.addGestureRecognizer(pinchGestureRecognizer)
        imageView.addGestureRecognizer(panGestureRecognizer)
        imageView.addGestureRecognizer(rotationGestureRecognizer)
    }
    
    func tap(_ gestureRecognizer:UITapGestureRecognizer){
        
        var frame = imageView.frame
        
        if (!expanded) {
            frame.size.height = frame.size.height * 2
            frame.size.width = frame.size.width * 2
            expanded = true
        } else {
            frame.size.height = frame.size.height / 2
            frame.size.width = frame.size.width / 2
            expanded = false
        }
        
        imageView.frame = frame
    }
    
    func pinch(_ gestureRecognizer: UIPinchGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizerState.began || gestureRecognizer.state == UIGestureRecognizerState.changed {
            imageView.transform = imageView.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale)
            gestureRecognizer.scale = 1
        }
    }
    
    func pan(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizerState.began || gestureRecognizer.state == UIGestureRecognizerState.changed {
            let translation = gestureRecognizer.translation(in: imageView.superview!)
            imageView.center = CGPoint(x: imageView.center.x + translation.x, y: imageView.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: imageView.superview)
        }
    }
    
    
    func rotation(_ gestureRecognizer: UIRotationGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizerState.began || gestureRecognizer.state == UIGestureRecognizerState.changed {
            imageView.transform = imageView.transform.rotated(by: gestureRecognizer.rotation)
            gestureRecognizer.rotation = 0
        }
    }
}
