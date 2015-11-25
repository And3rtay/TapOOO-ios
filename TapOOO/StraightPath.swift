//
//  StraightPath.swift
//  TapOOO
//
//  Created by Ander on 22/11/2015.
//  Copyright © 2015 Moggy Studio. All rights reserved.
//

import SpriteKit

class StraightPath : Path {
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initPath(posX: CGFloat, posY: CGFloat) {
        super.initPath(posX, posY: posY)
        
        self.position = CGPointMake(posX, posY)
        self.anchorPoint = CGPointMake(0, 0)
        
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.size, center: CGPointMake(self.frame.width/2, 0))
        self.physicsBody?.dynamic = true // 2
        self.physicsBody?.categoryBitMask = PhysicsCategory.Path // 3
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Ball // 4
        self.physicsBody?.collisionBitMask = PhysicsCategory.None // 5
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.affectedByGravity = false
    }
}
