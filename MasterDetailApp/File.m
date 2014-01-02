//
//  File.m
//  MasterDetailApp
//
//  Created by mgarciaibanez on 19/12/13.
//  Copyright (c) 2013 mgarciaibanez. All rights reserved.
//

#import "File.h"

@implementation File

/*Model to handle */
@synthesize codFile = _codFile;
@synthesize codFileShort = _codFileShort;
@synthesize fileType = _fileType;
@synthesize filenl = _filenl;
@synthesize fileVolume = _fileVolume;
@synthesize fileNumber = _fileNumber;
@synthesize filePage = _filePage;
@synthesize fileSubPage = _fileSubPage;
@synthesize fileTopic = _fileTopic;
@synthesize fileKeyword = _fileKeyword;
@synthesize fileTypeDescription = _fileTypeDescription;
@synthesize fileVersion = _fileVersion;
@synthesize fileVersionTitle = _fileVersionTitle;
@synthesize fileThumbNail = _fileThumbNail;
@synthesize fileVersionDate = _fileVersionDate;
@synthesize fileVersionFile = _fileVersionFile;

-(id) initWithAllData:(NSString *)codFile codFileShort:(NSString *)codFileShort filenl:(NSString *)filenl fileVolume:(NSString *)fileVolume fileNumber:(NSString *)fileNumber filePage:(NSString *)filePage fileSubPage:(NSString *)fileSubPage fileTopic:(NSString *)fileTopic fileKeyword:(NSString *)fileKeyword fileType:(NSNumber *)fileType fileTypeDescription:(NSString *)fileTypeDescription fileVersion:(NSString *)fileVersion fileVersionTitle:(NSString *)fileVersionTitle fileVersionDate:(NSDate *)fileVersionDate fileThumbNail:(NSString *)fileThumbNail fileCountry:(NSString *)fileCountry{
    
    if ((self = [super init])){
        self.codFile = codFile;
        self.codFileShort = codFileShort;
        self.filenl = filenl;
        self.fileVolume = fileVolume;
        self.fileNumber = fileNumber;
        self.filePage = filePage;
        self.fileSubPage = fileSubPage;
        self.fileTopic = fileTopic;
        self.fileKeyword = fileKeyword;
        self.fileType = fileType;
        self.fileTypeDescription = fileTypeDescription;
        self.fileVersion = fileVersion;
        self.fileVersionTitle = fileVersionTitle;
        self.fileVersionDate = fileVersionDate;
        self.fileThumbNail = fileThumbNail;
        self.fileCountry = fileCountry;
    }
    
    return self;
}

@end
