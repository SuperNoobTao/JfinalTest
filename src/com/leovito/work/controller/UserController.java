package com.leovito.work.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.leovito.work.model.Staff;
import com.leovito.work.service.StaffService;

/**
 * Created by vito on 2016/10/12.
 */
@Before(Tx.class)
public class UserController extends Controller {
    StaffService staffService = new StaffService();



    public  void notlogin(){
        render("login.ftl");
    }


    /**
     * denglu
     */
    public void login()
    {
        String account = getPara("account");
        String pwd = getPara("pwd");
        Staff staff = new Staff();
        staff = null;

        staff = staffService.findUser(account, pwd);

        if (staff != null) {
            render("index.ftl");
        } else {
            render("login.ftl");
        }

    }

    /**
     * add work
     */
    public void addWork(){


    }


}
