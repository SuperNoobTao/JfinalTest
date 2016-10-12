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
        List<Staff> staffs = staffService.list();
        setAttr("staffs",staffs);
        System.out.print("得到的数据是"+staffs.size()+"条");
        render("showstaff.ftl");
    }

    /**
     * 提交方法
     */
    public  void submit(){
        Staff staff = getModel(Staff.class,"staff");
       staffService.submit(staff);
        redirect("/user");
    }
//    /**
//     * 编辑方法
//     */
//    public void edit(){
//
//        form();
//    }
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
