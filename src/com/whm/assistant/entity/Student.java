package com.whm.assistant.entity;

import javax.persistence.*;

/**
 * @program: com.whm.assistant.entity
 * @ClassName: Student
 * @Date: 2019/12/12 10:12
 * @Author: 王海明 (1378832252@qq.com)
 * @Description: 学生实体类
 */
@Entity
@Table(name = "lab_student")
public class Student {
    @Id
    @Column
    private String stuId;
    @Column
    private String password;
    @Column
    private String stuName;
    @Column
    private String major;
    @Column
    private String department;
    @Column
    private String grade;
    @Column
    private String className;
    @Column
    private String phone;
    @Column
    private String email;
    @Column
    private String laboratory;

    /**
     * 默认构造函数
     */
    public Student() {
    }

    /**
     * 有参构造函数
     *
     * @param stuId
     * @param password
     * @param stuName
     * @param major
     * @param department
     * @param grade
     * @param className
     * @param phone
     * @param email
     */
    public Student(String stuId, String password, String stuName, String major, String department, String grade, String className, String phone, String email, String laboratory) {
        this.stuId = stuId;
        this.password = password;
        this.stuName = stuName;
        this.major = major;
        this.department = department;
        this.grade = grade;
        this.className = className;
        this.phone = phone;
        this.email = email;
        this.laboratory = laboratory;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLaboratory() {
        return laboratory;
    }

    public void setLaboratory(String laboratory) {
        this.laboratory = laboratory;
    }

    @Override
    public String toString() {
        return "Student{" +
                "stuId='" + stuId + '\'' +
                ", password='" + password + '\'' +
                ", stuName='" + stuName + '\'' +
                ", major='" + major + '\'' +
                ", department='" + department + '\'' +
                ", grade='" + grade + '\'' +
                ", className='" + className + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", laboratory='" + laboratory + '\'' +
                '}';
    }
}
