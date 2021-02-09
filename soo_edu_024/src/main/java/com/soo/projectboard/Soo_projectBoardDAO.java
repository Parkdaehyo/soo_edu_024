package com.soo.projectboard;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.soo.projectmain.Soo_projectMainVO;


@Repository("Soo_projectBoardDAO")
public class Soo_projectBoardDAO {

	@Autowired
	private SqlMapClient sql;

	
	//게시글 전체 조회	
	public List<Soo_projectBoardVO> selectBoardList(SearchVO search) throws SQLException{
		
		return sql.queryForList("soo_projectBoardDAO.List_Board", search);
	}
	
	//게시글 단일 조회기능
	public Soo_projectBoardVO getArticle(int board_seq) throws SQLException {
		System.out.println("getArticle DAO도 작동하냐고??");
		
/*		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("board_seq", board_seq);*/
		
		return (Soo_projectBoardVO) sql.queryForObject("soo_projectBoardDAO.select_Board", board_seq);
		
	}
	
/*	public List<Integer> countArticles() throws SQLException {
		
		return sql.queryForList("countArticles");
	}
	*/
	
	//게시글 총 갯수 구하기
	public Integer countArticles(SearchVO search) throws SQLException {
		System.out.println("countArticles DAO 제대로 작동중");
		return (Integer) sql.queryForObject("countArticles",search);
	}
	
	//글쓰기
	public Integer insertNewArticle(Map articleMap) throws SQLException {
	     Integer board_seq = selectNewArticleNO();
	     articleMap.put("board_seq", board_seq);
	     
	     if ( sql.update("insertNewArticle",articleMap) > 0 ) { // 데이터 처리한게 잇음
	    	 return board_seq;
	     } else {
	    	 return 0;
	     }
	     
	     // return (Integer) sql.insert("insertNewArticle",articleMap);
	      
	   }
	//게시글 번호 가져오기
	private Integer selectNewArticleNO() throws SQLException  {
		
		Integer result = (Integer) sql.queryForObject("selectNewArticleNO");
		return result;
	}
	
   //제목으로 검색기능
	List<Soo_projectBoardVO> getArticleListByTitle(SearchVO search) throws SQLException {
		
		return sql.queryForList("getArticleListByTitle", search);
	}
	
	//수정하기
	public void updateArticle(Map articleMap) throws SQLException {
	
		sql.update("updateArticle", articleMap);
	}
	

	
	//삭제하기
	public void deleteArticle(int board_seq) throws SQLException {

		sql.delete("deleteArticle", board_seq);
		
	}
	

	
	
	
	
	    
	
	

}
