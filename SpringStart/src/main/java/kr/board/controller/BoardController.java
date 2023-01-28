package kr.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMpper;
	
	@RequestMapping("/boardList.do")
	public String boardList (Model model) {
		
		
		List<Board> list = boardMpper.getList();
		model.addAttribute("list",list);
		
		return "boardList";
	}
	
}
