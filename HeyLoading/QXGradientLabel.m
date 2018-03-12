//
//  QXGradientLabel.m
//  Loading_demo
//
//  Created by 张昭 on 24/02/2018.
//  Copyright © 2018 heyfox. All rights reserved.
//

#import "QXGradientLabel.h"
#import "UIColor+QXAppend.h"

@interface QXGradientLabel ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation QXGradientLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatGradientLayer];
    }
    return self;
}

- (void)creatGradientLayer {
    UIColor *color = [UIColor colorWithHexString:@"cfcfcf"];
    self.textColor = color;
    self.progress = 0;
    self.gradientLayer = [CAGradientLayer layer];
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[color CGColor],
                       (id)[color CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:0] CGColor],
                       nil];
    [self.gradientLayer setColors:colors];
    [self.gradientLayer setStartPoint:CGPointMake(0.0f, 0.0f)];
    [self.gradientLayer setEndPoint:CGPointMake(1.0f, 1.0f)];
    [self.gradientLayer setFrame:self.bounds];
    [self.layer setMask:self.gradientLayer];
}

- (void)setProgress:(float)progress {
    _progress = progress;
    UIColor *color = [UIColor colorWithHexString:@"cfcfcf"];
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[color CGColor],
                       (id)[color CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:progress] CGColor],
                       nil];
    [self.gradientLayer setColors:colors];
    [self.gradientLayer setEndPoint:CGPointMake(progress, progress)];
    if (progress >= 1.0) {
        [self.layer setMask:nil];
    } else {
        if (!self.layer.mask) {
            [self.layer setMask:self.gradientLayer];
        }
    }
    [self.gradientLayer setNeedsLayout];
}

- (void)setMessage:(NSString *)message {
    _message = message;
}


@end
