#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger count = 0;
    
    for (int i = 0; i < ratingArray.count; i++) {
        NSMutableArray<NSNumber *> *arrGreate = [[NSMutableArray alloc] init];
        NSMutableArray<NSNumber *> *arrLess = [[NSMutableArray alloc] init];
        
        for (int j = i + 1; j < ratingArray.count; j++) {
            if ([ratingArray[i] intValue] > [ratingArray[j] intValue]) {
                [arrLess addObject:ratingArray[j]];
            }
            
            if ([ratingArray[i] intValue] < [ratingArray[j] intValue]) {
                [arrGreate addObject:ratingArray[j]];
            }
        }

        for (int n = 0; n < arrGreate.count; n++) {
            for (int j = n + 1; j < arrGreate.count; j++) {
                if ([arrGreate[n] intValue] < [arrGreate[j] intValue]) {
                    count += 1;
                }
            }
        }
        
        for (int n = 0; n < arrLess.count; n++) {
            for (int j = n + 1; j < arrLess.count; j++) {
                if ([arrLess[n] intValue] > [arrLess[j] intValue]) {
                    count += 1;
                }
            }
        }
        
    }
    
    return count;
}

@end
