package com.madforgolf.persistence;

import java.util.List;
import java.util.Map;

import com.madforgolf.domain.BoardVO;
import com.madforgolf.domain.DealVO;
import com.madforgolf.domain.LikeVO;
import com.madforgolf.domain.PageMakerVO;
import com.madforgolf.domain.PageVO;
import com.madforgolf.domain.ProductVO;
import com.madforgolf.domain.SellerReviewVO;

public interface ProductDAO {
	//메인(index.jsp)상품 목록 - 최신순(성별/카테고리 구분없음)
	public List<ProductVO> listMain(ProductVO vo) throws Exception;
	
	// 상품 전체 목록 - listAll() 최신순
	public List<ProductVO> listAll(ProductVO vo, PageVO vo2) throws Exception;
	
	// 상품 전체 목록 - listAll() 인기순
	public List<ProductVO> listAll2(ProductVO vo, PageVO vo2) throws Exception;
	
	// 상품 전체 목록 - listAll() 최신순 - 메인화면:카테고리,성별 분류X
	public List<ProductVO> listAll3(ProductVO vo, PageVO vo2) throws Exception;
	
	// 상품 전체 목록 - listAll() 인기순 - 메인화면:카테고리,성별 분류X
	public List<ProductVO> listAll4(ProductVO vo, PageVO vo2) throws Exception;
	
	// 상품 전체 개수 출력 - getTotalCnt()
	public Integer getTotalCnt(ProductVO vo) throws Exception;
	
	// 상품 전체 개수 출력 - getTotalCnt2() - 메인(인기순,최신순) 
	public Integer getTotalCnt2(ProductVO vo) throws Exception;
	
	
	// 상품 1개 상세 출력 - getProductDetail(prod_num)
	public DealVO getProductDetail(Integer prod_num) throws Exception;
	
	// 상품 1개 상세 출력 - getProductDetail(vo)
	public DealVO getProductDetail(DealVO vo) throws Exception;
	
	// 상품 등록 - insertProduct(vo)
	public ProductVO insertProduct(ProductVO vo) throws Exception;
	
	// 상품정보 수정하기 - update
	public Integer updateProduct(ProductVO vo) throws Exception;
	
	
	 // 상품 수정 1개 정보 가져오기 - getBoard(int) 
	 public ProductVO getProduct (Integer prod_num) throws Exception;
	 
	
	// 글 조회수 1증가
	public void updateReadCount(Integer bno) throws Exception;
	
	// 글 삭제하기
	public Integer deleteProduct(Integer prod_num) throws Exception;
	
	// 글 전체목록 - listPage(page)
	public List<BoardVO> listPage(Integer page) throws Exception;
	
	// 글 전체목록 - listPage(pageVO)
	public List<ProductVO> listPage(PageVO vo) throws Exception;
	
	//상세페이지 좋아요
	public LikeVO bringLike(LikeVO lvo) throws Exception;
	
	//좋아요 확인
	public LikeVO findLike(Map<String, Integer> number);
		
	//좋아요 저장
	public int insertLike(LikeVO vo);
		
	//좋아요 확인
	public LikeVO findLikeB(LikeVO vo);
		
	//좋아요 삭제
	public void deleteLike(LikeVO vo);
	
	//판매목록
	public List<ProductVO> sellProductList(PageMakerVO pm, String user_id) throws Exception;

	//판매목록 글갯수
	public Integer sellProductListCnt(PageVO vo, String user_id) throws Exception;
	
	//구매목록
	public List<DealVO> buyProductList(PageMakerVO pm, String user_id) throws Exception;
	
	//구매목록 글갯수
	public Integer buyProductListCnt(PageVO vo, String user_id) throws Exception;
	
	//거래중목록
	public List<DealVO> DealingProductList(PageMakerVO pm, String user_id) throws Exception;
	
	//거래중목록 글갯수
	public Integer DealingProductListCnt(PageVO vo, String user_id) throws Exception;
	
	//거래중->거래후
	public Integer dealDone(DealVO vo) throws Exception;
	
	//거래전->거래중
	public Integer BeforeAndDealing(DealVO dvo) throws Exception;
	
	//거래전->거래중
	public String BeforeAndDealing1(DealVO dvo) throws Exception;
	

	//거래목록 리뷰작성
	public int buyProductWrite(SellerReviewVO reviewVO) throws Exception;
	
	//거래목록 리뷰가져오기
	public SellerReviewVO getReviewInfo(SellerReviewVO reviewVO) throws Exception;

	
	
	
	
	
	

	
}
