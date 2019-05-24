//
//  DamagingComponent.swift
//  shoot
//
//  Created by Vilar da Camara Neto on 08/04/19.
//  Copyright © 2019 Vilar da Camara Neto. All rights reserved.
//

import Foundation
import GameplayKit


class CameraComponent: GKComponent {
    
    let cam = SKCameraNode()
    
    init(scene: SKScene){
        super.init()
        print(scene.childNode(withName: "camera") as? SKCameraNode)
        scene.camera = scene.childNode(withName: "camera") as? SKCameraNode
        
    }
    
    func followPlayer (player: SKSpriteNode) {
        print("\(player.position)")
        cam.position = player.position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
