package com.example.mbboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.mbboard.dto.Board;
import com.example.mbboard.dto.Page;
import com.example.mbboard.service.IBoardService;

@Controller
@RequestMapping("/")
public class BoardController {

    private IBoardService boardService;

    @Autowired
    public BoardController(IBoardService boardService) {
        this.boardService = boardService;
    }

   // 게시글 목록
    @GetMapping({"/", "/boardList"})
    public String boardList(@ModelAttribute Page page, Model model) {
        // 총 게시글 수 구해서 Page에 설정
        int totalCount = boardService.getBoardCount(page);
        page.setTotalCount(totalCount);

        // 목록 가져오기
        List<Board> boardList = boardService.getBoardListByPage(page);

        // 모델에 데이터 담기
        model.addAttribute("boardList", boardList);
        model.addAttribute("page", page);

        return "boardList";
    }


    // 게시글 상세
    @GetMapping("/boardOne")
    public String boardDetail(@RequestParam int boardNo, Model model) {
        Board board = new Board();
        board.setBoardNo(boardNo);
        Board result = boardService.getBoardOne(board);
        model.addAttribute("board", result);
        return "boardOne"; 
    }

    // 게시글 작성 폼
    @GetMapping("/boardWrite")
    public String boardWriteForm() {
        return "boardWrite";  
    }
    // 게시글 등록 처리
    @PostMapping("/boardWrite")
    public String boardWrite(@ModelAttribute Board board) {
        boardService.insertBoard(board);
        return "redirect:/boardList";
    }

    // 게시글 수정 폼
    @GetMapping("/boardEdit")
    public String boardEditForm(@RequestParam int boardNo, Model model) {
        Board board = new Board();
        board.setBoardNo(boardNo);
        Board result = boardService.getBoardOne(board);
        model.addAttribute("board", result);
        return "boardEdit";  
    }

    // 게시글 수정 처리
    @PostMapping("/boardEdit")
    public String boardEdit(@ModelAttribute Board board) {
        boardService.updateBoard(board);
        return "redirect:/boardOne?boardNo=" + board.getBoardNo();
    }

    // 게시글 삭제 처리
    @PostMapping("/boardDelete")
    public ResponseEntity<Void> boardDelete(@RequestParam int boardNo) {
        Board board = new Board();
        board.setBoardNo(boardNo);
        int result = boardService.deleteBoard(board);

        if (result > 0) {
            return ResponseEntity.ok().build(); // 성공(200)
        } else {
            return ResponseEntity.status(500).build(); // 실패(500)
        }
    }

}
    
