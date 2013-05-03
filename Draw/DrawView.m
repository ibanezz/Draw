//
//  DrawView.m
//  Draw
//
//  Created by YanG on 13-5-1.
//  Copyright (c) 2013年 YanG. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)awakeFromNib
{
    if (self.dots == nil) {
        self.dots = [NSMutableArray array];
    }
    
    self.backgroundColor = [UIColor whiteColor];
}

//- (NSMutableArray *)getDots
//{
//    if (self.dots == nil) {
//        self.dots = [NSMutableArray array];
//    }
//    return self.dots;
//}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
    
    for (Dot * dot in self.dots) {
        CGContextAddArc(context, dot.x, dot.y, 5.0f, 0.0f, 2.0f*M_PI, YES);
        CGContextFillPath(context);
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    Dot * dot = [[[Dot alloc] init] autorelease];
    dot.x = location.x;
    dot.y = location.y;
    
    [self.dots addObject:dot];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    Dot * dot = [[[Dot alloc] init] autorelease];
    dot.x = location.x;
    dot.y = location.y;
    
    [self.dots addObject:dot];
    [self setNeedsDisplay];
}

- (void)dealloc
{
    self.dots = nil;
    [super dealloc];
}

@end
