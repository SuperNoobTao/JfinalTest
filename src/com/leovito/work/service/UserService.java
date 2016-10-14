package com.leovito.work.service;

import com.jfinal.plugin.activerecord.Db;
import com.leovito.work.model.Project;
import com.leovito.work.model.User;
import com.leovito.work.model.Work;
import com.sun.scenario.effect.Effect;

import java.util.List;

/**
 * Created by vito on 2016/10/11.
 */
public class UserService {

    public User findUser(String account, String pwd) {
        User user = new User();
        user = null;
        String sql = "select * from tb_user where user_account='" + account + "' and user_pwd='" + pwd + "';";
        user = User.dao.findFirst(sql);
        System.out.printf("sql:" + sql);
        return user;
    }


    public Boolean saveUser(User user) {
        String account = user.get("user_account");
        String pwd = user.get("user_pwd");
        String sql = "select * from tb_user where user_account='" + account + "'";
        user = User.dao.findFirst(sql);
        if (user == null) {
            new User().set("user_account", account).set("user_pwd", pwd).save();
            String acount = user.get("id");
            if (account != null) {
                return true;
            }
        }
        return false;
    }


    public Boolean isrecord(int staffid,java.sql.Date today){
        String sql = "select * from tb_work where work_staffid='" + staffid + "'and work_date ='" + today + "'";
        Work work = Work.dao.findFirst(sql);

        if(work!=null){
            return true;
        }
        return  false;

    }


    public List projectlist(){
        List<Project> projects = Project.dao.find("select * from tb_project where project_state = 1 ");

        System.out.print("得到的数据是"+projects.size()+"条");
        return projects;
    }


}