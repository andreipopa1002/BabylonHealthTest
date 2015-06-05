//
//  APIClient.m
//  BabylonHealthTest
//
//  Created by Popa Andrei on 05/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "BHApiClient.h"
#import "AFNetworkActivityIndicatorManager.h"

static NSString *const kAPIBaseURLString = @"http://fast-gorge.herokuapp.com/";

typedef NS_ENUM(NSInteger, APIHTTPMethod) {
    APIHTTPMethodGet,
    APIHTTPMethodPost,
};

@implementation BHApiClient

+ (instancetype)sharedClient {
    static BHApiClient *_sharedClient;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[BHApiClient alloc] initWithBaseURL:[NSURL URLWithString:kAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
        AFNetworkActivityIndicatorManager.sharedManager.enabled = YES;
    });
    
    return _sharedClient;
}

# pragma mark - API methods
- (void)retrieveContactListWithCompletion:(void(^)(NSArray *contacts))callbackBlock {
    [self getRequestWithPath:@"contacts/" parameters:nil callbackBlock:^(id responseObject) {
        if (responseObject) {
            if (callbackBlock) {
                callbackBlock(responseObject);
            }
        } else if (callbackBlock) {
            callbackBlock(nil);
        }
    }];
}

# pragma mark - Requests
- (void)getRequestWithPath:(NSString *)path parameters:(NSDictionary *)parameters callbackBlock:(void (^)(id responseObject))callbackBlock {
    [self requestWithPath:path method:APIHTTPMethodGet parameters:parameters callbackBlock:callbackBlock];
}

- (void)requestWithPath:(NSString *)path method:(APIHTTPMethod)method parameters:(NSDictionary *)parameters
          callbackBlock:(void (^)(id responseObject))callbackBlock {
    void (^successPath)(NSDictionary *) = ^(NSDictionary *responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (responseObject){
                callbackBlock(responseObject);
            } else {
                callbackBlock(nil);
            }
        });
    };
    
    void (^errorPath)(NSError *) = ^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self handleError:error];
            callbackBlock(nil);
        });
    };
    
    if (method == APIHTTPMethodGet) {
        [self GET:path parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            successPath(responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            errorPath(error);
        }];
    }
}

# pragma mark - Error handling
- (void)handleError:(NSError *)error {
    NSString *errorString = [NSString stringWithFormat:@"%ld - %@",(long)error.code,error.domain];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil)
                                                        message:errorString
                                                       delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

@end
