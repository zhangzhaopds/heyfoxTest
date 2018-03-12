//
//  QXPullRefreshLoadingBoll.m
//  Loading_demo
//
//  Created by 张昭 on 22/02/2018.
//  Copyright © 2018 heyfox. All rights reserved.
//

#import "QXPullRefreshLoadingBoll.h"
#import "UIColor+QXAppend.h"
#import "UIView+Extension.h"

#define kTagOffset 10000
#define kBaseSteps 6

@interface QXPullRefreshLoadingBoll ()

@property (nonatomic, assign) CGFloat offsetY;

@end

@implementation QXPullRefreshLoadingBoll

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"cfcfcf"];
        self.layer.cornerRadius = kMinHeight / 2;
        self.enableProgress = true;
        _offsetY = (kMaxHeight - kMinHeight) * 0.4;
    }
    return self;
}

- (void)setProgress:(float)progress {
    _progress = progress;
    
    if (progress < 0) {
        progress = 0;
    } else if (progress > 0.9){
        progress = 0.9;
    }
    if (!self.enableProgress) {
        return;
    }
    _progress = progress;
    
    int step = floor(progress / 0.09 );
    NSLog(@"step:: %d, %0.2lf", step, progress);
    [self refreshFrameLoading:step];
}

-(void)setVerticalOffset:(float)verticalOffset{
    _verticalOffset = verticalOffset;
}

- (void)refreshFrameLoading:(NSInteger)step {
    NSLog(@"refreshFrameLoading ----- %ld", step);
    if (step == 0) {
        self.size = CGSizeMake(kMinHeight, 0);
        return;
    }
    if (step > 0 && step <= 5) {
        float height = (kMaxHeight - kMinHeight ) / 4 * (step - 1) + kMinHeight;
        
        self.size = CGSizeMake(kMinHeight, height);
        self.y = self.verticalOffset;
        
    }else if (5 < step && step < 10){
        float  height = kMaxHeight - (step - 5) * (kMaxHeight - kMinHeight ) / 4;
        self.size = CGSizeMake(kMinHeight, height);
        self.y = self.verticalOffset + (step - 5) * (kMaxHeight - kMinHeight) / 4;
    } else if (step == 10) {
        self.y = self.verticalOffset + (kMaxHeight - kMinHeight);
        self.size = CGSizeMake(kMinHeight, kMinHeight);
    } else {
        self.size = CGSizeMake(kMinHeight, kMinHeight);
        if (!self.isDown) {
            self.y = self.y - self.offsetY / kBaseSteps;
            if (self.y < self.verticalOffset + (kMaxHeight - kMinHeight) - self.offsetY) {
                self.y = self.verticalOffset + (kMaxHeight - kMinHeight) - self.offsetY;
                self.isDown = true;
            } else {
                self.isDown = false;
            }
        } else {
            self.y = self.y + self.offsetY / kBaseSteps;
            if (self.y > self.verticalOffset + (kMaxHeight - kMinHeight)) {
                self.y = self.verticalOffset + (kMaxHeight - kMinHeight);
                self.isDown = false;
            } else {
                self.isDown = true;
            }
        }
        if (self.needStop) {
            if (self.tag == kTagOffset && self.y == self.verticalOffset + (kMaxHeight - kMinHeight)) {
                if (self.beginFinishLoading) {
                    self.beginFinishLoading();
                }
                self.needStop = false;
            }
        }
    }
}

- (void)refreshFrameStopLoading:(NSInteger)step {
    NSLog(@"refreshFrameStopLoading--%ld", step);
    
    if (step < kBaseSteps) {
        
        self.y = self.y + self.offsetY / kBaseSteps;
        if (self.y > (kMaxHeight - kMinHeight) + self.verticalOffset) {
            self.y = (kMaxHeight - kMinHeight) + self.verticalOffset;
        }
    }
    else if (step <= kBaseSteps + 5) {
        //  10 11 长度不变；9、10、11
        float height = (kMaxHeight - kMinHeight) * 0.2 * (step - 5 > 5 ? 5 : step - 5) + kMinHeight;
        self.size = CGSizeMake(kMinHeight, height);
        if (step < kBaseSteps + 4) {
            self.y = self.y - (kMaxHeight - kMinHeight) * 0.2;
        } else {
            if (self.y - (kMaxHeight - kMinHeight) * 0.2 <= self.verticalOffset) {
                self.y = self.verticalOffset;
            } else {
                self.y = self.y - (kMaxHeight - kMinHeight) * 0.2;
            }
        }
    } else if (step == kBaseSteps + 6) { // 12
        // 减1/5
        float height = kMaxHeight - (kMaxHeight - kMinHeight ) / 5;
        self.size = CGSizeMake(kMinHeight, height);
    } else if (step == kBaseSteps + 7) { // 13
        // 减半
        float height = kMaxHeight * 0.5;
        self.size = CGSizeMake(kMinHeight, height);
    } else if (step == kBaseSteps + 8) { // 14
        // 减到最小
        self.size = CGSizeMake(kMinHeight, kMinHeight);
    } else if (step < kBaseSteps + 16) { // 22
        // 透明度 -1/7
        self.alpha = 1 - (step - (kBaseSteps + 8)) * 0.143;
    }
    
    // 第一个减到最小时，文字开始登场
    if (self.tag == kTagOffset && step > kBaseSteps + 4) {
        if (self.beginShowMessage) {
            self.beginShowMessage(step - (kBaseSteps + 4));
        }
    }
}

@end
