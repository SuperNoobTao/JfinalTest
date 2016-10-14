package com.leovito.work.service;

import com.leovito.work.model.Project;
import com.leovito.work.model.Staff;

import java.util.List;

/**
 * Created by vito on 2016/10/12.
 */
public class ProjectService {

    /**
     * 直接访问user地址进入list.jsp
     */
    public List list(){
        List<Project> projects = Project.dao.find("select * from tb_project");

        System.out.print("得到的数据是"+projects.size()+"条");
        return projects;
    }





}
