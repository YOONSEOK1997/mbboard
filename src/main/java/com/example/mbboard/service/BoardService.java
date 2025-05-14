package com.example.mbboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.mbboard.dto.Board;
import com.example.mbboard.dto.Page;
import com.example.mbboard.mapper.BoardMapper;

@Service
public class BoardService implements IBoardService {

    private final BoardMapper boardMapper;

    public BoardService(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    @Override
    public int insertBoard(Board board) {
        return boardMapper.insertBoard(board);
    }

    @Override
    public List<Board> getBoardListByPage(Page page) {
        return boardMapper.selectBoardListByPage(page);
    }

    @Override
    public Board getBoardOne(Board board) {
        return boardMapper.selectBoardOne(board);
    }

    @Override
    public int updateBoard(Board board) {
        return boardMapper.updateBoard(board);
    }

    @Override
    public int deleteBoard(Board board) {
        return boardMapper.deleteBoardByKey(board);
    }
    @Override
    public int getBoardCount(Page page) {
    	return boardMapper.getBoardCount(page);
    }
}
