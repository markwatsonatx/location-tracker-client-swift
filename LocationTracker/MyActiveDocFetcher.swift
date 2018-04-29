//
//  MyActiveDocFetcher.swift
//  LocationTracker
//
//  Created by Mark Watson on 6/30/16.
//  Copyright © 2016 Mark Watson. All rights reserved.
//

import Foundation

class MyActiveDocFetcher: NSObject, CDTActiveDocFetcherDelegate {
    
    func getFetchAllActiveDocsRequest() -> NSMutableURLRequest! {
        let credentials = "\(AppState.locationDbApiKey!):\(AppState.locationDbApiPassword!)"
        let url = NSURL(string:"http://\(credentials)@\(AppState.locationDbHost!)/\(AppState.locationDbName!)/_all_docs?include_docs=false")
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url!)
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData;
        request.HTTPMethod = "GET";
        
        // Add headers from my .requestHeaders property:
//        for(NSString *key in self.requestHeaders) {
//            [request setValue:self.requestHeaders[key] forHTTPHeaderField:key];
//        }
//        NSArray *requestHeadersKeys = [self.requestHeaders allKeys];
//        if (self.authorizer) {
//            NSString* authHeader = [self.authorizer authorizeURLRequest:self.request forRealm:nil];
//            if (authHeader) {
//                if ([requestHeadersKeys containsObject:@"Authorization"]) {
//                    CDTLogWarn(CDTREPLICATION_LOG_CONTEXT, @"%@ Overwriting 'Authorization' header with "
//                    @"value %@", self, authHeader);
//                }
//                [request setValue: authHeader forHTTPHeaderField:@"Authorization"];
//            }
//        }
        return request;
    }

    func parseActiveDocsFromResponse(body: NSData!, errorMessage: AutoreleasingUnsafeMutablePointer<NSString?>) -> [AnyObject]! {
        return [CDTActiveDoc(id:"026DE45F-8593-49AE-8688-87D046B9E678", revision:"3-7533c99d09f270d8ace8777ee37ab76e")]
    }
}