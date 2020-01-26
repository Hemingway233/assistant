package com.whm.assistant.dao;

import com.whm.assistant.entity.Recruit;

import java.util.List;

/**
 * @program: com.whm.assistant.dao
 * @ClassName: Recruit
 * @Date: 2019/12/12 13:11
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:
 */
public interface RecruitDao extends BaseDao<Recruit> {

    /**
     * 根据条件分页查询招聘计划信息
     * @param recruit
     * @param page
     * @param limit
     * @return
     */
    List<Recruit> page(Recruit recruit,int page,int limit);

}
