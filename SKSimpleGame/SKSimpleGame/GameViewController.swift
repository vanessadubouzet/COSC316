//
//  GameViewController.swift
//  SKSimpleGame
//
//  Created by Vanessa Dubouzet on 2024-03-05.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        let scene = GameScene(size: view.frame.size)
        let skView = view as! SKView
        skView.presentScene(scene)
    }

}
