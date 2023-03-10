package kr.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 회원가입 처리
	@RequestMapping("/memRegister.do")
	public String memRegister(Member m, String memPassword1, String memPassword2,
			                  RedirectAttributes rttr, HttpSession session) {
		if(m.getMemID()==null || m.getMemID().equals("") ||
		   memPassword1==null || memPassword1.equals("") ||
		   memPassword2==null || memPassword2.equals("") ||
		   m.getMemName()==null || m.getMemName().equals("") ||	
		   m.getMemAge()==0 || m.getMemAge() == null ||
		   m.getMemGender()==null || m.getMemGender().equals("") ||
		   m.getMemEmail()==null || m.getMemEmail().equals("")) {
		   // 누락메세지를 가지고 가기? =>객체바인딩(Model, HttpServletRequest, HttpSession)
		   rttr.addFlashAttribute("msgType", "실패 메세지");
		   rttr.addFlashAttribute("msg", "모든 내용을 입력하세요.");
		   return "redirect:/memJoin.do";  // ${msgType} , ${msg}
		}
		
		if(!memPassword1.equals(memPassword2)) {
		   rttr.addFlashAttribute("msgType", "실패 메세지");
		   rttr.addFlashAttribute("msg", "비밀번호가 서로 다릅니다.");
		   return "redirect:/memJoin.do";  // ${msgType} , ${msg}
		}		
		m.setMemProfile(""); // 사진이미는 없다는 의미 ""
		
		// 회원을 테이블에 저장하기
		int result=memberMapper.register(m);
		if(result==1) { // 회원가입 성공 메세지
		   rttr.addFlashAttribute("msgType", "성공 메세지");
		   rttr.addFlashAttribute("msg", "회원가입에 성공했습니다.");
		   // 회원가입이 성공하면=>로그인처리하기
		   session.setAttribute("mvo", m); // ${!empty mvo}
		   return "redirect:/";
		}else {
		   rttr.addFlashAttribute("msgType", "실패 메세지");
		   rttr.addFlashAttribute("msg", "이미 존재하는 회원입니다.");
		   return "redirect:/memJoin.do";
		}		
	}
	
	@RequestMapping("/memLogout.do")
	public String memLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/memLoginForm.do")
	public String memLoginForm() {
			
		return "member/memLoginForm";
	}
	
	@RequestMapping("/memLogin.do")
	public String memLogin(Member m,RedirectAttributes rttr, HttpSession session) {
		
		if(m.getMemID() == null || m.getMemID().equals("") || 
				m.getMemPassword() ==null || m.getMemPassword() =="") {
			rttr.addFlashAttribute("msgType","실패 메시지");
			rttr.addFlashAttribute("msg","모든 내용을 입력하세요");
			return "redirect:/memLoginForm.do";
		}
			
		Member mvo = memberMapper.memLogin(m);
		
		if(mvo != null) {
			rttr.addFlashAttribute("msgType","성공 메시지");
			rttr.addFlashAttribute("msg","로그인에 성공 했습니다.");
			session.setAttribute("mvo", mvo);
			return "redirect:/";
		}else {
			rttr.addFlashAttribute("msgType", "실패 메시지.");
			rttr.addFlashAttribute("msg", "다시 로그인 해주세요.");
			return "redirect:/memLoginForm.do";
		}
		
	
	}
	
}
