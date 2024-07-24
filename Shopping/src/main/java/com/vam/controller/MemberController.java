package com.vam.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.MimeHeaders;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vam.model.MemberVO;
import com.vam.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private BCryptPasswordEncoder pwEncoder;

	// 회원가입 페이지 이동
	@GetMapping("join")
	public void joinGET() {
		Logger.info("회원가입 페이지 진입");
	}

	@PostMapping("/join")
	public String joinPOST(MemberVO member) throws Exception {

		String rawPw = "";
		String encodePw = "";

		rawPw = member.getMemberPw();
		encodePw = pwEncoder.encode(rawPw);
		member.setMemberPw(encodePw);

		memberService.memberJoin(member);

		return "redirect:/main";
	}

	@PostMapping("/memberIdChk")
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception {

		// Logger.info("memberIdChk() 진입");

		int result = memberService.idCheck(memberId);

		Logger.info("결과값 = " + result);

		if (result != 0) {

			return "fail";
		} else {
			return "success";
		}
	}

	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

	    Logger.info("이메일 데이터 전송 확인");
	    Logger.info("인증번호 : " + email);

	    Random random = new Random();
	    int checkNum = random.nextInt(888888) + 111111;
	    Logger.info("인증번호 " + checkNum);

	    String setFrom = "skfo3219@naver.com";  // 네이버 계정 이메일 주소
	    String toMail = email;
	    String title = "회원가입 인증 이메일 입니다";
	    String content = "홈페이지를 방문해주셔서 감사합니다" + "<br><br>" + "인증번호는 " + checkNum + "입니다." + "<br>"
	            + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

	    try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	        helper.setFrom(setFrom);
	        helper.setTo(toMail);
	        helper.setSubject(title);
	        helper.setText(content, true);
	        mailSender.send(message);
	    } catch (Exception e) {
	        e.printStackTrace();
	        Logger.error("메일 전송 실패", e);
	    }

	    String num = Integer.toString(checkNum);

	    return num;
	}

	// 로그인 페이지 이동
	@GetMapping("login")
	public void loginGET() {
		Logger.info("로그인 페이지 진입");
	}

	@PostMapping("/login.do")
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception {
	    HttpSession session = request.getSession();
	    String rawPw = "";
	    String encodePw = "";

	    MemberVO lvo = memberService.memberLogin(member);

	    if (lvo != null) {
	        rawPw = member.getMemberPw();
	        encodePw = lvo.getMemberPw();

	        if (true == pwEncoder.matches(rawPw, encodePw)) {
	            lvo.setMemberPw("");
	            session.setAttribute("member", lvo);
	            return "redirect:/main";

	       
	        } else {
	            rttr.addFlashAttribute("result", 0);
	            return "redirect:/member/login";
	        }

	    } else {
	        rttr.addFlashAttribute("result", 0);
	        return "redirect:/member/login";
	    }
	}


	@GetMapping("/logout.do")
	public String logoutMainGET(HttpServletRequest request) throws Exception {

		Logger.info("logoutMainGET 메서드 진입");

		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/main";

	}

}
