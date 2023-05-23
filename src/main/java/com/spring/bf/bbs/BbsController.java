package com.spring.bf.bbs;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.bf.bbsLike.BbsLikeDAO;
import com.spring.bf.bbsLike.BbsLikeVO;
import com.spring.bf.group.GroupDAO;
import com.spring.bf.group.GroupVO;

@Controller
public class BbsController {
	@Autowired
	BbsDAO dao;
	
	@Autowired
	GroupDAO dao2;
	
	@Autowired
	BbsLikeDAO dao3;
	
	@RequestMapping("bbs/list")
	public void list(BbsVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<BbsVO> list = dao.list(vo);
		int count = dao.count(vo.getGroup_no());
		int pages = 0;
		if (count % 20 == 0) {
			pages = count / 20;
		} else {
			pages = count / 20 + 1;
		}
		model.addAttribute("list", list);
		model.addAttribute("pages", pages);
		
		//그룹이름
		GroupVO vo2 = dao2.one(vo.getGroup_no());
		model.addAttribute("group", vo2);
	}
	
	@RequestMapping("bbs/one")
	public void one(int bbs_no, Model model, HttpSession session) {
		//조회수
		dao.update(bbs_no);
		
		BbsVO vo = dao.one(bbs_no);
		model.addAttribute("vo", vo);
		
		//그룹이름
		GroupVO vo3 = dao2.one(vo.getGroup_no());
		model.addAttribute("group", vo3);
		
		//좋아요 눌렀는지 확인
		String id = (String)session.getAttribute("id");
		BbsLikeVO vo2 = new BbsLikeVO();
		vo2.setBbs_no(bbs_no);
		vo2.setMember_id(id);
		int count = dao3.one(vo2);
		model.addAttribute("like", count);
	}
	
	@RequestMapping("bbs/insert")
	public String list(BbsVO vo, HttpServletRequest request, MultipartFile file) throws Exception {
		if (!file.isEmpty()) {
			String savedName = file.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target);
			
			vo.setImg(savedName);
		}
		
		dao.insert(vo);
		return "redirect:list?group_no=" + vo.getGroup_no() + "&page=1";
	}
	
	@RequestMapping("bbs/delete")
	public void delete(int bbs_no) {
		System.out.println(bbs_no);
		dao.delete(bbs_no);
	}
	
	@RequestMapping("bbs/update2")
	public String update(BbsVO vo, HttpServletRequest request, MultipartFile file) throws Exception {
		if (!file.isEmpty()) {
			String savedName = file.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target);
			
			vo.setImg(savedName);
		}
		System.out.println(vo);
		dao.update(vo);
		return "redirect:one?bbs_no=" + vo.getBbs_no();
	}
	
	@RequestMapping("bbs/update")
	public void update(int bbs_no, Model model) {
		BbsVO vo = dao.one(bbs_no);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("bbs/search")
	public void search(BbsVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<BbsVO> list = dao.search(vo);
		
		int count = dao.count(vo);
		int pages = 0;
		if (count % 20 == 0) {
			pages = count / 20;
		} else {
			pages = count / 20 + 1;
		}
		model.addAttribute("list", list);
		model.addAttribute("pages", pages);
	}
	
	//전체 인기 게시물
	@RequestMapping("bbs/best")
	public void best(Model model) {
		List<BbsVO> list = dao.best();
		model.addAttribute("list", list);
	}
	
	//각 게시판별
	@RequestMapping("bbs/best2")
	public void best(BbsVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<BbsVO> list = dao.best(vo);
		model.addAttribute("list", list);
		
		int count = dao.count2(vo.getGroup_no());
		int pages = 0;
		if (count % 20 == 0) {
			pages = count / 20;
		} else {
			pages = count / 20 + 1;
		}
		model.addAttribute("pages", pages);
		
		//그룹이름
		GroupVO vo2 = dao2.one(vo.getGroup_no());
		model.addAttribute("group", vo2);
	}
	
}