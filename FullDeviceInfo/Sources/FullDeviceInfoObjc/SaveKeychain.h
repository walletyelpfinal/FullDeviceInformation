//
//  SaveKeychain.h
//  FullDeviceInfo
//
//  Created by pastry on 27/08/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SaveKeychain : NSObject

+ (instancetype)sharedInstance;

- (BOOL)saveString:(NSString *)string forKey:(NSString *)key;

- (nullable NSString *)loadStringForKey:(NSString *)key;

- (BOOL)deleteDataForKey:(NSString *)key;



@end

NS_ASSUME_NONNULL_END
