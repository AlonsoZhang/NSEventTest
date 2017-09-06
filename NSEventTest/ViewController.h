//
//  ViewController.h
//  NSEventTest
//
//  Created by Alonso on 2017/3/31.
//  Copyright © 2017年 Alonso. All rights reserved.
//

#import <Cocoa/Cocoa.h>

static id GlobalMonitorLeftMouseDown;
static id GlobalMonitorRightMouseDown;
static id GlobalMonitorKeyDown;
static id GlobalMonitorMouseMove;
static id LocalMonitorLeftMouseDown;
static id LocalMonitorRightMouseDown;
static id LocalMonitorKeyDown;
static id LocalMonitorMouseMove;

@interface ViewController : NSViewController

@property (strong) IBOutlet NSTextView *logView;

@property (weak) IBOutlet NSButton *startButton;
@property (weak) IBOutlet NSButton *stopButton;
@property (weak) IBOutlet NSButton *clearButton;

@property (weak) IBOutlet NSTextField *globalKeyPressCounterLabel;
@property (weak) IBOutlet NSTextField *globalLeftMouseCounterLabel;
@property (weak) IBOutlet NSTextField *globalRightMouseCounterLabel;
@property (weak) IBOutlet NSTextField *globalMouseMoveLabel;
@property (weak) IBOutlet NSTextField *LocalKeyPressCounterLabel;
@property (weak) IBOutlet NSTextField *LocalLeftMouseCounterLabel;
@property (weak) IBOutlet NSTextField *LocalRightMouseCounterLabel;
@property (weak) IBOutlet NSTextField *LocalMouseMoveLabel;

@property (readwrite) NSDateFormatter *logDateFormatter;



@property (readwrite) BOOL loggingEnabled;

- (IBAction)stopButtonPressed:(id)sender;
- (IBAction)startButtonPressed:(id)sender;
- (IBAction)clearButtonPressed:(id)sender;

- (void)logMessageToLogView:(NSString*)message;

@end

