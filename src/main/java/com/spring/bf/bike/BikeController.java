package com.spring.bf.bike;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class BikeController {

	@Autowired
	BikeDAO dao;
	
	
	@Autowired
	BikeReplyDAO dao2;
	
	//자전거 페이지를 불러오면서 1페이지에 데이터를 가져와서불러옴
	@RequestMapping("bike/bikemain")
	public String bikeMain(Model model) {
		PageVO vo = new PageVO();
		vo.setPage(1);
		vo.setStartEnd(vo.getPage());
		List<BikeVO> list = dao.all(vo);

		int count = dao.count();
		System.out.println("all count>> " + count);
		int pages = count / 6 + 1; // 전체 페이지 개수 구하
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
		return "bike/bikemain";
	}
	
	
	//자전거 페이지를 불러오면서 1페이지에 데이터를 넘겨주기
	@RequestMapping("bike/bikelistGetData")
	@ResponseBody
	public List<BikeVO> bikelistGetData() {
		PageVO vo = new PageVO();
		vo.setPage(1);
		vo.setStartEnd(vo.getPage());
		List<BikeVO> list = dao.all(vo);

		return list;
	}
	
	//자전거 전체 정보 불러오기
	@RequestMapping("bike/bikelist")
	public void list(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<BikeVO> list = dao.all(vo);
		int count = dao.count();
		int pages = count / 6 + 1; // 전체 페이지 개수 
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
	}

	//자전거 상세페이지	
	@RequestMapping("bike/bikeone")
	public void one(int bike_no, Model model) {
		
		BikeVO bag = dao.one(bike_no);
		model.addAttribute("bag", bag);
		
		List<BikeReplyVO> list = dao2.list(bike_no);
		System.out.println(list.size());
		model.addAttribute("list", list);
		
		BikeReplyVO bag2 = dao2.one(bike_no);
		model.addAttribute("bag2", bag2);
	}
	//검색조건으로 검색
	@RequestMapping("bike/bikelistsearch")
	public void listsearch
	(Model model ,String searchtype,String keyword, SearchVO vo) {
		vo.setStartEnd(vo.getPage());
		vo.setSearchtype(searchtype);
		vo.setKeyword(keyword);
		
		List<BikeVO> list = null;
		int count = 0 ;
		//키워드에따라 검색결과 다르게 받아오기
		if(searchtype.equals("bike_brand")){
			list = dao.searchbrand(vo);
			count =	dao.countbrand(keyword);
		}else if(searchtype.equals("bike_category")) {
			list = dao.searchcaegory(vo);
			count = dao.countcategory(keyword);
		}
		int pages = count / 6 + 1; // 전체 페이지 개수 
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchtype", searchtype);
	}
	
	//검색해서 첫페이지를 바로 보여주기위해서 만듬
	@RequestMapping("bike/bikelistsearchdata")
	public void listsearch2(Model model ,String searchtype,String keyword, SearchVO vo) {
		System.out.println(searchtype +" 검색타입");
		System.out.println(keyword + " 키워드");
		System.out.println(vo + " page");
		
		//SearchVO vo = new SearchVO();
		vo.setPage(1);
		vo.setStartEnd(vo.getPage());
		vo.setSearchtype(searchtype);
		vo.setKeyword(keyword);
		
		
		List<BikeVO> list = null;
		int count = 0 ;
		if(searchtype.equals("bike_brand")){
			list = dao.searchbrand(vo);
			count =	dao.countbrand(keyword);
			System.out.println("brand>>" + count);
		}else if(searchtype.equals("bike_category")) {
			list = dao.searchcaegory(vo);
			count = dao.countcategory(keyword);
			System.out.println("catagery>>"+ count);
		}
		System.out.println("검색 갯수는 " + count);
		int pages = count / 6 + 1; // 전체 페이지 개수 
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchtype", searchtype);
	}
	
	
}