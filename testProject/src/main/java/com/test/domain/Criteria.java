package com.test.domain;

public class Criteria {
	
	private int idx;
	private int page;			// 보여줄 페이지 번호
	private int perPageNum;		// 페이지당 보여줄 게시글의 개수
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	private String searchType;	// 검색에 필요
	private String keyword;		// 검색에 필요
	
	public Criteria() {
		// 최초로 게시판화면을 띄울때 기본값 설정
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum != 10) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	// 검색에 필요한 SearchCriteria
	public String getSearchType() {
		return searchType;
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	// paging 처리
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", " + "perPageNum=" + perPageNum + "]";
	}
	
	// Search 처리
	public String toString1() {
		return toString() + "SearchCriteria" + "[searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}
