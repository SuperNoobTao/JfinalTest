package com.leovito.work.service;

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
    public List list() {
        List<Staff> staffs = Staff.dao.find("select * from tb_staff");
        System.out.print("得到的数据是" + staffs.size() + "条");
        return staffs;
    }

//    /**
//     * 访问user/form进入from.jsp页面
//     */
//    public void form(){
//        Integer id = getParaToInt(0);
//        if(id!=null&&id>0){
//            setAttr("user",Staff.dao.findById(id));
//        }
//        render("form.jsp");
//
//    }

    /**
     * 提交方法
     */
    public void submit(Staff staff) {

        staff.save();

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
