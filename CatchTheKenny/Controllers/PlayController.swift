//
//  PlayController.swift
//  CatchTheKenny
//
//  Created by Chris Hand on 8/14/22.
//

/*
    The way to win a level is to hit the kenny the required number of times, before you miss the limited number of times
    
    Each level will adjust the size of the kenny: can be very big to very small
    Each level will adjust the number of times kenny is hit
    Each level will adjust the number of times kenny is missed
    Each level will adjust the movement pattern: linear, bouncing, random
    Each level will create objects that kenny could either move behind, or bounce off of
    Each level will have a timelimit
 
    Need to add a bouncing sound, and a splat sound
 */


import UIKit

class PlayController: UIViewController {

    private var timer = Timer()
    private var posX = 100
    private var posY = 23
    private var rateX = 5
    private var rateY = 5
    private var dirX = 1
    private var dirY = -1
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var kenny: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
    }
    
    @objc
    private func timerTick() {
        let maxX = Int(baseView.frame.width - kenny.frame.width)
        let maxY = Int(baseView.frame.height - kenny.frame.height)
        posX += dirX * rateX
        posY += dirY * rateY
        
        if posX <= 0 {
            posX = 0
            dirX *= -1
        }
        
        if posY <= 0 {
            posY = 0
            dirY *= -1
        }
        
        if posX >= maxX {
            posX = maxX
            dirX *= -1
        }
        
        if posY >= maxY {
            posY = maxY
            dirY *= -1
        }
        
        rateX = Int.random(in: 1...10)
        rateY = Int.random(in: 1...10)
        positionKenny(posX: posX, posY: posY)
    }
    
    private func positionKenny(posX: Int, posY: Int) {
        kenny.frame.origin.x = CGFloat(posX)
        kenny.frame.origin.y = CGFloat(posY)
    }
}
