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
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    var entityManager: EntityManager!
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var control: Control?
   
    private var haveControl: Bool = false
    
    //#MARK: DidMove_FUNC
    override func didMove(to view: SKView) {
        //super.didMove(to: view)
        control = Control(view: view)
        entityManager = EntityManager(scene: self)
        
        
        let personagemPrincipal = Player(imageName: "PersonagemPrincipal")
        if let spriteComponent = personagemPrincipal.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: 0, y: 0)
        }
        entityManager.add(personagemPrincipal)
//        entities.append(personagemPrincipal)
        
    }
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0
       // Instanciar os objetos
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Began")
      //  for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        guard touches.count == 1, let touch = touches.first else {
            return
        }
        
        control?.touchBegan(touch, in: scene!)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Moved")
      //  for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
        guard touches.count == 1, let touch = touches.first else {
            return
        }
        
        control?.touchMoved(touch, in: scene!)

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Ended")
       // for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        guard touches.count == 1, let touch = touches.first else {
            return
        }
        control?.touchEnded(touch, in: scene!)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("cancel")
      //  for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        guard touches.count == 1, let touch = touches.first else {
            return
        }
        
        control?.touchCancelled(touch, in: scene!)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        
//        for entity in self.entities {
//            if let control = self.control, let component = entity.component(ofType: MoveComponent.self){
//             //   print(entity)
//                component.updatePressedButtons(control: control.directionCommand ?? nil, dt: dt)
//            }
//            entity.update(deltaTime: dt)
        if control != nil {
            haveControl = true
        } else {
            haveControl = false
        }
        
        if haveControl == true {
            entityManager.updateControl(dt: dt, ctrol: control!)
        } else {
            entityManager.update(dt: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
    
}
