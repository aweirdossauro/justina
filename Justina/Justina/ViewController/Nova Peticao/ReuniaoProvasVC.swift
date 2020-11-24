//
//  ReuniaoProvasVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 19/11/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class ReuniaoProvasVC: UIViewController, Storyboarded {
    
    // MARK: Coordinator Related Properties
    static var storyboardName: String = "PersonalData"

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: CellIdentifiers.provasTableViewCell, bundle: nil),
                               forCellReuseIdentifier: CellIdentifiers.provasTableViewCell)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ReuniaoProvasVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        ReuniaoProvasModel.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
