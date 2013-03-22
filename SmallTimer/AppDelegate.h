//
//  AppDelegate.h
//  SmallTimer
//
//  Created by 森田 晃平 on 2013/03/21.
//
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSMutableArray *_TimerViews;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)pushMakeWindowButton:(id)sender;

@end
