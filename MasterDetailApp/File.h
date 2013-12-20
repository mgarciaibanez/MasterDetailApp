//
//  File.h
//  MasterDetailApp
//
//  Created by mgarciaibanez on 19/12/13.
//  Copyright (c) 2013 mgarciaibanez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface File : NSObject

@property (nonatomic, strong) NSString *codFile;
@property (nonatomic, strong) NSNumber *fileType;
@property (nonatomic, strong) NSString *fileTypeDescription;
@property (nonatomic, strong) NSString *fileVersion;
@property (nonatomic, strong) NSString *fileVersionTitle;
@property (nonatomic, strong) NSDate *fileVersionDate;
@property (nonatomic, strong) NSString *fileThumbNail;
@property (nonatomic, strong) NSString *fileVersionFile;

@end
