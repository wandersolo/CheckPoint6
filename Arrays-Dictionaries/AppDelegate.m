//
//  AppDelegate.m
//  Arrays-Dictionaries
//
//  Created by Daman Kapoor on 6/9/16.
//  Copyright © 2016 Wandersolo. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Create a random number array containing six unique lottery numbers
    
    
    NSMutableArray *lottoArray =  [NSMutableArray array];

    
    for (NSInteger idx = 0; idx < 6; idx++) {
        int r = arc4random_uniform(59);
        [lottoArray addObject:[NSNumber numberWithInt:r]];
    }
    
    [lottoArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSNumber *num1 = (NSNumber *)obj1;
        NSNumber *num2 = (NSNumber *)obj2;
        if (num1 < num2) {
            return NSOrderedAscending;
        } else if (num2 < num1) {
            return NSOrderedDescending;
        }
        return NSOrderedSame;
    }];
    NSString *lottoNumbers = [lottoArray componentsJoinedByString:@", "];
    
    NSLog(@"Your lucky lotto numbers are %@", lottoNumbers);
    
    // Pick a random day of week to play lottery numbers
    NSArray *daysArray = @[@"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday"];
    
    int n = arc4random_uniform(6);
    
    NSLog(@"Your lucky day is %@", daysArray[n]);
    
    
    
    // Add lottery nums and day of week to play to dict
    
    NSDictionary *justMyLuck = @{@"Lotto Numbers" : lottoArray,
                                       @"Day" : daysArray[n]};
    [justMyLuck enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"Your Lucky %@: %@", key, obj);
    }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
