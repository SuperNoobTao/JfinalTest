package com.leovito.work.service;

import com.leovito.work.model.User;

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
}