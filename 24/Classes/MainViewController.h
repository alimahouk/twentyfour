//
//  MainViewController.h
//  24
//
//  Created by MachOSX on 8/19/14.
//  Copyright (c) 2014 Scapehouse. All rights reserved.
//

@interface MainViewController : UIViewController
{
    UIView *container;
    UILabel *birthdayQuestionLabel;
    UILabel *daysSpentLabel;
    UILabel *hourLabel;
    UILabel *minutesLabel;
    UILabel *colonLabel_1;
    UILabel *colonLabel_2;
    UILabel *secondsLabel;
    UILabel *quoteLabel;
    UILabel *quoteAuthorLabel;
    UIButton *doneButton;
    UIDatePicker *birthdayPicker;
    NSCalendar *calendar;
    NSDate *selectedBirthday;
    NSTimer *timer_colons;
    NSTimer *timer_time;
    int birthDay;
    int birthMonth;
    int birthYear;
    int daysSpent;
    BOOL colonsVisible;
}

- (void)drawLabelsForCurrentTime;
- (void)drawDaysSpent;
- (NSInteger)daysBetweenDate:(NSDate *)fromDateTime andDate:(NSDate *)toDateTime;
- (void)animateColons;
- (void)startTimers;
- (void)pauseTimers;
- (void)showBirthdayPicker;

@end
