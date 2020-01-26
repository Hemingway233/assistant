package com.whm.assistant.dao;

import com.whm.assistant.entity.Student;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 王海明
 */
@Repository("studentDao")
public class StudentDaoImpl extends BaseDaoImpl<Student> implements StudentDao {

}
