package com.whm.assistant.entity;

import javax.persistence.*;

/**
 * @program: com.whm.assistant.entity
 * @ClassName: Recruit
 * @Date: 2019/12/12 10:12
 * @Author: 王海明 (1378832252@qq.com)
 * @Description: 招聘计划信息实体类
 */
@Entity
@Table(name = "lab_recruit")
public class Recruit {

    @Id
    @Column(name = "rid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)    //主键自增长
    /**
     * 主键
     */
    private int rid;

    @Column(name = "recruitId")
    /**
     * 招聘计划编号
     */
    private String recruitId;

    @Column(name = "recruitName")
    /**
     * 招聘计划名称
     */
    private String recruitName;

    @Column(name = "jobRequire")
    /**
     * 工作要求
     */
    private String jobRequire;

    @Column(name = "amount")
    /**
     * 招聘数量
     */
    private int amount;

    @Column(name = "department")
    /**
     * 申请部门
     */
    private String department;

    @Column(name = "applicant")
    /**
     * 申请人
     */
    private String applicant;

    @Column(name = "applyTime")
    /**
     * 申请时间
     */
    private String applyTime;

    @Column(name = "status")
    /**
     * 审核状态 0：未通过 、 1：已通过
     */
    private int status;

    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, fetch = FetchType.EAGER)  //设置级联更新、级联保存、急加载
    @JoinColumn(name = "userId", referencedColumnName = "userId")
    /**
     * 用户：具体指实验室技术员
     */
    private User user;

    /**
     * 默认构造函数
     */
    public Recruit() {

    }

    /**
     * 有参构造函数
     *
     * @param recruitId
     * @param recruitName
     * @param jobRequire
     * @param amount
     * @param department
     * @param applicant
     * @param applyTime
     * @param status
     */
    public Recruit(String recruitId, String recruitName, String jobRequire, int amount, String department, String applicant, String applyTime, int status) {
        this.recruitId = recruitId;
        this.recruitName = recruitName;
        this.jobRequire = jobRequire;
        this.amount = amount;
        this.department = department;
        this.applicant = applicant;
        this.applyTime = applyTime;
        this.status = status;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getRecruitId() {
        return recruitId;
    }

    public void setRecruitId(String recruitId) {
        this.recruitId = recruitId;
    }

    public String getRecruitName() {
        return recruitName;
    }

    public void setRecruitName(String recruitName) {
        this.recruitName = recruitName;
    }

    public String getJobRequire() {
        return jobRequire;
    }

    public void setJobRequire(String jobRequire) {
        this.jobRequire = jobRequire;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    public String getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(String applyTime) {
        this.applyTime = applyTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    //    public String getUserId() {
    //        return userId;
    //    }
    //
    //    public void setUserId(String userId) {
    //        this.userId = userId;
    //    }

    @Override
    public String toString() {
        return "Recruit{" +
                "rid=" + rid +
                ", recruitId='" + recruitId + '\'' +
                ", recruitName='" + recruitName + '\'' +
                ", jobRequire='" + jobRequire + '\'' +
                ", amount=" + amount +
                ", department='" + department + '\'' +
                ", applicant='" + applicant + '\'' +
                ", applyTime='" + applyTime + '\'' +
                ", status=" + status +
                ", userId='" + +'\'' +
                '}';
    }
}
