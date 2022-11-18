package com.madforgolf.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.madforgolf.domain.BoardVO;
import com.madforgolf.domain.DealVO;
import com.madforgolf.domain.LikeVO;
import com.madforgolf.domain.PageMakerVO;
import com.madforgolf.domain.PageVO;
import com.madforgolf.domain.ProductVO;
import com.madforgolf.domain.SellerReviewVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	private static final Logger log 
	    = LoggerFactory.getLogger(ProductDAOImpl.class);

	
	// SqlSession객체 주입(DI)
	@Autowired
	private SqlSession sqlSession;
	
	
	@Autowired
	private HttpSession session;

	private static final String NAMESPACE = "com.madforgolf.mapper.ProductMapper";
	
	@Override
	public List<ProductVO> listMain(ProductVO vo) throws Exception {
		log.info("listMain()호출");
		
		List<ProductVO> productList;
		
		productList = sqlSession.selectList(NAMESPACE+".listMain",vo);
		
		return productList;
	}

	@Override
	public List<ProductVO> listAll(ProductVO vo, PageVO vo2) throws Exception {
log.info("listAll() 호출");
		
		Map<String, Object> productObj = new HashMap<String, Object>();		

		productObj.put("category", vo.getCategory());
		productObj.put("gender", vo.getGender());
		productObj.put("pageStart", vo2.getPageStart());
		productObj.put("perPageNum", vo2.getPerPageNum());
		
		log.info(productObj.get("category")+"");
		log.info(productObj.get("gender")+"");
		log.info(productObj.get("pageStart")+"");
		log.info(productObj.get("perPageNum")+"");
				
		// DB - 모든정보 가져오기(SQL/mapper 호출)
		List<ProductVO> productList;
		
		if(vo.getGender() == 0) { //성별없음:0 남자:1 여자:2
			if((String)session.getAttribute("user_id") != null) {
				productObj.put("user_id", (String)session.getAttribute("user_id"));
				productList = sqlSession.selectList(NAMESPACE + ".listAll", productObj);
				log.info("Mapper - listAll 호출(로그인 o : 회원정보 지역 기반 리스트 출력)");
			} else {
				productObj.put("addr", (String)session.getAttribute("addr"));
				productList = sqlSession.selectList(NAMESPACE + ".listAll1-1", productObj);				
				log.info("Mapper - listAll1-1 호출(로그인 x : GO 이용 리스트 출력)");
			}
		} else {
			if((String)session.getAttribute("user_id") != null) {
				productObj.put("user_id", (String)session.getAttribute("user_id"));
				productList = sqlSession.selectList(NAMESPACE + ".listAll2", productObj);
				log.info("Mapper - listAll2 호출(로그인 o : 회원정보 지역 기반 리스트 출력)");
			} else {
				productObj.put("addr", (String)session.getAttribute("addr"));
				productList = sqlSession.selectList(NAMESPACE + ".listAll2-1", productObj);				
				log.info("Mapper - listAll2-1 호출(로그인 x : GO 이용 리스트 출력)");
			}
		}
		
		log.info("상품 개수 : "+ productList.size() + "개");
		
		return productList;
	}
	
	@Override
	public List<ProductVO> listAll2(ProductVO vo, PageVO vo2) throws Exception {
log.info("listAll2() 호출");
		
		Map<String, Object> productObj = new HashMap<String, Object>();		
		productObj.put("category", vo.getCategory());
		productObj.put("gender", vo.getGender());
		productObj.put("pageStart", vo2.getPageStart());
		productObj.put("perPageNum", vo2.getPerPageNum());
		
		log.info(productObj.get("category")+"");
		log.info(productObj.get("gender")+"");
		log.info(productObj.get("pageStart")+"");
		log.info(productObj.get("perPageNum")+"");
		
		// DB - 모든정보 가져오기(SQL/mapper 호출)
		List<ProductVO> productList;
		
		if(vo.getGender() == 0) { //성별없음:0 남자:1 여자:2
			if((String)session.getAttribute("user_id") != null) {
				productObj.put("user_id", (String)session.getAttribute("user_id"));
				productList = sqlSession.selectList(NAMESPACE + ".listLike", productObj);
				log.info("Mapper - listLike 호출(로그인 o : 회원정보 지역 기반 리스트 출력)");
			} else {
				productObj.put("addr", (String)session.getAttribute("addr"));
				productList = sqlSession.selectList(NAMESPACE + ".listLike1-1", productObj);				
				log.info("Mapper - listLike1-1 호출(로그인 x : GO 이용 리스트 출력)");
			}
		} else {
			if((String)session.getAttribute("user_id") != null) {
				productObj.put("user_id", (String)session.getAttribute("user_id"));
				productList = sqlSession.selectList(NAMESPACE + ".listLike2", productObj);
				log.info("Mapper - listLike2 호출(로그인 o : 회원정보 지역 기반 리스트 출력)");
			} else {
				productObj.put("addr", (String)session.getAttribute("addr"));
				productList = sqlSession.selectList(NAMESPACE + ".listLike2-1", productObj);				
				log.info("Mapper - listLike2-1 호출(로그인 x : GO 이용 리스트 출력)");
			}
		}
		
		log.info("상품 개수 : "+ productList.size() + "개");
		
		return productList;
	}
	
	
	// 상품 전체 목록 - listAll() 최신순 - 메인화면:카테고리,성별 분류X
	@Override
	public List<ProductVO> listAll3(ProductVO vo, PageVO vo2) throws Exception {
		log.info("listAll3() 호출");

		Map<String, Object> productObj = new HashMap<String, Object>();
		productObj.put("pageStart", vo2.getPageStart());
		productObj.put("perPageNum", vo2.getPerPageNum());
		
		log.info(productObj.get("pageStart")+"");
		log.info(productObj.get("perPageNum")+"");
		
		// DB - 모든정보 가져오기(SQL/mapper 호출)
		List<ProductVO> productList;
		
		productList = sqlSession.selectList(NAMESPACE + ".listAll3", productObj);
		log.info("Mapper - listAll2 호출");
		
		log.info("상품 개수 : " + productList.size() + "개");
		
		return productList;
				
		
	}
	
	// 상품 전체 목록 - listAll() 인기순 - 메인화면:카테고리,성별 분류X
	@Override
	public List<ProductVO> listAll4(ProductVO vo, PageVO vo2) throws Exception {
		log.info("listAll4() 호출");

		Map<String, Object> productObj = new HashMap<String, Object>();
		productObj.put("pageStart", vo2.getPageStart());
		productObj.put("perPageNum", vo2.getPerPageNum());
		
		log.info(productObj.get("pageStart")+"");
		log.info(productObj.get("perPageNum")+"");
		
		// DB - 모든정보 가져오기(SQL/mapper 호출)
		List<ProductVO> productList;
		
		productList = sqlSession.selectList(NAMESPACE + ".listLike3", productObj);
		log.info("Mapper - listLike2 호출");
		
		log.info("상품 개수 : " + productList.size() + "개");
		
		return productList;
	}
	
	@Override
	public Integer getTotalCnt(ProductVO vo) throws Exception {

		Map<String, Object> productObj = new HashMap<String, Object>();		
		productObj.put("category", vo.getCategory());
		productObj.put("gender", vo.getGender());
		
		if(vo.getGender()==0) {
			if((String)session.getAttribute("user_id") != null) {
				productObj.put("user_id", (String)session.getAttribute("user_id"));			
				return sqlSession.selectOne(NAMESPACE + ".getTotalCnt", productObj);
			} else {
				productObj.put("addr", (String)session.getAttribute("addr"));
				return sqlSession.selectOne(NAMESPACE + ".getTotalCnt1-1", productObj);
			}
			
		} else {
			
			if((String)session.getAttribute("user_id") != null) {
				productObj.put("user_id", (String)session.getAttribute("user_id"));			
				return sqlSession.selectOne(NAMESPACE + ".getTotalCnt2", productObj);
			} else {
				productObj.put("addr", (String)session.getAttribute("addr"));
				return sqlSession.selectOne(NAMESPACE + ".getTotalCnt2-1", productObj);
			}
		}
	}
	

	// 상품 전체 목록 - listAll() 최신순 - 메인화면:카테고리,성별 분류X
	@Override
	public Integer getTotalCnt2(ProductVO vo) throws Exception {
		
			
			return sqlSession.selectOne(NAMESPACE + ".getTotalCnt3",vo);
			
				
	}
	
	

	//////////////////////// 다은 수정 시작 1-1 /////////////////////////////////////////////////////////////////////////
	
	
	@Override
	public DealVO getProductDetail(Integer prod_num) throws Exception {
		log.info("getProductDetail(prod_num) 호출");

		log.info("ㅠㅠㅠㅠㅠㅠㅠㅠ"+sqlSession.selectOne(NAMESPACE + ".getProductDetail2", prod_num));
		return sqlSession.selectOne(NAMESPACE + ".getProductDetail2", prod_num);
		
	}
	
	
	@Override
	public DealVO getProductDetail(DealVO vo) throws Exception {
		log.info("getProductDetail(prod_num) 호출");
		
		
		return sqlSession.selectOne(NAMESPACE + ".getProductDetail", vo);
	}


	//////////////////////// 다은 수정 종료 1-1 /////////////////////////////////////////////////////////////////////////

	
	/*
	 * @Override public DealVO getProductDetail(DealVO vo) throws Exception { return
	 * sqlSession.selectOne(NAMESPACE + ".getProductDetail", vo); }
	 */




	@Override
	public ProductVO insertProduct(ProductVO vo) throws Exception{
		log.info("insertProduct(vo) 호출");
		
		// SQL 실행 - SqlSession 객체 (디비연결, Mybatis, 매퍼, 자원해제)
		// 상품 등록 (Insert)
		int result = sqlSession.insert(NAMESPACE + ".insert", vo);
		
		if(result > 0) {
			log.info("상품 등록 완료!");
		}
		
		ProductVO vo2 = sqlSession.selectOne(NAMESPACE + ".insert2", vo);
		log.info("vo2 : " + vo2);
		
		return vo2;
	}
	
	@Override
	public Integer updateProduct(ProductVO vo) throws Exception {
		log.info("updateProduct(ProductVO vo) 호출");
		
		int cnt = sqlSession.update(NAMESPACE + ".update", vo);		
		
		return cnt;
	}
	

	@Override
	public ProductVO getProduct(Integer prod_num) throws Exception {
		log.info("getBoard(Integer bno) 호출");
		

		
		return sqlSession.selectOne(NAMESPACE + ".read",prod_num);
		
		//return sqlSession.selectOne(NAMESPACE + ".read",bno); 
	}

	@Override
	public void updateReadCount(Integer bno) throws Exception {
		log.info(" updateReadCount(Integer bno) 호출 ");
		
		// SQL - mapper 쿼리구문 호출
		sqlSession.update(NAMESPACE + ".updateReadCnt",bno);
		
	}

	@Override
	public Integer deleteProduct(Integer prod_num) throws Exception {
		log.info(" deleteBoard(bno) 호출 ");

		/*
		 * Map<String, Object> removeObj = new HashMap<String, Object>();
		 * removeObj.put("prod_num", prod_num);
		 * 
		 * log.info("@@@@@@@@@@@@@@@@@removeOnj"+removeObj);
		 */
		
		return sqlSession.delete(NAMESPACE + ".remove",prod_num);
	}

	
	@Override
	public List<BoardVO> listPage(Integer page) throws Exception {
		log.info("listPage(Integer page) 호출");
		
		if(page <= 0) {
			page = 1;
		}
		int pageSize = 30;
		// 1-0, 2-10, 3-20,4-30,.....
		//page = (page - 1) * 10;
		page = (page - 1) * pageSize;
		
		Map<String, Object> pageObj = new HashMap<String, Object>();
		pageObj.put("page", page);
		pageObj.put("pageSize", pageSize);

		
		return sqlSession.selectList(NAMESPACE + ".listPage2", pageObj);
	}

	@Override
	public List<ProductVO> listPage(PageVO vo) throws Exception {
		log.info(" listPage(PageVO vo) 호출 ");
		
		return sqlSession.selectList(NAMESPACE + ".listPage3",vo);		
	}
	
	//상세페이지 좋아요
	@Override
	public LikeVO bringLike(LikeVO lvo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".bringLike", lvo);
	}
	
	//좋아요 확인
	@Override
	public LikeVO findLike(Map<String, Integer> number) {
		log.info("findLike() 호출");
		
		return sqlSession.selectOne(NAMESPACE + ".findLike", number);
	}
	

	//좋아요 저장 
	@Override
	public int insertLike(LikeVO vo) {
		log.info("insertLike() 호출");
		
		return sqlSession.insert(NAMESPACE + ".insertLike", vo);
	}

	//좋아요 확인
	@Override
	public LikeVO findLikeB(LikeVO vo) {
		log.info("findLikeB() 호출");
		
		return sqlSession.selectOne(NAMESPACE + ".findLikeB", vo);
	}
	@Override
	//좋아요 삭제
	public void deleteLike(LikeVO vo) {
		log.info("deleteLike() 호출");
		sqlSession.delete(NAMESPACE + ".deleteLike",vo);
		
	}
	
	//판매목록
	@Override
	public List<ProductVO> sellProductList(PageMakerVO pm, String user_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pm", pm);
		map.put("user_id", user_id);
		
		log.info("페이지넘"+pm.getVo().getPerPageNum());
		log.info(pm.getStartRow()+"!!!!!!!!!!!!!!");
		
		log.info("dddddd"+sqlSession.selectList(NAMESPACE+".sellProductList", map));
		return sqlSession.selectList(NAMESPACE+".sellProductList", map);
		
	}
	
	//판매목록 글갯수

	@Override
	public Integer sellProductListCnt(PageVO vo, String user_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("vo", vo);
		map.put("user_id", user_id);
		
		return sqlSession.selectOne(NAMESPACE+".sellProductListCnt",map);

	}
	
	
	//구매목록
	@Override
	public List<DealVO> buyProductList(PageMakerVO pm, String user_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pm", pm);
		map.put("user_id", user_id);
		
		log.info("DAOImplVO"+pm.getStartRow());
		
		return sqlSession.selectList(NAMESPACE+".buyProductList", map);
	}
	
	//구매목록 글갯수
	
	@Override
	public Integer buyProductListCnt(PageVO vo, String user_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("vo", vo);
		map.put("user_id", user_id);
		
		return sqlSession.selectOne(NAMESPACE+".buyProductListCnt",map);
		
	}
	
	//거래중목록
	@Override
	public List<DealVO> DealingProductList(PageMakerVO pm, String user_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pm", pm);
		map.put("user_id", user_id);
		
		
		return sqlSession.selectList(NAMESPACE+".DealingProductList", map);
	}
	
	//거래중목록 글갯수
	
	@Override
	public Integer DealingProductListCnt(PageVO vo, String user_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("vo", vo);
		map.put("user_id", user_id);
		
		return sqlSession.selectOne(NAMESPACE+".DealingProductListCnt",map);
		
	}
	
	
	//거래중 -> 거래후
	@Override
	public Integer dealDone(DealVO vo) throws Exception {
		log.info("DAOImpl: DealDone(DealVO vo)호출");
		
		return sqlSession.update(NAMESPACE+".DealDone",vo);
	}
	
	
	//거래중 -> 거래후
	@Override
	public Integer BeforeAndDealing(DealVO dvo) throws Exception {
		log.info("DAOImpl: BeforeAndDealing(DealVO dvo)호출");
		
		log.info("여기는 DAOImpl~~~~"+dvo.getState());
		log.info(dvo+"");
		
		Integer num = 0;
		if(dvo.getState().equals("거래전")) { //거래전 -> 거래중
			
			num = sqlSession.update(NAMESPACE + ".AfterDeal", dvo);
		}
		if(dvo.getState().equals("거래중")){ //거래중->거래전
			
			num = sqlSession.update(NAMESPACE + ".BeforeDeal", dvo);
		}
		
		return num;
	}
	
	//거래중 -> 거래후
	@Override
	public String BeforeAndDealing1(DealVO dvo) throws Exception {
		log.info("DAOImpl: BeforeAndDealing1(DealVO dvo)호출");
		
		log.info("여기는 DAOImpl~~~~"+dvo.getState());
		log.info(dvo+"");
		
		if(dvo.getState().equals("거래전")) { //거래전 -> 거래중
			
			sqlSession.update(NAMESPACE + ".AfterDeal", dvo);
		}
		if(dvo.getState().equals("거래중")){ //거래중->거래전
			
			sqlSession.update(NAMESPACE + ".BeforeDeal", dvo);
		}
			String state =  sqlSession.selectOne(NAMESPACE+".getState",dvo);
			log.info(state);
		
		return state;
	}
	

	//거래목록 리뷰작성
	@Override
	public int buyProductWrite(SellerReviewVO reviewVO) throws Exception {
		return sqlSession.insert(NAMESPACE+".buyProductWrite",reviewVO);
	}
	
	//거래목록 리뷰가져오기
	@Override
	public SellerReviewVO getReviewInfo(SellerReviewVO reviewVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getReviewInfo",reviewVO);
	}

}
