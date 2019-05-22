//
//  moveComponent.swift
//  TrainGame
//
//  Created by Robson James Junior on 22/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import Foundation
import GameplayKit

class MoveComponent: GKComponent {
    
    // Aceleração do personagem
    private static let acceleration: CGFloat = 300
    // Aceleração angular do personagem, rad/s^2
    private static let AccelerationJump: CGFloat = 2
    
    
    func updatePressedButtons(control: UserControl?, dt: Double) {
//        if let node = entity?.component(ofType: GKSKNodeComponent.self)?.node, let physicsBody = node.physicsBody {
//            let dv = MoveComponent.acceleration * CGFloat(dt)
//            let dx = dv * cos(node.zRotation)
//            let dy = dv * sin(node.zRotation)
        
            if (control == UserControl.up) {
                print("upent")
            }
            if (control == UserControl.down) {
                print("downent")
            }
            if (control == UserControl.left) {
               print("leftent")
            }
            if (control == UserControl.right) {
                print("rigthent")
            }
            
//            if physicsBody.angularVelocity > MoveComponent.maxAngularVelocity {
//                physicsBody.angularVelocity = MoveComponent.maxAngularVelocity
//            } else if physicsBody.angularVelocity < -MoveComponent.maxAngularVelocity {
//                physicsBody.angularVelocity = -MoveComponent.maxAngularVelocity
//            }
//        }
    }
    
}
