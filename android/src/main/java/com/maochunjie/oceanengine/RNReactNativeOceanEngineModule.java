package com.maochunjie.oceanengine;

import com.bytedance.ads.convert.BDConvert;
import com.bytedance.ads.convert.config.BDConvertConfig;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;

public class RNReactNativeOceanEngineModule extends ReactContextBaseJavaModule {
    private final ReactApplicationContext reactContext;

    public RNReactNativeOceanEngineModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNReactNativeOceanEngine";
    }

    // 初始化，在隐私合规同意之后调用
    @ReactMethod
    public void init(final ReadableMap data, final Promise p) {
        String oaid = data.getString("oaid"); // OAID
        String androidId = data.getString("androidId"); // androidId
        boolean setEnableLog = data.getBoolean("setEnableLog");


        BDConvertConfig config = new BDConvertConfig();
        // 配置不自动发送事件
        config.setAutoSendLaunchEvent(false);

        // 是否开启debug日志，默认为false，在排查问题时使用
        config.setEnableLog(setEnableLog);

        // 配置自定义OAID获取逻辑，默认不配置；若配置，则SDK自身不会有采集OAID的行为，会调用这个Callback获取
        if (oaid != null && !oaid.isEmpty()) {
            config.setCustomOaidCallback(() -> oaid);
        }

        // 配置自定义Android_id获取逻辑，默认不配置；若配置，则SDK自身不会有采集android_id的行为，会调用这个Callback获取
        // 请正确回传Android_id值，错误传值会导致归因失败
        if (androidId != null && !androidId.isEmpty()) {
            config.setCustomAndroidIDCallback(() -> androidId);
        }

        BDConvert.INSTANCE.init(reactContext.getCurrentActivity().getApplication(), config);
        BDConvert.INSTANCE.sendLaunchEvent(reactContext); // 发送

        p.resolve(true);
    }

    // 获取clickId
    @ReactMethod
    public void getClickId(final ReadableMap data, final Promise p) {
        p.resolve("");
    }
}
