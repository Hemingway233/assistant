package com.whm.assistant.entity;

import javax.persistence.*;

/**
 * @program: com.whm.assistant.entity
 * @ClassName: Device
 * @Date: 2019/12/20 20:23
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:  设备维修申请表实体类
 */
@Entity
@Table(name = "lab_device")
public class Device {

    /**
     * 主键
     */
    @Id
    @Column(name = "did")
    @GeneratedValue(strategy = GenerationType.IDENTITY)    //主键自增长
    private int did;
    /**
     * 设备编号
     */
    @Column(name = "deviceId")
    private String deviceId;
    /**
     * 设备名称
     */
    @Column(name = "deviceName")
    private String deviceName;
    /**
     * 型号
     */
    @Column(name = "model")
    private String model;
    /**
     * 故障现象描述
     */
    @Column(name = "describes")
    private String describes;
    /**
     * 报修时间
     */
    @Column(name = "repairTime")
    private String repairTime;
    /**
     * 学生信息实体类
     */
    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, fetch = FetchType.EAGER)  //设置级联更新、级联保存、急加载
    @JoinColumn(name = "stuId", referencedColumnName = "stuId")
    private Student student;

    public Device() {
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describes) {
        this.describes = describes;
    }

    public String getRepairTime() {
        return repairTime;
    }

    public void setRepairTime(String repairTime) {
        this.repairTime = repairTime;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    @Override
    public String toString() {
        return "Device{" +
                "did=" + did +
                ", deviceId='" + deviceId + '\'' +
                ", deviceName='" + deviceName + '\'' +
                ", model='" + model + '\'' +
                ", describes='" + describes + '\'' +
                ", repairTime='" + repairTime + '\'' +
                ", student=" + student +
                '}';
    }
}
