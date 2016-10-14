package com.leovito.work.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.leovito.work.model.Staff;
import com.leovito.work.model.User;
import com.leovito.work.service.StaffService;

import java.util.List;

/**
 * Created by vito on 2016/10/12.
 */
public class StaffController extends Controller{

    StaffService staffService = new StaffService();

    /**x
     * 直接访问user地址进入list.jsp
     */
    public void index(){
        String name  = getPara("name");
        String strpage =getPara("page");
        int page ;
        if (strpage==null) {
            page = 1;
        }else {
            page  = Integer.valueOf(strpage);
        }
        if (name==null) {name = "";}
        Page<Staff> staffs = staffService.list(name,page,10);

        setAttr("staffs",staffs);
        setAttr("name",name);
        render("showstaff.ftl");
    }


    /**
     * 删除方法
     */
    public void del(){
        staffService.del(getPara(0));
        redirect("/user");
    }
    /**
     * 更新方法
     */

    public void update(){
        Staff staff = getModel(Staff.class,"staff");
        staff.update();
        redirect("/user");
    }




}
