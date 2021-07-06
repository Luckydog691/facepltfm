package com.jeesite.modules.test.web.appApi;

import com.jeesite.common.web.BaseController;
import com.jeesite.modules.test.web.appApi.tool.Socket2App;
import com.jeesite.modules.test.web.appApi.tool.SocketSingleton;
import org.springframework.web.bind.annotation.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.logging.Logger;

//@CrossOrigin
@Controller
@RequestMapping(value ="${frontPath}/appApi")
public class AppController extends BaseController {

    @RequestMapping(value = "getstring",method = RequestMethod.GET)
    public void getString(String string, String name, HttpServletResponse response) throws IOException {
        response.getWriter().write("String = " + string + ", name = "+ name +"!!!");
    }
    @RequestMapping(value = "getInt",method = RequestMethod.GET)
    public void getInt(HttpServletResponse response) throws IOException {
        response.getWriter().write("1");
    }

    @RequestMapping(value="url")
    public String arr(HttpServletRequest request,HttpServletResponse response){
        return "modules/app/testAJAX";
    }

    @RequestMapping(value = "getpost",method = RequestMethod.POST)
    public void getPost(String string, String name , HttpServletResponse response) throws IOException {
        response.getWriter().write("String = " + string + ", name = "+ name +"!!!");
    }
    @RequestMapping(value = "getnull",method = RequestMethod.POST)
    public void getnull(HttpServletResponse response) throws IOException {
        response.getWriter().write("POST!!!");
    }
    @RequestMapping(value="socket")
    public void socket2App() throws IOException {
        SocketSingleton socketSingleton=SocketSingleton.getInstance();
        logger.info("enter accept");
        socketSingleton.accept();
        socketSingleton.addMsg("hhh");
        socketSingleton.send();
    }
    @RequestMapping(value="testbody",method = RequestMethod.POST)
    public void testbody(HttpServletRequest request) throws IOException {
        logger.info("enter");
        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String line = null;
        StringBuilder sb = new StringBuilder();
        while((line = br.readLine())!=null){
            sb.append(line);
        }
        logger.info(sb.toString());
    }
}
