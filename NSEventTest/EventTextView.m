//
//  EventTextView.m
//  NSEventTest
//
//  Created by Alonso on 2017/4/6.
//  Copyright © 2017年 Alonso. All rights reserved.
//

#import "EventTextView.h"

@implementation EventTextView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
//    CGRect eyeBox = CGRectMake(0, 0, 40, 40);
//    NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:eyeBox
//                                                                options: (NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved |
//                                                                          NSTrackingActiveInKeyWindow )
//                                                                  owner:self userInfo:nil];
//    [self addTrackingArea:trackingArea];
    // Drawing code here.
}

- (BOOL)performKeyEquivalent:(NSEvent *)theEvent {
    NSString  *characters = [theEvent charactersIgnoringModifiers];
    if ([characters isEqual:@"l"]) {
        NSLog(@"Command+l");
        return YES;
    }
    return NO;
}

- (void)mouseEntered:(NSEvent *)theEvent {
    NSLog(@"mouseEntered");
}
//- (void)mouseMoved:(NSEvent *)theEvent {
//    NSLog(@"mouseMoved");
//}
- (void)mouseExited:(NSEvent *)theEvent {
    NSLog(@"mouseExited");
}
- (void)cursorUpdate:(NSEvent *)theEvent {
    [[NSCursor crosshairCursor] set];
}

//- (void)keyDown:(NSEvent *)event{
//    
//    unsigned int flags;
//    flags = [event modifierFlags];
//    if (flags & NSEventModifierFlagControl) {
//        NSLog(@"%@", [NSString stringWithFormat:@"Control + %@", [event characters]]);
//    }
//    if (flags & NSEventModifierFlagShift) {
//        NSLog(@"%@", [NSString stringWithFormat:@"Shift + %@", [event characters]]);
//    }
//}

- (BOOL)acceptsFirstResponder {
    return YES;
}
- (void)keyDown:(NSEvent *)theEvent {
    [self interpretKeyEvents:[NSArray arrayWithObject:theEvent]];
}
- (void)insertText:(id)insertString {
    NSLog(@"insertString %@",insertString);
    self.string = [NSString stringWithFormat:@"%@%@",self.string,insertString];
}
- (void)doCommandBySelector:(SEL)aSelector {
    NSLog(@"doCommandBySelector %@",NSStringFromSelector(aSelector));
    [super doCommandBySelector:aSelector];
    [self textView:self doCommandBySelector:(aSelector)];
}

- (BOOL)textView:(NSTextView *)aTextView doCommandBySelector:(SEL)aSelector{
    //NSLog(@"%@",NSStringFromSelector(aSelector));
    //回车键
    if (aSelector == @selector(insertNewline:)) {
        //Do something against ENTER key
        NSLog(@"Return was pressed!");
        //这里是按下回车后的具体处理
        return YES;
    } else if (aSelector == @selector(deleteForward:)) {
        //Do something against DELETE key
        
    } else if (aSelector == @selector(deleteBackward:)) {
        //Do something against BACKSPACE key
        
    } else if (aSelector == @selector(insertTab:)) {
        //Do something against TAB key
    }
    return NO;
}


@end
