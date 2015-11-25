//
//  World.swift
//  TapOOO
//
//  Created by Ander on 21/11/2015.
//  Copyright © 2015 Moggy Studio. All rights reserved.
//

import SpriteKit

struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let All       : UInt32 = UInt32.max
    static let Ball      : UInt32 = 0b1       // 1
    static let Path      : UInt32 = 0b10      // 2
}

class World : SKScene, SKPhysicsContactDelegate {
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        backgroundColor = SKColor.whiteColor()
        
        //Set gravity of the world
        //physicsWorld.gravity = CGVectorMake(0,0)
        
        // 1. Create a physics body that borders the screen
        let borderBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        // 2. Set the friction of that physicsBody to 0
        borderBody.friction = 0
        // 3. Set physicsBody of scene to borderBody
        self.physicsBody = borderBody
        
        physicsWorld.contactDelegate = self
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        /*for touch in touches {
        let location = touch.locationInNode(self)
        
        let sprite = SKSpriteNode(imageNamed:"Spaceship")
        
        sprite.xScale = 0.5
        sprite.yScale = 0.5
        sprite.position = location
        
        let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        
        sprite.runAction(SKAction.repeatActionForever(action))
        
        self.addChild(sprite)
        }*/
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        //log.debug("Current time : \(currentTime)")
        
        //ball?.ball.physicsBody
    }
    

}
