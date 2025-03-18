#import "BDASignalDefinitions.h"
#import "BDASignalManager.h"
#import "RNReactNativeOceanEngine.h"

static NSDictionary *staticLaunchOptions;

@implementation RNReactNativeOceanEngine {
    bool hasListeners;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

+ (BOOL)requiresMainQueueSetup {
    return YES;
}

RCT_EXPORT_MODULE()

// Will be called when this module's first listener is added.
- (void)startObserving {
    hasListeners = YES;
    // Set up any upstream listeners or background tasks as necessary
}

// Will be called when this module's last listener is removed, or on dealloc.
- (void)stopObserving {
    hasListeners = NO;
    // Remove upstream listeners, stop unnecessary background tasks
}

// 初始化，请在合规同意后调用
RCT_EXPORT_METHOD(init:(NSDictionary *)param resolve:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *userUniqueId = param[@"userUniqueId"];

    if (userUniqueId && ![userUniqueId isEqual:@""]) {
        // 注册可选参数
        [BDASignalManager registerWithOptionalData:@{
             kBDADSignalSDKUserUniqueId: userUniqueId // 业务用户id，非必传
        }];
    }

    // 上报冷启动事件
    [BDASignalManager didFinishLaunchingWithOptions:staticLaunchOptions connectOptions:nil];
    resolve(@(YES));
}

// 获取clickId
RCT_EXPORT_METHOD(getClickId:(NSDictionary *)param resolve:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *clickId = [BDASignalManager getClickId];

    resolve(clickId);
}

+ (void)anylyseDeeplinkClickidWithOpenUrl:(nonnull UIApplication *)application
                                  openURL:(nonnull NSURL *)URL
                                  options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    // 将url参数转换成string类型之后，传递给SDK
    NSString *openUrl = URL.absoluteString;

    [BDASignalManager anylyseDeeplinkClickidWithOpenUrl:openUrl];
}

+ (void)setLaunchOptions:(NSDictionary *_Nonnull)launchOptions {
    staticLaunchOptions = launchOptions;
}

@end
