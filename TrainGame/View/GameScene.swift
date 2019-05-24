//
//  GameScene.swift
//  TrainGame
//
//  Created by Eliza Maria Porto de Carvalho on 21/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //#MARK: Variables
//    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    var entityManager: EntityManager!
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var control: Control?
    
    var player: SKSpriteNode?
    
    //#MARK: DidMove_FUNC
    override func didMove(to view: SKView) {
        
//        // Setup player
//        player = self.childNode(withName: "player") as? SKSpriteNode
//        self.listener = player
        
        //super.didMove(to: view)
        control = Control(view: view)
        entityManager = EntityManager(scene: self)


        let personagemPrincipal = Player(imageName: "PersonagemPrincipal", gameScene: self)
        if let spriteComponent = personagemPrincipal.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: 0, y: 0)
        }
        entityManager.add(personagemPrincipal)

    }
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0
       // Instanciar os objetos
       
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
//        // Update entities
//        for entity in self.entities {
//            if let control = self.control, let component = entity.component(ofType: MoveComponent.self){
//             //   print(entity)
//                component.updatePressedButtons(control: control.directionCommand ?? nil, dt: dt)
//            }
//            entity.update(deltaTime: dt)
//        }
//
        self.lastUpdateTime = currentTime
    }
    
}
