package com.example.mbboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mbboard.dto.Board;
import com.example.mbboard.dto.Page;
@Mapper
public interface BoardMapper {
    // 게시판 등록
    int insertBoard(Board board);
    // 게시글 목록
    List<Board> selectBoardListByPage(Page page);
    //게시글 상세
    Board selectBoardOne(Board Board);
    // 게시글 수정
    int updateBoard(Board board);
    //게시글 삭제
    int deleteBoardByKey(int boardNo);
    
    int getBoardCount(Page page);
}
