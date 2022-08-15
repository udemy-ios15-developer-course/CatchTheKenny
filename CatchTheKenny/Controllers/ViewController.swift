//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by Chris Hand on 8/14/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let modelData = ModelData()
        modelData.loadLevels()
        modelData.loadScores()
        modelData.saveScores()
    }
}

