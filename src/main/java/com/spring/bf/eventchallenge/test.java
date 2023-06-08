package com.spring.bf.eventchallenge;

import java.util.List;

public interface test {

	void insert(eventchallengeVO bag);

	void delete(String id);

	void update(eventchallengeVO bag);

	eventchallengeVO one(String img);

	eventchallengeVO imgone(String img);

	List<eventchallengeVO> list();

}