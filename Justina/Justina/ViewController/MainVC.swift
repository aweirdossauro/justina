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
        
    private let imageView = UIImageView(image: UIImage(systemName: "person.circle.fill"))
    private struct Const {
    /// Image height/width for Large NavBar state
        static let ImageSizeForLargeState: CGFloat = 40
    /// Margin from right anchor of safe area to right anchor of Image
        static let ImageRightMargin: CGFloat = 16
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
        static let ImageBottomMarginForLargeState: CGFloat = 12
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
        static let ImageBottomMarginForSmallState: CGFloat = 6
    /// Image height/width for Small NavBar state
        static let ImageSizeForSmallState: CGFloat = 32
    /// Height of NavBar for Small state. Usually it's just 44
        static let NavBarHeightSmallState: CGFloat = 44
    /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large state of NavBar
        static let NavBarHeightLargeState: CGFloat = 96.5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavBarButtonUI()
        showImage(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showImage(false)
    }
    
    @IBAction func testButton(_ sender: Any) {
        delegate?.mainVCDidFinish()
    }
    
    @objc func testButtonPressed(_ sender: Any) {
//        showImage(false)
//        delegate?.mainVCDidFinish()
        delegate?.moveToOnboarding()
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
            if indexPath.row == indexPath.count {             //adiciona processo
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == indexPath.last {
            delegate?.mainVCDidFinish()
            return
        }
        delegate?.moveToProcessosInfo()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == indexPath.count ? 60 : 130
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        moveAndResizeImage(for: height)
    }
}

//MARK:- Nav Bar setup related code
extension MainVC {
    private func setupNavBarButtonUI() {
        navigationController?.navigationBar.prefersLargeTitles = true

        title = "Meus Processos"

        imageView.tintColor = .label

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(testButtonPressed(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)

        // Initial setup for image for Large NavBar state since the the screen always has Large NavBar once it gets opened
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -Const.ImageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -Const.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    private func moveAndResizeImage(for height: CGFloat) {
        let coeff: CGFloat = {
            let delta = height - Const.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (Const.NavBarHeightLargeState - Const.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()
        
        let factor = Const.ImageSizeForSmallState / Const.ImageSizeForLargeState
        
        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()
        
        // Value of difference between icons for large and small states
        let sizeDiff = Const.ImageSizeForLargeState * (1.0 - factor) // 8.0
        let yTranslation: CGFloat = {
            /// This value = 14. It equals to difference of 12 and 6 (bottom margin for large and small states). Also it adds 8.0 (size difference when the image gets smaller size)
            let maxYTranslation = Const.ImageBottomMarginForLargeState - Const.ImageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation, (maxYTranslation - coeff * (Const.ImageBottomMarginForSmallState + sizeDiff))))
        }()
        
        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)
        
        imageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
    
    /// Show or hide the image from NavBar while going to next screen or back to initial screen
    ///
    /// - Parameter show: show or hide the image from NavBar
    private func showImage(_ show: Bool) {
        let duration = 0.2
        UIView.animate(withDuration: duration) {
            self.imageView.alpha = show ? 1.0 : 0.0
        }
        if show {
            guard let height = navigationController?.navigationBar.frame.height else { return }
            moveAndResizeImage(for: height)
             return
        }
        
    }
}

//MARK:- Coordinator Related Code
protocol MainVCDelegate : AnyObject{
    func  mainVCDidFinish()
    
    func moveToPersonalData()

    func moveToProcessosInfo()
    
    func moveToOnboarding()
}
