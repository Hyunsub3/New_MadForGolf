package com.madforgolf.controller;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.madforgolf.domain.MemberVO;
import com.madforgolf.domain.PageMakerVO;
import com.madforgolf.domain.PageVO;
import com.madforgolf.domain.ProductSellerVO;
import com.madforgolf.domain.ProductVO;
import com.madforgolf.domain.ReviewVO;
import com.madforgolf.service.ProductSellerService;
import com.madforgolf.service.ReviewService;

@Controller
@RequestMapping("/mypage/*")
public class ReviewController {

	
	private static final Logger log 
		= LoggerFactory.getLogger(ReviewController.class);
	
	@Inject
	private ReviewService service;
	
	@Inject
	private ProductSellerService prdSellerService;
	
	
	// @@@@@@@@@@@@@@@@@@@@@@ 은주야 리뷰 컨트롤러는 전체 복붙해서 넣어줘 @@@@@@@@@@@@@@@@@@@@@@
	
	
	
	// ---------------------- 매너스코어 페이지 시작 ----------------------
	
		// http://localhost:8088/member/mannerScore
	
		// ----------------------------------------------------------------
	
		// 리뷰 스코어 가져오기
		@RequestMapping(value="/mannerScore", method = RequestMethod.GET)
		public void mannerScore(HttpSession session, Model model, PageVO vo2) throws Exception {
			
		log.info("mannerScore() 호출");
			
		String user_id = (String)session.getAttribute("user_id");
		Integer totalCnt = service.getTotalCnt(user_id);

		// 페이징 처리
		PageMakerVO pm = new PageMakerVO();
		pm.setVo(vo2); // 페이징 처리 하단부 정보를 vo에 받아오고
		pm.setTotalCnt(totalCnt); // calData() 페이징처리에 필요한 계산식 계산 메서드가 포함된 전체 글 갯수 초기화 메서드 호출
				
		log.info("pmVO : " + pm);
		log.info("pageVO : " + vo2);
		
		
		MemberVO reviewList1 = (MemberVO) service.getReviewScore(user_id);
		model.addAttribute("vo", reviewList1);
		
		
		// ----------------------------------------------------------------
		
		// 다른 사람이 쓴 리뷰 가져오기
		List<ReviewVO> rvo = service.gerReviewListAll(user_id, pm);
		
		model.addAttribute("rvo", rvo);
		
		
		// ----------------------------------------------------------------
		
		
		// 페이징 처리
		log.info("DB 내 상품의 총 개수 : " + totalCnt + "개");

		// 페이징 처리 하단부 정보 저장


		// 페이징 처리 객체(pm)을 어트리뷰트에 담아서 view로 보냄
		model.addAttribute("pm", pm);

		
		}
		// ----------------------------------------------------------------

		// ----------------------------------------------------------------
		
		
		// 판매 상품 리뷰 상세 조회
		
		@RequestMapping(value = "/reviewSell", method = RequestMethod.GET)
		public void reviewSell (ReviewVO vo, HttpSession session, Model model, Integer prod_num, String user_id) throws Exception {
			
			
			
			log.info(" reviewSell() 호출 ");
			log.info(vo + " --------------prod_num");
			
			String seller_id=(String)session.getAttribute("user_id");
			
			log.info("########## 123123" + seller_id);
			
			// service.reviewSell(prod_num);
			
			
			model.addAttribute("vo", service.reviewSell(prod_num, seller_id));
			
			log.info("############# Controller " + service.reviewSell(prod_num, seller_id));
			

			
	
		}

	// ---------------------- 매너스코어 페이지 끝 ----------------------
		
		
}