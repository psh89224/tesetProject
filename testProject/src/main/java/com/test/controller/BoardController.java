package com.test.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.domain.BoardVO;
import com.test.domain.Criteria;
import com.test.domain.PageMaker;
import com.test.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger Logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	// create GET
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void getCreate() throws Exception {
		Logger.info("get create");
	}
	
	// create POST
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String postCreate(BoardVO vo) throws Exception {
		Logger.info("post create");
		Logger.info(vo.toString());
		
		service.create(vo);
		
		return "redirect:/board/listPage";
	}
	
	// read
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		Logger.info("get read");
		Logger.info(cri.toString());
		Logger.info(cri.toString1());
		
		model.addAttribute("read", service.read(bno));
		/*BoardVO vo = service.read(bno);
		model.addAttribute("read", vo);*/
	}
	
	// update GET
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		Logger.info("get modify");
		Logger.info(cri.toString());
		
		model.addAttribute("modify", service.read(bno));
		/*BoardVO vo = service.read(bno);
		model.addAttribute("modify", vo);*/
		//model.addAttribute(service.read(bno));
	}
	
	// update POST
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		Logger.info("post modify");
				
		service.update(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		Logger.info(rttr.toString());
		
		return "redirect:/board/listPage";
	}
	
	// delete GET
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		Logger.info("get delete");
		
		model.addAttribute("delete", bno);
		//model.addAttribute(service.read(bno));
	}
	
	// delete POST
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(@RequestParam("bno") int bno, Criteria cri, RedirectAttributes rttr) throws Exception {
		Logger.info("post delete");
		
		service.delete(bno);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());		
		
		return "redirect:/board/listPage";
	}
	
	// list
	/*@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		Logger.info("get list");
		
		List<BoardVO> list = service.list();
		
		model.addAttribute("list", list);
	}*/
	
	// list + paging + Search
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		Logger.info("get listPage");
		Logger.info(cri.toString());	// paging
		Logger.info(cri.toString1());	// Search
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countPaging(cri));
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);					// 게시판 하단의 페이징 관련, 이전페이지, 페이지링크, 다음페이지
		model.addAttribute("list", service.listCriteria(cri));		// 게시판 글리스트
		model.addAttribute("list", service.listSearch(cri));
		
	}

}