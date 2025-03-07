//
//  MainViewController.m
//  24
//
//  Created by MachOSX on 8/19/14.
//  Copyright (c) 2014 Scapehouse. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (id)init
{
    self = [super init];
    
    if ( self )
    {
        calendar = [NSCalendar currentCalendar];
        [calendar setTimeZone:[NSTimeZone localTimeZone]];
        
        colonsVisible = YES;
    }
    
    return self;
}

- (void)loadView
{
    AppDelegate *appDelegate = [AppDelegate sharedDelegate];
    
    UIView *contentView = [[UIView alloc] initWithFrame:appDelegate.screenBounds];
    contentView.backgroundColor = [UIColor blackColor];
    
    container = [[UIView alloc] initWithFrame:appDelegate.screenBounds];
    
    birthdayQuestionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 280, 20)];
    birthdayQuestionLabel.textColor = [UIColor whiteColor];
    birthdayQuestionLabel.font = [UIFont systemFontOfSize:MAIN_FONT_SIZE];
    birthdayQuestionLabel.textAlignment = NSTextAlignmentCenter;
    birthdayQuestionLabel.text = @"When were you born?";
    birthdayQuestionLabel.alpha = 0.0;
    birthdayQuestionLabel.hidden = YES;
    
    daysSpentLabel = [[UILabel alloc] init];
    daysSpentLabel.textColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    daysSpentLabel.textAlignment = NSTextAlignmentCenter;
    daysSpentLabel.numberOfLines = 0;
    daysSpentLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:MAIN_FONT_SIZE];
    
    hourLabel = [[UILabel alloc] init];
    hourLabel.textColor = [UIColor whiteColor];
    hourLabel.font = [UIFont boldSystemFontOfSize:MAIN_FONT_SIZE];
    
    colonLabel_1 = [[UILabel alloc] init];
    colonLabel_1.textColor = [UIColor whiteColor];
    colonLabel_1.font = [UIFont systemFontOfSize:MAIN_FONT_SIZE];
    colonLabel_1.text = @":";
    
    minutesLabel = [[UILabel alloc] init];
    minutesLabel.textColor = [UIColor whiteColor];
    minutesLabel.font = [UIFont boldSystemFontOfSize:MAIN_FONT_SIZE];
    
    colonLabel_2 = [[UILabel alloc] init];
    colonLabel_2.textColor = [UIColor whiteColor];
    colonLabel_2.font = [UIFont systemFontOfSize:MAIN_FONT_SIZE];
    colonLabel_2.text = @":";
    
    secondsLabel = [[UILabel alloc] init];
    secondsLabel.textColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    secondsLabel.font = [UIFont systemFontOfSize:MAIN_FONT_SIZE];
    
    quoteLabel = [[UILabel alloc] init];
    quoteLabel.textColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    quoteLabel.numberOfLines = 0;
    quoteLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:MAIN_FONT_SIZE];
    
    quoteAuthorLabel = [[UILabel alloc] init];
    quoteAuthorLabel.textColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    quoteAuthorLabel.numberOfLines = 0;
    quoteAuthorLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:MAIN_FONT_SIZE];
    
    doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [doneButton addTarget:self action:@selector(dismissBirthdayPicker) forControlEvents:UIControlEventTouchUpInside];
    [doneButton setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [doneButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    doneButton.titleLabel.font = [UIFont boldSystemFontOfSize:MAIN_FONT_SIZE];
    doneButton.frame = CGRectMake(110, appDelegate.screenBounds.size.height - 280, 100, 44);
    doneButton.alpha = 0.0;
    doneButton.hidden = YES;
    
    birthdayPicker = [[UIDatePicker alloc] init];
    birthdayPicker.backgroundColor = [UIColor whiteColor];
    birthdayPicker.frame = CGRectMake(0, appDelegate.screenBounds.size.height, appDelegate.screenBounds.size.width, 216);
    birthdayPicker.datePickerMode = UIDatePickerModeDate;
    birthdayPicker.maximumDate = [NSDate date]; // Don't allow more than the current date.
    [birthdayPicker addTarget:self action:@selector(datePickerValueChanged) forControlEvents:UIControlEventValueChanged];
    
    int rand = arc4random_uniform(18);
    NSString *quote = @"";
    NSString *quoteAuthor = @"";
    
    switch (rand)
    {
        case 0:
        {
            quote = @"Make today count.";
            break;
        }
            
        case 1:
        {
            quote = @"So, what have you done today?";
            break;
        }
            
        case 2:
        {
            quote = @"Saw that minute that just passed? You're never getting it back.";
            break;
        }
            
        case 3:
        {
            quote = @"Read a book. Go for a run. Do something with your life.";
            break;
        }
            
        case 4:
        {
            quote = @"If today was your last day, what would you do?";
            break;
        }
            
        case 5:
        {
            quote = @"Tick tock. Tick tock.";
            break;
        }
            
        case 6:
        {
            quote = @"Waiting for a miracle? It ain't gonna happen. Your life is in YOUR hands.";
            break;
        }
            
        case 7:
        {
            quote = @"Lost time is never found again.";
            quoteAuthor = @"Benjamin Franklin";
            break;
        }
            
        case 8:
        {
            quote = @"Don't wait. The time will never be just right.";
            quoteAuthor = @"Napoleon Hill";
            break;
        }
            
        case 9:
        {
            quote = @"Time is the most valuable thing a man can spend.";
            quoteAuthor = @"Theophrastus";
            break;
        }
            
        case 10:
        {
            quote = @"My favorite things in life don't cost any money. It's really clear that the most precious resource we all have is time.";
            quoteAuthor = @"Steve Jobs";
            break;
        }
            
        case 11:
        {
            quote = @"Waste your money and you're only out of money, but waste your time and you've lost a part of your life.";
            quoteAuthor = @"Michael LeBoeuf";
            break;
        }
            
        case 12:
        {
            quote = @"Don't let the fear of the time it will take to accomplish something stand in the way of your doing it. The time will pass anyway; we might just as well put that passing time to the best possible use.";
            quoteAuthor = @"Earl Nightingale";
            break;
        }
            
        case 13:
        {
            quote = @"I must govern the clock, not be governed by it.";
            quoteAuthor = @"Golda Meir";
            break;
        }
            
        case 14:
        {
            quote = @"You may delay, but time will not.";
            quoteAuthor = @"Benjamin Franklin";
            break;
        }
            
        case 15:
        {
            quote = @"Better late than never!";
            break;
        }
            
        case 16:
        {
            quote = @"Life is a one time offer. Use it well.";
            break;
        }
            
        case 17:
        {
            quote = @"When was the last time you did something for the first time?";
            break;
        }
    }
    
    CGSize textSize_quote = [quote sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:MAIN_FONT_SIZE] constrainedToSize:CGSizeMake(280, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    
    quoteLabel.frame = CGRectMake((appDelegate.screenBounds.size.width / 2) - (textSize_quote.width / 2), appDelegate.screenBounds.size.height - textSize_quote.height - 100, textSize_quote.width, textSize_quote.height);
    quoteLabel.text = quote;
    
    if ( quoteAuthor.length > 0 )
    {
        quoteAuthor = [NSString stringWithFormat:@"— %@", quoteAuthor];
        
        CGSize textSize_quoteAuthor = [quoteAuthor sizeWithFont:[UIFont fontWithName:@"HelveticaNeue" size:MAIN_FONT_SIZE] constrainedToSize:CGSizeMake(280, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
        
        quoteAuthorLabel.frame = CGRectMake(appDelegate.screenBounds.size.width - textSize_quoteAuthor.width - 20, quoteLabel.frame.origin.y + quoteLabel.frame.size.height + 10, textSize_quoteAuthor.width, textSize_quoteAuthor.height);
        quoteAuthorLabel.text = quoteAuthor;
    }
    
    [container addSubview:daysSpentLabel];
    [container addSubview:hourLabel];
    [container addSubview:colonLabel_1];
    [container addSubview:minutesLabel];
    [container addSubview:colonLabel_2];
    [container addSubview:secondsLabel];
    [container addSubview:quoteLabel];
    [container addSubview:quoteAuthorLabel];
    [contentView addSubview:birthdayQuestionLabel];
    [contentView addSubview:doneButton];
    [contentView addSubview:container];
    [contentView addSubview:birthdayPicker];
    
    [self startTimers];
    [self drawLabelsForCurrentTime];
    
    self.view = contentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ( [userDefaults stringForKey:@"SHTwentyFourRunCount"] )
    {
        birthDay = [[userDefaults stringForKey:@"SHTwentyFourBirthDay"] intValue];
        birthMonth = [[userDefaults stringForKey:@"SHTwentyFourBirthMonth"] intValue];
        birthYear = [[userDefaults stringForKey:@"SHTwentyFourBirthYear"] intValue];
        
        [self drawDaysSpent];
    }
    else
    {
        [self showBirthdayPicker];
    }
}

- (void)drawLabelsForCurrentTime
{
    AppDelegate *appDelegate = [AppDelegate sharedDelegate];
    
    [self pauseTimers];
    
    timer_colons = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(animateColons) userInfo:nil repeats:NO];
    timer_time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(drawLabelsForCurrentTime) userInfo:nil repeats:NO];
    
    NSDate *today = [NSDate date];
    
    NSDateComponents *targetDateComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:today];
    int hour = abs(24 - (int)[targetDateComponents hour]);
    int minute = abs(60 - (int)[targetDateComponents minute]);
    int second = abs(60 - (int)[targetDateComponents second]);
    
    if ( [targetDateComponents hour] == 24 )
    {
        hour = 24;
    }
    
    NSString *hourString = [NSString stringWithFormat:@"%02d", hour];
    NSString *minuteString = [NSString stringWithFormat:@"%02d", minute];
    NSString *secondString = [NSString stringWithFormat:@"%02d", second];
    
    CGSize textSize_hour = [hourString sizeWithFont:[UIFont boldSystemFontOfSize:MAIN_FONT_SIZE] constrainedToSize:CGSizeMake(100, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    CGSize textSize_colon = [@":" sizeWithFont:[UIFont systemFontOfSize:MAIN_FONT_SIZE] constrainedToSize:CGSizeMake(100, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    CGSize textSize_minutes = [minuteString sizeWithFont:[UIFont boldSystemFontOfSize:MAIN_FONT_SIZE] constrainedToSize:CGSizeMake(100, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    CGSize textSize_seconds = [secondString sizeWithFont:[UIFont systemFontOfSize:MAIN_FONT_SIZE] constrainedToSize:CGSizeMake(100, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    
    hourLabel.frame = CGRectMake((appDelegate.screenBounds.size.width / 2) - textSize_hour.width - (textSize_minutes.width / 2) - textSize_colon.width - 4, (appDelegate.screenBounds.size.height / 2) - (textSize_hour.height / 2), textSize_hour.width, textSize_hour.height);
    hourLabel.text = hourString;
    
    colonLabel_1.frame = CGRectMake((appDelegate.screenBounds.size.width / 2) - (textSize_minutes.width / 2) - textSize_colon.width - 2, (appDelegate.screenBounds.size.height / 2) - (textSize_colon.height / 2), textSize_colon.width, textSize_colon.height);
    
    minutesLabel.frame = CGRectMake((appDelegate.screenBounds.size.width / 2) - (textSize_minutes.width / 2), (appDelegate.screenBounds.size.height / 2) - (textSize_minutes.height / 2), textSize_minutes.width, textSize_minutes.height);
    minutesLabel.text = minuteString;
    
    colonLabel_2.frame = CGRectMake((appDelegate.screenBounds.size.width / 2) + (textSize_minutes.width / 2) + 2, (appDelegate.screenBounds.size.height / 2) - (textSize_colon.height / 2), textSize_colon.width, textSize_colon.height);
    
    secondsLabel.frame = CGRectMake((appDelegate.screenBounds.size.width / 2) + (textSize_minutes.width / 2) + textSize_colon.width + 4, (appDelegate.screenBounds.size.height / 2) - (textSize_seconds.height / 2), textSize_seconds.width, textSize_seconds.height);
    secondsLabel.text = secondString;
}

- (void)drawDaysSpent
{
    NSString *dateString = [NSString stringWithFormat:@"%d-%d-%d", birthYear, birthMonth, birthDay];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *birthday = [dateFormatter dateFromString:dateString];
    
    daysSpent = (int)[self daysBetweenDate:birthday andDate:[NSDate date]];
    
    NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSString *daysSpentString = [numberFormatter stringFromNumber:[NSNumber numberWithInt:daysSpent]];
    daysSpentLabel.text = [NSString stringWithFormat:@"%@ days of your life have passed.", daysSpentString];
    
    CGSize textSize_daysSpent = [daysSpentLabel.text sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:MAIN_FONT_SIZE] constrainedToSize:CGSizeMake(280, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    daysSpentLabel.frame = CGRectMake(20, 100, 280, textSize_daysSpent.height);
}

- (NSInteger)daysBetweenDate:(NSDate *)fromDateTime andDate:(NSDate *)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

- (void)animateColons
{
    if ( colonsVisible )
    {
        colonsVisible = NO;
        
        colonLabel_1.hidden = YES;
        colonLabel_2.hidden = YES;
    }
    else
    {
        colonsVisible = YES;
        
        colonLabel_1.hidden = NO;
        colonLabel_2.hidden = NO;
    }
}

- (void)startTimers
{
    NSDate *today = [NSDate date];
    
    NSDateComponents *targetDateComponents = [calendar components:NSSecondCalendarUnit fromDate:today];
    NSInteger seconds = [targetDateComponents minute];
    
    timer_colons = [NSTimer scheduledTimerWithTimeInterval:(60 - seconds) target:self selector:@selector(animateColons) userInfo:nil repeats:NO];
    timer_time = [NSTimer scheduledTimerWithTimeInterval:(60 - seconds) target:self selector:@selector(drawLabelsForCurrentTime) userInfo:nil repeats:NO];
}

- (void)pauseTimers
{
    [timer_colons invalidate];
    [timer_time invalidate];
}

- (void)showBirthdayPicker
{
    AppDelegate *appDelegate = [AppDelegate sharedDelegate];
    
    birthdayQuestionLabel.hidden = NO;
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        birthdayPicker.frame = CGRectMake(0, appDelegate.screenBounds.size.height - 216, birthdayPicker.frame.size.width, 216);
        birthdayQuestionLabel.alpha = 1.0;
        container.alpha = 0.0;
    } completion:^(BOOL finished){
        container.hidden = YES;
    }];
}

- (void)dismissBirthdayPicker
{
    AppDelegate *appDelegate = [AppDelegate sharedDelegate];
    
    container.hidden = NO;
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        birthdayPicker.frame = CGRectMake(0, appDelegate.screenBounds.size.height, birthdayPicker.frame.size.width, 216);
        birthdayQuestionLabel.alpha = 0.0;
        doneButton.alpha = 0.0;
        container.alpha = 1.0;
    } completion:^(BOOL finished){
        birthdayQuestionLabel.hidden = YES;
        doneButton.hidden = YES;
    }];
    
    NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:selectedBirthday];
    birthYear = (int)[dateComponents year];
    birthMonth = (int)[dateComponents month];
    birthDay = (int)[dateComponents day];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSNumber numberWithInt:birthDay] forKey:@"SHTwentyFourBirthDay"];
    [userDefaults setObject:[NSNumber numberWithInt:birthMonth] forKey:@"SHTwentyFourBirthMonth"];
    [userDefaults setObject:[NSNumber numberWithInt:birthYear] forKey:@"SHTwentyFourBirthYear"];
    [userDefaults setObject:@"1" forKey:@"SHTwentyFourRunCount"];
    [userDefaults synchronize];
    
    [self drawDaysSpent];
}

- (void)datePickerValueChanged
{
    selectedBirthday = birthdayPicker.date;
    
    doneButton.hidden = NO;
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        doneButton.alpha = 1.0;
    } completion:^(BOOL finished){
        
    }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
