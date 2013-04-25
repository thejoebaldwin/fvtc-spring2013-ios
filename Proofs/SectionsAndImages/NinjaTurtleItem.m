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

-(NSString *) NiceColor
{
    NSString *niceColor = @"none";
    if (_Color == [UIColor redColor])
    {
        niceColor = @"Red";
    }
    else if (_Color == [UIColor purpleColor])
    {
        niceColor =  @"Purple";
    }
    else if (_Color == [UIColor orangeColor])
    {
        niceColor =  @"Orange";
    }
    else if (_Color == [UIColor blueColor])
    {
        niceColor =  @"Blue";
    }
    return niceColor;
}

-(NSString *) description
{
    NSString *description = [NSString stringWithFormat:@"%@ uses %@ and wears a %@ bandanna", _Name, _Skill, [self NiceColor]];
    return description;
}

@end
