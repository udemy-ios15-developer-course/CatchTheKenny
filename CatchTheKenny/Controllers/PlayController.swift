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
    private var hit = 0
    private var miss = 0
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var kenny: UIImageView!
    @IBOutlet weak var hitCount: UILabel!
    @IBOutlet weak var missCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        var hitTap = UITapGestureRecognizer(target: self, action: #selector(kennyTap))
        var missTab = UITapGestureRecognizer(target: self, action: #selector(viewTap))
        kenny.addGestureRecognizer(hitTap)
        kenny.isUserInteractionEnabled = true
        baseView.addGestureRecognizer(missTab)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
    }
    
    @objc
    private func kennyTap() {
        hit += 1
        hitCount.text = "\(hit)"
        if Int.random(in: 1...2)%2 == 0 {
            dirX *= -1
        } else {
            dirY *= -1
        }
    }
    
    @objc
    private func viewTap() {
        miss += 1
        missCount.text = "\(miss)"
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
        
        rateX = Int.random(in: 1...3)
        rateY = Int.random(in: 1...3)
        positionKenny(posX: posX, posY: posY)
    }
    
    private func positionKenny(posX: Int, posY: Int) {
        kenny.frame.origin.x = CGFloat(posX)
        kenny.frame.origin.y = CGFloat(posY)
    }
}
