//
//  Ball.swift
//  TapOOO
//
//  Created by Ander on 21/11/2015.
//  Copyright © 2015 Moggy Studio. All rights reserved.
//

import SpriteKit

enum BallState {
    case Falling //Generated and falling from top
    case OnPath //Rolling on path
}

class Ball : SKShapeNode {
    
    var ballState:BallState?
    var radius:CGFloat?
    var color:SKColor?
    var posX:CGFloat? //position X of the ball
    var posY:CGFloat? //postion Y of the ball
    
    init(circleOfRadius: CGFloat){
        super.init()
        
        ballState = .Falling
        self.radius = circleOfRadius
        let diameter = circleOfRadius * 2
        self.path = CGPathCreateWithEllipseInRect(CGRect(origin: CGPointZero, size: CGSize(width: diameter, height: diameter)), nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initBall(color:SKColor, positonX:CGFloat, positionY:CGFloat) {
       self.color = color
       self.posX = positonX
       self.posY = positionY
    }
    
    func addBall(scene:SKScene) {
        
        self.position = CGPointMake(posX!, posY!)  //Middle of Screen
        //ball.strokeColor = SKColor.blackColor()
        self.glowWidth = 1.0
        self.fillColor = color!
        self.strokeColor = color!
        
        //Add physics to the object 
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius!, center: CGPointMake(self.frame.width/2, 0))
        self.physicsBody?.dynamic = true
        self.physicsBody?.categoryBitMask = PhysicsCategory.Ball
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Path
        //self.physicsBody?.collisionBitMask = PhysicsCategory.Path
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.friction = 0.0
        self.physicsBody?.restitution = 0.5
        self.physicsBody?.linearDamping = 0.0
        self.physicsBody?.angularDamping = 0.0
        
        scene.addChild(self)
        
    }
    
    func moveBall() {
        self.physicsBody?.applyImpulse(CGVectorMake(5, 0))
        
    }
    
}
