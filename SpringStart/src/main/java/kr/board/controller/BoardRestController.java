package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@RestController // @ResponseBody(JSON) 응답
@RequestMapping("/board")
public class BoardRestController {

	@Autowired
	BoardMapper boardMapper;
	
	//@ResponseBody -> jackson-databind (객체-> JSON 데이터 포맷 변환)
	@GetMapping("/all")
	public List<Board> boardList(){
		List<Board> list = boardMapper.getLists();
		return list;
	}
	
	//@RequestMapping("/boardInsert.do")
	
	@PostMapping("/new")
	public void boardInsert(Board board) {
		boardMapper.boardInsert(board);
	}
	
	@DeleteMapping("/{idx}")
	public void boardDelte(@PathVariable("idx") int idx) {
		boardMapper.boardDelete(idx);
	}
	
	@PutMapping("/update")
	public void boardUpdate(@RequestBody Board board) {
		boardMapper.boardUpdate(board);
	}
	
	
	@RequestMapping("/count/{idx}")
	public Board boardCount(@PathVariable("idx") int idx) {
		boardMapper.boardCount(idx);
		Board vo = boardMapper.boardContent(idx);
		return vo;
		
	}
	
	
}
