package com.leovito.work.service;

import com.leovito.work.model.Cookie;
import com.leovito.work.model.User;

/**
 * Created by vito on 2016/10/11.
 */
public class CookieService {

    public String findUserid(String cookie) {


        String sql = "select cookie_userid from tb_cookie where cookie_id='" + cookie + "' ;";

        String userid  = Cookie.dao.getStr(sql);

        System.out.printf("sql:" + sql);

        return userid;
    }

}
