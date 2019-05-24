//
//  Player.swift
//  TrainGame
//
//  Created by Eliza Maria Porto de Carvalho on 22/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class Player: GKEntity{
    
    init(imageName: String, gameScene: GameScene){
        super.init()
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName), gameScene: gameScene)
        spriteComponent.node.texture = SKTexture.init(imageNamed: imageName)
        addComponent(spriteComponent)
        let camerComponent = CameraComponent(scene: gameScene)
        addComponent(spriteComponent)
        addComponent(camerComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
}
