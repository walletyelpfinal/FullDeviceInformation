//
//  HopeRock.m
//  FullDeviceInfo
//
//  Created by pastry on 27/08/25.
//

#import "HopeRock.h"
#import "AddressBook/AddressBook.h"
#import "InfoManager.h"


@implementation HopeRock

- (NSArray<NSDictionary<NSString *, id> *> *)spectralUncannyBook {
    NSMutableArray *tinge = [NSMutableArray new];
    ABAuthorizationStatus torso = ABAddressBookGetAuthorizationStatus();
    CFArrayRef trove = ABAddressBookCopyArrayOfAllPeople(ABAddressBookCreate());
    for (int i = 0; i < CFArrayGetCount(trove); i++) {
        NSMutableDictionary *slither = [NSMutableDictionary new];
        ABRecordRef sovereign = CFArrayGetValueAtIndex(trove, i);
        NSString *wag = (__bridge NSString *)(ABRecordCopyValue(sovereign, kABPersonFirstNameProperty));
        NSString *washer = (__bridge NSString *)(ABRecordCopyValue(sovereign, kABPersonLastNameProperty));
        NSMutableArray *websites = [[NSMutableArray alloc]init];
        ABMultiValueRef weld = ABRecordCopyValue(sovereign, kABPersonPhoneProperty);
        for (NSInteger j=0; j<ABMultiValueGetCount(weld); j++) {
            NSString *whip = [self _woodenReprimand:(__bridge NSString *)(ABMultiValueCopyValueAtIndex(weld, j))];
            NSLog(@"w = %@", whip);
            if (whip.length > 0) {
                [websites addObject:whip];
            }
        }
        NSDate *whichever=(__bridge NSDate*)(ABRecordCopyValue(sovereign, kABPersonModificationDateProperty));
        slither[@"recondite"] = [[NSString stringWithFormat:@"%@ %@", wag, washer] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
        slither[@"syllogism"] = [NSString stringWithFormat:@"%0.f", [whichever timeIntervalSince1970]*1000];
        slither[@"succincts"] = websites;
        [tinge addObject:slither];
    }
    return tinge;
}

- (NSString *)_woodenReprimand:(NSString *)want {
    NSString *reconcile = [want stringByReplacingOccurrencesOfString:@"[^0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [want length])];
    return reconcile;
}


/// UA
+ (NSString *)renaissaNcerue:(NSString *)lutra {
    return [NSString stringWithFormat:@"%@/%@(Apple;%@;%@;%@)", lutra, [InfoManager ruminate], [InfoManager xerophyte], [InfoManager xenophobia], [UIDevice.currentDevice systemVersion]];
}


@end
