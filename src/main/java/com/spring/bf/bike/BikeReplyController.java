package com.spring.bf.bike;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.cj.Session;

@Controller
public class BikeReplyController {

	@Autowired
	BikeReplyDAO dao;

	@RequestMapping("bike/bikereplyinsert")
	public void insert(BikeReplyVO bag,Model model) {
	
		//Mapper에 그냥 now()함수써서 넣어봄 안되면 이걸로 다시 바꿔야함
		
		 dao.insert(bag);
		 Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 bag.setDate(Timestamp.valueOf(sdf.format(timestamp)));
		 model.addAttribute("bag", bag);
	}
	
	@RequestMapping("bike/bikereplydelete")
	public void delete(int bikereply_no) {
		dao.delete(bikereply_no);
	}
	
	
	@RequestMapping("bike/bikereplyupdate")
	public void update(int bikereply_no,Model model) {
		BikeReplyVO vo = dao.one(bikereply_no);
		model.addAttribute("vo",vo);
	}
	
	@RequestMapping("bike/bikereplyupdate2")
	public void update2(BikeReplyVO vo) {
		dao.update(vo);
	}
	
	
	

}