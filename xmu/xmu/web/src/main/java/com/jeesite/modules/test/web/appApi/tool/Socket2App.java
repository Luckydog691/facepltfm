package com.jeesite.modules.test.web.appApi.tool;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;

public class Socket2App extends Socket {
    public Socket2App(String ip,int port) throws IOException {
        super(ip,port);
    }
    public void sendMessage(String jsonStr) throws IOException {
        OutputStream outputStream=this.getOutputStream();
        PrintWriter printWriter=new PrintWriter(outputStream);
        printWriter.write(jsonStr);
        printWriter.flush();
        this.shutdownOutput();
        printWriter.close();
        this.close();
    }
}
