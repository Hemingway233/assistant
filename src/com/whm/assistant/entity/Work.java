package com.whm.assistant.entity;

import javax.persistence.*;

/**
 * @program: com.whm.assistant.entity
 * @ClassName: Work
 * @Date: 2019/12/20 10:31
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:
 */
@Entity
@Table(name = "lab_work")
public class Work {
    /**
     * 主键
     */
    @Id
    @Column(name = "wid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)    //主键自增长
    private int wid;
    /**
     * 周次
     */
    @Column(name = "weekTime")
    private String weekTime;
    /**
     * 时间日期（年/月/日）
     */
    @Column(name = "workTime")
    private String workTime;
    /**
     * 系统时间（（时/分/秒））
     */
    @Column(name = "sysTime")
    private String sysTime;
    /**
     * 星期
     */
    @Column(name = "week")
    private String week;
    /**
     * 工作内容
     */
    @Column(name = "jobContent")
    private String jobContent;
    /**
     * 学生信息实体类
     */
    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, fetch = FetchType.EAGER)  //设置级联更新、级联保存、急加载
    @JoinColumn(name = "stuId", referencedColumnName = "stuId")
    private Student student;

    /**
     * 用户信息实体类
     */
    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, fetch = FetchType.EAGER)  //设置级联更新、级联保存、急加载
    @JoinColumn(name = "userId", referencedColumnName = "userId")
    private User user;

    public Work() {
    }

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public String getWeekTime() {
        return weekTime;
    }

    public void setWeekTime(String weekTime) {
        this.weekTime = weekTime;
    }

    public String getWorkTime() {
        return workTime;
    }

    public void setWorkTime(String workTime) {
        this.workTime = workTime;
    }

    public String getSysTime() {
        return sysTime;
    }

    public void setSysTime(String sysTime) {
        this.sysTime = sysTime;
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }

    public String getJobContent() {
        return jobContent;
    }

    public void setJobContent(String jobContent) {
        this.jobContent = jobContent;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Work{" +
                "wid=" + wid +
                ", weekTime='" + weekTime + '\'' +
                ", workTime='" + workTime + '\'' +
                ", sysTime='" + sysTime + '\'' +
                ", week='" + week + '\'' +
                ", jobContent='" + jobContent + '\'' +
                ", student=" + student +
                ", user=" + user +
                '}';
    }
}
