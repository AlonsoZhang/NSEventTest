//
//  ViewController.m
//  NSEventTest
//
//  Created by Alonso on 2017/3/31.
//  Copyright © 2017年 Alonso. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    self.loggingEnabled = false;
    self.logDateFormatter = [[NSDateFormatter alloc] init];
    [self.logDateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    self.stopButton.hidden = true;
}

-(void)logMessageToLogView:(NSString*)message {
    [self.logView setString: [[self.logView string] stringByAppendingFormat:@"%@: %@\n", [self.logDateFormatter stringFromDate:[NSDate date]],  message]];
    [self.logView scrollRangeToVisible:NSMakeRange([self.logView.string length], 0)];
}

- (IBAction)stopButtonPressed:(id)sender{
    if (!self.loggingEnabled) {
        return;
    }
    self.loggingEnabled = false;
    self.startButton.hidden = false;
    self.stopButton.hidden = true;
    [NSEvent removeMonitor:GlobalMonitorLeftMouseDown];
    [NSEvent removeMonitor:GlobalMonitorRightMouseDown];
    [NSEvent removeMonitor:GlobalMonitorKeyDown];
    [NSEvent removeMonitor:GlobalMonitorMouseMove];
    [NSEvent removeMonitor:LocalMonitorLeftMouseDown];
    [NSEvent removeMonitor:LocalMonitorRightMouseDown];
    [NSEvent removeMonitor:LocalMonitorKeyDown];
    [NSEvent removeMonitor:LocalMonitorMouseMove];
}

- (IBAction)startButtonPressed:(id)sender{
    if (self.loggingEnabled) {
        return;
    }
    self.loggingEnabled = true;
    self.startButton.hidden = true;
    self.stopButton.hidden = false;
    
    
    
    GlobalMonitorLeftMouseDown = [NSEvent addGlobalMonitorForEventsMatchingMask:NSEventMaskLeftMouseDown handler:^(NSEvent *evt) {
        [self logMessageToLogView:@"Global left mouse down!"];
        self.globalLeftMouseCounterLabel.stringValue = [NSString stringWithFormat:@"%d",[self.globalLeftMouseCounterLabel.stringValue intValue]+1];
    }];
    
    GlobalMonitorRightMouseDown = [NSEvent addGlobalMonitorForEventsMatchingMask:NSEventMaskRightMouseDown handler:^(NSEvent *evt) {
        [self logMessageToLogView:@"Global right mouse down!"];
        self.globalRightMouseCounterLabel.stringValue = [NSString stringWithFormat:@"%d",[self.globalRightMouseCounterLabel.stringValue intValue]+1];
    }];
    
    GlobalMonitorKeyDown = [NSEvent addGlobalMonitorForEventsMatchingMask:NSEventMaskKeyDown handler:^(NSEvent * evt) {
        [self logMessageToLogView:[NSString stringWithFormat:@"Global key down: %@ (key code %d)", [evt characters], [evt keyCode]]];
        self.globalKeyPressCounterLabel.stringValue = [NSString stringWithFormat:@"%d",[self.globalKeyPressCounterLabel.stringValue intValue]+1];
    }];
    
    GlobalMonitorMouseMove = [NSEvent addGlobalMonitorForEventsMatchingMask:NSEventMaskMouseMoved handler:^(NSEvent * evt) {
        self.globalMouseMoveLabel.stringValue = [NSString stringWithFormat:@"%d",[self.globalMouseMoveLabel.stringValue intValue]+1];
    }];
    
    LocalMonitorLeftMouseDown = [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskLeftMouseDown handler:^NSEvent * (NSEvent * evt) {
        NSPoint eventLocation = [evt locationInWindow];
        NSPoint center = [self.logView convertPoint:eventLocation fromView:nil];
        [self logMessageToLogView:[NSString stringWithFormat:@"Local left mouse down at x:%.1f,y:%.1f",center.x,center.y]];
        self.LocalLeftMouseCounterLabel.stringValue = [NSString stringWithFormat:@"%d",[self.LocalLeftMouseCounterLabel.stringValue intValue]+1];
        return evt;
    }];
    
    LocalMonitorRightMouseDown = [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskRightMouseDown handler:^NSEvent * (NSEvent * evt) {
        [self logMessageToLogView:@"Local right mouse down!"];
        self.LocalRightMouseCounterLabel.stringValue = [NSString stringWithFormat:@"%d",[self.LocalRightMouseCounterLabel.stringValue intValue]+1];
        return evt;
    }];
    
    LocalMonitorKeyDown = [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskKeyDown handler:^NSEvent * (NSEvent * evt) {
        [self logMessageToLogView:[NSString stringWithFormat:@"Local key down: %@ (key code %d)", [evt characters], [evt keyCode]]];
        self.LocalKeyPressCounterLabel.stringValue = [NSString stringWithFormat:@"%d",[self.LocalKeyPressCounterLabel.stringValue intValue]+1];
        return evt;
    }];
    
    LocalMonitorMouseMove = [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskMouseMoved handler:^NSEvent * (NSEvent * evt) {
        self.LocalMouseMoveLabel.stringValue = [NSString stringWithFormat:@"%d",[self.LocalMouseMoveLabel.stringValue intValue]+1];
        return evt;
    }];
}

- (IBAction)clearButtonPressed:(id)sender{
    self.globalKeyPressCounterLabel.stringValue = @"0";
    self.globalLeftMouseCounterLabel.stringValue = @"0";
    self.globalRightMouseCounterLabel.stringValue = @"0";
    self.LocalKeyPressCounterLabel.stringValue = @"0";
    self.LocalLeftMouseCounterLabel.stringValue = @"0";
    self.LocalRightMouseCounterLabel.stringValue = @"0";
    [self.logView setString:@""];
}

- (void)scrollWheel:(NSEvent *)event{
    NSLog(@"scroll");
}

- (void)rightMouseDown:(NSEvent *)event{
    [self logMessageToLogView:@"lalala Local right mouse down!"];
    self.LocalRightMouseCounterLabel.stringValue = [NSString stringWithFormat:@"%d",[self.LocalRightMouseCounterLabel.stringValue intValue]+1];
}


- (void)mouseDown:(NSEvent *)theEvent {
    if ([theEvent clickCount] > 1) {
        [self logMessageToLogView:@"Double click!"];
    }
    else{
        [super mouseDown:theEvent];
    }
}

@end
