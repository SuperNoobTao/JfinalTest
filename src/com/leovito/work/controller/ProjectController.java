package com.leovito.work.controller;

import com.jfinal.core.Controller;
import com.leovito.work.model.Project;
import com.leovito.work.service.ProjectService;
import com.leovito.work.service.StaffService;

import java.util.List;

/**
 * Created by vito on 2016/10/12.
 */
public class ProjectController extends Controller{

    ProjectService projectService = new ProjectService();

    /**
     * 直接访问user地址进入list.jsp
     */
    public void index(){
        List<Project> projects = projectService.list();
        setAttr("projects",projects);
        System.out.print("得到的数据是"+projects.size()+"条");
        render("showproject.ftl");
    }


    public void addui(){
        render("addproject.ftl");
    }

}
