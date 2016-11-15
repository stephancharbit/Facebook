    //
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet var tap1: UITapGestureRecognizer!
    @IBOutlet var tap2: UITapGestureRecognizer!
    @IBOutlet var tap3: UITapGestureRecognizer!
    @IBOutlet var tap4: UITapGestureRecognizer!
    @IBOutlet var tap5: UITapGestureRecognizer!
    
    var senderImage:UIImageView!
    var senderID:Int!

    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSize(width: 320, height: feedImageView.image!.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        var destinationViewController = segue.destination as! PhotoViewController
        destinationViewController.senderID = senderID
        destinationViewController.senderImage = senderImage
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 0.5

    }
    
    @IBAction func didTapPhoto(_ sender: UITapGestureRecognizer) {
        senderID = sender.view!.tag
        //print("in didTapPhoto, the sender ID is:",senderID)
        senderImage = sender.view as! UIImageView!
        performSegue(withIdentifier: "photoSegue", sender: nil)
    }
    
    
    
}
