//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class FadeTransition: BaseTransition {
    
    
    
    let window = UIApplication.shared.keyWindow
    //let senderImage:UIImageView!
    
    var senderImageFrame:CGRect!
    var fullImageFrame:CGRect!
    
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        containerView.backgroundColor = UIColor(white: 0, alpha: 0)
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! NewsFeedViewController
        let toViewController = toViewController as! PhotoViewController
        let senderID:Int = feedViewController.senderID
        senderImageFrame = window!.convert(toViewController.senderImage.frame, from: feedViewController.scrollView)
        fullImageFrame = toViewController.imageView.frame
        //print("senderID: ", senderID)
        toViewController.imageView.contentMode = UIViewContentMode.scaleAspectFit
        if (senderID == 0){
            toViewController.imageView.contentMode = UIViewContentMode.scaleAspectFill
        }
        
        
        toViewController.imageView.alpha = 1
        toViewController.imageView.frame = senderImageFrame
        toViewController.scrollView.backgroundColor = UIColor(white: 0, alpha: 0)
        UIView.animate(withDuration: duration, animations: {
            toViewController.scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
            toViewController.imageView.frame = self.fullImageFrame
            toViewController.imageView.frame.size.width = self.fullImageFrame.size.width
            //print("toViewController.actionsView.alpha:",toViewController.actionsView.alpha)
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        fromViewController.view.alpha = 1
        let fromViewController = fromViewController as! PhotoViewController
        fromViewController.scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
        UIView.animate(withDuration: duration, animations: {
            fromViewController.imageView.frame = self.senderImageFrame
            fromViewController.scrollView.backgroundColor = UIColor(white: 0, alpha: 0)
            fromViewController.view.alpha = 0
        }) { (finished: Bool) -> Void in
            self.finish()
            fromViewController.view.alpha = 0
        }
    }
}
