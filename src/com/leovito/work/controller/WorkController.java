package com.leovito.work.controller;

import com.jfinal.core.Controller;
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
public class WorkController extends Controller{
    WorkService workService = new WorkService();



    public void index(){

          java.sql.Date  date = getSqlDate(getToday());

        List<Work> works = workService.list(date);
        setAttr("works",works);
        System.out.print("得到的数据是"+works.size()+"条");
        render("showwork.ftl");
    }

    public void staff_work(){
        String staffid = getPara("staffid");
        List<Record> works = workService.listbystaff(staffid);
        setAttr("works",works);
        System.out.print("得到的数据是"+works.size()+"条");
        render("staff_work.ftl");
    }




}
