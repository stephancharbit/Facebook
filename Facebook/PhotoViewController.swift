//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Stephan Charbit on 11/10/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    var image:UIImage!
    var senderID:Int = 0
    var senderImage: UIImageView!
    var imageName:String!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var photoActions: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageName = ("wedding"+String(senderID+1))
        //imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        // Do any additional setup after loading the view.
        //bgView.alpha = 0
        scrollView.contentSize = imageView.frame.size
        scrollView.contentSize.height = 900
        print(scrollView.contentSize)
        scrollView.delegate = self
        scrollView.backgroundColor = UIColor(white: 0, alpha: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method is called as the user scrolls
        //let messageCenter = messageImageView.center.x
        let opacity = (100 + scrollView.contentOffset.y)/100
        photoActions.alpha = opacity
        doneBtn.alpha = opacity
        scrollView.backgroundColor = UIColor(white: 0, alpha: opacity)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollView.backgroundColor = UIColor(white: 0, alpha: 0)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let translation = scrollView.contentOffset
        if (translation.y < -100){
            dismiss(animated: true, completion: nil)
        }
        
    }
    @IBAction func didPressDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
