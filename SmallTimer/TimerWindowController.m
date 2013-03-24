//
//  TimerWindowController.m
//  SmallTimer
//
//  Created by 森田 晃平 on 2013/03/22.
//
//

#import "TimerWindowController.h"

@interface TimerWindowController () {
    NSDate *_startDate;
    NSUInteger _time;
    NSTimer *_timerTimer;
}

@end

@implementation TimerWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    self.window.delegate = self;
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (void)timerRef:(NSTimer *)aTimer
{
    NSTimeInterval nowTime = [_startDate timeIntervalSinceNow];
    NSInteger laberTime = _time + nowTime;
    NSString *laber = [NSString stringWithFormat:@"%02ld:%02ld",laberTime / 60, laberTime % 60];
    timeField.stringValue = laber;
    if (laberTime <= 0) {
        NSUserNotification *myNotification = [[NSUserNotification alloc] init];
        myNotification.title = @"たいまーだよ！";
        myNotification.informativeText = [NSString stringWithFormat:@"%ld分たったよ!", _time / 60];
        [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:myNotification];
        [aTimer invalidate];
    }
}

- (IBAction)pushStartButton:(id)sender
{
    if (setTimeField.intValue) {
        _startDate = [NSDate date];
        _time = setTimeField.intValue * 60;
        _timerTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerRef:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timerTimer forMode:NSEventTrackingRunLoopMode];
        [self timerRef:_timerTimer];
    }
}
- (BOOL)windowShouldClose:(id)sender
{
    [_timerTimer invalidate];
    return YES;
}
@end
