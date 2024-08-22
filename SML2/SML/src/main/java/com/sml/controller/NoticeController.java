package com.sml.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.nio.file.Files;
import java.nio.file.Path;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.net.URLDecoder;


import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.util.FileCopyUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sml.model.Criteria;
import com.sml.model.FileupVO;
import com.sml.model.MemberVO;
import com.sml.model.NoticeVO;
import com.sml.model.PageDTO;
import com.sml.service.NoticeService;


@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
   
	@Autowired
	private NoticeService noticeservice;
	
	/* 공지사항 조회페이지 이동 */
	@GetMapping("/list")
	public void noticeListGET(Criteria cri, Model model, HttpSession session) throws Exception {

		logger.info("공지사항 조회페이지 이동" + cri);
      
		List<NoticeVO> list = noticeservice.noticeGetList(cri);
		
		if(!list.isEmpty()) {
	          model.addAttribute("list", list);
	       } else {
	    	   model.addAttribute("listCheck", "empty");
	       }
		
			/* 페이징처리 */
		int total = noticeservice.noticeGetTotal(cri);
		
		PageDTO pageMaker = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
		
		
		 // 로그인 상태 확인
		// MemberVO 객체를 가져옵니다.
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    
	    // member 객체가 null이 아니라면 로그인 상태입니다.
	    boolean isLoggedIn = (member != null);
	    boolean isAdmin = false;
	    
	    if(isLoggedIn) {
	        isAdmin = member.getMemAdminCheck() == 1;
	    }
	    model.addAttribute("isLoggedIn", isLoggedIn);
	    model.addAttribute("isAdmin", isAdmin);
	}
	
	/* 공지사항 조회기능 */
	@PostMapping("/Count")
	@ResponseBody
	public ResponseEntity<String> noticeCount(@RequestParam("noticeCode") int noticeCode) {
	    try {
	        int affectedRows = noticeservice.noticeCount(noticeCode);
	        logger.info("조회수 증가: 영향을 받은 행의 수 = " + affectedRows);
	        return ResponseEntity.ok("조회수 증가 성공");
	    } catch (Exception e) {
	        logger.error("조회수 증가 중 오류 발생", e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("조회수 증가 실패");
	    }
	}

	@PostMapping("/Like")
    @ResponseBody
    public ResponseEntity<String> noticeLikePOST(@RequestParam("noticeCode") int noticeCode) {
        try {
            boolean success = noticeservice.noticeLike(noticeCode);
            if (success) {
                return ResponseEntity.ok("좋아요 증가 성공");
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("좋아요 증가 실패");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("좋아요 증가 실패");
        }
    }
	
	/* 공지사항 상세조회페이지 이동 */
	@GetMapping({"/detail" , "/modify"})
	public void noticeDetailGET(int noticeCode,Criteria cri, Model model, HttpSession session) throws Exception {

		logger.info("공지사항 상세조회 이동 ");
			
		// 조회수 증가
        noticeservice.noticeCount(noticeCode);
		/* 공지사항 조회 페이지 정보 */
		model.addAttribute("cri",cri);
			/* 선택 글 정보 */
		model.addAttribute("noticeDetail", noticeservice.noticeGetDetail(noticeCode));
		 // 로그인 상태 확인
		// MemberVO 객체를 가져옵니다.
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    
	    // member 객체가 null이 아니라면 로그인 상태입니다.
	    boolean isLoggedIn = (member != null);
	    boolean isAdmin = false;
	    
	    if(isLoggedIn) {
	        isAdmin = member.getMemAdminCheck() == 1;
	    }
	    model.addAttribute("isLoggedIn", isLoggedIn);
	    model.addAttribute("isAdmin", isAdmin);
	}
	
	/* 공지사항 등록페이지 이동 */
	@GetMapping("/enroll")
	public void noticeEnrollGET(HttpSession session) throws Exception {

		logger.info("공지사항 등록페이지 이동");
     
	}
	
	@PostMapping("/enroll.do")
	public String noticeEnrollPOST(NoticeVO notice ,RedirectAttributes rttr) throws Exception {
		 logger.info("공지사항 글 등록: " + notice);
		 
		 noticeservice.noticeRegister(notice);
		 rttr.addFlashAttribute("enroll_result", notice.getNoticeTitle());
		return "redirect:/notice/list";
	}
  
	/* 공지사항 수정 */
	   @PostMapping("/modify")
	   public String noticeModifyPOST(NoticeVO notice ,RedirectAttributes rttr) throws Exception{
		   logger.info("공지사항 수정: " + notice); 
		   
		   int result= noticeservice.noticeModify(notice);
		   
		   rttr.addFlashAttribute("modify_result", result);
		   
		   return "redirect:/notice/list";
	   }
	
		/* 공지사항 삭제 */
	   
	   @PostMapping("/delete")
	   public String noticeDeletePOST(int noticeCode,RedirectAttributes rttr) throws Exception{
		  
			logger.info("공지사항 삭제.........." + noticeCode);
			
			int result = 0;
			
			try {
				
				result = noticeservice.noticeDelete(noticeCode);
				
			} catch (Exception e) {
				
				e.printStackTrace();
				result = 2;
				rttr.addFlashAttribute("delete_result", result);
				
				return "redirect:/notice/list";
			}

			logger.info("삭제 결과.........." + result);
			rttr.addFlashAttribute("delete_result", result);
			
			return "redirect:/notice/list";
		}
		
		/* 이미지 미리보기 */
	   @GetMapping("/display")
		public ResponseEntity<byte[]> getImage(String fileName){
			
			File file = new File("c:\\upload\\" + fileName);
			
			ResponseEntity<byte[]> result = null;
			
			try {
				
				HttpHeaders header = new HttpHeaders();
				
				header.add("Content-type", Files.probeContentType(file.toPath()));
				
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
				
			}catch (IOException e) {
				e.printStackTrace();
			}
			
			return result;
		}
	   
	   /* 첨부 파일 업로드 */
	   @PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ResponseEntity<List<FileupVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
			
			logger.info("uploadAjaxActionPOST..........");
			
			/* 이미지 파일 체크 */
			for(MultipartFile multipartFile: uploadFile) {
				
				File checkfile = new File(multipartFile.getOriginalFilename());
				String type = null;
				
				try {
					type = Files.probeContentType(checkfile.toPath());
					logger.info("MIME TYPE : " + type);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				if(!type.startsWith("image")) {
					
					List<FileupVO> list = null;
					return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
					
				}
				
			}// for
			
			String uploadFolder = "C:\\upload";
			
			/* 날짜 폴더 경로 */
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			Date date = new Date();
			
			String str = sdf.format(date);
			
			String datePath = str.replace("-", File.separator);
			
			/* 폴더 생성 */
			File uploadPath = new File(uploadFolder, datePath);
			
			if(uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
			
			/* 이미저 정보 담는 객체 */
			List<FileupVO> list = new ArrayList();
			
			// 향상된 for
			for(MultipartFile multipartFile : uploadFile) {
				 
				FileupVO vo = new FileupVO();
		
				/* 파일 이름 */
		   		String uploadFileName = multipartFile.getOriginalFilename();
		   		vo.setFileName(uploadFileName);
		   		vo.setFilePath(datePath);
				
				/* uuid 적용 파일 이름(동일한이름을 가진 파일일시, 고유한 이름을 가지도록 해결함)*/ 
				String uuid = UUID.randomUUID().toString();
				vo.setFileUuid(uuid);
				
				uploadFileName = uuid + "_" + uploadFileName;
				
				/* 파일 위치, 파일 이름을 합친 File 객체 */
				File saveFile = new File(uploadPath, uploadFileName);
				
				/* 파일 저장 */
				try {
					multipartFile.transferTo(saveFile);
					
					/* 썸네일 생성 */
					File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
					
					BufferedImage bo_image = ImageIO.read(saveFile);
					
					/* 비율 */
					double ratio = 3;
					/*넓이 높이*/
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);
					
					BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
									
					Graphics2D graphic = bt_image.createGraphics();
					
					graphic.drawImage(bo_image, 0, 0,width,height, null);
						
					ImageIO.write(bt_image, "jpg", thumbnailFile);

					
					
				} catch (Exception e) {
					e.printStackTrace();
				} 
				
				list.add(vo);
			} // for문
			ResponseEntity<List<FileupVO>> result = new ResponseEntity<List<FileupVO>>(list, HttpStatus.OK);
		
			return result;
		}
	   
	   /* 이미지 파일 삭제 */
		@PostMapping("/deleteFile")
		public ResponseEntity<String> deleteFile(@RequestParam String fileName){
			
			logger.info("deleteFile........" + fileName);
			File file = null;
			
			try {
				/* 썸네일 파일 삭제 */
				file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
				
				file.delete();
				
				/* 원본 파일 삭제 */
				String originFileName = file.getAbsolutePath().replace("s_", "");
				
				logger.info("originFileName : " + originFileName);
				
				file = new File(originFileName);
				
				file.delete();
				
				
			} catch(Exception e) {
				
				e.printStackTrace();
				
				return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
				
			} //catch
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}

}
