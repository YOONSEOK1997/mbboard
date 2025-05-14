package com.example.mbboard.dto;

import lombok.Data;

@Data
public class Page {
	private int currentPage;
	private int rowPerPage;
	
	private int beginRow;
	private int totalCount;
	
	private String searchWord;

	// 기본 생성자 추가 + 기본값 지정
	public Page() {
		this.currentPage = 1;
		this.rowPerPage = 10;
	}

	// 기존 생성자 유지
	public Page(int rowPerPage, int currentPage , int totalCount ) {
		this.rowPerPage = rowPerPage;
		this.currentPage  = currentPage;
		this.totalCount = totalCount;
		this.beginRow  = (currentPage -1) * rowPerPage;
	}
	
	public int getBeginRow() {
		return (this.currentPage -1)*(this.rowPerPage);
	}
	
	public int getLastPage() {
		int lastPage = this.totalCount / this.rowPerPage;
		if(this.totalCount % this.rowPerPage !=0) {
			lastPage +=1;
		}
		return lastPage;
	}
}
