package com.soo.projectuser;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.soo.projectboard.Soo_projectBoardVO;

public interface Soo_projectUserService {

	//	게시글 리스트 가져오기
	List<Soo_projectUserVO> selectUserList(Soo_projectUserVO vo) throws Exception;

	//회원가입
	 public Integer addMember(Soo_projectUserVO user) throws Exception;
	 
	 //로그인 조회
	 public Soo_projectUserVO loginbyId(Soo_projectUserVO uservo) throws Exception;
	 
	 Soo_projectUserVO findid(Soo_projectUserVO uservo) throws SQLException;
	 
	 //Integer accessTime(Map articleMap) throws SQLException;

	 void accessTime(Date date) throws SQLException;
}
