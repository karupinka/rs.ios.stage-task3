#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber > 0 && monthNumber < 12) {
        NSString *format = @"MMMM";
        NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
        NSDateComponents *dateComponent = [[NSDateComponents alloc] init];
        [dateComponent setMonth:monthNumber];
        
        NSDate *date = [calendar dateFromComponents:dateComponent];
        NSDateFormatter *dateFormator = [[NSDateFormatter alloc] init];
        dateFormator.dateFormat = format;
        dateFormator.locale = [[NSLocale alloc] initWithLocaleIdentifier: @"en_US"];
        NSString *month = [dateFormator stringFromDate:date];
        return month;
    }
    
    else {
        return  nil;
    }
    
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSString *formatString = @"yyyy-MM-dd'T'HH:mm:ssZ";
    NSString *formatStringOnlyDay = @"dd";
    
    NSDateFormatter *dateFormattor = [[NSDateFormatter alloc] init];
    dateFormattor.dateFormat = formatString;
    
    NSDateFormatter *dateFormattorOnlyDay = [[NSDateFormatter alloc] init];
    dateFormattorOnlyDay.dateFormat = formatStringOnlyDay;
    
    NSDate *dateFromFormatter = [dateFormattor dateFromString:date];
    NSString *resultString = [dateFormattorOnlyDay stringFromDate:dateFromFormatter];
    
    return [resultString longLongValue];;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSString *weekdayFormat = @"E";
    NSDateFormatter *dateFormattor = [[NSDateFormatter alloc] init];
    dateFormattor.dateFormat = weekdayFormat;
    dateFormattor.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_Ru"];
    NSString *result = [dateFormattor stringFromDate:date];
    return result;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];

    NSDate *dateNow = [NSDate date];
    NSDateComponents *dateComponents;
//    [dateComponents setWeekday:2];
    dateComponents = [calendar components:NSYearForWeekOfYearCalendarUnit |NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:dateNow];
    
    NSDate *firstDateOfWeek = [calendar dateFromComponents:dateComponents];
    
    NSDateInterval *interval = [[NSDateInterval alloc] initWithStartDate:firstDateOfWeek duration:60*60*24*7];
    
    return [interval containsDate:date];
}

@end
