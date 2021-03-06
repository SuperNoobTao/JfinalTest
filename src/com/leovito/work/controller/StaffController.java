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
public class StaffController extends Controller {

    StaffService staffService = new StaffService();

    /**
     * x
     * 分页显示员工
     */
    public void index() {
        String name = getPara("name");
        String strpage = getPara("page");
        int page;
        if (strpage == null) {
            page = 1;
        } else {
            page = Integer.valueOf(strpage);
        }
        if (name == null) {
            name = "";
        }
        Page<Staff> staffs = staffService.list(name, page, 10);

        setAttr("staffs", staffs);
        setAttr("name", name);
        render("showstaff.ftl");
    }




}
