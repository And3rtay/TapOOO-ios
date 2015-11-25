//
//  MapLevel1.swift
//  TapOOO
//
//  Created by Ander on 21/11/2015.
//  Copyright © 2015 Moggy Studio. All rights reserved.
//

import SpriteKit

class MapLevel1 : World {
    
    var ball:Ball?
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        log.debug("World Width : \(self.frame.size.width)")
        log.debug("World Height : \(self.frame.size.height)")
        
        //Create the paths
        let straightPath1 = StraightPath(color: SKColor.blackColor(), size: CGSizeMake(self.frame.width-50, 30))
        straightPath1.initPath(0, posY: self.frame.height-100)
        addChild(straightPath1)
        
        let straightPath2 = StraightPath(color: SKColor.blackColor(), size: CGSizeMake(self.frame.width-50, 30))
        straightPath2.initPath(50, posY: self.frame.height-200)
        addChild(straightPath2)
        
        let straightPath3 = StraightPath(color: SKColor.blackColor(), size: CGSizeMake(self.frame.width-50, 30))
        straightPath3.initPath(0, posY: self.frame.height-300)
        addChild(straightPath3)
        
        ball = Ball(circleOfRadius: 15)
        ball!.initBall(SKColor.yellowColor(), positonX: 0, positionY: frame.height)
        ball!.addBall(self)
        
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        //This gets called automatically when two objects begin contact with each other
        
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch(contactMask) {
            
        case PhysicsCategory.Ball | PhysicsCategory.Path:
            //either the contactMask was the ball or the path type
            log.debug("contact made")
            if ball?.ballState == .Falling {
                ball!.moveBall()
                ball!.ballState = .OnPath
            }
            
        default:
            return
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        super.update(currentTime)
        
    }
}
