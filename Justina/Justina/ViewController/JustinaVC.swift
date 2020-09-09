//
//  JustinaVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 02/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit
import UBottomSheet


class MyDataSource: UBottomSheetCoordinatorDataSource {
    func sheetPositions(_ availableHeight: CGFloat) -> [CGFloat] {
        return [0.1, 0.85].map{$0*availableHeight}
    }
    
    func initialPosition(_ availableHeight: CGFloat) -> CGFloat {
        return availableHeight*0.1
    }
}


class JustinaVC: UIViewController, Storyboarded, Draggable {
    
    // MARK: Coordinator Related Properties
    static var storyboardName: String = "Justina"
    var coordinator: MainCoordinator?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeader: UIView!
    @IBOutlet weak var tableViewCornerView: UIView!
    
    @IBOutlet weak var messageTFView: UIView!

    var arrayData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        messageTFView.layer.cornerRadius = 11
        
        tableView.contentInsetAdjustmentBehavior = .never
        tableViewCornerView.roundCorners(corners: [.topLeft, .topRight], radius: 15, rect: tableViewCornerView.rect)
        
        // flip tableview
//        tableView.transform = CGAffineTransform(rotationAngle: -(CGFloat)(Double.pi));
//
//        // flip scrolling
//        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: tableView.bounds.size.width - 8.0)
//
//        tableViewHeader.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));
//        tableView.tableHeaderView = tableViewHeader
//        tableView.tableFooterView = nil
//        tableView.tableHeaderView = nil
        
        
        tableView.register(UINib(nibName: "MessageSentTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "MessageSentTableViewCell")

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //adds pan gesture recognizer to draggableView()
        sheetCoordinator?.startTracking(item: self)
    }

    var sheetCoordinator: UBottomSheetCoordinator?

    func draggableView() -> UIScrollView? {
        return tableView
    }
    
    var i = 0
    @IBAction func sendButton(_ sender: Any) {
//        arrayData.append("eae")
        i += 1
        arrayData.append("eae \(i)")
        tableView.reloadData()
    }
}

extension JustinaVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = arrayData.reversed()

        if data.count > 0 {
            return data.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageSentTableViewCell", for: indexPath) as! MessageSentTableViewCell
        
        let reverseIndex = arrayData.count-indexPath.row-1

//        let currCellData = arrayData.object(at: reverseIndex)

        cell.messageText = arrayData.reversed()[reverseIndex]
        cell.messageLabel.text = arrayData.reversed()[reverseIndex]
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPos: CGFloat = -scrollView.contentOffset.y
        print(yPos)
    }
}

class HasBottomSheet {
    func openJustina(){
        
    }
}
