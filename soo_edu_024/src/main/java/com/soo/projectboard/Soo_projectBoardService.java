package com.soo.projectboard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface Soo_projectBoardService {

	//	게시글 목록 가져오기
	List<Soo_projectBoardVO> selectBoardList(SearchVO search) throws Exception;
	
	// 게시글 단일조회기능
	Soo_projectBoardVO getArticle(int board_seq) throws SQLException;
	
	//총 게시물의 수 조회기능
	Integer countArticles(SearchVO search) throws SQLException;
	
	//글쓰기
	public Integer addNewArticle(Map articleMap) throws Exception;
	
	//검색 조회
	List<Soo_projectBoardVO> getArticleListByTitle(SearchVO search) throws SQLException;
	
	//수정하기
	public void modArticle(Map articleMap) throws Exception;
	
	
	//삭제하기
	public void removeArticle(int articleNO) throws Exception;
	
}