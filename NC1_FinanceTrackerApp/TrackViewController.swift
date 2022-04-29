//
//  TrackViewController.swift
//  NC1_FinanceTrackerApp
//
//  Created by Marcelino Budiman on 27/04/22.
//

import UIKit

class TrackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configureTopTitle()
    }
    
    private func configureTopTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Track Money"
        titleLabel.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    
    


}
