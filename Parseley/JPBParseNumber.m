//
//  JPBParseNumber.m
//  Parseley
//
//  Created by John Beatty on 1/30/14.
//  Copyright (c) 2014 John Beatty. All rights reserved.
//

#import "JPBParseNumber.h"

static NSInteger const JPBBillion   = 1000000000;
static NSInteger const JPBMillion   = 1000000;
static NSInteger const JPBThousand  = 1000;
static NSInteger const JPBHundred   = 100;
static NSInteger const JPBTen       = 10;
static NSInteger const JPBOne       = 1;


@implementation JPBParseNumber

+ (NSString *)parseInteger:(NSInteger)integer {

    if (integer > 0) {
        return stringForBillions(integer);
    } else if (integer == 0) {
        return @"zero";
    } else {
        return [NSString stringWithFormat:@"negative %@", stringForBillions(-integer)];
    }
}

NSString *stringForBillions(NSInteger billions) {
    NSInteger greaterThanBillions = billions / JPBBillion;
    NSInteger lessThanBillions = billions % JPBBillion;
    
    NSString *result;
    if (greaterThanBillions > 0) {
        result = [NSString stringWithFormat:@"%@ billion", stringForTripleDigit(greaterThanBillions)];
        if (lessThanBillions > 0) {
            result = [result stringByAppendingFormat:@" %@", stringForMillions(lessThanBillions)];
        }
    } else {
        result = stringForMillions(lessThanBillions);
    }
    
    return result;
}


NSString *stringForMillions(NSInteger millions) {
    NSInteger greaterThanMillions = millions / JPBMillion;
    NSInteger lessThanMillions = millions % JPBMillion;
    
    NSString *result;
    if (greaterThanMillions > 0) {
        result = [NSString stringWithFormat:@"%@ million", stringForTripleDigit(greaterThanMillions)];
        if (lessThanMillions > 0) {
            result = [result stringByAppendingFormat:@" %@", stringForThousands(lessThanMillions)];
        }
    } else {
        result = stringForThousands(lessThanMillions);
    }
    
    return result;
}

NSString *stringForThousands(NSInteger thousands) {
    
    NSInteger greaterThanThousands = thousands / JPBThousand;
    NSInteger lessThanThousands = thousands % JPBThousand;
    
    NSString *result;
    if (greaterThanThousands > 0) {
        result = [NSString stringWithFormat:@"%@ thousand", stringForTripleDigit(greaterThanThousands)];
        if (lessThanThousands > 0) {
            result = [result stringByAppendingFormat:@" %@", stringForTripleDigit(lessThanThousands)];
        }
    } else {
        result = stringForTripleDigit(lessThanThousands);
    }
    return result;
}

NSString * stringForTripleDigit(NSInteger tripleDigit) {
    NSInteger hundredsPlace = tripleDigit / JPBHundred;
    NSInteger tensPlace = tripleDigit % JPBHundred;
    
    NSString *result;
    if (hundredsPlace > 0) {
        result = [NSString stringWithFormat:@"%@ hundred", stringForSingleDigit(hundredsPlace)];
        if (tensPlace > 0) {
            result = [result stringByAppendingFormat:@" %@", stringForDoubleDigit(tensPlace)];
        }
    } else {
        result = stringForDoubleDigit(tensPlace);
    }
    
    return result;
}

NSString * stringForDoubleDigit(NSInteger doubleDigit) {
    NSString *result = @"";
    NSInteger tensPlace = doubleDigit / JPBTen;
    NSInteger onesPlace = doubleDigit % JPBTen;
    switch (tensPlace) {
        case 0:
            return stringForSingleDigit(onesPlace);
            break;
        case 1:
            switch (doubleDigit) {
                case 10:
                    return @"ten";
                    break;
                case 11:
                    return @"eleven";
                    break;
                case 12:
                    return @"twelve";
                    break;
                case 13:
                    return @"thirteen";
                    break;
                case 14:
                    return @"fourteen";
                    break;
                case 15:
                    return @"fifteen";
                    break;
                case 16:
                    return @"sixteen";
                    break;
                case 17:
                    return @"seventeen";
                    break;
                case 18:
                    return @"eighteen";
                    break;
                case 19:
                    return @"nineteen";
                    break;
                default:
                    break;
            }
            break;
        case 2:
            result = @"twenty";
            break;
        case 3:
            result = @"thirty";
            break;
        case 4:
            result = @"forty";
            break;
        case 5:
            result = @"fifty";
            break;
        case 6:
            result = @"sixty";
            break;
        case 7:
            result = @"seventy";
            break;
        case 8:
            result = @"eighty";
            break;
        case 9:
            result = @"ninety";
            break;
        default:
            break;
    }
    
    if (onesPlace > 0) {
        result = [result stringByAppendingFormat:@"-%@", stringForSingleDigit(onesPlace)];
    }
    return result;
}

NSString * stringForSingleDigit(NSInteger singleDigit) {
    switch (singleDigit) {
        case 1:
            return @"one";
            break;
        case 2:
            return @"two";
            break;
        case 3:
            return @"three";
            break;
        case 4:
            return @"four";
            break;
        case 5:
            return @"five";
            break;
        case 6:
            return @"six";
            break;
        case 7:
            return @"seven";
            break;
        case 8:
            return @"eight";
            break;
        case 9:
            return @"nine";
            break;
            
        default:
            break;
    }
    return @"";
}

@end
