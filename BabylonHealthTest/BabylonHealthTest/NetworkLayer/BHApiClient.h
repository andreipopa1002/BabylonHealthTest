//
//  APIClient.h
//  BabylonHealthTest
//
//  Created by Popa Andrei on 05/06/2015.
//  Copyright (c) 2015 Popa Andrei. All rights reserved.
//

#import "AFNetworking.h"

/**
 * This class is intended to encapsulate all the network comunicatinon
 */
@interface BHApiClient : AFHTTPSessionManager

/**
 *  SharedClient
 *
 *  @return Shared instance for the BHApiClient class
 */
+ (instancetype)sharedClient;

/**
 *  This method will retrieve list of contacts
 */
- (void)retrieveContactListWithCompletion:(void(^)(NSArray *contacts))callbackBlock;

@end
