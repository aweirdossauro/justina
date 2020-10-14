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
            case .visaoGeral: break
            
            case .peticao: break
            }
        }
    }
}
