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
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func sceneDidLoad() {

        self.lastUpdateTime = 0
       // Instanciar os objetos
       
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        //Quando comeca o touch
      //  print("Beggin")
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        //Quando usa-se o touch
       // print("Moved")
    }
    
    func touchUp(atPoint pos : CGPoint) {
        //Quando acaba o touch
     //   print("Ended")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      //  print("Began")
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      //  print("Moved")
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       // print("Ended")
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
      //  print("cancel")
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        addSwiperRecognizer()
    }
    
    func addSwiperRecognizer() {
        let gesturesDirections: [UISwipeGestureRecognizer.Direction] = [.up,.down,.left,.right]
        for gesturesDirection in gesturesDirections {
            let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
            gestureRecognizer.direction = gesturesDirection
            self.view?.addGestureRecognizer(gestureRecognizer)
        }
        
    }
    
    @objc func handleSwipe(gesture: UIGestureRecognizer){
        if let gesture = gesture as? UISwipeGestureRecognizer {
            switch gesture.direction{
            case .up:
                print("up")
            case .down:
                print("down")
            case .left:
                print("left")
            case .right:
                print("right")
            default:
                print("don't have swipe")
            }
        }
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
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
}
