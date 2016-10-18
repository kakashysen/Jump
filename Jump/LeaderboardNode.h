//
//  LeaderboardNode.h
//  Jump
//
//  Created by Jose Aponte on 10/16/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface LeaderboardNode : SKNode

@property(strong, nonatomic) NSString *title;

-(instancetype)initWithParent:(SKNode*) parent andFontName:(NSString*)fontName andData:(NSArray*) data;

@end
