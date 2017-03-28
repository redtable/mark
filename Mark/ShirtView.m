//
//  ShirtView.m
//  Mark
//
//  Created by WangSen on 2017/3/28.
//  Copyright © 2017年 WangSen. All rights reserved.
//

#import "ShirtView.h"

@implementation ShirtView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [_color setStroke];
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    path.lineWidth = 2;
    path.lineCapStyle = kCGLineCapSquare;
    path.lineJoinStyle = kCGLineCapSquare;
    
    CGFloat littleWidth = FollowW(self) / 5;
    CGFloat curvedHeight = FollowH(self) / 3;
    [path moveToPoint:CGPointMake(1, curvedHeight)];
    [path addQuadCurveToPoint:CGPointMake(littleWidth, 1) controlPoint:CGPointMake(littleWidth , curvedHeight)];
    
    [path addLineToPoint:CGPointMake(littleWidth * 2, 1)];
    [path addQuadCurveToPoint:CGPointMake(littleWidth * 3, 1) controlPoint:CGPointMake(FollowW(self) / 2, curvedHeight / 3)];
    
    [path addLineToPoint:CGPointMake(littleWidth * 4, 1)];
    [path addQuadCurveToPoint:CGPointMake(FollowW(self) - 1, curvedHeight) controlPoint:CGPointMake(littleWidth * 4, curvedHeight)];
    
    [path addLineToPoint:CGPointMake(FollowW(self) - 1, FollowH(self) - 1)];
    [path addLineToPoint:CGPointMake(1, FollowH(self) - 1)];
    [path closePath];
    
    [path stroke];
    
//    [RGBA(150, 150, 255, 1) setFill];
//    [path fill];
    NSMutableParagraphStyle* paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingMiddle;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    UIFont * nameFont = BoldFont(FollowW(self) / 7);
    UIFont * numberFont = BoldFont(FollowW(self) / 4);
    NSDictionary* nameDic = @{NSFontAttributeName:nameFont,NSParagraphStyleAttributeName:paragraphStyle,NSForegroundColorAttributeName:[UIColor whiteColor]};
    NSDictionary* numberDic = @{NSFontAttributeName:numberFont,NSParagraphStyleAttributeName:paragraphStyle,NSForegroundColorAttributeName:[UIColor whiteColor]};
    [_name drawInRect:CGRectMake(littleWidth, curvedHeight / 2, FollowW(self) - littleWidth * 2, curvedHeight / 2) withAttributes:nameDic];
    [_number drawInRect:CGRectMake(littleWidth, curvedHeight * 1.3, FollowW(self) - littleWidth * 2, curvedHeight) withAttributes:numberDic];
}


@end
