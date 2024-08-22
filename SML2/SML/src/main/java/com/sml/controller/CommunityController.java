package com.sml.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sml.model.CommunityReplyDTO;
import com.sml.model.CommunityVO;
import com.sml.model.Criteria;
import com.sml.model.PageDTO;
import com.sml.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

	@Autowired
	private CommunityService service;

	@GetMapping("/boardList")
	public void boardListGET(Criteria cri, Model model) throws Exception {

		logger.info("커뮤니티 페이지 이동" + cri);

		List list = service.getBoardList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("totalCount", list.size());
		} else {
			model.addAttribute("listCheck", "empty");
		}

		int total = service.communityGetTotal(cri);
		PageDTO pageMaker = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMaker);
//      model.addAttribute("pageMaker", new PageDTO(cri, service.communityGetTotal(cri)));
	}

	@GetMapping("/enroll")
	public void enrollGET() throws Exception {
		logger.info("커뮤니티 글 등록");
	}

	@PostMapping("/enroll.do")
	public String enrollPOST(CommunityVO community, RedirectAttributes rttr, HttpSession session) throws Exception {
		int memCode = (Integer) session.getAttribute("memCode");
		community.setMemCode(memCode);
		
		service.communityEnroll(community);
		rttr.addFlashAttribute("enroll_result", community.getCommTitle());
		return "redirect:/community/boardList";
	}

	@GetMapping({"/detail", "/modify"})
	public void communityDetailGET(int commCode, Criteria cri, Model model) throws Exception {

		model.addAttribute("cri", cri);
		model.addAttribute("communityDetail", service.communityDetail(commCode));
		
		int total = service.communityGetTotal(cri);
		PageDTO pageMaker = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMaker);
	}

	@PostMapping("/modify")
	public String modifyPOST(CommunityVO community, RedirectAttributes rttr) throws Exception {
		logger.info("modifyPOST......" + community);
		int result = service.communityModify(community);
		rttr.addFlashAttribute("modify_result", result);
		// 해당 페이지로 다시 return - 바꾸기
		return "redirect:/community/boardList";
	}

	@PostMapping("/delete")
	public String deletePOST(int commCode, RedirectAttributes rttr) throws Exception {
		logger.info("deletePOST......");
		int result = 0;
		try {
			result = service.communityDelete(commCode);
		} catch (Exception e) {
			e.printStackTrace();
			result = 2;
			rttr.addFlashAttribute("delete_result", result);
			return "redirect:/community/boardList";
		}

		rttr.addFlashAttribute("delete_result", result);
		return "redirect:/community/boardList";
	}
	
	@GetMapping("/reply/{memCode}")
	public String replyGET(@PathVariable("memCode")int memCode, int commCode, Model model) throws Exception {
		CommunityVO community = service.getCommunityCode(commCode);
		model.addAttribute("communityDetail", community);
		model.addAttribute("member", memCode);
		return "/reply";
	}

}