#import <React/RCTBridgeModule.h>

@interface RNReactNativeOceanEngine : NSObject <RCTBridgeModule>

+ (void)anylyseDeeplinkClickidWithOpenUrl:(nonnull UIApplication *)application
                                  openURL:(nonnull NSURL *)URL
                                  options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;

+ (void)setLaunchOptions:(NSDictionary *_Nonnull)launchOptions;

@end
