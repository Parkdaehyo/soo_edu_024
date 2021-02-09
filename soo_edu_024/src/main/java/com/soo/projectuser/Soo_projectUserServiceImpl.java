package com.soo.projectuser;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.soo.projectboard.Soo_projectBoardVO;

@Service
public class Soo_projectUserServiceImpl implements Soo_projectUserService{
	
	@Resource
	private Soo_projectUserDAO SooprojectUserDAO;

	@Override
	public List<Soo_projectUserVO> selectUserList(Soo_projectUserVO vo) throws Exception {
		
		return SooprojectUserDAO.selectUserList(vo);
	}

	@Override
	public Integer addMember(Soo_projectUserVO user) throws Exception {
	
		return (Integer) SooprojectUserDAO.insertMember(user);
	}

	@Override
	public Soo_projectUserVO loginbyId(Soo_projectUserVO uservo) throws Exception {
	
		return SooprojectUserDAO.loginById(uservo);
	}

	@Override
	public Soo_projectUserVO findid(Soo_projectUserVO uservo) throws SQLException {
		
		return SooprojectUserDAO.findid(uservo);
	}


	/*@Override
	public Integer accessTime(Map articleMap) throws SQLException {
		
		return SooprojectUserDAO.accessTime(articleMap);
		
	}*/

	@Override
	public void accessTime(Date date) throws SQLException {
		System.out.println("date값: " + date);
		SooprojectUserDAO.accessTime(date);
		
	}
	
	
	

}
