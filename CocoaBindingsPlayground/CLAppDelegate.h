//
//  CLAppDelegate.h
//
//  Created by Leon Szpilewski on 5/13/12.
//  Copyright (c) 2012 Clawfield. All rights reserved.
//

/*
 This little project demonstrates programmatic use of Cocoa bindings.
 
 We do the following:
 - Create bindings with the Interface Builder (button's title)
 - Create bindigns programmatically for IB controls (theSlider, theLabel)
 - Create bindings programmatically for a custom view (monsterView)
 
 As you'll see bindings just work. There's some magic going on behind the scenes:
 http://www.mikeash.com/pyblog/friday-qa-2009-01-23.html
 
 This is especially useful for custom views - as long as you name your accessors
 in a KVO compilant way bindings will work automagically.
 
 */

#import <Cocoa/Cocoa.h>
#import "CLMonsterView.h"

@interface CLAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSTextField *theLabel;
@property (strong) IBOutlet NSSlider *theSlider;

//this is actually created programmatically inside applicationDidFinishLaunching:
@property (strong) IBOutlet CLMonsterView *monsterView;


//totaly custom setter/getter to see the kvo magic class swizzling do its wonders ;)
//you could always replace those with
//@property (assign) int foo;
- (int) foo;
- (void) setFoo:(int)foo;

//just trigger a fido value change programmatically
- (IBAction) resetFoo:(id)sender;

@end
