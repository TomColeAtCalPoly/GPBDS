//
//  GPBDSDataService.h
//  GPBDS
//
//  Created by Tom Cole on 2/12/14.
//  Copyright (c) 2014 Cal Poly Pomona. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPBDSDataService : NSObject

- (NSMutableArray*)searchByKeywords:(NSString *) keywords;
- (NSString*)lookUpDetails:(NSString *) recordId recordType:(NSString *) recordType;

@end
