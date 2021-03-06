//
//  StageV.swift
//  iSoBlocks
//
//  Created by Tassos Lambrou on 7/9/16.
//  Copyright © 2016 SsosSoft. All rights reserved.
//

import Foundation
import SpriteKit


class StageV: SKSpriteNode {
    
    
    /* Grid array dimensions */
    let spaces = rows
    var stageArray: [Block] = []
    
    var cellWidth = 0
    var cellHeight = 0
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        /* Enable own touch implefmentation for this node */
        isUserInteractionEnabled = true
        
        /* Calculate individual cell dimensions */
        cellWidth = Int(self.size.width)
        
        cellHeight = Int(self.size.height) / spaces
        
        /* Populate grid with blocks */
        for stageX in 0..<spaces {
            let block = Block()
            //Convert the row/column position into a stage screen position
            block.position.y = CGFloat(stageX*cellHeight + (cellHeight/2))
            block.position.x = CGFloat(0 + CGFloat((cellWidth/2)))

            
            block.size.width = CGFloat(cellWidth)*0.87
            block.size.height = CGFloat(cellHeight)*0.87
            
            
            //Add block as a child of the grid node
            addChild(block)
            
            //Add block to the stageArray at the x,y position
            stageArray.append(block)
            
//            randomActiveBlock(stageX)
            
//            let x = block.position.x
//            let y = block.position.y
//            let labelX = SKLabelNode(text: "\(x)")
//            labelX.fontName = "Helvetica"
//            labelX.fontSize = 40
//            labelX.zPosition = 100
//            block.addChild(labelX)
//            let labelY = SKLabelNode(text: "\(y)")
//            labelY.fontName = "Helvetica"
//            labelY.fontSize = 40
//            labelY.position.offset(dx: 0, dy: CGFloat(-45))
//            labelY.zPosition = 100
//            block.addChild(labelY)
            
        }

        
        
    }
    
    func addBlockToEmptyStage() -> Bool {
        var blockCreated: Bool = false
        var numActive: Int = 0
        var rand = Int.random(spaces)
        var block = stageArray[rand]
        var index = 0
        let factorialValue = factorialWeights()
        
        //Loop through the array
        for j in 0..<spaces {
            if stageArray[j].state != .inactive {
                numActive += 1
            }
        }
        
        if numActive == spaces {
            return false
            
        } else {
            
            while blockCreated == false {
                if block.state == .inactive {
                    let typeRand = Int.random(numBlocks)+1
                    switch typeRand {
                    //case 0?
                    case 1:
                        block.state = .red
                        block.stack = factorialValue
                    case 2:
                        block.state = .blue
                        block.stack = factorialValue
                    case 3:
                        block.state = .green
                        block.stack = factorialValue
                    case 4:
                        block.state = .yellow
                        block.stack = factorialValue
                    default:
                        print("switch statement in addBlockToEmptyStage didn't work")
                    }
                    
                    blockCreated = true
                    
                    if block.stack >= 4 {
                    animateWiggle(block)
                    }
                    
                } else if block.state != .inactive && index < spaces{
                    rand = Int.random(spaces)
                    block = stageArray[rand]
                    index += 1
                } else {
                    
                    break
                }
                
            }
            
            return true
        }
        
    }


    
    func randomActiveBlock(_ y: Int) {
        var blockCreated: Bool = false
        let block = stageArray[y]
        let factorialValue = factorialWeights()
        
        while blockCreated == false {
            if block.state == .inactive {
                let typeRand = Int.random(numBlocks)+1
                switch typeRand {
                //case 0?
                case 1:
                    block.state = .red
                    block.stack = factorialValue
                case 2:
                    block.state = .blue
                    block.stack = factorialValue
                case 3:
                    block.state = .green
                    block.stack = factorialValue
                default:
                    print("switch statement in addBlockToEmptyGrid didn't work")
                }
                
                blockCreated = true
                
                
            }
        }
    }

    
    func stageRegen() {
        
        for gridSpace in 0..<spaces {
            
            if stageArray[gridSpace].state == .inactive {
                
                randomActiveBlock(gridSpace)
                
            }
        }
        
    }
    
}

    
