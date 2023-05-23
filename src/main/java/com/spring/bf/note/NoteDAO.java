package com.spring.bf.note;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NoteDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(NoteVO bag) {
		my.insert("note.create", bag);
	}
	
	public void delete(int no) {
		int result = my.delete("note.del", no);
		System.out.println(result);
	}
	public List<NoteVO> send(NoteVO bag) {
		List<NoteVO> list = my.selectList("note.send", bag);
		System.out.println(list.size());
		return list;
	}
	
	public List<NoteVO> receive(NoteVO bag) {
		List<NoteVO> list = my.selectList("note.receive", bag);
		System.out.println(list.size());
		return list;
	}
	
	//노트에 대한 상세페이지 조회, 입력값을 NO
	public NoteVO one(int no) {
		NoteVO one = my.selectOne("note.one", no);
		return one;
	}
}
