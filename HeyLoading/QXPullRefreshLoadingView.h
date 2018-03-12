//
//  QXPullRefreshLoadingView.h
//  Loading_demo
//
//  Created by 张昭 on 22/02/2018.
//  Copyright © 2018 heyfox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QXPullRefreshLoadingView : UIView

@property (nonatomic, assign) float pullingPercent;
@property (nonatomic, assign) float verticalOffset;
@property (nonatomic, copy) void(^didFinishAnimationBlock)(void);

-(void)beginLoading;

-(void)endLoading;

@end
