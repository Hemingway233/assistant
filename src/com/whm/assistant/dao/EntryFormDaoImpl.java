package com.whm.assistant.dao;

import com.whm.assistant.entity.EntryForm;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @program: com.whm.assistant.dao
 * @ClassName: EntryFormDaoImpl
 * @Date: 2019/12/18 0:29
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:
 */
@Repository("entryFormDao")
public class EntryFormDaoImpl extends BaseDaoImpl<EntryForm> implements EntryFormDao{
}
