package com.soo.projectboard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("Soo_projectBoardService")
public class Soo_projectBoardServiceImpl implements Soo_projectBoardService{

	@Resource
	Soo_projectBoardDAO SooprojectBoardDAO;
		
	@Override
	public List<Soo_projectBoardVO> selectBoardList(SearchVO search) throws Exception {
		
		return SooprojectBoardDAO.selectBoardList(search);
	}
	
	//조회하기
	@Override
	public Soo_projectBoardVO getArticle(int board_seq) throws SQLException {
		System.out.println("getArticle 작동하냐고??");
	
		return SooprojectBoardDAO.getArticle(board_seq);
	}

	//게시글 총 갯수
	@Override
	public Integer countArticles(SearchVO search) throws SQLException {
	
		return SooprojectBoardDAO.countArticles(search);
	}

	//글쓰기
	@Override
	public Integer addNewArticle(Map articleMap) throws Exception {
		return SooprojectBoardDAO.insertNewArticle(articleMap);
	
	}
	
	//동적쿼리문 안쓰면 써야하는것.
	@Override
	public List<Soo_projectBoardVO> getArticleListByTitle(SearchVO search) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	//수정하기
	@Override
	public void modArticle(Map articleMap) throws Exception {
		SooprojectBoardDAO.updateArticle(articleMap);
		
	}

	//삭제하기
	@Override
	public void removeArticle(int board_seq) throws Exception {
		SooprojectBoardDAO.deleteArticle(board_seq);
		
	}



}
