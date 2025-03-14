# react-native-oceanengine

[![npm version](https://badge.fury.io/js/react-native-oceanengine.svg)](https://badge.fury.io/js/react-native-oceanengine)

iOS version：1.0.3

Android version：2.0.0

## 开始

`$ npm install react-native-oceanengine --save`

### iOS

```sh
cd ios
pod install
```

## 使用

### iOS集成

1. 打开iOS工程的 `AppDelegate` 、 `SceneDelegate`，添加如下代码：

```oc
#import "RNReactNativeOceanEngine.h"


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [RNReactNativeOceanEngine setLaunchOptions:launchOptions]; // 添加此行代码
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
  [RNReactNativeOceanEngine anylyseDeeplinkClickidWithOpenUrl:application openURL:url options:options]; // 添加此行代码
  return [RCTLinkingManager application:application openURL:url options:options];
}

```

### 接口

```javascript
import OceanEngine from 'react-native-oceanengine';

// 初始化 SDK，需要在隐私合规同意之后调用
let ret = await OceanEngine.init({
  userUniqueId: 'userUniqueId', // 选填，用户业务标识（仅iOS）
  setEnableLog: true, // 必填，是否开启日志（仅Android）
  oaid: 'oaid', // 选填，OAID（仅Android），为空或者不填则SDK内部自动获取OAID
  androidId: 'androidId', // 选填，AndroidID（仅Android），为空或者不填则SDK内部自动获取AndroidID
}); // 返回true表示初始化成功，false表示初始化失败

// 获取clickId
let clickId = await OceanEngine.getClickId(); // Android下返回空字符串，iOS下返回clickId
```
