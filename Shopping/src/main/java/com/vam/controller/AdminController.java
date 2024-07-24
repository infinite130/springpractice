package com.vam.controller;

import java.io.Reader;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vam.model.AuthorVO;
import com.vam.model.Criteria;
import com.vam.model.PageDTO;
import com.vam.service.AuthorService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger Logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AuthorService authorService;
	
	@GetMapping("/main")
	public String adminMainGET() throws Exception {
		Logger.info("관리자 페이지 이동");
		return "admin/main";
	}
	
	@GetMapping("/goodsManage")
	public String goodsManageGET() throws Exception {
		Logger.info("상품 등록 페이지 접속");
		return "admin/goodsManage";
	}
	
	@GetMapping("/goodsEnroll")
	public String goodsEnrollGET() throws Exception {
		Logger.info("상품 등록 페이지 접속");
		return "admin/goodsEnroll";
	}
	
	@GetMapping("/authorEnroll")
	public String authorEnrollGET() throws Exception {
		Logger.info("작가 등록 페이지 접속");
		return "admin/authorEnroll";
	}
	
	@GetMapping("/authorManage")
	public void authorManageGET(Criteria cri, Model model) throws Exception {
		Logger.info("작가 관리 페이지 접속....." + cri);
		
		List list = authorService.authorGetList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list",list);
		}else {
			model.addAttribute("listCheck", "empty");
		}
		
		int total = authorService.authorGetTotal(cri);
		PageDTO pageMaker = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@PostMapping("/authorEnroll.do")
	public String authorEnrollPOST(AuthorVO author, RedirectAttributes rttr) throws Exception {
		Logger.info("authorEnroll : " + author);
		authorService.authorEnroll(author);
		rttr.addFlashAttribute("enroll_result", author.getAuthorName());
		return "redirect:/admin/authorManage";
	}
	
	@GetMapping("/authorDetail")
	public void authorGetInfoGET(int authorId, Criteria cri, Model model) throws Exception{
		
		Logger.info("authorDetail...." + authorId);
		
		model.addAttribute("cri", cri);
		
		model.addAttribute("authorInfo", authorService.authorGetDetail(authorId));
		
	}
	
	@PostMapping("/authorModify")
	public String authorModifyPOST(AuthorVO author, RedirectAttributes rttr) throws Exception{
		
		Logger.info("authorModifyPOST......" +  author);
		
		int result = authorService.authorModify(author);
		
		rttr.addFlashAttribute("modify_result",result);
		
		return "redirect:/admin/authorManage";
	}
	
}
