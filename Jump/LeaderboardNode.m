//
//  LeaderboardNode.m
//  Jump
//
//  Created by Jose Aponte on 10/16/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

#import "LeaderboardNode.h"
#define POSITION_NODE @"positionNode"
#define PLAYER_NAME_NODE @"playerNameNode"
#define SPACE_BEWTEEN_LABELS 30

@interface LeaderboardNode ()
{
    SKNode *_parent;
}
@property(strong, nonatomic) SKLabelNode *titleLabel;


@end

@implementation LeaderboardNode



-(instancetype)initWithParent:(SKNode*) parent andFontName:(NSString*)fontName andData:(NSArray*) data
{
    if (self = [super init])
    {
        
        _parent = parent;
        _titleLabel = [SKLabelNode labelNodeWithFontNamed:fontName];
        //_titleLabel.text = @"Max Coins Reached";
        _titleLabel.position = CGPointMake(0,_parent.frame.size.height / 2 - _titleLabel.frame.size.height);
        
        NSLog(@"_titleLabel.position : x:%f - y:%f", _titleLabel.position.x, _titleLabel.position.y );
        [self addChild:_titleLabel];
        
        CGFloat yPosition = - (_parent.frame.size.height / 2 );
        for (int i = 1; i <= 10; i++)
        {
            SKLabelNode *labelPosition = [SKLabelNode labelNodeWithFontNamed:fontName];
            labelPosition.text = [NSString stringWithFormat:@"%d",i];
            labelPosition.position = CGPointMake( - (_parent.frame.size.width / 2) + labelPosition.frame.size.width, yPosition);
            labelPosition.name = POSITION_NODE;
            [self addChild:labelPosition];
            
            SKLabelNode *labelPlayerName = [SKLabelNode labelNodeWithFontNamed:fontName];
            labelPlayerName.text = [NSString stringWithFormat:@"Jose Aponte"];
            labelPlayerName.position = CGPointMake(self.parent.frame.size.height / 2, yPosition);
            labelPlayerName.name = PLAYER_NAME_NODE;
            
            [self addChild:labelPlayerName];
            
            
            yPosition += labelPlayerName.frame.size.height;
        }
        
        
    }
    return self;
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text =  _title;
    //[self recalculatePositions];
}

-(void)recalculatePositions
{
    _titleLabel.position = CGPointMake(_titleLabel.position.x,- (_parent.frame.size.height / 2) - _titleLabel.frame.size.height);
    __block CGFloat yPosition = -(_titleLabel.position.y  + SPACE_BEWTEEN_LABELS);
    [self enumerateChildNodesWithName:POSITION_NODE usingBlock:^(SKNode * _Nonnull node, BOOL * _Nonnull stop) {
        node.position = CGPointMake(node.position.x, yPosition);
        yPosition -= node.frame.size.height + SPACE_BEWTEEN_LABELS;
    }];
    
    
    __block CGFloat yPosition2 = _titleLabel.position.y - _titleLabel.frame.size.height + SPACE_BEWTEEN_LABELS;
    [self enumerateChildNodesWithName:PLAYER_NAME_NODE usingBlock:^(SKNode * _Nonnull node, BOOL * _Nonnull stop) {
        node.position = CGPointMake(node.position.x, yPosition2);
        yPosition2 -= node.frame.size.height + SPACE_BEWTEEN_LABELS;
    }];
}

@end
