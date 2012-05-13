//
//  CLAppDelegate.m
//
//  Created by Leon Szpilewski on 5/13/12.
//  Copyright (c) 2012 Clawfield. All rights reserved.
//
#import "CLAppDelegate.h"

@implementation CLAppDelegate {
	int m_foo;
}
//@synthesize foo = m_foo;
@synthesize window = m_window;
@synthesize theLabel = m_label;
@synthesize theSlider = m_slider;
@synthesize monsterView = m_monsterView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
	[self.theLabel bind: @"value"
			   toObject: self
			withKeyPath: @"foo"
				options: nil];
	
	[self.theSlider bind: @"value"
				toObject: self
			 withKeyPath: @"foo"
				 options: nil];
	
	//now let's create our custom view and bind it
	NSRect windowFrame = [(NSView*)[[self window] contentView] frame];
	self.monsterView = [[CLMonsterView alloc] initWithFrame: NSMakeRect(0, 0, windowFrame.size.width, 50)];
	[self.window.contentView addSubview: self.monsterView];
	
	[self.monsterView bind: @"monsterValue"
				  toObject: self
			   withKeyPath: @"foo"
				   options: nil];
	
	[self setFoo: 50];
}

//custom accessors - seemingly not KVO compilant, but behind the scenes
//this gets wrapped into -willChangeValueForKey:/-didChangeValueForKey:
//as soon as a binding is added
- (int) foo {
	return m_foo;
}

- (void) setFoo:(int)foo {
	m_foo = foo;
}

- (IBAction) resetFoo:(id)sender {
	[self setFoo: 23];
}

@end
