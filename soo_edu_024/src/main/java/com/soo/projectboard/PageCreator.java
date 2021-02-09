package com.soo.projectboard;

import java.util.List;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageCreator {

	private PageVO paging;
	//private Integer articleTotalcount;
	//private List<Integer> articleTotlcount;
	private Integer articleTotalCount;
	private Integer beginPage;
	private Integer endPage;
	private boolean prev;
	private boolean next;
	
	private final Integer displayPageNum = 5;
	
		//URL 파라미터를 쉽게 만들어주는 유틸메서드 선언.
		public String makeURI(Integer page) {
			
			UriComponents ucp = UriComponentsBuilder.newInstance()
							.queryParam("page", page)
							.queryParam("countPerPage", paging.getCountPerPage())
							.queryParam("keyword", ((SearchVO)paging).getKeyword())
							.queryParam("condition", ((SearchVO)paging).getCondition())
							.build();
			
			return ucp.toUriString();
		}
		
	
						//페이징 알고리즘
	private void calcDateOfPage() {
		
				 //보정 전 끝 페이지 구하기
				endPage = (int)Math.ceil(paging.getPage() 
								/ (double)displayPageNum)
						  		* displayPageNum;
				
				//시작 페이지 번호 구하기
				beginPage = (endPage - displayPageNum) + 1;
				
				//현재 시작페이지가 1이라면 이전버튼 활성화 여부를 false로 지정
				prev = (beginPage == 1) ? false : true; //현재 페이지가 1이면 이전버튼 false
				
				//마지막 페이지인지 여부 확인 후 다음 버튼 비활성.
				next = (articleTotalCount <= (endPage * paging.getCountPerPage())) ? false : true;
				
				//재보정 여부 판단하기
				if(!isNext()) {
					//끝 페이지 재보정하기
					endPage = (int)Math.ceil(articleTotalCount / (double)paging.getCountPerPage());
				}
	
		
	}
	
	
	public PageVO getPaging() {
		return paging;
	}

	public void setPaging(PageVO paging) {
		this.paging = paging;
	}



	public Integer getArticleTotalCount() {
		return articleTotalCount;
	}


	public void setArticleTotalCount(Integer articleTotalCount) {
		this.articleTotalCount = articleTotalCount;
		calcDateOfPage();
	}


	public Integer getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(Integer beginPage) {
		this.beginPage = beginPage;
	}

	public Integer getEndPage() {
		return endPage;
	}

	public void setEndPage(Integer endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Integer getDisplayPageNum() {
		return displayPageNum;
	}
	
	
	
	
}
