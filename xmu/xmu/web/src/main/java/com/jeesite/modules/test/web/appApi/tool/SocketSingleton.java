package com.jeesite.modules.test.web.appApi.tool;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class SocketSingleton {
    private static SocketSingleton instance=null;
    private Logger logger;
    private ServerSocket serverSocket;
    private Socket socket;
    private BufferedWriter bufferedWriter;
    private List<String> msgList;
    private long last_socket = 0;
    private long last_stream = 0;
    private SocketSingleton() throws IOException {
        serverSocket=new ServerSocket(12345);
        serverSocket.setSoTimeout(0);
        msgList=new ArrayList<>();
        logger= LoggerFactory.getLogger(this.getClass());
        //*
        Thread thread = new Thread(){
            public void run(){
                while (true) {
                    try {
                        socket = serverSocket.accept();
                        socket.setKeepAlive(true);
                        last_socket = System.currentTimeMillis();
                        logger.info("a new socket from thread");
                        addMsg("hhh");
                        send();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        };
        thread.start();
        //*/
    }
    public static synchronized SocketSingleton getInstance() throws IOException {
        if(instance==null){
            instance= new SocketSingleton();
        }
        return instance;
    }
    public void accept() throws IOException {
        if(isDisconnect()){
            logger.info("socket is null,create");
            socket = serverSocket.accept();
            socket.setKeepAlive(true);
            last_socket = System.currentTimeMillis();
            addMsg("hhh");
            send();
            logger.info("a new socket from accept");
        }
        else
        {
            logger.info("socket is not null");
        }
    }
    public void addMsg(String jsonStr){
        msgList.add(jsonStr);
    }
    public boolean delMsg(String jsonStr){
        if(msgList.contains(jsonStr))
        {
            msgList.remove(jsonStr);
            return true;
        }
        return false;
    }
    public int send() throws IOException {
        int count=0;
        if(bufferedWriter==null || last_socket != last_stream){
            bufferedWriter=new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
            last_stream = last_socket;
            logger.info("update buffer.");
        }
        while(!msgList.isEmpty()){
            sendOnce();
            count++;
        }
        return count;
    }
    public boolean isDisconnect(){
        if(socket == null || socket.isConnected()==false)
            return true;
        return false;
    }
    private boolean sendOnce(){
        try {
            String str=msgList.remove(0);
            bufferedWriter.write(str);
            bufferedWriter.newLine();
            bufferedWriter.flush();
            logger.info("sent one msg success");
        }catch (SocketException e){
            logger.error("socket disconnect");
            socket=null;
            logger.info("socket is null");
        }
        catch (IOException e) {
            logger.error("socket other error");
            e.printStackTrace();
            return false;
        }
        return true;
    }
}

