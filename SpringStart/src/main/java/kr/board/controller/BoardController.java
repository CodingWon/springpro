package kr.board.controller;

import java.util.ArrayList;
import java.util.List;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BoardController {

	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
}
