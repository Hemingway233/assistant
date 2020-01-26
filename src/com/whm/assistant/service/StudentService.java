package com.whm.assistant.service;

import com.whm.assistant.dao.RecruitDao;
import com.whm.assistant.dao.StudentDao;
import com.whm.assistant.entity.Recruit;
import com.whm.assistant.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 王海明
 */
@Service("studentService")
@Transactional(rollbackFor = Exception.class)
public class StudentService {

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private RecruitDao recruitDao;

    /**
     * 学生注册
     * @param student
     */
    public void add(Student student){
        studentDao.add(student);
    }

    /**
     * 学生信息修改
     * @param t
     */
    public void edit(Student t) {
        studentDao.update(t);
    }

    /**
     * 根据学号查询学生信息
     * @param stuId  学号
     * @return
     */
    public Student findOne(String stuId){
        return studentDao.findOne(stuId);
    }

    /**
     * 根据审核状态status分页查询招聘计划信息
     * @param status
     * @param value
     * @param recruit
     * @param page
     * @param limit
     * @return
     */
    public List<Recruit> page(String status, Object value, Recruit recruit, int page, int limit){

        return recruitDao.page(status,value,recruit,page,limit);
    }

    /**
     * 根据条件(审核状态)查询招聘计划信息总记录数
     * @param status  审核状态
     * @param value  审核状态对应的值
     * @return
     */
    public int findCount(String status, Object value) {

        return recruitDao.findCount(status,value);
    }
}
