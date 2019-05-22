//
//  Control.swift
//  TrainGame
//
//  Created by Robson James Junior on 22/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import SpriteKit
import GameplayKit


enum UserControl {
    case up
    case down
    case left
    case right
    case jump
    case act
}


class Control {
    
    private var touchInitialLocation: CGPoint?
    var directionCommand: UserControl?
    
    init(view: UIView){
        
        addSwiperRecognizer(view: view)
    }
    
    //Mark: Gestures of the User
    
    func addSwiperRecognizer(view: UIView) {
        let gesturesDirections: [UISwipeGestureRecognizer.Direction] = [.up,.down,.left,.right]
        for gesturesDirection in gesturesDirections {
            let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
            gestureRecognizer.direction = gesturesDirection
            view.addGestureRecognizer(gestureRecognizer)
        }
        
    }
    
    @objc func handleSwipe(gesture: UIGestureRecognizer){
        if let gesture = gesture as? UISwipeGestureRecognizer {
            switch gesture.direction{
            case .up:
                directionCommand = UserControl.up
                print("up")
            case .down:
                directionCommand = UserControl.down
                print("down")
            case .left:
                directionCommand = UserControl.left
                print("left")
            case .right:
                directionCommand = UserControl.right
                print("right")
            default:
                print("don't have swipe")
            }
        }
    }
    
    
    
    // Controlls in game
    
    func touchBegan(_ touch: UITouch, in scene: SKScene) {
//        var location = touch.location(in: scene)
//        if let cameraPosition = scene.camera?.position {
//            location.x -= cameraPosition.x
//            location.y -= cameraPosition.y
//        }
//        touchInitialLocation = location
//        region = TouchRegion(initialLocation: touchInitialLocation!, location: location, allowsDiagonals: allowsDiagonals)
    }
    
    func touchMoved(_ touch: UITouch, in scene: SKScene) {
//        var location = touch.location(in: scene)
//        if let cameraPosition = scene.camera?.position {
//            location.x -= cameraPosition.x
//            location.y -= cameraPosition.y
//        }
//        if let touchInitialLocation = touchInitialLocation {
//            region = TouchRegion(initialLocation: touchInitialLocation, location: location, allowsDiagonals: allowsDiagonals)
//        }
    }
    
    func touchEnded(_ touch: UITouch, in scene: SKScene) {
//        touchInitialLocation = nil
//        region = nil
    }
    
    func touchCancelled(_ touch: UITouch, in scene: SKScene) {
//        touchInitialLocation = nil
//        region = nil
    }

    
}
