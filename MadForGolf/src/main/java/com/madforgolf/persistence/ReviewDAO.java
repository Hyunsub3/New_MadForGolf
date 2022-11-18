package com.madforgolf.persistence;

import java.util.List;

import com.madforgolf.domain.MemberVO;
import com.madforgolf.domain.PageMakerVO;
import com.madforgolf.domain.ReviewVO;

public interface ReviewDAO {

	// 리뷰 스코어 가져오기
	public MemberVO getReviewScore(String user_id) throws Exception;
	

	// 리뷰 목록 (상품 번호로) 가져오기
		public List<ReviewVO> getReviewListAll (String seller_id, PageMakerVO pm) throws Exception;
	
	
	// 페이징 처리
	public Integer getTotalCnt (String seller_id) throws Exception;
	
	// 판매 상품 리뷰 상세 조회
	public ReviewVO reviewSell (Integer prod_num, String user_id) throws Exception;
}
