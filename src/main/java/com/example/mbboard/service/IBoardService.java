package com.example.mbboard.service;

import java.util.List;

import com.example.mbboard.dto.Board;
import com.example.mbboard.dto.Page;

public interface IBoardService {
    // 게시판 등록
    int insertBoard(Board board);

    // 게시글 목록 조회 (페이지 처리 포함)
    List<Board> getBoardListByPage(Page page);

    // 게시글 상세 조회
    Board getBoardOne(Board board);

    // 게시글 수정
    int updateBoard(Board board);

    // 게시글 삭제
    int deleteBoard(int boardNo);
    
    int getBoardCount(Page page);

	
}
