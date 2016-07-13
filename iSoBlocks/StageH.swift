//
//  StageH.swift
//  iSoBlocks
//
//  Created by Tassos Lambrou on 7/9/16.
//  Copyright © 2016 Ssos Games. All rights reserved.
//

import Foundation
import SpriteKit


class StageH: SKSpriteNode {
    
    
    /* Grid array dimensions */
    let spaces = columns
    var stageArray: [Block] = []
    
    var cellWidth = 0
    var cellHeight = 0
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        /* Enable own touch implefmentation for this node */
        userInteractionEnabled = true
        
        /* Calculate individual cell dimensions */
        cellWidth = Int(self.size.width) / spaces
        
        cellHeight = Int(self.size.height)
        
        /* Populate grid with blocks */
        for stageX in 0..<spaces {
            let block = Block()
            //Convert the row/column position into a stage screen position
            let stagePosition = CGPoint(x: stageX*cellWidth + (cellWidth/2), y: 0 + (cellHeight/2))
            block.position = stagePosition
            
            block.size.width = CGFloat(cellWidth)*0.87
            block.size.height = CGFloat(cellHeight)*0.87
            print(cellHeight)
            
            
            //Add block as a child of the grid node
            addChild(block)
            
            //Add block to the stageArray at the x,y position
            stageArray.append(block)
            
        }

        
        
    }
    
    func addBlockToEmptyStage() {
        var blockCreated: Bool = false
        var rand = Int.random(spaces)
        var block = stageArray[rand]
        var index = 0
        
        while blockCreated == false {
            if block.state == .inactive {
                let typeRand = Int.random(3)+1
                switch typeRand {
                //case 0?
                case 1:
                    block.state = .rock
                case 2:
                    block.state = .paper
                case 3:
                    block.state = .scissors
                default:
                    print("switch statement in addBlockToEmptyStage didn't work")
                }
                
                blockCreated = true
            } else if block.state != .inactive && index < spaces{
                rand = Int.random(spaces)
                block = stageArray[rand]
                index += 1
            } else {
                break
            }
            
        }
    }
    
    
    
}

    