package com.leovito.work.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * Created by vito on 2016/10/12.
 */
public class Staff extends Model<Staff>{
    public static final Staff dao = new Staff();

    //静态常量
    public static final int SEX_MALE = 1;//男
    public static final int SEX_FEMALE = 2;//女性

}
