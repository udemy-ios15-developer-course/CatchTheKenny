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

    @IBOutlet weak var baseView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
}
