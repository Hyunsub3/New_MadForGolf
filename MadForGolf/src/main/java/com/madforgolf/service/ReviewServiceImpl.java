package com.madforgolf.service;


import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.madforgolf.domain.MemberVO;
import com.madforgolf.domain.PageMakerVO;
import com.madforgolf.domain.ReviewVO;
import com.madforgolf.persistence.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	private static final Logger log 
		= LoggerFactory.getLogger(ReviewServiceImpl.class);
	
	@Inject
	private ReviewDAO dao;
	
	// 리뷰 스코어 가져오기
	@Override
	public MemberVO getReviewScore(String user_id) throws Exception {
		log.info("getReviewScore-ServiceImpl() 호출");
		
		return dao.getReviewScore(user_id);
	}

	
	// 리뷰 목록 (상품 번호로) 가져오기
		@Override
		public List<ReviewVO> gerReviewListAll(String seller_id, PageMakerVO pm) throws Exception {
			return dao.getReviewListAll(seller_id, pm);
		}

	// 페이징 처리
	@Override
	public Integer getTotalCnt(String seller_id) throws Exception {
		return dao.getTotalCnt(seller_id);
	}


	// 판매 상품 리뷰 상세 조회
	@Override
	public ReviewVO reviewSell(Integer prod_num, String user_id) throws Exception {
		
		log.info("serviceImpl ******" + prod_num);
		
		return dao.reviewSell(prod_num, user_id);
		
	}
	

}
