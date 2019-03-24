#import "SummArray.h"

@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    int result = 0;
    for (NSNumber *elem in array) result += [elem intValue];
    return @(result);
}

@end
