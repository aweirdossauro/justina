//
//  OnboardingPageVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 22/10/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class OnboardingPageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    // MARK: - Properties
    
    weak var onboardingDelegate: OnboardingPageVCDelegate?
    
    var pageBody = ["""
                        Você está começando uma nova petição. Este processo possui quatro etapas:
                        """,
                    """
                        Na primeira você irá redigir uma petição contando sua versão e o motivo de se sentir lesado. Não se preocupe, nós vamos te ajudar com isso.
                        """,
                    """
                        Você deverá se encaminhar até o JEC mais próximo a sua casa para marcar a data da sua audiência.
                        Vamos te ajudar a encontrá-los!
                        """,
                    """
                        Basta comparecer na data e hora marcada da audiência para fazer valer seus direitos. Você pode definir um lembrete para que a Justina te lembre e dê dicas!
                        """,
                    """
                        A parte que a gente mais gosta: quando tudo está resolvido. Se você achar que seu acordo foi justo, tudo termina aqui.
                        """]
    var pageHeadings = ["",
                        "1-Redigir a petição:",
                        "2-Marcar a audiência:",
                        "3-Comparecer a audiência:",
                        "4-Conciliação:"]
    
    var pageImages = ["onboarding1", "onboarding2", "onboarding3", "onboarding4", "onboarding5"]
    
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
            pageContentViewController.body = pageBody[index]
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
