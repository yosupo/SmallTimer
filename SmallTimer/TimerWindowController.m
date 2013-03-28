//
//  TimerWindowController.m
//  SmallTimer
//
//  Created by 森田 晃平 on 2013/03/22.
//
//

#import "TimerWindowController.h"
#import <AVFoundation/AVFoundation.h>

@interface TimerWindowController () {
    NSDate *_startDate;
    NSUInteger _time;
    NSTimer *_timerTimer;
    NSURL *_musicUrl;
    AVAudioPlayer *_audio;
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
        myNotification.informativeText = [NSString stringWithFormat:@"%ld分たったよ!", _time / 60 + 1];
        [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:myNotification];
        _audio = [[AVAudioPlayer alloc] initWithContentsOfURL:_musicUrl error:nil];
        _audio.numberOfLoops = 1;
        [_audio play];
        [aTimer invalidate];
    }
}

- (IBAction)endTimeEditing:(id)sender
{
    [self pushStartButton:nil];
}

- (IBAction)pushStartButton:(id)sender
{
    if (setTimeField.intValue) {
        _startDate = [NSDate date];
        _time = setTimeField.intValue * 1 + 1;
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

- (IBAction)pushMusicSelectButton:(id)sender
{
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            _musicUrl = openPanel.URL;
            NSLog(@"%@", _musicUrl);
        }
    }];
}

@end
