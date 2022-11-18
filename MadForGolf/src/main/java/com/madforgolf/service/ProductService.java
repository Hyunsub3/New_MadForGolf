package com.madforgolf.service;


import java.util.List;
import java.util.Map;

import com.madforgolf.domain.BoardVO;
import com.madforgolf.domain.DealVO;
import com.madforgolf.domain.LikeVO;
import com.madforgolf.domain.PageMakerVO;
import com.madforgolf.domain.PageVO;
import com.madforgolf.domain.ProductVO;
import com.madforgolf.domain.SellerReviewVO;

public interface ProductService {
	//메인(index.jsp)상품 목록 - 최신순(성별/카테고리 구분없음)
	public List<ProductVO> listMain(ProductVO vo) throws Exception;
	
	// 상품 전체 목록 불러오기(최신순)
	public List<ProductVO> getProductListAll(ProductVO vo, PageVO vo2) throws Exception;
	
	// 상품 전체 목록 불러오기(인기순)
	public List<ProductVO> getProductListAll2(ProductVO vo, PageVO vo2) throws Exception;
	
	// 상품 전체 목록 불러오기(최신순 - 메인화면:카테고리,성별 분류X)
	public List<ProductVO> getProductListAll3(ProductVO vo, PageVO vo2) throws Exception;
	
	// 상품 전체 목록 불러오기(인기순  - 메인화면:카테고리,성별 분류X)
	public List<ProductVO> getProductListAll4(ProductVO vo, PageVO vo2) throws Exception;
	/*
	 * // 상품 1개 상세 불러오기 public DealVO productDetail(DealVO vo) throws Exception;
	 */
	
	
	//////////////////////// 다은 수정 시작 1-1 /////////////////////////////////////////////////////////////////////////
	
	
	
	// 상품 1개 상세 불러오기
	public DealVO productDetail(Integer prod_num) throws Exception;
	

	//////////////////////// 다은 수정 종료 1-1 /////////////////////////
	
	// 상품 전체 개수 불러오기
	public Integer getTotalCnt(ProductVO vo) throws Exception;
	
	// 상품 전체 개수 불러오기(메인 -인기순,최신순)
	public Integer getTotalCnt2(ProductVO vo) throws Exception;
	
	// 상품 등록 (Insert)
	public ProductVO productInsert(ProductVO vo) throws Exception;
	
	// 상품정보 수정하기 (Update)
	public Integer updateProduct(ProductVO vo) throws Exception;
	
	// 글 삭제하기
	public Integer deleteProduct(Integer prod_num) throws Exception;
	
	// 상품수정 1개정보 불러오기
	public ProductVO getProduct(Integer prod_num) throws Exception;
	
	// 글 조회수 1증가
	public void updateReadCount(Integer bno) throws Exception;
	
	
	// 글 리스트 가져오기(페이징처리)
	public List<ProductVO> listPage(PageVO vo) throws Exception;
	
	
	//상세페이지 좋아요
	public LikeVO bringLike(LikeVO lvo) throws Exception;
	
	//좋아요 확인
	public LikeVO findLike(int prod_num, int buyer_id);
		
	//좋아요 저장
	public int insertLike(LikeVO vo);
	
	//판매목록 리스트 
	public List<ProductVO> sellProductList(PageMakerVO pm, String user_id)throws Exception;
	
	//판매목록 페이징에 필요한 판매목록 글갯수
	public Integer sellProductListCnt(PageVO vo, String user_id) throws Exception;
	
	//구매목록 리스트 
	public List<DealVO> buyProductList(PageMakerVO pm, String user_id)throws Exception;
	
	//구매목록 페이징에 필요한 판매목록 글갯수
	public Integer buyProductListCnt(PageVO vo, String user_id) throws Exception;
	
	//거래중목록 리스트 
	public List<DealVO> DealingProductList(PageMakerVO pm, String user_id)throws Exception;
	
	//거래중목록 페이징에 필요한 거래중목록 글갯수
	public Integer DealingProductListCnt(PageVO vo, String user_id) throws Exception;
	
	// 거래완료
	public Integer dealDone(DealVO vo) throws Exception;
	
	//상세페이지 거래전->거래중   // ->거래전->거래중
	public Integer BeforeAndDealing(DealVO dvo) throws Exception;
	
	//상세페이지 거래전->거래중   // ->거래전->거래중
	public String BeforeAndDealing1(DealVO dvo) throws Exception;
	
	// 구매내역 페이지 리뷰작성
	public int buyProductWrite(SellerReviewVO reviewVO) throws Exception;

	// 구매내역 페이지 리뷰가져오기
	public SellerReviewVO getReviewInfo(SellerReviewVO reviewVO) throws Exception;
	
	
	


	
	
	
	

}
