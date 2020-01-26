package com.whm.assistant.dao;

import java.util.List;

/**
 * @program: assistant
 * @Date: 2019/11/27 20:38
 * @Author: Hemingway
 * @Description:
 */
public interface BaseDao<T> {

    /**
     * 添加T信息
     * @param t
     */
    void add(T t);

    /**
     * 更新T信息
     * @param t
     */
    void update(T t);

    /**
     * 删除T信息
     * @param t
     */
    void delete(T t);

    /**
     * 查询所有T信息
     * @return
     */
    List<T> findAll();

    /**
     * 根据外键id查询所有T信息
     * @param id  外键id
     * @param value  外键id对应的值
     * @return
     */
    List<T> findAll(String id,Object value);

    /**
     * 根据主键id查询T信息
     * @param id  主键id
     * @return
     */
    T findOne(String id);

    /**
     * 查询T信息的总记录数
     * @return
     */
    Integer findCount();

    /**
     * 根据条件id(指表的相应字段名称)查询T信息的总记录数
     * @param id  表的相应字段名称
     * @param value  表的相应字段名称的值
     * @return
     */
    int findCount(String id,Object value);

    /**
     * 分页查询
     * @param page  当前页
     * @param limit  每页记录数
     * @return
     */
    List<T> findPage(int page, int limit);

    /**
     * 根据条件id(指表的对应字段名称)查询T信息的总记录数
     * @param id  表的对应字段名称
     * @param value  表的对应字段名称的值
     * @param t  实体类对象
     * @param page  当前页
     * @param limit  每页记录数
     * @return
     */
    List<T> page(String id, Object value, T t, int page, int limit);

}
