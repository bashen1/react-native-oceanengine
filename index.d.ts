interface InitParams {
    /**
     * 业务用户id，非必传（仅iOS）
     */
    userUniqueId?: string;
    /**
     * 是否开启日志，必传（仅Android）
     */
    setEnableLog: boolean;
    /**
     * OAID，非必传（仅Android）
     * 注意：为空或者不填则SDK内部自动获取OAID
     */
    oaid?: string;
    /**
     * AndroidID，非必传（仅Android）
     * 注意：为空或者不填则SDK内部自动获取AndroidID
     */
    androidId?: string;
}

export default class OceanEngine {
    /**
     * 初始化，需要在隐私合规同意之后调用
     */
    static init(params: InitParams): Promise<boolean>;

    /**
     * 获取clickId，Android返回空字符串
     */
    static getClickId(): Promise<string>;
}
