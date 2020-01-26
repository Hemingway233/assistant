package com.whm.assistant.test;

import cn.hutool.core.date.DateUtil;

import java.util.Calendar;
import java.util.Date;

/**
 * @program: com.whm.assistant.test
 * @ClassName: DateTimeTest
 * @Date: 2019/12/12 21:13
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:
 */
public class DateTimeTest {

    public static void main(String[] args) {
        //当前时间
        Date date = DateUtil.date();
        //当前时间
        Date date2 = DateUtil.date(Calendar.getInstance());
        //当前时间
        Date date3 = DateUtil.date(System.currentTimeMillis());
        System.out.println(date);
        System.out.println(date2);
        System.out.println(date3);

        String dateStr = "2017-03-01";
        Date date4 = DateUtil.parse(dateStr,"yyyy-MM-dd");
        System.out.println(date4);

        //当前时间字符串，格式：yyyy-MM-dd HH:mm:ss
        String now= DateUtil.now();
        //去除字符串时间的横杠、空格、冒号
        String replaceAll = now.replaceAll("[[\\s-:punct:]]", "");
        System.out.println(replaceAll);

    }
}
