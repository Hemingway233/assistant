package com.whm.assistant.service;

import com.whm.assistant.dao.RecruitDao;
import com.whm.assistant.entity.Recruit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: com.whm.assistant.service
 * @ClassName: RecruitService
 * @Date: 2019/12/12 13:13
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:
 */
@Service("recruitService")
@Transactional(rollbackFor = Exception.class)
public class RecruitService {

    @Autowired
    private RecruitDao recruitDao;

    /**
     * 添加招聘计划信息
     * @param recruit
     */
    public void add(Recruit recruit){
        recruitDao.add(recruit);
    }

    /**
     * 更新招聘计划信息
     * @param recruit
     */
    public void update(Recruit recruit){
        recruitDao.update(recruit);
    }

    /**
     * 删除招聘计划信息
     * @param recruit
     */
    public void delete(Recruit recruit) {
        recruitDao.delete(recruit);
    }

    /**
     * 分页查询招聘计划信息
     * @return
     * @param page
     * @param limit
     */
    public List<Recruit> findPage(int page, int limit){

        return recruitDao.findPage(page,limit);
    }

    /**
     * 根据外键userId分页查询招聘计划信息
     * @param id
     * @param value
     * @param recruit
     * @param page
     * @param limit
     * @return
     */
    public List<Recruit> page(String id,Object value,Recruit recruit,int page, int limit){

        return recruitDao.page(id,value,recruit,page,limit);
    }

    /**
     * 查询招聘计划信息总记录数
     * @return
     */
    public int findCount(){
        return recruitDao.findCount();
    }

    /**
     * 根据条件id查询招聘计划信息总记录数
     * @param id
     * @param value
     * @return
     */
    public int findCount(String id,Object value){
        return recruitDao.findCount(id,value);
    }

}
