//
//  AppDelegate.m
//  SmallTimer
//
//  Created by 森田 晃平 on 2013/03/21.
//
//

#import "AppDelegate.h"
#import "TimerWindowController.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    _TimerViews = [[NSMutableArray alloc] init];
}

- (IBAction)pushMakeWindowButton:(id)sender
{
    TimerWindowController *windowController = [[TimerWindowController alloc] initWithWindowNibName:@"TimerView"];
    [_TimerViews addObject:windowController];
    [windowController showWindow:nil];
}

@end
