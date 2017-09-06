//
//  clearBtn.m
//  NSEventTest
//
//  Created by Alonso on 2017/5/8.
//  Copyright © 2017年 Alonso. All rights reserved.
//

#import "clearBtn.h"

@implementation clearBtn

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
}

- (void)mouseDown:(NSEvent *)theEvent {
    if ([theEvent modifierFlags] & NSEventModifierFlagCommand) {
        [self setFrameRotation:[self frameRotation]+90.0];
        [self setNeedsDisplay:YES];
    }
    else{
        [super mouseDown:theEvent];
    }
}

- (BOOL)sendAction:(SEL)theAction to:(id)theTarget {
    NSLog(@"sendAction");
    return [super sendAction:theAction to:theTarget];
}


@end
