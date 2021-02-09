package com.soo.projectmain;
import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("Soo_projectMainDAO")
public class Soo_projectMainDAO {
	
	@Autowired
	private SqlMapClient sql;


	//@SuppressWarnings("unchecked")
	public int test(Soo_projectMainVO vo) throws SQLException {	
		
		return (int)sql.queryForObject("soo_projectMainDAO.test",vo);
	}

}
