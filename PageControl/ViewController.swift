//
//  ViewController.swift
//  PageControl
//
//  Created by jungbyungwoo1 on 2016. 12. 15..
//  Copyright © 2016년 jungbyungwoo1. All rights reserved.
//

import UIKit

var images = ["1.png", "2.png", "3.png", "4.png", "5.png"]

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.greenColor()
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        
        imageView.image = UIImage(named: images[0])
        
        let swipePrev = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipePrev.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipePrev)
        
        let swipeNext = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeNext.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeNext)

    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            var nextIndex = pageControl.currentPage
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                nextIndex = (nextIndex - 1 < 0) ? nextIndex : nextIndex - 1
            case UISwipeGestureRecognizerDirection.Right:
                nextIndex = (nextIndex + 1 > 4) ? nextIndex : nextIndex + 1
            default:
                break
            }
            
            imageView.image = UIImage(named: images[nextIndex])
            pageControl.currentPage = nextIndex
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onPageChanged(sender: UIPageControl) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }

}

