package com.leovito.work.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.leovito.work.model.Staff;
import com.leovito.work.model.Work;
import com.leovito.work.service.WorkService;

import java.sql.Date;
import java.util.List;

import static com.leovito.work.Util.CommonFunctions.getSqlDate;
import static com.leovito.work.Util.CommonFunctions.getToday;

/**
 * Created by vito on 2016/10/13.
 */
public class WorkController extends Controller {
    WorkService workService = new WorkService();

    /**
     * （管理员）分页显示工作日志
     */
    public void index() {
        String name = getPara("name");
        String date = getPara("date");
        String strpage = getPara("page");
        int page;
        if (strpage == null) {
            page = 1;
        } else {
            page = Integer.valueOf(strpage);
        }
        if (name == null) name = "";
        if (date == null) date = String.valueOf(getSqlDate(getToday()));

        Page<Record> works = workService.list(name, date, page, 10);
        setAttr("works", works);
        setAttr("name", name);
        setAttr("date", date);
        render("showwork.ftl");
    }

    /**
     *
     */
    public void staff_work() {
        String staffid = getPara("staffid");
        List<Record> works = workService.listbystaff(staffid);
        setAttr("works", works);
        System.out.print("得到的数据是" + works.size() + "条");
        render("staff_work.ftl");
    }


}
