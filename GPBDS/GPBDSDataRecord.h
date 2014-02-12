//
//  GPBDSDataRecord.h
//  GPBDS
//
//  Created by Tom Cole on 2/12/14.
//  Copyright (c) 2014 Cal Poly Pomona. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPBDSDataRecord : NSObject

@property (strong, nonatomic) NSString *recordId;
@property (strong, nonatomic) NSString *recordType;
@property (strong, nonatomic) NSString *displayData;

@end
