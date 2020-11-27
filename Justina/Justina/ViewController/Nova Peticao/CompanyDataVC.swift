//
//  CompanyDataVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 24/10/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class CompanyDataVC: UIViewController , Storyboarded {

    // MARK: Coordinator Related Properties
    static var storyboardName: String = "PersonalData"
    var delegate: CompanyDataVCDelegate?

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: CellIdentifiers.textFieldTableViewCell, bundle: nil),
                               forCellReuseIdentifier: CellIdentifiers.textFieldTableViewCell)
            tableView.register(UINib(nibName: CellIdentifiers.continueTableViewCell, bundle: nil),
                               forCellReuseIdentifier: CellIdentifiers.continueTableViewCell)

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol CompanyDataVCDelegate: AnyObject {
    func companyDataVCDidFinish()
    
    func companyDataVCNextStep()
}

