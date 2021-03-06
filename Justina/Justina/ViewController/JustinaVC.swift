//
//  JustinaVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 02/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit
import UBottomSheet
import IQKeyboardManagerSwift

class JustinaDataSource: UBottomSheetCoordinatorDataSource {
    func sheetPositions(_ availableHeight: CGFloat) -> [CGFloat] {
        return [0.175, 0.85].map{$0*availableHeight}
    }
    
    func initialPosition(_ availableHeight: CGFloat) -> CGFloat {
        return availableHeight*0.175
    }
}

class JustinaVC: UIViewController, Storyboarded, Draggable {
    
    // MARK: Coordinator Related Properties
    static var storyboardName: String = "Justina"
    var coordinator: MainCoordinator?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: CellIdentifiers.messageSentTableViewCell, bundle: nil),
                               forCellReuseIdentifier: CellIdentifiers.messageSentTableViewCell)
            tableView.register(UINib(nibName: CellIdentifiers.justinaMessageTableViewCell, bundle: nil),
                               forCellReuseIdentifier: CellIdentifiers.justinaMessageTableViewCell)
        }
    }
    @IBOutlet weak var tableViewHeader: UIView!
    @IBOutlet weak var tableViewHeaderCornerView: UIView!
    
    @IBOutlet weak var messageTFView: UIView!
    @IBOutlet weak var messageTextField: UITextField!

    var arrayData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        IQKeyboardManager.shared.enable = false
        
        initialUI()
        messageTextField.delegate = self

        messageTFView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor).isActive = true
        
        tableView.contentInsetAdjustmentBehavior = .never
        
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
        i += 1
//        arrayData.append("eaesadljahd;awouhjaldahjd;lawidjaw;oduhjawdljhdoawudjaldhjawldaskdjalwidjasldjawdlijasdadasdifjal;fsdjf;rifjdl;firjgfl;sdfsdsdcvsdcsdvcerververveavvffdvkdfgvkdfv;dkvjeorigvnerogiujl   dflbvkeatnvleafk velarjgv aerlv aerltgv ealrg elrtg eltmbg aertl vbaeltkg lfjtg elgvmj aetr;gonr efweo;i fhjwe r;oeruwhf ;aeorfguh r;ofguh e \(i)")
        arrayData.append("eae \(i)")
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: arrayData.count - 1, section: 0) , at: .bottom, animated: true)
        
    }
    
    func initialUI(){
        messageTFView.layer.cornerRadius = 11
        tableViewHeaderCornerView.roundCorners(corners: [.topLeft, .topRight], radius: 15)

        tableView.tableFooterView = nil
        tableView.tableHeaderView = tableViewHeader
        
        messageTFView.backgroundColor = .secondaryBackground
        tableViewHeader.backgroundColor = .secondaryBackground
        tableView.backgroundColor = .primaryBackground
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
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.messageSentTableViewCell, for: indexPath) as! MessageSentTableViewCell

//        let cell = tableView.dequeueReusableCell(withIdentifier: "JustinaMessageTableViewCell", for: indexPath) as! JustinaMessageTableViewCell
        let reverseIndex = arrayData.count - indexPath.row - 1

        cell.messageText = arrayData.reversed()[reverseIndex]
        cell.messageLabel.text = arrayData.reversed()[reverseIndex]
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPos: CGFloat = -scrollView.contentOffset.y
        print(yPos)
    }
}

extension JustinaVC : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("começou a editar")
        
    }
}
