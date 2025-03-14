import {NativeModules} from 'react-native';

const {RNReactNativeOceanEngine} = NativeModules;

class OceanEngine {
    static init = async (params) => {
        return await RNReactNativeOceanEngine.init(params ?? {});
    };

    static getClickId = async () => {
        return await RNReactNativeOceanEngine.getClickId({});
    };
}

export default OceanEngine;
