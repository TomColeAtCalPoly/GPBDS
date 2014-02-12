//
//  GPBDSDataService.m
//  GPBDS
//
//  Created by Tom Cole on 2/12/14.
//  Copyright (c) 2014 Cal Poly Pomona. All rights reserved.
//

#import "GPBDSDataService.h"
#import "GPBDSDataRecord.h"

@implementation GPBDSDataService

- (NSMutableArray*)searchByKeywords:(NSString *)keywords
{
    NSMutableArray *searchResults = [[NSMutableArray alloc] init];
    
    for (int i = 1; i <= 10; i++) {
        GPBDSDataRecord *record = [[GPBDSDataRecord alloc] init];
        record.recordId = [NSString stringWithFormat:@"%i", i];
        record.recordType = @"Customer";
        record.displayData = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget urna ante. Ut sit amet elit libero. Pellentesque elementum tellus tellus, vitae porttitor magna ultrices quis.";
        
        [searchResults addObject:record];
    }
    
    return searchResults;
}

- (NSString*)lookUpDetails:(NSString *)recordId recordType:(NSString *)recordType
{
    return @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget urna ante. Ut sit amet elit libero. Pellentesque elementum tellus tellus, vitae porttitor magna ultrices quis.";
}

@end
