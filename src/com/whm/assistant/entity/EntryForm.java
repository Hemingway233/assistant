package com.whm.assistant.entity;

import javax.persistence.*;

/**
 * @program: com.whm.assistant.entity
 * @ClassName: EntryForm
 * @Date: 2019/12/17 18:23
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:
 */
@Entity
@Table(name = "lab_entryform")
public class EntryForm {
    /**
     * 主键
     */
    @Id
    @Column(name = "eid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)    //主键自增长
    private int eid;
    /**
     * 报名编号
     */
    @Column(name = "entryId")
    private String entryId;
    /**
     * 岗位名称
     */
    @Column(name = "recruitName")
    private String recruitName;
    /**
     * 技能描述
     */
    @Column(name = "describes")
    private String describes;
    /**
     * 申请时间
     */
    @Column(name = "applyTime")
    private String applyTime;

    /**
     * 考核状态： 0：未审核、 1：进入面试环节、 2：未进入面试环节、 3：面试已通过、 4：面试未通过
     */
    @Column(name = "status")
    private int status;

    /**
     * 招聘计划信息实体类
     */
    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, fetch = FetchType.EAGER)  //设置级联更新、级联保存、急加载
    @JoinColumn(name = "rid", referencedColumnName = "rid")
    private Recruit recruit;
    /**
     * 学生信息实体类
     */
    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, fetch = FetchType.EAGER)  //设置级联更新、级联保存、急加载
    @JoinColumn(name = "stuId", referencedColumnName = "stuId")
    private Student student;

    /**
     * 默认构造函数
     */
    public EntryForm() {
    }

    /**
     * @param eid
     * @param entryId
     * @param recruitName
     * @param describes
     * @param applyTime
     * @param recruit
     * @param student
     */
    public EntryForm(int eid, String entryId, String recruitName, String describes, String applyTime, Recruit recruit, Student student) {
        this.eid = eid;
        this.entryId = entryId;
        this.recruitName = recruitName;
        this.describes = describes;
        this.applyTime = applyTime;
        this.recruit = recruit;
        this.student = student;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getEntryId() {
        return entryId;
    }

    public void setEntryId(String entryId) {
        this.entryId = entryId;
    }

    public String getRecruitName() {
        return recruitName;
    }

    public void setRecruitName(String recruitName) {
        this.recruitName = recruitName;
    }

    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describes) {
        this.describes = describes;
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

    public Recruit getRecruit() {
        return recruit;
    }

    public void setRecruit(Recruit recruit) {
        this.recruit = recruit;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    @Override
    public String toString() {
        return "EntryForm{" +
                "eid=" + eid +
                ", entryId='" + entryId + '\'' +
                ", recruitName='" + recruitName + '\'' +
                ", describes='" + describes + '\'' +
                ", applyTime='" + applyTime + '\'' +
                ", recruit=" + recruit +
                ", student=" + student +
                '}';
    }
}
