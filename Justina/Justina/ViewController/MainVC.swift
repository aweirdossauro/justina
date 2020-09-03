//
//  ViewController.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 01/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit
import UBottomSheet

extension UIView{
    func roundCorners(corners: UIRectCorner, radius: CGFloat, rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

class MainVC: UIViewController, Storyboarded {
    
    // MARK: Coordinator Related Properties
    static var storyboardName: String = "Main"
    var coordinator: MainCoordinator?
    var sheetCoordinator: UBottomSheetCoordinator!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    override func viewWillLayoutSubviews() {
        super.viewDidLoad()

        guard sheetCoordinator == nil else {return}
        sheetCoordinator = UBottomSheetCoordinator(parent: self,
                                                   delegate: self)
        
        // parentViewController: main view controller that presents the bottom sheet
        // call this within viewWillLayoutSubViews to make sure view frame has measured correctly. see example projects.
        let vc = UIStoryboard(name: "Justina", bundle: nil).instantiateViewController(withIdentifier: "JustinaVC") as! JustinaVC
        
        vc.sheetCoordinator = sheetCoordinator
        
        sheetCoordinator.addSheet(vc, to: self, didContainerCreate: { container in
        let f = self.view.frame
        let rect = CGRect(x: f.minX, y: f.minY, width: f.width, height: f.height)
        container.roundCorners(corners: [.topLeft, .topRight], radius: 10, rect: rect)
        })
        sheetCoordinator.setCornerRadius(10)
    }

}


extension MainVC: UBottomSheetCoordinatorDelegate{
    
    func bottomSheet(_ container: UIView?, didPresent state: SheetTranslationState) {
//        self.addBackDimmingBackView(below: container!)
//        self.sheetCoordinator.addDropShadowIfNotExist()
        self.handleState(state)
    }

    func bottomSheet(_ container: UIView?, didChange state: SheetTranslationState) {
        handleState(state)
    }

    func bottomSheet(_ container: UIView?, finishTranslateWith extraAnimation: @escaping ((CGFloat) -> Void) -> Void) {
        extraAnimation({ percent in
//            self.backView?.backgroundColor = UIColor.black.withAlphaComponent(percent/100 * 0.8)
        })
    }
    
    func handleState(_ state: SheetTranslationState){
//        switch state {
//        case .progressing(_, let percent):
//            self.backView?.backgroundColor = UIColor.black.withAlphaComponent(percent/100 * 0.8)
//        case .finished(_, let percent):
//            self.backView?.backgroundColor = UIColor.black.withAlphaComponent(percent/100 * 0.8)
//        default:
//            break
//        }
    }
}


