package com.jeesite.modules.test.image;

import sun.misc.BASE64Encoder;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class ImageToBase64 {
    public String ImageToBase64 (String filepath){
        byte[] data = null;
        InputStream in;

        {
            try {
                in = new FileInputStream(filepath);
                data = new byte[in.available()];
                in.read(data);
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        BASE64Encoder encoder = new BASE64Encoder();
        //System.out.println(encoder.encode(data));
        return encoder.encode(data);
    }
    
}
