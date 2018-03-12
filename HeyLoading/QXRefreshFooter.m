//
//  QXRefreshFooter.m
//  MiniK
//
//  Created by Mac on 2017/9/5.
//  Copyright © 2017年 UI. All rights reserved.
//

#import "QXRefreshFooter.h"
@interface QXRefreshFooter ()

@property (nonatomic, strong) UIView *leftLineView;
@property (nonatomic, strong) UIView *rightLineView;

@end

@implementation QXRefreshFooter



@end


@implementation QXRefreshHeader


#pragma mark - 覆盖父类的方法
- (void)prepare
{
    [super prepare];
    self.stateLabel.hidden = true;
    if (!_pullView) {
        QXPullRefreshLoadingView *pullView = [[QXPullRefreshLoadingView alloc] initWithFrame:self.bounds];
        [self addSubview:_pullView = pullView];
    }

}

- (void)placeSubviews
{
    [super placeSubviews];
    _pullView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.mj_h);
    _pullView.verticalOffset = self.mj_h * 0.5 - 8;
}

- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    _pullView.pullingPercent = pullingPercent;
}

-(void)setState:(MJRefreshState)state{
    MJRefreshCheckState

    if (state == MJRefreshStateRefreshing) {
        [_pullView beginLoading];
    }else if (state == MJRefreshStateIdle){

    }
}

-(void)endRefreshing{
    [_pullView endLoading];
    _pullView.didFinishAnimationBlock = ^{
        [super endRefreshing];
    };
}


@end
