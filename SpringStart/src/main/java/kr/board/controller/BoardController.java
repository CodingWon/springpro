package kr.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping("/boardList.do")
	public String boardList (Model model) {
		List<Board> list = boardMapper.getList();
		model.addAttribute("list",list);
		return "boardList";
	}
	
	@GetMapping("/get.do/{idx}")
	public String getMember(Model model, @PathVariable("idx") int idx) {
		
		Board board = boardMapper.getMember(idx);
		model.addAttribute("vo",board);
		
		return "memberContent";
	}
	
}
