package com.spring.bf.eventchallenge;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class eventchallengeDAO implements test { 
	
	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public void insert(eventchallengeVO bag) {
		my.insert("eventchallenge.create", bag);
	}
	
	@Override
	public void delete (String id) {
		my.delete("eventchallenge.del", id);
	}
	
	@Override
	public void update (eventchallengeVO bag) {
		my.update("eventchallenge.up", bag);
	}
	
	@Override
	public eventchallengeVO one (String img) {
		eventchallengeVO vo=my.selectOne("eventchallenge.one", img);
		return vo;
	}
	
	@Override
	public eventchallengeVO imgone (String img) {
		eventchallengeVO vo=my.selectOne("eventchallenge.imgone", img);
		return vo;
	}
	
	@Override
	public List <eventchallengeVO> list(){
		List<eventchallengeVO> list=my.selectList("eventchallenge.all");
		return list;
	}
}