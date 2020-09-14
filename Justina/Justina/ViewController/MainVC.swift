//
//  ViewController.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 01/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit
import UBottomSheet

class MainVC: UIViewController, Storyboarded {
    
    // MARK: Coordinator Related Properties
    static var storyboardName: String = "Main"
    var delegate: MainVCDelegate?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: CellIdentifiers.sectionHeaderTableViewCell, bundle: nil),
                               forCellReuseIdentifier: CellIdentifiers.sectionHeaderTableViewCell)
            tableView.register(UINib(nibName: CellIdentifiers.processosTableViewCell, bundle: nil),
                               forCellReuseIdentifier: CellIdentifiers.processosTableViewCell)
            tableView.register(UINib(nibName: CellIdentifiers.addProcessoTableViewCell, bundle: nil),
                               forCellReuseIdentifier: CellIdentifiers.addProcessoTableViewCell)
        }
    }
    
    var sheetCoordinator: UBottomSheetCoordinator!
    var dataSource: UBottomSheetCoordinatorDataSource?

    var backView: PassThroughView?

    let notification = UINotificationFeedbackGenerator()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    override func viewWillLayoutSubviews() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        presentSheet()
    }

    func presentSheet() {
        guard sheetCoordinator == nil else {return}
        sheetCoordinator = UBottomSheetCoordinator(parent: self,
                                                   delegate: self)
        dataSource = JustinaDataSource()
        guard let dataSource = dataSource else {
            print("deu ruim aqui man")
            return
        }
        sheetCoordinator.dataSource = dataSource

        // parentViewController: main view controller that presents the bottom sheet
        // call this within viewWillLayoutSubViews to make sure view frame has measured correctly. see example projects.
        let vc = UIStoryboard(name: "Justina", bundle: nil).instantiateViewController(withIdentifier: "JustinaVC") as! JustinaVC
        
        vc.sheetCoordinator = sheetCoordinator
        sheetCoordinator.addSheet(vc, to: self, didContainerCreate: { container in
            container.roundCorners(corners: [.topLeft, .topRight], radius: 15, rect: container.rect)
        })
        sheetCoordinator.setCornerRadius(15)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01){
            self.sheetCoordinator.setToNearest(self.sheetCoordinator.availableHeight*0.85, animated: true)
        }
    }
    
    private func addBackDimmingBackView(below container: UIView){
        backView = PassThroughView()
        self.view.insertSubview(backView!, belowSubview: container)
        backView!.translatesAutoresizingMaskIntoConstraints = false
        backView!.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backView!.bottomAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
        backView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        backView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    @IBAction func testButton(_ sender: Any) {
        delegate?.mainVCDidFinish()
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.addProcessoTableViewCell) as! AddProcessoTableViewCell
                return cell
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.processosTableViewCell) as! ProcessosTableViewCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.addProcessoTableViewCell) as! AddProcessoTableViewCell
        return cell
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.sectionHeaderTableViewCell) as! SectionHeaderTableViewCell
//
////        if section == 0 {
////            cell.l
////        }
//        return cell
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 2 ? 60 : 100
    }
}


//MARK:- Bottom Sheet Related Code
extension MainVC: UBottomSheetCoordinatorDelegate{
    
    func bottomSheet(_ container: UIView?, didPresent state: SheetTranslationState) {
        self.addBackDimmingBackView(below: container!)
        self.sheetCoordinator.addDropShadowIfNotExist()
        self.handleState(state)
    }

    func bottomSheet(_ container: UIView?, didChange state: SheetTranslationState) {
        handleState(state)
    }

    func bottomSheet(_ container: UIView?, finishTranslateWith extraAnimation: @escaping ((CGFloat) -> Void) -> Void) {
        extraAnimation({ percent in
            self.backView?.backgroundColor = UIColor.black.withAlphaComponent(percent/100 * 0.8)
        })
    }
    
    func handleState(_ state: SheetTranslationState){
        switch state {
        case .progressing(_, let percent):
            self.backView?.backgroundColor = UIColor.black.withAlphaComponent(percent/100 * 0.8)
        case .finished(_, let percent):
            self.backView?.backgroundColor = UIColor.black.withAlphaComponent(percent/100 * 0.8)
        default:
            notification.notificationOccurred(.success)
            break
        }
    }
}

//MARK:- Coordinator Related Code
protocol MainVCDelegate : AnyObject{
    func mainVCDidFinish()
    
    func moveToPersonalData()
}
