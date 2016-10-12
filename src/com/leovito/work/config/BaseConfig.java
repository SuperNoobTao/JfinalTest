package com.leovito.work.config;


import com.jfinal.config.*;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.leovito.work.controller.*;
import com.leovito.work.model.*;

/**
 * Created by vito on 2016/10/11.
 */


public class BaseConfig extends JFinalConfig {


    @Override
    public void configConstant(Constants me) {
        // TODO Auto-generated method stub
        PropKit.use("demo_config.txt");
        me.setBaseViewPath("/WEB-INF/view");
        me.setFreeMarkerViewExtension(".ftl");//freemarker 模板后缀名
        me.setDevMode(PropKit.getBoolean("devMode", false));
    }

    @Override
    public void configHandler(Handlers me) {
        // TODO Auto-generated method stub

    }

    @Override
    public void configInterceptor(Interceptors me) {
        // TODO Auto-generated method stub

    }

    @Override
    public void configPlugin(Plugins me) {
        // TODO Auto-generated method stub
        C3p0Plugin c3p0Plugin = new C3p0Plugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password").trim());
        me.add(c3p0Plugin);
        ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
        me.add(arp);

        arp.addMapping("tb_user","user_id", User.class);
        arp.addMapping("tb_cookie","cookie_id", Cookie.class);
        arp.addMapping("tb_staff","staff_id", Staff.class);
        arp.addMapping("tb_project","project_id", Project.class);
        arp.addMapping("tb_work","work_id", Work.class);
    }

    @Override
    public void configRoute(Routes me) {
        // TODO Auto-generated method stub
        me.add("/hello", AdminController.class,"admin");
        me.add("/", IndexController.class,"admin");	// 第三个参数为该Controller的视图存放路径
        me.add("/staff", StaffController.class,"admin");
        me.add("/project", ProjectController.class,"admin");
        me.add("/user", UserController.class,"user");
    }
}