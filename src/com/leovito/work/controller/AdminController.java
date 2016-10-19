package com.leovito.work.controller;

/**
 * Created by vito on 2016/10/11.
 */



import com.jfinal.core.Controller;
import com.leovito.work.model.User;
import com.leovito.work.service.UserService;

public class AdminController extends Controller {

    UserService userService = new UserService();

    /**
     * （管理员）首页
     */
    public void index()
    {
        String account = getPara("account");
        String pwd = getPara("pwd");
        User user = userService.findUser(account, pwd);
        if (user != null) {
            render("index.ftl");
        } else {
            render("login.ftl");
        }

    }


}