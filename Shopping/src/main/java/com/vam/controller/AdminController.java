package com.vam.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.vam.model.AttachImageVO;
import com.vam.model.AuthorVO;
import com.vam.model.BookVO;
import com.vam.model.CateVO;
import com.vam.model.Criteria;
import com.vam.model.PageDTO;
import com.vam.service.AuthorService;

import net.coobird.thumbnailator.Thumbnails;

import com.vam.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private AuthorService authorService;

    @Autowired
    private AdminService adminService;

    @GetMapping("/main")
    public String adminMainGET() throws Exception {
        logger.info("관리자 페이지 이동");
        return "admin/main";
    }

    @GetMapping("/authorEnroll")
    public String authorEnrollGET() throws Exception {
        logger.info("작가 등록 페이지 접속");
        return "admin/authorEnroll";
    }

    @GetMapping("/authorManage")
    public void authorManageGET(Criteria cri, Model model) throws Exception {
        logger.info("작가 관리 페이지 접속....." + cri);

        List<AuthorVO> list = authorService.authorGetList(cri);

        if (!list.isEmpty()) {
            model.addAttribute("list", list);
        } else {
            model.addAttribute("listCheck", "empty");
        }

        int total = authorService.authorGetTotal(cri);
        PageDTO pageMaker = new PageDTO(cri, total);
        model.addAttribute("pageMaker", pageMaker);
    }

    @PostMapping("/authorEnroll.do")
    public String authorEnrollPOST(AuthorVO author, RedirectAttributes rttr) throws Exception {
        logger.info("authorEnroll : " + author);
        authorService.authorEnroll(author);
        rttr.addFlashAttribute("enroll_result", author.getAuthorName());
        return "redirect:/admin/authorManage";
    }


	/* 작가 상세, 수정 페이지 */
	@GetMapping({"/authorDetail", "/authorModify"})
	public void authorGetInfoGET(int authorId, Criteria cri, Model model) throws Exception {
		
		logger.info("authorDetail......." + authorId);
		
		/* 작가 관리 페이지 정보 */
		model.addAttribute("cri", cri);
		
		/* 선택 작가 정보 */
		model.addAttribute("authorInfo", authorService.authorGetDetail(authorId));
		
	}	

	/* 작가 정보 수정 */
	@PostMapping("/authorModify")
	public String authorModifyPOST(AuthorVO author, RedirectAttributes rttr) throws Exception{
		
		logger.info("authorModifyPOST......." + author);
		
		int result = authorService.authorModify(author);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/authorManage";
		
	}	

    @PostMapping("/goodsEnroll")
    public String goodsEnrollPOST(BookVO book, RedirectAttributes rttr) {
        logger.info("goodsEnrollPOST....." + book);

        adminService.bookEnroll(book);
        rttr.addFlashAttribute("enroll_result", book.getBookName());

        return "redirect:/admin/goodsManage";
    }

    @GetMapping("/authorPop")
    public void authorPopGET(Criteria cri, Model model) throws Exception {
        logger.info("authorPopGET......");

        cri.setAmount(5);

        List<AuthorVO> list = authorService.authorGetList(cri);

        if (!list.isEmpty()) {
            model.addAttribute("list", list);
        } else {
            model.addAttribute("listCheck", "empty");
        }

        model.addAttribute("pageMaker", new PageDTO(cri, authorService.authorGetTotal(cri)));
    }

    @GetMapping("/goodsEnroll")
    public void goodsEnrollGET(Model model) throws Exception {
        logger.info("상품 등록 페이지 접속");

        ObjectMapper objm = new ObjectMapper();

        List<CateVO> list = adminService.cateList();

        String cateList = objm.writeValueAsString(list);

        model.addAttribute("cateList", cateList);

        logger.info("변경 전....." + list);
        logger.info("변경 후....." + cateList);
    }

    @GetMapping("/goodsManage")
    public void goodsManageGET(Criteria cri, Model model) throws Exception {
        logger.info("상품 관리 페이지 접속");

        List list = adminService.goodsGetList(cri);

        if (!list.isEmpty()) {
            model.addAttribute("list", list);
        } else {
            model.addAttribute("listCheck", "empty");
            return;
        }

        model.addAttribute("pageMaker", new PageDTO(cri, adminService.goodsGetTotal(cri)));
    }

    @GetMapping({"/goodsDetail", "/goodsModify"})
    public void goodsGetInfoGET(int bookId, Criteria cri, Model model) throws JsonProcessingException {
        logger.info("goodsGetInfo()......." + bookId);

        ObjectMapper mapper = new ObjectMapper();

        model.addAttribute("cateList", mapper.writeValueAsString(adminService.cateList()));

        model.addAttribute("cri", cri);

        model.addAttribute("goodsInfo", adminService.goodsGetDetail(bookId));
    }

    @PostMapping("/goodsModify")
    public String goodsModifyPOST(BookVO vo, RedirectAttributes rttr) {
        logger.info("goodsModifyPOST....." + vo);

        int result = adminService.goodsModify(vo);

        rttr.addFlashAttribute("modify_result", result);

        return "redirect:/admin/goodsManage";
    }

    @PostMapping("/goodsDelete")
    public String goodsDeletePOST(int bookId, RedirectAttributes rttr) {
        logger.info("goodsDeletePOST.....");

        int result = adminService.goodsDelete(bookId);

        rttr.addFlashAttribute("delete_result", result);

        return "redirect:/admin/goodsManage";
    }

    @PostMapping("/authorDelete")
    public String authorDeletePOST(int authorId, RedirectAttributes rttr) {
        logger.info("authorDeletePOST.......");

        int result = 0;

        try {
            result = authorService.authorDelete(authorId);
        } catch (Exception e) {
            result = 2;
            rttr.addFlashAttribute("delete_result", result);
            return "redirect:/admin/authorManage";
        }

        rttr.addFlashAttribute("delete_result", result);

        return "redirect:/admin/authorManage";
    }
    
    @PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
        logger.info("uploadAjaxActionPOST.......");

        String uploadFolder = "C:\\upload";

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date date = new Date();

        String str = sdf.format(date);

        String datePath = str.replace("-", File.separator);

        File uploadPath = new File(uploadFolder, datePath);

        if (!uploadPath.exists()) {
            uploadPath.mkdirs();
        }

        List<AttachImageVO> list = new ArrayList<>();

        for (MultipartFile multipartFile : uploadFile) {

            String uploadFileName = multipartFile.getOriginalFilename();

            if (uploadFileName == null || uploadFileName.trim().isEmpty()) {
                logger.error("Invalid file name");
                continue;
            }

            String uuid = UUID.randomUUID().toString();

            uploadFileName = uuid + "_" + uploadFileName;

            File saveFile = new File(uploadPath, uploadFileName);

            try {
                multipartFile.transferTo(saveFile);

                File thumbnailFile = new File(uploadPath, "S_" + uploadFileName);

                Thumbnails.of(saveFile)
                .size(160, 160)
                .toFile(thumbnailFile);

                AttachImageVO vo = new AttachImageVO();
                vo.setFileName(uploadFileName);
                vo.setUploadPath(datePath);
                vo.setUuid(uuid);

                list.add(vo);

            } catch (Exception e) {
                e.printStackTrace();
                return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }

        return new ResponseEntity<>(list, HttpStatus.OK);
    }
    

}
