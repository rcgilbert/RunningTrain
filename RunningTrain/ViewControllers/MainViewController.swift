//
//  MainViewController.swift
//  RunningTrain
//
//  Created by Ryan Gilbert on 6/5/14.
//  Copyright (c) 2014 Ryan Gilbert. All rights reserved.
//

import UIKit

class MainViewController: UISplitViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [TrainListTableViewController(style: .Plain)]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
