package com.leovito.work.model;

/**
 * Created by vito on 2016/10/11.
 */
import com.jfinal.plugin.activerecord.Model;

public class User extends Model<User> {
    public static final User dao = new User();
}