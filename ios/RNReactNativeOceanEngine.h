#import <React/RCTBridgeModule.h>

@class UISceneConnectionOptions;

@interface RNReactNativeOceanEngine : NSObject <RCTBridgeModule>

+ (void)anylyseDeeplinkClickidWithOpenUrl:(nonnull UIApplication *)application
                                  openURL:(nonnull NSURL *)URL
                                  options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;

+ (void)setLaunchOptions:(NSDictionary *_Nonnull)launchOptions;
+ (void)setConnectionOptions:(UISceneConnectionOptions *_Nonnull)connectionOptions;

@end
