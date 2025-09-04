//
//  SaveKeychain.m
//  FullDeviceInfo
//
//  Created by pastry on 27/08/25.
//

#import "SaveKeychain.h"
#import <Security/Security.h>


#define kService @"com.fullDeviceInfo.keychain"
#define kAccount @"com.fullDeviceInfo.account"

@implementation SaveKeychain


+ (instancetype)sharedInstance {
    static SaveKeychain *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (BOOL)saveData:(NSData *)data
          forKey:(NSString *)key {
    
    if (!data || !key) {
        return NO;
    }
    
    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    [query setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    [query setObject:kService forKey:(__bridge id)kSecAttrService];
    [query setObject:kAccount forKey:(__bridge id)kSecAttrAccount];
    [query setObject:key forKey:(__bridge id)kSecAttrGeneric];
    
    SecItemDelete((__bridge CFDictionaryRef)query);
    
    [query setObject:data forKey:(__bridge id)kSecValueData];
    
    OSStatus status = SecItemAdd((__bridge CFDictionaryRef)query, NULL);
    
    return (status == errSecSuccess);
}

- (nullable NSData *)loadDataForKey:(NSString *)key {
    
    if (!key) {
        return nil;
    }
    
    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    [query setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    [query setObject:kService forKey:(__bridge id)kSecAttrService];
    [query setObject:kAccount forKey:(__bridge id)kSecAttrAccount];
    [query setObject:key forKey:(__bridge id)kSecAttrGeneric];
    [query setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    [query setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    
    CFTypeRef result = NULL;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
    
    if (status == errSecSuccess && result != NULL) {
        NSData *data = (__bridge_transfer NSData *)result;
        return data;
    }
    
    return nil;
}

- (BOOL)deleteDataForKey:(NSString *)key {
    
    if (!key) {
        return NO;
    }
    
    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    [query setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    [query setObject:kService forKey:(__bridge id)kSecAttrService];
    [query setObject:kAccount forKey:(__bridge id)kSecAttrAccount];
    [query setObject:key forKey:(__bridge id)kSecAttrGeneric];
    
    OSStatus status = SecItemDelete((__bridge CFDictionaryRef)query);
    
    return (status == errSecSuccess || status == errSecItemNotFound);
}


- (BOOL)saveString:(NSString *)string
            forKey:(NSString *)key {
    
    if (!string || !key) {
        return NO;
    }
    
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [self saveData:data forKey:key];
}

- (nullable NSString *)loadStringForKey:(NSString *)key {
    
    NSData *data = [self loadDataForKey:key];
    if (data) {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

@end
