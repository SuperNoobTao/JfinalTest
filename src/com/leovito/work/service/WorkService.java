package com.leovito.work.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.leovito.work.model.Staff;
import com.leovito.work.model.Work;

import java.util.Date;
import java.util.List;

/**
 * Created by vito on 2016/10/13.
 */
public class WorkService {

    public Boolean save(Work work) {
        work.save();
        if (work.get("work_id") != null) {
            return true;
        }
        return false;
    }




    public List list(java.sql.Date date) {
        List<Record> works = Db.find("select *,s.staff_name,p.project_name from tb_work w,tb_staff s,tb_project p where w.work_staffid=s.staff_id and w.work_projectid=p.project_id and  work_date='" + date + "' ");
        System.out.print("得到的数据是" + works.size() + "条");
        return works;
    }

    public List listbystaff(String staffid) {
        List<Record> works = Db.find("select *,s.staff_name,p.project_name from tb_work w,tb_staff s,tb_project p where w.work_staffid=s.staff_id and w.work_projectid=p.project_id and  work_staffid='" + staffid + "'");
        System.out.print("得到的数据是" + works.size() + "条");
        return works;
    }
    public List todaylist(java.sql.Date date,int staffid) {
        List<Record> works = Db.find("select *,s.staff_name,p.project_name from tb_work w,tb_staff s,tb_project p where w.work_staffid=s.staff_id and w.work_projectid=p.project_id and  work_date='" + date + "' and s.staff_id='" + staffid + "' ");

        System.out.print("得到的数据是" + works.size() + "条");
        return works;
    }


}
