//
//  Path.swift
//  TapOOO
//
//  Created by Ander on 22/11/2015.
//  Copyright © 2015 Moggy Studio. All rights reserved.
//

import SpriteKit

class Path : SKSpriteNode {
    
    var posX:CGFloat?
    var posY:CGFloat?
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initPath(posX:CGFloat, posY:CGFloat) {
        self.posX = posX
        self.posY = posY
    }
}