//
//  Ensighten.h
//  Ensighten
//
//  Created by Scott Price
//  Copyright 2011 Ensighten, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class NSTNReachability, NSTNApplicationVersion, ASIHTTPRequest, NSTNWebView;
@class EnsightenInstructionProcessor, NSTNUncaughtExceptionHandler;
@class NSTNBatteryWatch, UIDevice_IdentifierAddition, EnsightenQueueItem, NSTNQueueManager;
@class EnsightenUtils, NSTNAsyncConnection, NSTNLogger, EnsightenSession;




@interface Ensighten : NSObject <UIAlertViewDelegate> {
    
    // Admin mode
    BOOL isAdminMode;
	BOOL isAdminVerified;
    
    // Admin prompt
	UIView* overlay;
	UITextField *adminKey;
    UIAlertView *adminKeyAlert;

    // View Controller
	NSString *firstVC;
	NSString *currentVC;
    NSString *currentVCTitle;
    UIViewController* currentVCObj;

    
	NSDateFormatter *formatter;
    
    // Processing
    EnsightenInstructionProcessor *cpu;
    EnsightenUtils *utils;
    
}

@property (strong, nonatomic) NSString *firstVC;
@property (strong, nonatomic) NSString *currentVC;
@property (strong, nonatomic) NSString *currentVCTitle;
@property (strong, nonatomic) UIViewController *currentVCObj;

@property (strong, nonatomic) EnsightenSession *session;
@property (strong, nonatomic) NSString *curRuleId;
@property int postedToClient_connected;
@property int postedToClient_started;
@property BOOL isAdminMode;


// Public methods
+ (void)setAdminOrTestFlag:(NSString *)flag;
+ (void)bootstrapForClient:(NSString*)clientID andApp:(NSString*)appID;
+ (void)viewDidAppear:(NSString*)viewControllerName;


// Instance
+ (Ensighten*)sharedInstance;


// Processing
- (void)evaluate:(SEL)selector className:(NSString*)className args:(NSArray*)args invocation:(NSInvocation*)invocation;
- (void)processInitEvent;
- (void)callJSAppLifeCycleEventHandler;
- (void)handleCall:(NSString*)functionName callbackId:(int)callbackId args:(id)args;
- (NSString *)formulateGatewayWrapperForQueuing: (NSString *)value andQueueItem: (EnsightenQueueItem *)qItem;
- (void)executeQueuedJavaScriptObject: (NSString *)gatewayWrapper;


// Handling live javascript objects (not queued)
- (void)executeJavaScript: (NSString *)value andQueueItem: (EnsightenQueueItem *)qItem;
- (NSString *)evaluateJS:(NSString*)value isCacheable:(BOOL)isCacheable;


//Extra getters
- (NSString *)currentRuleID;
+ (EnsightenSession *)session;
- (void)createAdminPrompt;
- (void)didPostConnectedToClient;
- (void)didPostStartedToClient;

- (NSString *)buildConfigUrlString;
- (NSString *)buildTagUrlString;


@end
