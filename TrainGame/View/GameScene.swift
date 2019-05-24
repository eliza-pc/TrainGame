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
  //  private var control: Control?
    
//    let jSizePlusSpriteNode = SKSpriteNode(imageNamed: "plus")
//    let jSizeMinusSpriteNode = SKSpriteNode(imageNamed: "minus")
    let setJoystickStickImageBtn = SKLabelNode()
    let setJoystickSubstrateImageBtn = SKLabelNode()
    let joystickStickColorBtn = SKLabelNode(text: "Sticks random color")
    let joystickSubstrateColorBtn = SKLabelNode(text: "Substrates random color")
    
    let moveJoystick = 🕹(withDiameter: 100)
    let rotateJoystick = TLAnalogJoystick(withDiameter: 100)
    
    var joystickStickImageEnabled = true
    
    var joystickSubstrateImageEnabled = true
    
    
    var player: SKSpriteNode?
    
    //#MARK: DidMove_FUNC
    override func didMove(to view: SKView) {
        
        
        let moveJoystickHiddenArea = TLAnalogJoystickHiddenArea(rect: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        moveJoystickHiddenArea.joystick = moveJoystick
        moveJoystick.isMoveable = true
        addChild(moveJoystickHiddenArea)
        
        entityManager = EntityManager(scene: self)
        
        
        let personagemPrincipal = Player(imageName: "PersonagemPrincipal", gameScene: self)
        //
        //        if let spriteComponent = personagemPrincipal.component(ofType: SpriteComponent.self) {
        //            spriteComponent.node.position = CGPoint(x: 0, y: 0)
        //        }
        //        entityManager.add(personagemPrincipal)
        
        if let spriteComponent = personagemPrincipal.component(ofType: SpriteComponent.self) {
            //spriteComponent.node.size = CGSize(width: 100, height: 100)
           // spriteComponent.node.position = CGPoint(x:284, y: 512)
            //MARK: Handlers begin
            moveJoystick.on(.begin) { [unowned self] _ in
                //print("pegou1")
                let actions = [
                    SKAction.scale(to: 1, duration: 0.5),
                    SKAction.scale(to: 1, duration: 0.5)
                ]
                
                spriteComponent.node.run(SKAction.sequence(actions))
            }
            
            moveJoystick.on(.move) { [unowned self] joystick in
                // print("pegou2")
                guard let spriteComponent = personagemPrincipal.component(ofType: SpriteComponent.self) else {
                    return
                }
                
                let pVelocity = joystick.velocity;
                let speed = CGFloat(0.12)
                
                spriteComponent.node.position = CGPoint(x: spriteComponent.node.position.x + (pVelocity.x * speed), y: spriteComponent.node.position.y)
            }
            
            moveJoystick.on(.end) { [unowned self] _ in
                // print("pegou3")
                let actions = [
                    SKAction.scale(to: 1, duration: 0.5),
                    SKAction.scale(to: 1, duration: 0.5)
                ]
                
                spriteComponent.node.run(SKAction.sequence(actions))
            }
        }
        
        entityManager.add(personagemPrincipal)
        view.isMultipleTouchEnabled = true
        
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
