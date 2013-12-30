//
//  File.h
//  MasterDetailApp
//
//  Created by mgarciaibanez on 19/12/13.
//  Copyright (c) 2013 mgarciaibanez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface File : NSObject

@property (nonatomic, strong) NSString *codFile; //For Both
@property (nonatomic, strong) NSString *codFileShort;//For Tips&Advices
@property (nonatomic, strong) NSString *filenl;//For Tips&Advices ??
@property (nonatomic, strong) NSString *fileVolume;//For Tips&Advices
@property (nonatomic, strong) NSString *fileNumber;//For Tips&Advices
@property (nonatomic, strong) NSString *fileSubPage;//For Tips&Advices
@property (nonatomic, strong) NSString *fileTopic;//For Tips&Advices
@property (nonatomic, strong) NSString *fileKeyword;//For Tips&Advices
@property (nonatomic, strong) NSNumber *fileType;//??
@property (nonatomic, strong) NSString *fileTypeDescription;
@property (nonatomic, strong) NSString *fileVersion; // For iM
@property (nonatomic, strong) NSString *fileVersionTitle; // for iMe
@property (nonatomic, strong) NSDate *fileVersionDate;
@property (nonatomic, strong) NSString *fileThumbNail;
@property (nonatomic, strong) NSString *fileVersionFile;
@property (nonatomic, strong) NSString *fileCountry;

@end
