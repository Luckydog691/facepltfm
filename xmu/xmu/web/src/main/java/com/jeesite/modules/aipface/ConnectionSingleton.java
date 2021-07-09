package com.jeesite.modules.aipface;

import com.baidu.aip.face.AipFace;

/*
* baiduSDK connection
* @author Jiuyi Liu
* */
public class ConnectionSingleton
{
    //设置APPID/AK/SK
    private static final String APP_ID = "24503591";
    private static final String API_KEY = "asCh0jSNPgVrhRUL5OVirGg3";
    private static final String SECRET_KEY = "OlVvKpWp21qfhqp9bDrFEqhpsS8wty8G";
    private static AipFace instance = new AipFace(APP_ID, API_KEY, SECRET_KEY);
    private ConnectionSingleton(){}
    //获取唯一可用的对象
    public static AipFace getInstance(){
        //instance.setConnectionTimeoutInMillis(2000);
        //instance.setSocketTimeoutInMillis(60000);
        return instance;
    }
}
