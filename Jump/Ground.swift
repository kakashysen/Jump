//
//  Ground.swift
//  Jump
//
//  Created by Jose Aponte on 10/15/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

import UIKit
import SpriteKit

class Ground: SKSpriteNode
{

   required init()
   {
        let texture = SKTexture(image: #imageLiteral(resourceName: "ground"))
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
}
