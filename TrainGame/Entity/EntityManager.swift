//
//  EntityManager.swift
//  TrainGame
//
//  Created by Eliza Maria Porto de Carvalho on 22/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class EntityManager {
    
    
    var entities = Set<GKEntity>()
    let scene: SKScene
    
   
    init(scene: SKScene) {
        self.scene = scene
    }
    
   
    func add(_ entity: GKEntity) {
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            scene.addChild(spriteNode)
        }
    }
    
   
    func remove(_ entity: GKEntity) {
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        
        entities.remove(entity)
    }
    
    func update(dt: TimeInterval) {
//        for entity in entities {
//            entity.update(deltaTime: seconds)
//        }
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
    }
    
    func updateControl(dt: TimeInterval, ctrol: Control) {
        //        for entity in entities {
        //            entity.update(deltaTime: seconds)
        //        }
        for entity in self.entities {
            if let component = entity.component(ofType: MoveComponent.self){
                //   print(entity)
                component.updatePressedButtons(control: ctrol.directionCommand, dt: dt)
            }
            entity.update(deltaTime: dt)
        }
    }

}
