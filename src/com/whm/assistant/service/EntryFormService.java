package com.whm.assistant.service;

import com.whm.assistant.dao.EntryFormDao;
import com.whm.assistant.entity.EntryForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: com.whm.assistant.service
 * @ClassName: EntryFormService
 * @Date: 2019/12/18 0:32
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:
 */
@Service("entryFormService")
@Transactional(rollbackFor = Exception.class)
public class EntryFormService {

    @Autowired
    private EntryFormDao entryFormDao;

    /**
     * 保存报名信息
     *
     * @param entryForm
     */
    public void add(EntryForm entryForm) {
        entryFormDao.add(entryForm);
    }

    /**
     * 更新报名信息
     *
     * @param entryForm
     */
    public void update(EntryForm entryForm) {
        entryFormDao.update(entryForm);
    }

    /**
     * 根据学号查询报名表的信息
     * @param value
     * @return
     */
    public EntryForm findOne(Object value){
        String stuId = "student.stuId";
        List<EntryForm> all = entryFormDao.findAll(stuId, value);
        return all.get(0);
    }

    /**
     * 根据学号查询报名表的总记录数
     *
     * @param value 学号对应的值
     * @return
     */
    public int stuIdFindCount(Object value) {
        //对应数据库的报名表的学号stuId的字段名称
        String stuId = "stuId";
        return entryFormDao.findCount(stuId, value);
    }

    /**
     * 根据招聘计划信息主键查询报名表的总记录数
     * @param value  主键对应的值
     * @return
     */
    public int ridFindCount(Object value) {
        //对应数据库的报名表的外键rid的字段名称
        String rid = "rid";
        return entryFormDao.findCount(rid,value);
    }

    /**
     * 根据学号查询报名表的信息
     * @param value  学号对应的值
     * @param entryForm  报名表实体类
     * @param page  当前页
     * @param limit  每页记录数
     * @return
     */
    public List<EntryForm> stuIdPage(Object value, EntryForm entryForm, int page, int limit) {
        //对应数据库的报名表的学号stuId的字段名称
        String stuId = "student.stuId";
        return entryFormDao.page(stuId, value, entryForm, page, limit);
    }

    /**
     * 根据招聘计划信息的主键rid查询对应的学生的报名表的信息
     * @param value  聘计划信息的主键rid对应的值
     * @param entryForm  报名表实体类
     * @param page  当前页
     * @param limit  每页记录数
     * @return
     */
    public List<EntryForm> ridPage(Object value, EntryForm entryForm, int page, int limit) {
        //对应数据库的报名表的学号stuId的字段名称
        String rid = "recruit.rid";
        return entryFormDao.page(rid, value, entryForm, page, limit);
    }

}
