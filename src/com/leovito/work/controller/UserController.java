package com.leovito.work.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.leovito.work.model.Project;
import com.leovito.work.model.Staff;
import com.leovito.work.model.Work;
import com.leovito.work.service.ProjectService;
import com.leovito.work.service.StaffService;
import com.leovito.work.service.UserService;
import com.leovito.work.service.WorkService;

import java.util.List;

import static com.leovito.work.Util.CommonFunctions.getSqlDate;
import static com.leovito.work.Util.CommonFunctions.getToday;


/**
 * Created by vito on 2016/10/12.
 */
@Before(Tx.class)
public class UserController extends Controller {
    StaffService staffService = new StaffService();
    WorkService workService = new WorkService();
    UserService userService = new UserService();

    public void login() {
        render("login.ftl");
    }


    /**
     * denglu
     */
    public void index() {
        String account = getPara("account");
        String pwd = getPara("pwd");
        Staff staff = new Staff();
        staff = null;
        staff = staffService.findUser(account, pwd);
        if (staff != null) {
            java.sql.Date today = getSqlDate(getToday());
            int staffid = staff.get("staff_id");
            List<Project> projects = userService.projectlist();
            List<Record> works = workService.todaylist(today, staffid);
            setAttr("works", works);
            setSessionAttr("staffid", staff.get("staff_id"));
            setAttr("staff", staff);
            setAttr("today", today);
            setAttr("projects", projects);
            render("index.ftl");
        } else {
            render("login.ftl");
        }

    }

    /**
     * add work
     */
    public void addwork() {
        String time = getPara("time");
        String projectid = getPara("projectid");
        java.sql.Date date = getSqlDate(getToday());
        int staffid = getSessionAttr("staffid");
        System.out.println("staffid=" + staffid);
        Work work = new Work().set("work_staffid", staffid)
                .set("work_projectid", projectid)
                .set("work_time", time)
                .set("work_date", date);
        if (workService.save(work)) {
            renderJson("state", "00000");
        } else {
            renderJson("state", "10000");
        }

    }

    /**
     * del work
     */
    public void delwork() {
        String workid = getPara("workid");
        Work.dao.deleteById(workid);
        if (Work.dao.findById(workid)==null) {
            renderJson("state","00000");
        }else {
            renderJson("state","20000");
        }
    }

    /**
     * del work
     */
    public void record() {
        String date = getPara("date");
        if (date == null) date = String.valueOf(getSqlDate(getToday()));
        String staffid = getPara("staffid");
        List<Work> works = workService.listby(date,staffid);
        setAttr("works",works);
    }
}
