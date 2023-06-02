package com.spring.bf.pay;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

//import com.spring.bf.pay.BbsDAO;
import com.spring.bf.pay.PayVO;
import com.spring.bf.pay.Page1VO;
//import com.spring.bf.pay.ReplyDAO;
//import com.spring.bf.pay.ReplyVO;
import com.spring.bf.pay.PayVO;


@Controller
//@RequestMapping("payment")
public class RestController {
	
	@Autowired
	PayDAO dao;
	//@GetMapping("/insertpay")
	
	@RequestMapping("payment/insertpay")
	public String insert(PayVO bag, Model model) {
		System.out.println("insertpay : "+bag);
		
		Page1VO vo = new Page1VO();
		vo.setPage(1); 
		vo.setStartEnd(1);
		
		dao.insert(bag);
		
		List<PayVO> list = dao.all(vo); ////asdfasdfasdfasdfasdfasdf
		int count = dao.count();
		int pages = count / 10 + 1;
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
		System.out.println("list : "+list);
		return "payment/list_result";	
	}
	
	@RequestMapping("payment/paidList")
	public String paidList(Page1VO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<PayVO> list = dao.all(vo);
		int count = dao.count();
		System.out.println("all count>> " + count);
		int pages = count / 10 + 1; //전체 페이지 개수 구하
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
		return "payment/list_result";
		
	}
	
	/*
	 * @RequestMapping("list") public void list(Model model) { //Model은 컨트롤러의 list를
	 * views/list.jsp까지만 전달할 수 있는 객체
	 * 
	 * 
	 * }
	 */
	
	//@RequestMapping("payment/delete")//여기 주의하자 !! bag가 아닌 id만있으니 id만했음.!
	//public void delete(PayVO bag) {
	//	System.out.println("delete요청됨.");
		
	//	System.out.println(dao);
	//	dao.delete(bag);
	//}
	@RequestMapping("payment/delete")//여기 주의하자 !! bag가 아닌 id만있으니 id만했음.!
	public void delete(String id) {
		System.out.println("delete요청됨.");
		System.out.println(dao);
		dao.delete(id);
	}
	
//	@RequestMapping("json2")
//	@ResponseBody //요청을 받으면 return되는 데이터를 json으로 만들어서 요청하는 곳으로 다시 보냄.
//	public ArrayList<PayVO> json2() {
//		PayVO bag = new PayVO();
//		bag.setId("root");
//		bag.setMoney("money");
//		bag.setName("hong");
//		bag.setTel("011");
//		
//		PayVO bag2 = new PayVO();
//		bag2.setId("root2");
//		bag.setMoney("money");
//		bag2.setName("hong2");
//		bag2.setTel("0112");
//		
//		ArrayList<PayVO> list = new ArrayList<PayVO>();
//		
//		list.add(bag);
//		list.add(bag2);
//		
//		
//		
//		return list; //{"id" : "root", "pw" : "1234", ;
//	}
	
	@RequestMapping("payment/json1")
	@ResponseBody //요청을 받으면 return되는 데이터를 json으로 만들어서 요청하는 곳으로 다시 보냄.
	public PayVO json1() {
		
		
		PayVO bag = new PayVO();
	
		bag.setMoney("1000");
		
		return bag; //{"id" : "root", "pw" : "1234", ;
		
		
		
	}
	
	@RequestMapping("payment/json1000")
	@ResponseBody //요청을 받으면 return되는 데이터를 json으로 만들어서 요청하는 곳으로 다시 보냄.
	public PayVO json1000() {
		
		
		PayVO bag = new PayVO();
	
		bag.setMoney("1000");
		
		return bag; //{"id" : "root", "pw" : "1234", ;
	}
	
	@RequestMapping("payment/json2000")
	@ResponseBody //요청을 받으면 return되는 데이터를 json으로 만들어서 요청하는 곳으로 다시 보냄.
	public PayVO json2000() {
		
		
		PayVO bag = new PayVO();
	
		bag.setMoney("2000");
		
		return bag; //{"id" : "root", "pw" : "1234", ;
	}
	
	@RequestMapping("payment/json50000")
	@ResponseBody //요청을 받으면 return되는 데이터를 json으로 만들어서 요청하는 곳으로 다시 보냄.
	public PayVO json50000() {
		
		
		PayVO bag = new PayVO();
	
		bag.setMoney("50000");
		
		return bag; //{"id" : "root", "pw" : "1234", ;
		
		
		
	}
	
