package com.madforgolf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.madforgolf.domain.BoardVO;
import com.madforgolf.domain.DealVO;
import com.madforgolf.domain.LikeVO;
import com.madforgolf.domain.PageMakerVO;
import com.madforgolf.domain.PageVO;
import com.madforgolf.domain.ProductVO;
import com.madforgolf.domain.SellerReviewVO;
import com.madforgolf.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {

	private static final Logger log = LoggerFactory.getLogger(ProductServiceImpl.class);

	// BoardDAO 객체 주입(DI)
	@Autowired
	private ProductDAO dao;
	
	@Override
	public List<ProductVO> listMain(ProductVO vo) throws Exception {
		log.info("Service:listMain()호출");
		
		List<ProductVO> productList = dao.listMain(vo);
		
		return productList;
	}
	
	
	
	@Override
	public List<ProductVO> getProductListAll(ProductVO vo, PageVO vo2) throws Exception {
		log.info("getProductListAll() 호출");

		List<ProductVO> productList = dao.listAll(vo, vo2);

		return productList;
	}
	
	@Override
	public List<ProductVO> getProductListAll2(ProductVO vo, PageVO vo2) throws Exception {
		log.info("getProductListAll2() 호출");
		
		List<ProductVO> productList = dao.listAll2(vo, vo2);
		
		return productList;
	}

	// 상품 전체 목록 불러오기(최신순 - 메인화면:카테고리,성별 분류X)
	@Override
	public List<ProductVO> getProductListAll3(ProductVO vo, PageVO vo2) throws Exception {
		log.info("getProductListAll3() 호출");

		List<ProductVO> productList = dao.listAll3(vo, vo2);

		return productList;
	}

	// 상품 전체 목록 불러오기(인기순  - 메인화면:카테고리,성별 분류X)
	@Override
	public List<ProductVO> getProductListAll4(ProductVO vo, PageVO vo2) throws Exception {
		log.info("getProductListAll4() 호출");

		List<ProductVO> productList = dao.listAll4(vo, vo2);

		return productList;
	}
	
	@Override
	public Integer getTotalCnt(ProductVO vo) throws Exception {
		return dao.getTotalCnt(vo);
	}
	
	//메인 -> 인기순,최신순
	@Override
	public Integer getTotalCnt2(ProductVO vo) throws Exception {
		return dao.getTotalCnt2(vo);
	}
	


	//////////////////////// 다은 수정 시작 1-1 /////////////////////////////////////////////////////////////////////////
	

	
	@Override
	public DealVO productDetail(Integer prod_num) throws Exception {
		log.info(" productDetail(prod_num) 호출");

		return dao.getProductDetail(prod_num);
	}

	
	//////////////////////// 다은 수정 종료 1-1 /////////////////////////////////////////////////////////////////////////
	
	

	/*
	 * @Override public DealVO productDetail(DealVO vo) throws Exception { return
	 * dao.getProductDetail(vo); }
	 */
	@Override
	public ProductVO productInsert(ProductVO vo) throws Exception {
		log.info("productInsert(vo) 호출");

		return dao.insertProduct(vo);
	}
	

	@Override
	public Integer updateProduct(ProductVO vo) throws Exception {
		log.info("updateProduct(ProductVO vo) 호출");
		
		int cnt = dao.updateProduct(vo);
		
		return cnt;
	}


	
	@Override
	public ProductVO getProduct(Integer prod_num) throws Exception {
		log.info("getBoard(Integer prod_num) 호출 ");


		return dao.getProduct(prod_num);
		//	return dao.getBoard(bno);
	}

	@Override
	public void updateReadCount(Integer bno) throws Exception {
		log.info("updateReadCount(bno) 호출");
		
		// DAO - updateReadCount(BNO)
		dao.updateReadCount(bno);
		
	}


	@Override
	public Integer deleteProduct(Integer prod_num) throws Exception {
		log.info(" deleteBoard(bno) 호출 ");
		
		return dao.deleteProduct(prod_num);
	}

	@Override
	public List<ProductVO> listPage(PageVO vo) throws Exception {
		log.info(" listPage(PageVO vo) ");
		return dao.listPage(vo);
	}
	
	//상세페이지 좋아요 
	@Override
	public LikeVO bringLike(LikeVO lvo) throws Exception {
		log.info("bringLike(LikeVO lvo)");
		return dao.bringLike(lvo);
	}
	
	//좋아요 확인
		@Override
		public LikeVO findLike(int prod_num, int buyer_id) {
			Map<String, Integer> number = new HashMap<String, Integer>();
			number.put("prod_num", prod_num);
			number.put("buyer_id",buyer_id);
			return dao.findLike(number);
		}
		

		//좋아요 저장
		@Override
		public int insertLike(LikeVO vo) {
			int result = 0;
			LikeVO find = dao.findLikeB(vo);
			
			if(find == null) {
				result = dao.insertLike(vo);
			} else {
				dao.deleteLike(vo);
			}		
			
			return result;
		}
		
	//판매목록
	@Override
	public List<ProductVO> sellProductList(PageMakerVO pm, String user_id) throws Exception {

		return dao.sellProductList(pm,user_id);	
		
	}
	
	
	//판매목록 글갯수
	@Override
	public Integer sellProductListCnt(PageVO vo, String user_id) throws Exception {
		
		return dao.sellProductListCnt(vo,user_id);
	}
	
	//구매목록
	@Override
	public List<DealVO> buyProductList(PageMakerVO pm, String user_id) throws Exception {
		
		return dao.buyProductList(pm,user_id);	
		
	}
	//구매목록 글갯수
	@Override
	public Integer buyProductListCnt(PageVO vo, String user_id) throws Exception {
		
		return dao.buyProductListCnt(vo,user_id);
	}
	
	//거래중목록
	@Override
	public List<DealVO> DealingProductList(PageMakerVO pm, String user_id) throws Exception {
		
		return dao.DealingProductList(pm,user_id);	
		
	}
	//거래중목록 글갯수
	@Override
	public Integer DealingProductListCnt(PageVO vo, String user_id) throws Exception {
		
		return dao.DealingProductListCnt(vo,user_id);
	}
	
	// 거래완료
	@Override
	public Integer dealDone(DealVO vo) throws Exception {
	log.info("dealDone(DealVO vo) 호출");
		
		return dao.dealDone(vo);
	}
	
	@Override
	public Integer BeforeAndDealing(DealVO dvo) throws Exception {
		
		log.info("BeforeAndDealing(DealVO dvo)");
		return dao.BeforeAndDealing(dvo);
	}
	
	@Override
	public String BeforeAndDealing1(DealVO dvo) throws Exception {
		log.info("BeforeAndDealing1(DealVO dvo)");
		return dao.BeforeAndDealing1(dvo);
	}
	

	// 구매내역 페이지 리뷰작성
	@Override
	public int buyProductWrite(SellerReviewVO reviewVO) throws Exception {
		return dao.buyProductWrite(reviewVO);
	}



	@Override
	public SellerReviewVO getReviewInfo(SellerReviewVO reviewVO) throws Exception {
		return dao.getReviewInfo(reviewVO);
	}
	
	
	
	

}
