//
//  iOSOpenSourceViewController.h
//  Study Manual For iOS
//
//  Created by Apple on 9/14/15.
//  Copyright (c) 2015 广东华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iOSOpenSourceViewController : UITableViewController<UISearchResultsUpdating>

@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) NSMutableArray *searchResults;
@property (nonatomic, strong) UISearchController *searchController;

@end
