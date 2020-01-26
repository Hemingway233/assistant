package com.whm.assistant.dao;

import com.whm.assistant.entity.Recruit;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @program: com.whm.assistant.dao
 * @ClassName: RecruitDaoImpl
 * @Date: 2019/12/12 13:11
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:
 */
@Repository("recruitDao")
public class RecruitDaoImpl extends BaseDaoImpl<Recruit> implements RecruitDao {


    /**
     * 根据条件分页查询招聘计划信息
     *
     * @param recruit
     * @param page
     * @param limit
     * @return
     */
    @Override
    public List<Recruit> page(Recruit recruit, int page, int limit) {

        //开始位置
        int begin = (page - 1) * limit;

        //使用pClass得到T.class，即（pClass = T.class）
        //创建离线对象
        DetachedCriteria criteria = DetachedCriteria.forClass(Recruit.class);

        //添加查询条件： where userId=?
        criteria.add(Restrictions.eq("user.userId", recruit.getUser().getUserId()));

        //执行方法

        return (List<Recruit>) hibernateTemplate.findByCriteria(criteria, begin, limit);
    }

}
