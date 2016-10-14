package com.leovito.work.controller;

import com.jfinal.core.Controller;
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
        int page = Integer.parseInt(getPara("page"));


        int total=staffService.listcount(name);
        if(page==0){
            page=1;
        }
        int totalpage=(int)Math.ceil(total*1.0f/10);
        if(totalpage==0){
            totalpage=1;
        }

        if(page<0){
            page=1;
        }
        if(page>totalpage){
            page=totalpage;
        }
        List<Staff> staffs = staffService.list(name,page,10);

        setAttr("staffs",staffs);
        System.out.print("得到的数据是"+staffs.size()+"条");
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
