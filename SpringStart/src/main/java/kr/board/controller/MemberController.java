package kr.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Member;
import kr.board.mapper.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	MemberMapper memberMapper;
	
	@RequestMapping("/memJoin.do")
	public String memJoin () {
		return "member/join";
	}
	
	@RequestMapping("/memRegisterCheck.do")
	public @ResponseBody int memRegisterCheck(String memID) {
		Member m = memberMapper.registerChekc(memID);
		int result = 1;
		
		System.out.println("@@@@@@@@@@1. result " + result);
		if(m != null || memID.equals("")) {
			result =0;
		}
		
		System.out.println("@@@@@@@@@@2. result " + result);
		return result;
	}
}
