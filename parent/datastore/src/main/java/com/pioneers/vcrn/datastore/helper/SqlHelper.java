package com.pioneers.vcrn.datastore.helper;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlHelper {
	static SqlSessionFactory sqlSessionFactory;

	public static SqlSession getSession() throws Exception {
		if (sqlSessionFactory == null) // build it only once
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources
					.getResourceAsReader("myBatisConfiguration.xml"));
		return sqlSessionFactory.openSession();
	}
}
