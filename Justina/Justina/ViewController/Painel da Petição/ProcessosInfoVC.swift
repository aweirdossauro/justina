//
//  ProcessosInfoVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 16/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class ProcessosInfoVC: UIViewController, Storyboarded {
    // MARK: Coordinator Related Properties
    static var storyboardName: String = "Main"

    var delegate : PeticaoProcessosVCDelegate?

    @IBOutlet weak var processoNameLabel: UILabel!

    @IBOutlet weak var contentSegmentedView: UISegmentedControl!
    @IBOutlet weak var contentView: UIView!
    
    // MARK: Subtypes
    enum SegmentedViewIndex: Int {
        case visaoGeral = 0
        case peticao = 1
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        
        title = "Painel de Petição"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backItem?.title = ""
        navigationController?.navigationBar.tintColor = .label
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func contentSegmentedViewDidChange(_ sender: Any) {
        let segmentedValue = contentSegmentedView.selectedSegmentIndex
        
        if let segmentedIndex = SegmentedViewIndex(rawValue: segmentedValue) {
            switch segmentedIndex {
            case .visaoGeral:
                let vc = VisaoGeralProcessosVC.instantiate()
                self.addChild(vc)
                vc.view.frame = CGRect(x: 0, y: 0,
                                       width: self.contentView.frame.size.width,
                                       height: self.contentView.frame.size.height)
                self.contentView.addSubview(vc.view)
                vc.didMove(toParent: self)
            
            case .peticao:
                let vc = PeticaoProcessosVC.instantiate()
                vc.delegate = self.delegate
                self.addChild(vc)
                vc.view.frame = CGRect(x: 0, y: 0,
                                       width: self.contentView.frame.size.width,
                                       height: self.contentView.frame.size.height)
                self.contentView.addSubview(vc.view)
                vc.didMove(toParent: self)
            }
        }
    }
}
