package com.leovito.work.Util;




import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by tzry on 16/6/6.
 */

public class CommonFunctions {
    //得到参数
    //得到IP地址
    public static String getIp(HttpServletRequest request) {

        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)
                || "null".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)
                || "null".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)
                || "null".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * 设置adminsession
     *
     * @param request
     * @param id
     */
    public static void setAdminSession(
            HttpServletRequest request,
            String id
    ) {
        SetSession(request, "admin_id", id);
    }

    /**
     * 得到adminsession
     *
     * @param request
     * @return
     */
    public static String getAdminSession(
            HttpServletRequest request
    ) {
        return (String) getSession(request, "admin_id");
    }


    //设置Session
    public static void SetSession(HttpServletRequest request, String name, Object obj) {

        request.getSession().setAttribute(name, obj);
    }

    //获取Session
    public static Object getSession(HttpServletRequest request, String name) {

        return request.getSession().getAttribute(name);
    }

    //得到参数
    public static Object getParam(HttpServletRequest request, String name) {
        return request.getParameter(name);
    }

    public static String getrequreststr(HttpServletRequest request) {
        BufferedReader reader = null;
        StringBuilder sb = new StringBuilder();
        try {
            reader = new BufferedReader(new InputStreamReader(request
                    .getInputStream(), "utf-8"));
            String line = null;

            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != reader) {
                    reader.close();
                }
            } catch (IOException e) {

            }
        }
        return sb.toString();
    }


    java.sql.Date date = getSqlDate(getToday());
    java.sql.Date yesterday = getSqlDate(getYesterday());


    /**
     * 得到当前时间
     *
     * @return
     */
    public static long getNowTimestamp() {
        return new Date().getTime() / 1000;
    }


    /**
     * 获取今天是这个月的第几天
     *
     * @param date
     * @return
     */
    public static int getDay(java.sql.Date date) {
        SimpleDateFormat df = new SimpleDateFormat("dd");//设置日期格式
        return Integer.parseInt(df.format(date));// new Date()为获取当前系统时间
    }


    /**
     * 获取今天现在几点钟
     *
     * @param date
     * @return
     */
    public static int getHour(Date date) {
        SimpleDateFormat df = new SimpleDateFormat("HH");//设置日期格式
        return Integer.parseInt(df.format(date));// new Date()为获取当前系统时间
    }

    public static int getMinute(Date date) {
        SimpleDateFormat df = new SimpleDateFormat("mm");//设置日期格式
        return Integer.parseInt(df.format(date));// new Date()为获取当前系统时间
    }

    public static int getSecond(Date date) {
        SimpleDateFormat df = new SimpleDateFormat("ss");//设置日期格式
        return Integer.parseInt(df.format(date));// new Date()为获取当前系统时间
    }


    /**
     * 获取昨天的日期
     *
     * @return
     */
    public static Date getYesterday() {
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        date = calendar.getTime();
        return date;
    }


    /**
     * 获取今天的日期
     *
     * @return
     */
    public static Date getToday() {
        Date date = new Date();
        return date;
    }


    /**
     * 把util.date转换成sql.date
     *
     * @param date
     * @return
     */
    public static java.sql.Date getSqlDate(Date date) {
        return new java.sql.Date(date.getTime());
    }


    /**
     * 5：00-7：00 打卡100分
     * 7：00-8：00 打卡50分
     * 8：00-9：00 打卡10分
     *
     * @return
     */
    public static int signedscore() {
        int signedScore = 0;
        int hour = CommonFunctions.getHour(new Date());
        int minute = CommonFunctions.getMinute(new Date());
        int second = CommonFunctions.getSecond(new Date());
        if ((hour >= 5) && (hour < 7) || (hour == 7 && minute == 0 && second == 0)) {
            signedScore = 100;
        } else if ((hour >= 7) && (hour < 8) || (hour == 8 && minute == 0 && second == 0)) {
            signedScore = 50;
        } else if ((hour >= 8) && (hour < 9) || (hour == 9 && minute == 0 && second == 0)) {
            signedScore = 10;
        } else {
            signedScore = 50;//代表不在签到时间之列
        }
        return signedScore;
    }


    /**
     * 得到几天后的时间
     *
     * @param date
     * @param day
     * @return
     */
    public static java.sql.Date getDateAfter(java.sql.Date date, int day) {
        Date d = new Date(date.getTime());
        Calendar now = Calendar.getInstance();
        now.setTime(d);
        now.set(Calendar.DATE, now.get(Calendar.DATE) + day);
        d = now.getTime();
        return new java.sql.Date(d.getTime());
    }


    /**
     * 日期比较
     *
     * @param afdate
     * @return
     */
    public static Boolean compareDate(java.sql.Date afdate, java.sql.Date date1) {
        if (date1.before(afdate))
            return true;
        else
            return false;
    }

    /**
     * 当前签到积分
     * 连续签到3天 奖励100分
     * 连续签到10天 奖励500分
     * 连续签到21天 奖励1500分
     *
     * @param day
     * @return
     */
    public static int serialscore(int score, int day) {
        switch (day) {
            case 3:
                score = score + 100;
                break;
            case 10:
                score = score + 500;
                break;
            case 21:
                score = score + 1500;
                break;
        }
        return score;
    }


    /**
     * 报名是否结束
     *
     * @param startdate
     * @return
     */
    public static Boolean isEntrolOverdue(java.sql.Date today,
                                          java.sql.Date startdate) {
        if (today.before(startdate)) {
            return true;
        } else
            return false;
    }

    /**
     * 活动在正式开始之前？
     *
     * @param startdate
     * @return
     */
    public static Boolean isACTStart(java.sql.Date today,
                                     java.sql.Date startdate,
                                     Date utoday) {
        if (isDateEqual(today, startdate)) {
            if (getHour(utoday) >= 5)
                return false;//活动已经开始
            else
                return true;
        } else if (today.after(startdate))
            return false;//活动已经开始了
        else
            return true;
    }


    /**
     * 检查是活动是否在进行中
     *
     * @param startdate
     * @param finishdate
     * @return
     */
    public static int isACTing(java.sql.Date startdate, java.sql.Date finishdate, java.sql.Date today, Date utoday) {
        int remark = 0;

        if (!getToday().before(startdate) || !getToday().after(finishdate)) {
            if (isDateEqual(today, startdate)) {
                System.out.println(utoday);
                if (getHour(utoday) >= 5) {
                    remark = 1;//可签到
                } else
                    remark = -1;//不在活动时间（当天还没到5点还没开始）
            } else if (isDateEqual(today, finishdate)) {
                if (getHour(utoday) <= 8) {
                    remark = 1;//可签到
                } else
                    remark = -1;//不在活动时间（当天过了8点已经结束了）
            } else {
                remark = 1;//可签到
            }

        } else {
            remark = -1;//不在活动期间（在活动时间之外）
        }
        return remark;

    }

    /**
     * 判断两个日期是否在同一天
     *
     * @param date1
     * @param date2
     * @return
     */
    public static Boolean isDateEqual(java.sql.Date date1, java.sql.Date date2) {
        Date d1_temp = java.sql.Date.valueOf(date1.toString());
        Date d2_temp = java.sql.Date.valueOf(date2.toString());
        if (d1_temp.equals(d2_temp)) {
            return true;
        } else
            return false;
    }



    public static void main(String[] args) {


    }

    public static String getuuid(HttpServletRequest request){
        String uuid = "";

        Cookie[] cookies = request.getCookies();
        if (cookies!=null) {
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("token"))
                    uuid=cookie.getValue();
            }
        }
        return uuid;
    }
}