	/*
	 * @RequestMapping("payment_result") public String payment_result(PayVO vo
	 * ,Model model) { ArrayList<PayVO> list = dao.list();
	 * System.out.println(list.size()); //사이즈를 찍어보세요. model.addAttribute("payVO",
	 * vo);
	 * 
	 * 
	 * return "구매하기"; }
	 */
	
	
	

	
//	@RequestMapping("map22")
//	@ResponseBody
//	public MapVO json22() {
//		MapVO bag = new MapVO();
//		bag.setLat(37.51);
//		bag.setLon(127.06);
//		
//		System.out.println(bag);
//		return bag;
//	}
//	
//	@RequestMapping("jasonResponse5")
//	@ResponseBody // 요청을 받으면 return되는 데이터를 json으로 만들어서 요청하는 곳으로 다시 보냄,
//	public MapVO kakaoMap() {
//		MapVO bag = new MapVO();
//		bag.setLat(37.5117);
//		bag.setLon(127.0592);
//		System.out.println(bag);
//		return bag;
//	}
//	
//	
//	@RequestMapping("jsonResponse6")
//	@ResponseBody
//	public ArrayList<ChartVO> json6() {
//		ArrayList<ChartVO> list = new ArrayList<ChartVO>();
//		
//		ChartVO vo = new ChartVO();
//		vo.setWork("study!");
//		vo.setTime(10);
//		list.add(vo);
//		
//		ChartVO vo2 = new ChartVO();
//		vo2.setWork("run!");
//		vo2.setTime(5);
//		list.add(vo2);
//		
//		ChartVO vo3 = new ChartVO();
//		vo3.setWork("eat!");
//		vo3.setTime(7);
//		list.add(vo3);
//		
//		return list;
//	}
//	
	@RequestMapping("payment/payAll")
	public void all(Page1VO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<PayVO> list = dao.all(vo);
		int count = dao.count();
		System.out.println("all count>> " + count);
		int pages = count / 10 + 1; //전체 페이지 개수 구하
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
	}


@RequestMapping("payList")
public void list(PayVO vo, Model model) {
	List<PayVO> list = dao.list();
	model.addAttribute("list", list);
}

@RequestMapping("payList2")
public void list2(Page1VO vo, Model model) {
	vo.setStartEnd(vo.getPage());
	List<PayVO> list = dao.list2(vo);
	model.addAttribute("list", list);
}

//@RequestMapping("payAll")
//public void all(Page1VO vo, Model model) {
//	vo.setStartEnd(vo.getPage());
	//List<PayVO> list = dao.all(vo);
	//int count = dao.count();
	//System.out.println("all count>> " + count);
	//int pages = count / 10 + 1; //전체 페이지 개수 구하
	//model.addAttribute("list", list);
	//model.addAttribute("count", count);
	//model.addAttribute("pages", pages);
//}

@RequestMapping("payAll2")
public void all2(Page1VO vo, Model model) {
	vo.setStartEnd(vo.getPage());
	List<PayVO> list = dao.all(vo);
	int count = dao.count();
	System.out.println("all count>> " + count);
	int pages = count / 10 + 1; //전체 페이지 개수 구하기 
	model.addAttribute("list", list);
	model.addAttribute("count", count);
	model.addAttribute("pages", pages);
}

//@RequestMapping("payOne")
//public void one(PayVO vo, Model model) {
//	//게시물 1개짜리 vo2
//	//replyList
//	PayVO vo2 = dao.one(vo);
//	model.addAttribute("one", vo2);
//	
//	List<ReplyVO> list = dao2.list(vo);
//	model.addAttribute("list", list);
//}
//
//@RequestMapping("payIn")
//public void insert(PayVO vo, Model model) {
//	//리뷰<--- movie(oriId, img)
//	//insert into review values (null, #{oriId}, #{content}, #{writer})
//	//화면만들때는 
//	//review + movie(oriId, img)
//	
//	int result = dao.insert(vo);
//	PayVO vo2 = dao.createdId();
//	String text = "게시물 작성 성공";
//	if(result != 1) {
//		text = "게시물 작성 실패";
//	}
//	model.addAttribute("result", text);
//	model.addAttribute("id", vo2.getId());
//}
@RequestMapping("payDel")
public void delete(PayVO vo, Model model) {
	int result = dao.del(vo);
	model.addAttribute("result", result);
}
@RequestMapping("payUp")
public void update(PayVO vo, Model model) {
	//수정하기버튼을 누르면, 기존의 db에 저장된 데이터를
	//가지고 와서, 수정할 수 있는 화면에 넣어주어야 한다. 
	PayVO vo2 = dao.one(vo);
	model.addAttribute("one", vo2);
}

}
	
	

