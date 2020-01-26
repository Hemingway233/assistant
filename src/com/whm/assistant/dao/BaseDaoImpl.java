package com.whm.assistant.dao;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/**
 * @program: assistant
 * @Date: 2019/11/27 20:36
 * @Author: Hemingway
 * @Description:
 */
public class BaseDaoImpl<T> implements BaseDao<T> {

    @Autowired
    HibernateTemplate hibernateTemplate;

    private Class pClass;

    public BaseDaoImpl() {
        //第一步、得到当前运行类Class
        Class clazz = this.getClass();
        //第二步、得到运行类的父类的参数化类型BaseDaoImpl<T>
        Type type = clazz.getGenericSuperclass();
        //转换成子接口ParameterizedType
        ParameterizedType pType = (ParameterizedType) type;
        //得到实际类型参数<T>里的T
        Type[] types = pType.getActualTypeArguments();
        Class tClass = (Class) types[0];
        this.pClass = tClass;
    }

    /**
     * 添加T信息
     *
     * @param t
     */
    @Override
    public void add(T t) {
        hibernateTemplate.save(t);
    }

    /**
     * 更新T信息
     *
     * @param t
     */
    @Override
    public void update(T t) {
        hibernateTemplate.update(t);
    }

    /**
     * 删除T信息
     *
     * @param t
     */
    @Override
    public void delete(T t) {
        hibernateTemplate.delete(t);
    }

    /**
     * 查询所有T信息
     *
     * @return
     */
    @Override
    public List<T> findAll() {
        //使用Class里面的getSimpleName()得到类名称
        return (List<T>) hibernateTemplate.find("from "+pClass.getSimpleName());
    }

    /**
     * 根据主键id查询T信息
     *
     * @param id  主键id
     * @return
     */
    @Override
    public T findOne(String id) {
        //使用pClass得到T.class，即（pClass = T.class）
        return (T) hibernateTemplate.get(pClass, id);
    }

    /**
     * 根据外键id查询所有T信息
     * @param id  外键id
     * @param value  外键id对应的值
     * @return
     */
    @Override
    public List<T> findAll(String id,Object value) {
        //使用Class里面的getSimpleName()得到类名称
        String hql = "from "+pClass.getSimpleName()+" where "+id+"=?0";
        return (List<T>) hibernateTemplate.find(hql, value);
    }

    /**
     * 查询T信息的总记录数
     *
     * @return
     */
    @Override
    public Integer findCount() {
        //使用Class里面的getSimpleName()得到类名称
        List<Object> object = (List<Object>) hibernateTemplate.find("select count(*) from "+pClass.getSimpleName());
        if(object.size() != 0 && object != null){
            Object o = object.get(0);
            //变成Integer类型
            Long obj = (Long) o;
            Integer totalCount = obj.intValue();
            return totalCount;
        }
        return 0;
    }

    /**
     * 根据条件id(指表的相应字段名称)查询T信息的总记录数
     *
     * @param id    表的相应字段名称
     * @param value 表的相应字段名称的值
     * @return
     */
    @Override
    public int findCount(String id, Object value) {
        //使用Class里面的getSimpleName()得到类名称
        List<Object> object = (List<Object>) hibernateTemplate.find("select count(*) from "+pClass.getSimpleName()+" where "+id+"="+value);
        if(object.size() != 0 && object != null){
            Object o = object.get(0);
            //变成int类型
            Long obj = (Long) o;
            int totalCount = obj.intValue();
            return totalCount;
        }
        return 0;
    }

    /**
     * 分页查询
     *
     * @param page    当前页
     * @param limit 每页记录数
     * @return
     */
    @Override
    public List<T> findPage(int page, int limit) {

        //开始位置
        int begin = (page - 1) * limit;

        //使用pClass得到T.class，即（pClass = T.class）
        //创建离线对象
        DetachedCriteria criteria = DetachedCriteria.forClass(pClass);

        return (List<T>) hibernateTemplate.findByCriteria(criteria, begin, limit);
    }

    /**
     * 根据条件id(指表的对应字段名称)查询T信息的总记录数
     *
     * @param id    表的对应字段名称
     * @param value 表的对应字段名称的值
     * @param t     实体类对象
     * @param page  当前页
     * @param limit 每页记录数
     * @return
     */
    @Override
    public List<T> page(String id, Object value, T t, int page, int limit) {
        //开始位置
        int begin = (page - 1) * limit;

        //使用pClass得到T.class，即（pClass = T.class）
        //创建离线对象
        DetachedCriteria criteria = DetachedCriteria.forClass(pClass);

        //添加查询条件： where id=?
        criteria.add(Restrictions.eq(id,value));

        //执行方法
        return (List<T>) hibernateTemplate.findByCriteria(criteria, begin, limit);
    }

}
