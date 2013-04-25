//
//  NinjaTurtleItem.h
//  SectionsAndImages
//
//  Created by Joseph Baldwin on 4/25/13.
//  Copyright (c) 2013 Humboldt Technology Group, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NinjaTurtleItem : NSObject
{
    NSString *_Name;
    UIColor *_Color;
    NSString *_Skill;
}

-(void) SetName:(NSString *) name;
-(NSString *) Name;
-(void) SetColor:(UIColor *) color;
-(UIColor *) Color;
-(void) SetSkill:(NSString *) skill;
-(NSString *) Skill;


@end
