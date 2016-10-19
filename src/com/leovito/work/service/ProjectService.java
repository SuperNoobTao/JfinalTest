package com.leovito.work.service;

import com.jfinal.plugin.activerecord.Page;
import com.leovito.work.Util.StringUtil;
import com.leovito.work.model.Project;
import com.leovito.work.model.Staff;

import java.util.List;

/**
 * Created by vito on 2016/10/12.
 */
public class ProjectService {

    /**
     *
     */
    public Page<Project> list(String name,int page,int  pagesize){
        Page<Project> projects =
                Project.dao.paginate(
                        page,
                        pagesize,
                        "select *",
                        "from tb_project where project_name like '%"+name+"%'");
        return projects;
    }

    public String add(String name,int state){
       Boolean msg = new Project().
               set("project_name",name).
               set("project_state",state).save();
        if (msg) {
            return StringUtil.SUCCESS;
        }
        return StringUtil.DB_WRITTEN_ERROR;
    }





}
