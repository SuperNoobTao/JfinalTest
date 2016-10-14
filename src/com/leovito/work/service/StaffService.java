package com.leovito.work.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.leovito.work.model.Staff;
import com.leovito.work.model.User;

import java.util.List;

/**
 * Created by vito on 2016/10/12.
 */
public class StaffService {

    /**
     * 直接访问user地址进入list.jsp
     */
    public Page<Staff> list(String name ,int page,int  pagesize) {
        Page<Staff> staffs = Staff.dao.paginate(page,pagesize,"select *","select * from tb_staff");
        return staffs;
    }


    /**
     * 提交方法
     */
    public int listcount(String staffname) {
        String sql = "select count(*) from tb_staff where staff_name like '%" + staffname + "%'";
        int total = Db.queryInt(sql);
        return total;
    }
//    /**
//     * 编辑方法
//     */
//    public void edit(){
//
//        form();
//    }

    /**
     * 删除方法
     */
    public void del(String staff_id) {
        Staff.dao.deleteById(staff_id);
    }

    /**
     * 更新方法
     */
    public void update(Staff staff) {
        staff.update();
    }


    public Staff findUser(String account, String pwd) {
        Staff staff = new Staff();
        staff = null;
        String sql = "select * from tb_staff where staff_account='" + account + "' and staff_pwd='" + pwd + "';";
        staff = Staff.dao.findFirst(sql);
        System.out.printf("sql:" + sql);
        return staff;
    }


}
