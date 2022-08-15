//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by Chris Hand on 8/14/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var kenny: UIImageView!
    
    @IBOutlet weak var score1: UILabel!
    @IBOutlet weak var score2: UILabel!
    @IBOutlet weak var score3: UILabel!
    @IBOutlet weak var score4: UILabel!
    @IBOutlet weak var score5: UILabel!
    private var scoreboard = [UILabel]()
    private var position = 0.0
    private var direction = 2.0
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let modelData = ModelData()
        modelData.loadLevels()
        modelData.loadScores()
        modelData.saveScores()
        kenny.image = UIImage(named: "kenny")
        kenny.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(startGame))
        kenny.addGestureRecognizer(gestureRecognizer)
        scoreboard = [score1, score2, score3, score4, score5]
        for index in 0...4 {
            scoreboard[index].text = "\(modelData.highScores[index].initials) --- \(modelData.highScores[index].score)"
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(moveKenny), userInfo: nil, repeats: true)
    }
        
    @objc
    private func startGame() {
        timer.invalidate()
        kenny.image = UIImage(named: "kenny_splat")
        kenny.frame.origin.x = position
        kenny.isUserInteractionEnabled = false
        performSegue(withIdentifier: "toPlayController", sender: nil)
    }
    
    @objc
    private func moveKenny() {
        kenny.frame.origin.x = position + direction
        position += direction
        direction *= position > 300 || position <= 0 ? -1.0 : 1.0
    }
}

