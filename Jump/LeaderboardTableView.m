//
//  LeaderboardTableView.m
//  Jump
//
//  Created by Jose Aponte on 10/17/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

#import "LeaderboardTableView.h"
#import "HeaderScoreTableViewCell.h"
#import "ScoreTableViewCell.h"


@implementation LeaderboardTableView


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        self.delegate = self;
        self.dataSource = self;
    }
    
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    
    
    if (indexPath.section == 0)
    {
        static NSString *headerCellIdentifier = @"headerCell";
        cell =(HeaderScoreTableViewCell*)[tableView dequeueReusableCellWithIdentifier:headerCellIdentifier];
        if (cell == nil)
        {
            cell = (HeaderScoreTableViewCell*) [[[NSBundle mainBundle] loadNibNamed:@"HeaderScoreTableViewCell" owner:self options:nil] objectAtIndex:0];
        }
    }
    else
    {
        static NSString *identifier = @"myCell";
        cell = (ScoreTableViewCell*) [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil)
        {
            cell = (ScoreTableViewCell*) [[[NSBundle mainBundle] loadNibNamed:@"ScoreTableViewCell" owner:self options:nil] objectAtIndex:0];
        }
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 10;
            break;
        default:
            return 0;
            break;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 110;
    }
    
    return 60;
}

//
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    cell.contentView.backgroundColor = [UIColor clearColor];
//    UIView *viewcontent = [[UIView alloc] initWithFrame:CGRectMake(0, 10, cell.frame.size.width, cell.frame.size.height)];
//    viewcontent.layer.backgroundColor = [UIColor redColor].CGColor;
//    viewcontent.layer.cornerRadius = 9.f;
//    viewcontent.layer.masksToBounds = NO;
//    viewcontent.layer.shadowOffset = CGSizeMake(-1, 1);
//    viewcontent.layer.shadowOpacity = 0.2;
//    
//    [cell.contentView addSubview:viewcontent];
//    [cell.contentView sendSubviewToBack:viewcontent];
//    
//    
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
