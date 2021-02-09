package com.soo.projectuser;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.soo.projectboard.Soo_projectBoardVO;

@Repository("Soo_projectUserDAO")
public class Soo_projectUserDAO {
	
	@Autowired
	private SqlMapClient sql;
	
	public List<Soo_projectUserVO> selectUserList(Soo_projectUserVO vo) throws SQLException{
		
	return sql.queryForList("soo_projectUserDAO.User_list",vo);
		
	}
	
	
	//글쓰기
	public Integer insertMember(Soo_projectUserVO user) throws SQLException{
		
		Integer result = (Integer) sql.insert("register" ,user);
		return result;
	}
	
	public Soo_projectUserVO loginById(Soo_projectUserVO uservo) throws SQLException {
		Soo_projectUserVO UserVO = (Soo_projectUserVO) sql.queryForObject("loginById", uservo);
		return UserVO;
	}
	
	//아이디 찾기 조회
	Soo_projectUserVO findid(Soo_projectUserVO uservo) throws SQLException {
		Soo_projectUserVO UserVO = (Soo_projectUserVO) sql.queryForObject("findid", uservo);
		return UserVO;
	}
	
	/*public Integer accessTime(Map articleMap) throws SQLException {
		Date date = timenow();
		articleMap.put("date", date);
		return sql.update("accessTime", date);
	}*/
	
	void accessTime(Date date) throws SQLException {
		//Soo_projectUserVO UserVO = (Soo_projectUserVO) sql.queryForObject("accessTime", uservo);
		//return UserVO;
		System.out.println("DAO date값" + date);
		sql.update("accessTime", date);
	}
	
	/*Date timenow() throws SQLException {
		
		return (Date) sql.queryForObject("timenow");
	}*/

		

}
