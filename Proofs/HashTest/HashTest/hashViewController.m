//
//  hashViewController.m
//  HashTest
//
//  Created by student on 4/22/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "hashViewController.h"
#import <CommonCrypto/CommonCrypto.h>

@interface hashViewController ()

@end

@implementation hashViewController

@synthesize HashLabel, ClearTextField;



- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [ClearTextField resignFirstResponder];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*) sha1:(NSString*)input
{
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
    
}

-(NSString *) sha256:(NSString *) input
{
    NSData *dataIn = [input dataUsingEncoding:NSASCIIStringEncoding];
    NSMutableData *dataOut = [NSMutableData dataWithLength:CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(dataIn.bytes, dataIn.length,  dataOut.mutableBytes);
    
    NSString *hash =[dataOut description];
    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    
    NSLog(@"hash:%@", hash);
    return hash;
}



- (IBAction)HashButtonClick:(id)sender {
    
    NSString *clearText= [ClearTextField text ];
    NSString *hash = [self sha256:clearText];
    [HashLabel setText:hash];
    
}
@end
