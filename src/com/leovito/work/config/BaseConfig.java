package com.leovito.work.config;


import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.wall.WallFilter;
import com.jfinal.config.*;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.druid.DruidStatViewHandler;
import com.jfinal.plugin.druid.IDruidStatViewAuth;
import com.leovito.work.controller.HelloController;
import com.leovito.work.controller.IndexController;
import com.leovito.work.model.Cookie;
import com.leovito.work.model.User;

import javax.servlet.http.HttpServletRequest;

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
    }

    @Override
    public void configRoute(Routes me) {
        // TODO Auto-generated method stub
        me.add("/hello", HelloController.class);
        me.add("/", IndexController.class,"html");	// 第三个参数为该Controller的视图存放路径


    }
}