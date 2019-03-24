#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    int matrixSize = (int)[array count];
    int mainDiagonal = 0, secondDiagonal = 0;
    NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:@"[-0-9]{1,4}" options:NSRegularExpressionCaseInsensitive error:NULL];
    NSArray *matches = [NSArray new];
    NSString *matrixLine = [NSString new];
    for(int i=0; i<matrixSize; i++){
        NSMutableArray *matrixRow = [NSMutableArray new];
        matrixLine = array[i];
        matches = [regexp matchesInString:matrixLine options:0 range:NSMakeRange(0, matrixLine.length)];
        for(NSTextCheckingResult *match in matches) {
            NSString* strNumber = [matrixLine substringWithRange:match.range];
            [matrixRow addObject:[NSNumber numberWithInt:strNumber.intValue]];
        }
        mainDiagonal += [matrixRow[i] intValue];
        secondDiagonal += [matrixRow[matrixSize-i-1] intValue];
        [matrixRow dealloc];
    }
    return @(abs(mainDiagonal-secondDiagonal));
}

@end
