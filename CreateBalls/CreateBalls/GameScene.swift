//
//  GameScene.swift
//  CreateBalls
//
//  Created by Vanessa Dubouzet on 2024-02-29.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.white
        scene!.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        run(SKAction.repeat(SKAction.sequence([SKAction.run(createBall),
                                               SKAction.wait(forDuration: 0.05)]), count: 200))
    }
    
    func createBall() {
        let ball = SKSpriteNode(imageNamed: "ball")
        ball.position = CGPoint(x: CGFloat(Int(arc4random()) &
                                           Int(size.width)), y: size.height - ball.size.height)
        ball.physicsBody = SKPhysicsBody(circleOfRadius:
                                            ball.size.width/2) //try 1, 1/3, 2/3 to see different effects
        addChild(ball)
    }
}
