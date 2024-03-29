//
//  TimerWindowController.h
//  SmallTimer
//
//  Created by 森田 晃平 on 2013/03/22.
//
//

#import <Cocoa/Cocoa.h>

@interface TimerWindowController : NSWindowController <NSWindowDelegate> {
    __weak IBOutlet NSTextField *setTimeField;
    __weak IBOutlet NSTextField *timeField;
}

- (IBAction)pushStartButton:(id)sender;
- (IBAction)endTimeEditing:(id)sender;
- (IBAction)pushMusicSelectButton:(id)sender;

@end
