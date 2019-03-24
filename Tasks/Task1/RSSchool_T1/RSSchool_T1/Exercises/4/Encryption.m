#import "Encryption.h"

@implementation Encryption

// Complete the encryption function below.
- (NSString *)encryption:(NSString *)string {
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    int sqr = (int)sqrt([string length]);
    int rows = 1, columns = 1, square = pow(sqr+1, 2);
    for(int i=1; i<=sqr+1; i++)
        for(int j=1; j<=sqr+1; j++)
            if(sqr <= i && i <= j && j <= sqr+1 && i*j <= square && i*j >= [string length]){
                square = i*j;
                rows = i;
                columns = j;
            }
    NSMutableString *returnString = [NSMutableString new];
    for(int i=0; i<columns; i++){
        for(int j=0; j<rows; j++)
            if(i+j*columns < [string length]){
                [returnString appendString:[string substringWithRange:NSMakeRange(i+j*columns, 1)]];
            }
        if(i<columns-1) [returnString appendString:@" "];
    }
    [returnString autorelease];
    return returnString;
}

@end
