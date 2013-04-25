//
//  NinjaTurtleItem.m
//  SectionsAndImages
//
//  Created by Joseph Baldwin on 4/25/13.
//  Copyright (c) 2013 Humboldt Technology Group, LLC. All rights reserved.
//

#import "NinjaTurtleItem.h"

@implementation NinjaTurtleItem

-(void) SetName:(NSString *) name
{
    _Name = name;
}

-(NSString *) Name
{
    return _Name;
}

-(void) SetColor:(UIColor *) color
{
    _Color = color;
}

-(UIColor *) Color
{
    return _Color;
}

-(void) SetSkill:(NSString *) skill
{
    _Skill = skill;
}

-(NSString *) Skill
{
    return _Skill;
}

@end
