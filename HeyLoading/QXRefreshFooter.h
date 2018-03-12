//
//  QXRefreshFooter.h
//  MiniK
//
//  Created by Mac on 2017/9/5.
//  Copyright © 2017年 UI. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>
#import "QXPullRefreshLoadingView.h"
@interface QXRefreshFooter : MJRefreshAutoNormalFooter

@end


//@interface QXRefreshHeader : MJRefreshHeader
@interface QXRefreshHeader : MJRefreshStateHeader
@property (nonatomic ,weak) QXPullRefreshLoadingView *pullView;

@end
