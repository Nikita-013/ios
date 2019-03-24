#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams:(NSString *)string {
    string = [string uppercaseString];
    BOOL matches = false;
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    for(int j=0; j<26; j++){
        matches = false;
        for(int i=0; i<string.length && !matches; i++){
            if([alphabet characterAtIndex:j] == [string characterAtIndex:i]){ matches = true; }
        }
        if(!matches){ [alphabet autorelease]; return NO; }
    }
    [alphabet autorelease];
    return YES;
}

@end
