//
//  GameScene.swift
//  Jump
//
//  Created by Jose Aponte on 10/15/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import Foundation

class GameScene: SKScene , UITableViewDelegate, UITableViewDataSource {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var crash: SKSpriteNode?
    private var touchEnded: Bool = false
    private var touchBegan: Bool = false
    let player = SKNode()
    let sizePlayer = CGSize(width: 40, height: 40)
    var tableScores = UITableView()
    
    
    override func didMove(to view: SKView)
    {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -9)
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        self.label?.name = "leaderboard"
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
//        
//        // Create shape node to use during mouse interaction
//        let w = (self.size.width + self.size.height) * 0.05
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//        
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//            
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(M_PI), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
        
//        let ground = Ground()
//        ground.position = CGPoint(x: self.size.width/2, y: ground.size.height)
//        self.addChild(ground)
//        
//        let player = Player()
//        player.position = CGPoint(x: self.size.width / 2, y: ground.position.y + player.size.height)
//        self.addChild(player)
        crash = self.childNode(withName: "crash") as? SKSpriteNode
        
        
        tableScores =  LeaderboardTableView(frame:(self.view?.frame)!, style: .grouped) //UITableView(frame: (self.view?.frame)!, style: .grouped)
//        tableScores.delegate = self
//        tableScores.dataSource = self
        
        
        view.addSubview(tableScores)
        
        
        let leaderboard = LeaderboardNode(parent: self, andFontName: "verdana", andData: nil)
        leaderboard?.zPosition  = 100;
        leaderboard?.title = "Max Coins Reached"
        self.addChild(leaderboard!)
        
        NSLog("size before calulate: w:%f - h:%f", self.frame.size.width, self.frame.size.height );
        
        
        let playerTopLeft = SKSpriteNode(color: UIColor.yellow, size: sizePlayer)
        let playerTopRight = SKSpriteNode(color: UIColor.green, size: sizePlayer)
        let playerBottomRight = SKSpriteNode(color: UIColor.red, size: sizePlayer)
        let playerBottomLeft = SKSpriteNode(color: UIColor.blue, size: sizePlayer)

        
        //player.position = CGPoint(x:self.frame.size.width / 2, y:self.frame.size.height / 2)
        addChild(player)
        
        playerTopLeft.position = CGPoint(x:-(self.size.width / 2 - playerTopLeft.size.width), y:(self.size.height / 2 - playerTopLeft.size.height))
        player.addChild(playerTopLeft)
        
        playerTopRight.position = CGPoint(x:40, y:40)
        player.addChild(playerTopRight)
        
        playerBottomRight.position = CGPoint(x:40, y:-40)
        player.addChild(playerBottomRight)
        
        playerBottomLeft.position = CGPoint(x:-40, y:-40)
        player.addChild(playerBottomLeft)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 10
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MyCell"
        var cell: UITableViewCell?
        
        if indexPath.section == 0
        {
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? HeaderScoreTableViewCell
            if cell == nil
            {
                let nib = Bundle.main.loadNibNamed("HeaderScoreTableViewCell", owner: self, options: nil)
                cell = nib?[0] as? HeaderScoreTableViewCell
            }
        }
        else
        {
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ScoreTableViewCell
            if cell == nil
            {
                let nib = Bundle.main.loadNibNamed("ScoreTableViewCell", owner: self, options: nil)
                cell = nib?[0] as? ScoreTableViewCell
            }
        }
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: self.size.width, height: 20));
        title.text = "LEADERBOARD"
        return title
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return 110
        }
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0
        {
            return 0
        }
        return 20
    }
    
    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
//        
        // Load the SKScene from 'GameScene.sks'
//        if let scene = SKScene(fileNamed: "LeaderboardScene") {
//            // Set the scale mode to scale to fit the window
//            scene.scaleMode = .aspectFill
//            
//            // Present the scene
//            view?.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1))
//        }
//        
//        view?.ignoresSiblingOrder = true
//        view?.showsFPS = true
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//        
        for t in touches {
            self.touchDown(atPoint: t.location(in: self))
        }
        
        
        
        print("touch began")
        crash?.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 900))
        touchBegan = true
        
        

        }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
        print("touch moved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        print("touch ended")
        touchBegan = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func didSimulatePhysics() {
        
        if touchBegan
        {
            self.physicsWorld.gravity = CGVector(dx: 0, dy: -5)
        }
        else
        {
            self.physicsWorld.gravity = CGVector(dx: 0, dy: -15)
        }
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
}
