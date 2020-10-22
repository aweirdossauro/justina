//
//  OnboardingPageVC.swift
//  FlappyAR
//
//  Created by Vinicius Augusto Dilay de Paula on 13/08/20.
//  Copyright © 2020 YUR. All rights reserved.
//

import UIKit

class OnboardingPageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
   
   // MARK: - Properties
   
   weak var onboardingDelegate: OnboardingPageVCDelegate?
   
    var pageHeadings = ["""
                        Place your phone on the ground facing you

                        Move 3 steps back
                        """,
                       "Squat to move the bee"]
    
   var pageImages = ["onboarding1", "onboarding2-1"]
   
   var currentIndex = 0

   override func viewDidLoad() {
       super.viewDidLoad()
       
       // Set the data source and the delegate to itself
       dataSource = self
       delegate = self
       
       // Create the first onboarding screen
       if let startingViewController = contentViewController(at: 0) {
           setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
       }
   }
   
   // MARK: - Page View Controller Data Source
   
   func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
       var index = (viewController as! OnboardingContentVC).index
       index -= 1
       
       return contentViewController(at: index)
   }
   
   func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
       var index = (viewController as! OnboardingContentVC).index
       index += 1
       
       return contentViewController(at: index)
   }
   
   // MARK: - Helper
   
   func contentViewController(at index: Int) -> OnboardingContentVC? {
       if index < 0 || index >= pageHeadings.count {
           return nil
       }
       
       // Create a new view controller and pass suitable data
       let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
       if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "OnboardingContentVC") as? OnboardingContentVC {
           pageContentViewController.imageFile = pageImages[index]
           pageContentViewController.heading = pageHeadings[index]
           pageContentViewController.index = index
           
           return pageContentViewController
       }
       
       return nil
   }
   
   func forwardPage() {
       currentIndex += 1
       if let nextViewController = contentViewController(at: currentIndex) {
           setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
       }
   }
   
   // MARK: - Page View Controller delegate
   
   func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
       if completed {
           if let contentViewController = pageViewController.viewControllers?.first as? OnboardingContentVC {
               currentIndex = contentViewController.index
               
               onboardingDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
           }
       }
   }
   

}

protocol OnboardingPageVCDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}
