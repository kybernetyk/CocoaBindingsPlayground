//
//  CLMonsterView.m
//  Created by Leon Szpilewski on 5/13/12.
//  Copyright (c) 2012 Clawfield. All rights reserved.
//
#import "CLMonsterView.h"

@implementation CLMonsterView
@synthesize monsterValue = m_monsterValue;

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
	float fval = (float)m_monsterValue;
	fval = fval / 100.0;
	
	NSColor *color = [NSColor colorWithDeviceRed: fval green: 0.0 blue:0.0 alpha:1.0];
	[color set];
	NSRectFill([self bounds]);
}

//we have to override this to add the setNeedsDisplay:
- (void) setMonsterValue:(int)monsterValue {
	m_monsterValue = monsterValue;
	[self setNeedsDisplay: YES];
}

@end
