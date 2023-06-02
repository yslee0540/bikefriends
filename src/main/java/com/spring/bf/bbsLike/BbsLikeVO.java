package com.spring.bf.bbsLike;

public class BbsLikeVO {

	private int like_no;
	private int bbs_no;
	private String member_id;

	@Override
	public String toString() {
		return "BbsLikeVO [like_no=" + like_no + ", bbs_no=" + bbs_no + ", member_id=" + member_id + "]";
	}

	public int getLike_no() {
		return like_no;
	}

	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}

	public int getBbs_no() {
		return bbs_no;
	}

	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
