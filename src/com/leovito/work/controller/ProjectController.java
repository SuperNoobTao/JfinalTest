package com.leovito.work.controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.leovito.work.Util.StringUtil;
import com.leovito.work.model.Project;
import com.leovito.work.service.ProjectService;


import java.util.List;

/**
 * Created by vito on 2016/10/12.
 */
public class ProjectController extends Controller {

    ProjectService projectService = new ProjectService();

    /**
     * （管理员）项目模块
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
        Page<Project> projects = projectService.list(name, page, 10);
        setAttr("projects", projects);
        setAttr("name", name);
        render("showproject.ftl");
    }

    /**
     * 进入添加项目页面
     */
    public void addui() {
        render("addproject.ftl");
    }

    /**
     * 添加项目，默认状态“进行中”
     */
    public void add() {
        String name = getPara("name");
        int state = 0;
        String msg = projectService.add(name, state);
        renderJson("state", msg);
    }


    /**
     * 添加项目，默认状态“进行中”
     */
    public void update() {
        String name = getPara("name");
        String projectid = getPara("projectid");
        String state = getPara("state");
        Boolean msg = new Project().findById(projectid).
                set("project_name", name).
                set("project_state", state).update();
        if (msg) {
            renderJson("state", StringUtil.SUCCESS);
        } else
            renderJson("state", StringUtil.DB_WRITTEN_ERROR);
    }


}
