package com.test.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.domain.MemberVO;
import com.test.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
		@Inject
		private MemberService service;
		
		// 회원가입 get
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public void getRegister() throws Exception {
			logger.info("get register");
		}
		
		// 회원가입 post
		@RequestMapping(value = "/register", method = RequestMethod.POST)
		public String postRegister(MemberVO vo) throws Exception {
			logger.info("post register");
			
			service.register(vo);
			
			return "redirect:/";
		}
		
		// 로그인
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
			logger.info("post login");
			
			HttpSession session = req.getSession();
			
			MemberVO login = service.login(vo);
			
			if(login == null) {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", false);
			} else {
				session.setAttribute("member", login);
			}
			
			return "redirect:/";
		}
		
		// 로그아웃
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpSession session) throws Exception {
			logger.info("get logout");
			
			session.invalidate();
			
			return "redirect:/";
		}
		
		/*// 로그인
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public void loginGet(@ModelAttribute("dto") LoginDTO dto) {
		
		}
		
		// 로그인 완료 후
		@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
		public void loginPost(LoginDTO dto, HttpSession session, Model model) throws Exception {
			
			MemberVO vo = service.login(dto);
			
			if (vo == null) {
				return;
			}
			
			model.addAttribute("memberVO", vo);
			
		}
		
		// 로그아웃
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
			
			Object obj = session.getAttribute("login");
			
			if(obj != null) {
				MemberVO vo = (MemberVO) obj;
				
				session.removeAttribute("login");
				session.invalidate();
				return "/";
			}
			return "/logout";
		}*/
}