#import "Sorted.h"

@implementation ResultObject
@end

@implementation Sorted

// Complete the sorted function below.
- (ResultObject*)sorted:(NSString*)string {
    ResultObject *value = [ResultObject new];
    NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:@"[0-9]{1,7}" options:NSRegularExpressionCaseInsensitive error:NULL];
    NSArray *matches = [regexp matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    NSMutableArray *array = [NSMutableArray new];
    NSMutableString *result = [NSMutableString new];
    for(NSTextCheckingResult *match in matches) {
        NSString* strNumber = [string substringWithRange:match.range];
        [array addObject:[NSNumber numberWithInt:strNumber.intValue]];
        [strNumber release];
    }
    int index1=-1, index2=-1, numberSwaps=0;
    for(int i=0; i<[array count]-1; i++){
        if([array[i] intValue] > [array[i+1] intValue] && numberSwaps==0){
            numberSwaps++;
            index1 = i;
            index2 = index1+1;
        }
        else if([array[i] intValue] > [array[i+1] intValue] && numberSwaps==1){
            numberSwaps++;
            index2 = i+1;
        }
        else if([array[i] intValue] > [array[i+1] intValue]){
            if(i-index1 > 2){
                value.status = NO;
                value.detail = @"";
                [result release];
                [array release];
                [value autorelease];
                return value;
            } else {
                for(int j=i; j<[array count]-1; j++){
                    if([array[j] intValue] < [array[j+1] intValue] || j == [array count]-2){
                        for(int k=index1, q=j; k<q; k++, q--)
                            [array exchangeObjectAtIndex:k withObjectAtIndex:q];
                        [result appendFormat:@"reverse %i %i", index1+1, j+1];
                        value.detail = result;
                        index2 = index1 = -1;
                    }
                }
                value.status = YES;
                i = (int)[array count];
            }
        }
    }
    if(index1 >= 0 && index2 >= 0){
        [array exchangeObjectAtIndex:index1 withObjectAtIndex:index2];
        [result appendFormat:@"swap %i %i", index1+1, index2+1];
        value.detail = result;
    }
    for(int i=0; i<[array count]-1; i++)
        if([array[i] intValue] > [array[i+1] intValue]){
            value.status = NO;
            value.detail = @"";
            [result release];
            [array release];
            [value autorelease];
            return value;
        }
    value.status = YES;
    if([value.detail  isEqual: @""]){ value.detail = @"yes"; }
    [result release];
    [array release];
    [value autorelease];
    return value;
}

@end
