package com.madforgolf.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.madforgolf.domain.MemberVO;
import com.madforgolf.domain.PageMakerVO;
import com.madforgolf.domain.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	
	private static final Logger log 
		= LoggerFactory.getLogger(ReviewDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE
	= "com.madforgolf.mapper.ReviewMapper";
	
	
	// ---------------------------------------------------------------------------

	
	// 리뷰 스코어 가져오기
	@Override
	public MemberVO getReviewScore(String user_id) throws Exception {
		log.info("**** DAO - getReviewScore() 호출");
		
		log.info("DAOImpl ----- " + user_id);

		Integer score = sqlSession.selectOne(NAMESPACE+".reviewProdList", user_id);
		log.info(score + "DAOImpl 테스트 중 *****************");
		
		MemberVO mvo = new MemberVO();
		log.info(mvo + "DAOImpl 테스트 중 *****************");
		
		mvo.setUser_id(user_id);
		mvo.setScore(score);
		
		
		log.info(score+ "********** DAOImpl");
		log.info("DAOImpl ---++-- " + mvo);

		sqlSession.update(NAMESPACE+".reviewInsert", mvo);
		
		
		return sqlSession.selectOne(NAMESPACE+".reviewSelect", mvo);
	
	}

	
	// 리뷰 목록 (상품 번호로) 가져오기
		@Override
		public List<ReviewVO> getReviewListAll(String seller_id, PageMakerVO pm) throws Exception {
			
			Map<String, Object> hashMap = new HashMap<String, Object>();
			
			hashMap.put("seller_id", seller_id);
			hashMap.put("startRow", pm.getStartRow());
			hashMap.put("perPageNum", pm.getVo().getPerPageNum());

			log.info(pm.getStartPage()+"");
			log.info(pm.getVo().getPerPageNum()+"");
			return sqlSession.selectList(NAMESPACE+".getReviewListAll", hashMap);

		}

	// 페이징 처리
	@Override
	public Integer getTotalCnt(String seller_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getReviewCnt", seller_id) ;
	}


	// 판매 상품 리뷰 상세 조회
	@Override
	public ReviewVO reviewSell(Integer prod_num, String user_id) throws Exception {
		
		
		
		log.info("DAOImpl ****** " + prod_num);
		

		Map<String, Object> pageObj = new HashMap<String, Object>();
		pageObj.put("prod_num", prod_num);
		pageObj.put("user_id", user_id);
		log.info(user_id);
		
		ReviewVO vo = sqlSession.selectOne(NAMESPACE+".reviewSell", pageObj);
		log.info("다오임플 마지막"+vo);
		
		return vo;
	}
	
	// ---------------------------------------------------------------------------
	

}
