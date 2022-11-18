package com.madforgolf.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.madforgolf.domain.BoardVO;
import com.madforgolf.domain.ChattingVO;
import com.madforgolf.domain.DealVO;
import com.madforgolf.domain.LikeVO;
import com.madforgolf.domain.PageMakerVO;
import com.madforgolf.domain.PageVO;
import com.madforgolf.domain.ProductVO;
import com.madforgolf.domain.SellerReviewVO;
import com.madforgolf.service.ChattingService;
import com.madforgolf.service.DealService;
import com.madforgolf.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	// http://localhost:8080/controller/test (x)
	// http://localhost:8080/controller/board/test (o)
	// http://localhost:8080/board/test (o , 서버 모듈 설정후)
	// @RequestMapping("/test")
	// public void test() {
	// log.info("test() 호출");
	// }

	private static final Logger log = LoggerFactory.getLogger(ProductController.class);

	// 서비스객체
	@Inject
	private ProductService service;
	
	@Inject
	private ChattingService service2;
	
	
	@Inject
	private DealService service3;

//===============================================최신순 상품목록 조회:"/listAll"==========================================================

	// http://localhost:8080/product/listAll
	// 상품 리스트 - 조회 (GET)
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String listAllGET(ProductVO vo, PageVO vo2, Model model, HttpSession session) throws Exception {
		log.info("listAllGET() 호출");
		log.info("카테고리 : " + vo.getCategory());
		log.info("성별 : " + vo.getGender());
		
		String user_id = (String)session.getAttribute("user_id");


		// 서비스 - 글전체 목록 가져오는 메서드
		List<ProductVO> productList = service.getProductListAll(vo, vo2);
		log.info("상품 개수 : " + productList.size() + "개");
		
		// 상품을 카테고리로 분류하기 위해 category 변수명으로 변수를 view로 넘겨줌
		model.addAttribute("category", vo.getCategory());
		model.addAttribute("gender", vo.getGender());


		// 출력되는 상품 리스트를 어트리뷰트에 담아서 view로 보냄
		model.addAttribute("productList", productList);
		
		session.setAttribute("user_id", user_id);


		// 세션객체 - isUpdate 정보전달
		session.setAttribute("isUpdate", false);
		

		// ==================================================== 페이징 처리
		// ====================================================
		// DB 내 모든 상품의 총 개수
		Integer totalCnt = service.getTotalCnt(vo);
		log.info("DB 내 상품의 총 개수 : " + totalCnt + "개");

		// 페이징 처리 하단부 정보 저장
		PageMakerVO pm = new PageMakerVO();
		pm.setVo(vo2); // 페이징 처리 하단부 정보를 vo에 받아오고
		pm.setTotalCnt(totalCnt); // calData() 페이징처리에 필요한 계산식 계산 메서드가 포함된 전체 글 갯수 초기화 메서드 호출

		log.info("pmVO : " + pm);
		log.info("pageVO : " + vo2);

		// 페이징 처리 객체(pm)을 어트리뷰트에 담아서 view로 보냄
		model.addAttribute("pm", pm);
		// ==================================================== 페이징 처리
		// ====================================================

		log.info("/product/shop -> /product/shop.jsp ");
		return "/product/shop";
	} // 상품 리스트 - 조회 (GET)
//===============================================최신순 상품목록 조회:"/listAll"==========================================================

//===============================================인기순 상품목록 조회:"/listLike"==========================================================
	// http://localhost:8080/product/listLike
	// 상품 리스트 - 조회 (GET)
	@RequestMapping(value = "/listLike", method = RequestMethod.GET)
	public String listLikeGET(ProductVO vo, PageVO vo2, Model model, HttpSession session) throws Exception {
		log.info("listLikeGET() 호출");
		log.info("카테고리 : " + vo.getCategory());
		log.info("성별 : " + vo.getGender());
		
		String user_id = (String)session.getAttribute("user_id");


		// 서비스 - 글전체 목록 가져오는 메서드
		List<ProductVO> productList = service.getProductListAll2(vo, vo2);
		log.info("상품 개수 : " + productList.size() + "개");

		// 상품을 카테고리로 분류하기 위해 category 변수명으로 변수를 view로 넘겨줌
		// 최신순 정렬 위해 필요한 값 -> #{category}, #{gender}
		model.addAttribute("category", vo.getCategory());

		model.addAttribute("gender", vo.getGender());
		//지역컬럼 
		
		// 출력되는 상품 리스트를 어트리뷰트에 담아서 view로 보냄
		model.addAttribute("productList", productList);
		
		session.setAttribute("user_id", user_id);

		// 세션객체 - isUpdate 정보전달
		session.setAttribute("isUpdate", false);

		// ==================================================== 페이징 처리
		// ====================================================
		// DB 내 모든 상품의 총 개수
		Integer totalCnt = service.getTotalCnt(vo);
		log.info("DB 내 상품의 총 개수 : " + totalCnt + "개");

		// 페이징 처리 하단부 정보 저장
		PageMakerVO pm = new PageMakerVO();
		pm.setVo(vo2); // 페이징 처리 하단부 정보를 vo에 받아오고
		pm.setTotalCnt(totalCnt); // calData() 페이징처리에 필요한 계산식 계산 메서드가 포함된 전체 글 갯수 초기화 메서드 호출

		log.info("pmVO : " + pm);
		log.info("pageVO : " + vo2);

		// 페이징 처리 객체(pm)을 어트리뷰트에 담아서 view로 보냄
		model.addAttribute("pm", pm);
		// ==================================================== 페이징 처리
		// ====================================================

		log.info("/product/shop -> /product/shop.jsp ");
		return "/product/shop";
	} // 상품 리스트 - 조회 (GET)

//===============================================인기순 상품목록 조회:"/listLike"==========================================================
	
//===============================================최신순 상품목록 조회:"/listAll2"(메인)==========================================================
	
	// http://localhost:8080/product/listAll
	// 상품 리스트 - 조회 (GET)
	@RequestMapping(value = "/listAll2", method = RequestMethod.GET)
	public String listAll2GET(ProductVO vo, PageVO vo2, Model model, HttpSession session) throws Exception {
		log.info("listAll2GET() 호출");
		
		String user_id = (String)session.getAttribute("user_id");
		
		// 서비스 - 글전체 목록 가져오는 메서드
		List<ProductVO> productList = service.getProductListAll3(vo, vo2);
		log.info("상품 개수 : " + productList.size() + "개");
				
		
		// 출력되는 상품 리스트를 어트리뷰트에 담아서 view로 보냄
		model.addAttribute("productList", productList);
		
		session.setAttribute("user_id", user_id);

		
		// 세션객체 - isUpdate 정보전달
		session.setAttribute("isUpdate", false);
		
		
		// ==================================================== 페이징 처리
		// ====================================================
		// DB 내 모든 상품의 총 개수
		Integer totalCnt = service.getTotalCnt2(vo);
		log.info("DB 내 상품의 총 개수 : " + totalCnt + "개");
		
		// 페이징 처리 하단부 정보 저장
		PageMakerVO pm = new PageMakerVO();
		pm.setVo(vo2); // 페이징 처리 하단부 정보를 vo에 받아오고
		pm.setTotalCnt(totalCnt); // calData() 페이징처리에 필요한 계산식 계산 메서드가 포함된 전체 글 갯수 초기화 메서드 호출
		
		log.info("pmVO : " + pm);
		log.info("pageVO : " + vo2);
		
		// 페이징 처리 객체(pm)을 어트리뷰트에 담아서 view로 보냄
		model.addAttribute("pm", pm);
		// ==================================================== 페이징 처리
		// ====================================================
		
		log.info("/product/listLike2 -> /product/mainShop.jsp ");
		return "/product/mainShop";
	} // 상품 리스트 - 조회 (GET)
//===============================================최신순 상품목록 조회:"/listAll2"(메인)==========================================================
	
//===============================================인기순 상품목록 조회:"/listLike2"(메인)==========================================================
	// http://localhost:8080/product/listLike
	// 상품 리스트 - 조회 (GET)
	@RequestMapping(value = "/listLike2", method = RequestMethod.GET)
	public String listLike2GET(ProductVO vo, PageVO vo2, Model model, HttpSession session) throws Exception {
		log.info("listLikeGET() 호출");
		log.info("카테고리 : " + vo.getCategory());
		log.info("성별 : " + vo.getGender());
		
		String user_id = (String)session.getAttribute("user_id");
		
		// 서비스 - 글전체 목록 가져오는 메서드
		List<ProductVO> productList = service.getProductListAll4(vo, vo2);
		log.info("상품 개수 : " + productList.size() + "개");
		
		// 상품을 카테고리로 분류하기 위해 category 변수명으로 변수를 view로 넘겨줌
		// 최신순 정렬 위해 필요한 값 -> #{category}, #{gender}
		model.addAttribute("category", vo.getCategory());
		
		model.addAttribute("gender", vo.getGender());
		//지역컬럼 
		
		// 출력되는 상품 리스트를 어트리뷰트에 담아서 view로 보냄
		model.addAttribute("productList", productList);
		
		session.setAttribute("user_id", user_id);

		
		// 세션객체 - isUpdate 정보전달
		session.setAttribute("isUpdate", false);
		
		// ==================================================== 페이징 처리
		// ====================================================
		// DB 내 모든 상품의 총 개수
		Integer totalCnt = service.getTotalCnt2(vo);
		log.info("DB 내 상품의 총 개수 : " + totalCnt + "개");
		
		// 페이징 처리 하단부 정보 저장
		PageMakerVO pm = new PageMakerVO();
		pm.setVo(vo2); // 페이징 처리 하단부 정보를 vo에 받아오고
		pm.setTotalCnt(totalCnt); // calData() 페이징처리에 필요한 계산식 계산 메서드가 포함된 전체 글 갯수 초기화 메서드 호출
		
		log.info("pmVO : " + pm);
		log.info("pageVO : " + vo2);
		
		// 페이징 처리 객체(pm)을 어트리뷰트에 담아서 view로 보냄
		model.addAttribute("pm", pm);
		// ==================================================== 페이징 처리
		// ====================================================
		
		log.info("/product/listLike2 -> /product/mainShop.jsp ");
		return "/product/mainShop";
	} // 상품 리스트 - 조회 (GET)
	
//===============================================인기순 상품목록 조회:"/listLike2"(메인)==========================================================

	// 상품 페이징 리스트(GET) : 페이징처리 완료된 페이지 호출
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public String listPageGET(PageVO vo, Model model) throws Exception {
		log.info("listPageGET() 호출");
		log.info("vo : " + vo);

		/*
		 * //PageVO 객체 생성
		 */ /*
			 * PageVO vo = new PageVO(); vo.setPage(2); //2페이지에 해당하는 글을
			 * vo.setPerPageNum(30); //30개씩 표시
			 */
		// View페이지로 vo(글의 정보 : Service -> DAO -> mapper과정으로 담아온 데이터를 View로 보내줌)
		model.addAttribute("ProductList", service.listPage(vo));

		// 페이징 처리 하단부 정보 저장
		PageMakerVO pm = new PageMakerVO();
		pm.setVo(vo); // 페이징 처리 하단부 정보를 vo에 받아오고
		pm.setTotalCnt(512); // calData() 페이징처리에 필요한 계산식 계산 메서드가 포함된 전체 글 갯수 초기화 메서드 호출
		// 512 : DB 값 확인 필요

		log.info("pm : " + pm);
		log.info("vo : " + vo);

		// model객체에 담아서 view페이지로 페이징 처리 정보 전달
		model.addAttribute("pm", pm);
		model.addAttribute("vo", vo);

		return "/product/shop";
	} // 상품 페이징 리스트(GET) : 페이징처리 완료된 페이지 호출

	//////////////////////// 다은 수정 시작 2-1 /////////////////////////////////////////////////////////////////////////
	
	
	
	// 상품 상세 페이지 - 이동(GET) 
		@RequestMapping(value = "/productDetail", method = RequestMethod.GET)
		public String productDetail(@RequestParam("prod_num") int prod_num, DealVO vo,Model model, HttpSession session) throws Exception {
			log.info("productDetail(DealVO vo) 호출");
			
			int result=-1;
			
			String user_id = (String)session.getAttribute("user_id");

			service3.addProd_num(prod_num);
			
			log.info(" ******* product Controller 돌아옴");
			log.info("#####################"+prod_num);
			
			DealVO deal = service.productDetail(prod_num);
			model.addAttribute("deal", deal);
			
						
			LikeVO lvo = new LikeVO();
			lvo.setProd_num(prod_num);
			lvo.setBuyer_id(user_id);
			log.info(" LikeVO : "+lvo);


			LikeVO like = service.bringLike(lvo);
			log.info(" bringLike : "+like);
			if(like != null) {
			}else {
				like = new LikeVO();
				like.setCheck(0);
			}
			model.addAttribute("result",like);
			
			session.setAttribute("user_id", user_id);

			log.info(" ***" +deal+" ***" +like+" ***" +user_id);
			
			
			return "/product/shopDetails";

		} // 상품 상세 페이지 - 이동(GET)

		
		
	// 상품등록 페이지 - 이동 (GET)
	@RequestMapping(value = "/productInsert", method = RequestMethod.GET)
	public void productInsertGET() throws Exception {
		log.info("productInsert() 호출");
		log.info("/product/productInsert.jsp 호출");
	} // 상품등록 페이지 - 이동 (GET)

	
	

	// 상품 등록 - 등록 (POST) - 다중 업로드
	@RequestMapping(value = "/productInsert", method = RequestMethod.POST)
	public String productInsertPOST(Model model,MultipartHttpServletRequest multi, ProductVO vo,HttpServletRequest request,HttpSession session, RedirectAttributes redirect) throws Exception {
		log.info("productInsertPOST() 호출");
		
		String user_id = (String)session.getAttribute("user_id");
		
		session.setAttribute("user_id", user_id);
		
		
		
		// log.info("multi : " + multi);

		// 파일의 정보를 저장하는 MAP
		Map map = new HashMap();
		
		Enumeration enu = multi.getParameterNames(); // 파일정보 x
		// log.info("enu : " + enu);
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			log.info("name : " + name);
			String value = multi.getParameter(name);
			log.info("value : " + value);
			map.put(name, value);
		}
		
		// 굳이 이렇게 해야하나...
		log.info("map : " + map);
		vo.setSeller_id((String)map.get("seller_id"));
		vo.setProd_name((String)map.get("prod_name"));
		vo.setPrice(Integer.parseInt((String)map.get("price")));
		vo.setDetail((String)map.get("detail"));
		vo.setCondition((String)map.get("condition"));
		vo.setCategory((String)map.get("category"));
		vo.setGender(Integer.parseInt((String)map.get("gender")));
		// 전달정보(파라미터값)을 MAP에 저장 끝
		
		// 업로드 파일 처리
		fileProcess(multi, vo, request);
		
		ProductVO vo2 = service.productInsert(vo);

		log.info("******* vo2 : "+ vo2);
		
//		model.addAttribute("ProductVo", vo);
		
		redirect.addFlashAttribute("ProductVo", vo2);
		
		return "redirect:/deal/insertDeal";
	}
	
	

	

	//////////////////////// 다은 수정 종료 2-1 /////////////////////////////////////////////////////////////////////////
	
	
	// 전달된 파일 처리 전용 메서드
	public List<String> fileProcess(MultipartHttpServletRequest multi, ProductVO vo, HttpServletRequest request) throws Exception {
		log.info("첨부파일 처리 시작");
		
		// 파일정보를 저장하는 리스트(리턴)
		List<String> fileList = new ArrayList<String>();
		
		// 전달된 파일정보를 받아서 처리
		Iterator<String> fileNames = multi.getFileNames();
		// log.info("fileNames : " + fileNames);
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next(); // 파일의 파라미터명
			log.info("fileName : " + fileName);
			
			MultipartFile mFile = multi.getFile(fileName); // 업로드된 파일정보를 가져오기
			String oFileName = mFile.getOriginalFilename();
			log.info("oFileName : " + oFileName);
			
			// 파일 등록 - 파일 이름 랜덤 생성(이름 중복 방지)
			UUID uuid = UUID.randomUUID();
			log.info("UUID : " + uuid);
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			log.info("생성된 고유문자열 : " + uniqueName);
	
			// 파일 등록 - 확장자명 만들기
			String fileExtension = oFileName.substring(oFileName.lastIndexOf("."), oFileName.length());
			log.info("확장자명 : " + fileExtension);
			
			// 파일 등록 - 고유한 이름 만들기
			String uFileName = uniqueName + fileExtension;
			log.info("고유한 이름 : " + uFileName);
			
			switch(fileName) {
				case "file1" : vo.setProd_img(uFileName); break;
				case "file2" : vo.setProd_img2(uFileName); break;
				case "file3" : vo.setProd_img3(uFileName); break;
			}
			log.info("image1 : " + vo.getProd_img());
			log.info("image2 : " + vo.getProd_img2());
			log.info("image3 : " + vo.getProd_img3());
			
			// 업로드 될 파일의 이름들을 저장
			fileList.add(uFileName);
			log.info("fileList" + fileList);
			
			// 파일 업로드
			String uploadFolder1 = "C:\\Users\\ITWILL\\git\\New_MadForGolf3\\MadForGolf\\src\\main\\webapp\\resources\\product_img";
			// 속도가 느려 초반에 엑박뜸 and 경로 일치 필요 => but, 깃허브 연동 o
			String uploadFolder2 = request.getServletContext().getRealPath("resources/product_img");
			// 메서드를 통한 경로 => 속도가 빠름, 경로 일치 불필요 => but, 깃허브 연동 x
			// 파일 저장 경로 : D:\workspace_sts6\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MadForGolf\resources\product_img
			// => 둘 다 필요
			
			// 파일 생성
			File file1 = new File(uploadFolder1 + "\\" + uFileName);
			File file2 = new File(uploadFolder2 + "\\" + uFileName);
				
			if(mFile.getSize() != 0) { // 첨부파일이 있을 때				
				mFile.transferTo(file2); // 첨부파일로 전달된 정보를 파일로 전달
				Files.copy(file2.toPath(), file1.toPath(), StandardCopyOption.REPLACE_EXISTING); // file2를 file1으로 복사
				log.info("파일 업로드 성공");
			} // if
			
		} // while
		
		if(vo.getProd_img2() == null) {
			vo.setProd_img2(vo.getProd_img());
		}
		if(vo.getProd_img3() == null) {
			vo.setProd_img3(vo.getProd_img());
		}
		
		log.info("첨부파일 처리 끝");
		return fileList;
	} // 상품 등록 - 등록 (POST)
		

//////////////////////// 다은 수정 시작 2-2  /////////////////////////////////////////////////////////////////////////

	
		// 상품작성 수정하기 - GET (기존의 정보 조회 출력+수정할 정보 입력)
		@RequestMapping(value = "/modify", method = RequestMethod.GET)
		public String modifyProductGET(@RequestParam("prod_num") int prod_num, DealVO vo, Model model) throws Exception {
			log.info("modifyProductGET() 호출");
			
			// 연결된 뷰에 정보 전달(Model객체)
			model.addAttribute("deal", service.productDetail(prod_num));
			
			// 페이지 이동(출력) /product/productUpdate.jsp
			return "/product/productUpdate";
		}
		

//////////////////////// 다은 수정 종료 2-2  /////////////////////////////////////////////////////////////////////////
		
		// 상품작성 수정하기 - POST (수정할데이터 처리)
		@RequestMapping(value = "/modify", method = RequestMethod.POST)
		public String modifyProductPOST(
				@RequestParam("oldfile1") String oldfile1, @RequestParam("oldfile2") String oldfile2,
				@RequestParam("oldfile3") String oldfile3, ProductVO vo, RedirectAttributes rttr,
				MultipartHttpServletRequest multi, HttpServletRequest request,HttpSession session) throws Exception {
			log.info("modifyProductPOST() 호출");
			String user_id = (String)session.getAttribute("user_id");

			// 전달정보 저장(수정할 정보) VO
			log.info("수정할 정보 : " + vo);
			
			// 파일의 정보를 저장하는 MAP
			Map map = new HashMap();
			
			Enumeration enu = multi.getParameterNames(); // 파일정보 x
			
			while(enu.hasMoreElements()) {
				String name = (String)enu.nextElement();
				log.info("name : " + name);
				String value = multi.getParameter(name);
				log.info("value : " + value);
				map.put(name, value);
			}
					
			// 굳이 이렇게 해야하나...
			log.info("map : " + map);
			vo.setProd_num(Integer.parseInt((String)map.get("prod_num")));
			// vo.setSeller_id((String)map.get("seller_id"));
			vo.setProd_name((String)map.get("prod_name"));
			vo.setPrice(Integer.parseInt((String)map.get("price")));
			vo.setDetail((String)map.get("detail"));
			vo.setCondition((String)map.get("condition"));
			vo.setCategory((String)map.get("category"));
			vo.setGender(Integer.parseInt((String)map.get("gender")));
			vo.setProd_img(oldfile1);
			vo.setProd_img2(oldfile2);
			vo.setProd_img3(oldfile3);
			// 전달정보(파라미터값)을 MAP에 저장 끝
			
			// 업로드 파일 처리
			fileProcess(multi, vo, request, oldfile1, oldfile2, oldfile3);
			
			// 서비스 - 상품정보 수정
			int cnt = service.updateProduct(vo);
			log.info("cnt : " + cnt);
			
			if (cnt == 1) {
				// 수정 성공
				return "redirect:/product/productDetail?prod_num=" + vo.getProd_num();
			} else {
				// 수정 실패
				return "redirect:/product/modify?prod_num=" + vo.getProd_num();
			}
			
		}
		
		// 전달된 파일 처리 전용 메서드 - 오버로딩(oldfile)
			public List<String> fileProcess(
					MultipartHttpServletRequest multi, ProductVO vo, HttpServletRequest request,
					String oldfile1, String oldfile2, String oldfile3) throws Exception {
				log.info("첨부파일 처리 시작");
				
				// 파일정보를 저장하는 리스트(리턴)
				List<String> fileList = new ArrayList<String>();
				
				// 전달된 파일정보를 받아서 처리
				Iterator<String> fileNames = multi.getFileNames();
				// log.info("fileNames : " + fileNames);
				
				while(fileNames.hasNext()) {
					String fileName = fileNames.next(); // 파일의 파라미터명
					log.info("fileName : " + fileName);
					
					MultipartFile mFile = multi.getFile(fileName); // 업로드된 파일정보를 가져오기
					String oFileName = mFile.getOriginalFilename();
					log.info("oFileName : " + oFileName);
					
					if(!oFileName.equals("")) {
						// 파일 업로드 경로
						String uploadFolder1 = "C:\\Users\\ITWILL\\git\\New_MadForGolf\\MadForGolf\\src\\main\\webapp\\resources\\product_img";
						// 속도가 느려 초반에 엑박뜸 and 경로 일치 필요 => but, 깃허브 연동 o
						String uploadFolder2 = request.getServletContext().getRealPath("resources/product_img");
						// 메서드를 통한 경로 => 속도가 빠름, 경로 일치 불필요 => but, 깃허브 연동 x
						// 파일 저장 경로 : D:\workspace_sts6\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MadForGolf\resources\product_img
						// => 둘 다 필요
						
						// 파일 등록 - 파일 이름 랜덤 생성(이름 중복 방지)
						UUID uuid = UUID.randomUUID();
						log.info("UUID : " + uuid);
						String[] uuids = uuid.toString().split("-");
						String uniqueName = uuids[0];
						log.info("생성된 고유문자열 : " + uniqueName);
			
						// 파일 등록 - 확장자명 만들기
						String fileExtension = oFileName.substring(oFileName.lastIndexOf("."), oFileName.length());
						log.info("확장자명 : " + fileExtension);
					
						// 파일 등록 - 고유한 이름 만들기
						String uFileName = uniqueName + fileExtension;
						log.info("고유한 이름 : " + uFileName);
						
						switch(fileName) {
							case "file1" : {
								File oldDeleteFile1 = new File(uploadFolder1 + "\\" + oldfile1);
								oldDeleteFile1.delete();
								File oldDeleteFile2 = new File(uploadFolder2 + "\\" + oldfile1);
								oldDeleteFile2.delete();
								vo.setProd_img(uFileName);
								break;
							}
							case "file2" : {
								File oldDeleteFile1 = new File(uploadFolder1 + "\\" + oldfile2);
								oldDeleteFile1.delete();
								File oldDeleteFile2 = new File(uploadFolder2 + "\\" + oldfile2);
								oldDeleteFile2.delete();
								vo.setProd_img2(uFileName);
								break;
							}
							case "file3" : {
								File oldDeleteFile1 = new File(uploadFolder1 + "\\" + oldfile3);
								oldDeleteFile1.delete();
								File oldDeleteFile2 = new File(uploadFolder2 + "\\" + oldfile3);
								oldDeleteFile2.delete();
								vo.setProd_img3(uFileName);
								break;
							}
						}
						log.info("image1 : " + vo.getProd_img());
						log.info("image2 : " + vo.getProd_img2());
						log.info("image3 : " + vo.getProd_img3());
						
						// 업로드 될 파일의 이름들을 저장
						fileList.add(uFileName);
						log.info("fileList" + fileList);
						
						// 파일 생성
						//File file1 = new File(uploadFolder1 + "\\" + uFileName); // 학원에서 사용할 때 주석 풀면 됩니다.
						File file2 = new File(uploadFolder2 + "\\" + uFileName);
						
						if(mFile.getSize() != 0) { // 첨부파일이 있을 때				
							//mFile.transferTo(file1); // 첨부파일로 전달된 정보를 파일로 전달  // 학원에서 사용할 때 주석 풀면 됩니다.
							mFile.transferTo(file2);
							log.info("파일 업로드 성공");
						} // if
					} // if(oFileName)
				} // while
				
				log.info("첨부파일 처리 끝");
				return fileList;
			} // 상품작성 수정하기 - POST (수정할데이터 처리)
			
			
			// 상품작성 삭제 - POST
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String removeProductPOST(@RequestParam("prod_num") int prod_num,@RequestParam("category") String category,ProductVO vo,PageVO vo2,RedirectAttributes rttr,Model model) throws Exception {
		log.info(" removeProductPOST() 호출 ");

		// 전달정보 저장(bno)
		log.info("prod_num : " + prod_num);
		log.info("category:"+category);

		// 서비스 - 글삭제 동작 (bno)
		int result = service.deleteProduct(prod_num);

		if (result == 1) {
			rttr.addFlashAttribute("msg", "DELOK");

		}

		// 글 리스트 페이지 이동
//		return "redirect:/board/listAll";
		return "redirect:/product/listAll?category="+category+"&page=1";
	}
	
//=========================메인화면 상품리스트=================================	
	// http://localhost:8080/product 
		// 상품 리스트 - 조회 (GET)]
		@RequestMapping(value = "/index", method = RequestMethod.GET)
		public void listMainGET(ProductVO vo,Model model, HttpSession session) throws Exception {
			log.info("listMainGET() 호출");


			// 서비스 - 글전체 목록 가져오는 메서드
			List<ProductVO> productList = service.listMain(vo);
			log.info("상품 개수 : " + productList.size() + "개");
			
			// 출력되는 상품 리스트를 어트리뷰트에 담아서 view로 보냄
			model.addAttribute("productList", productList);

			// 세션객체 - isUpdate 정보전달
			session.setAttribute("isUpdate", false);
			



			log.info("/index -> index.jsp");

		} // 상품 리스트 - 조회 (GET)
	
	
	
	

//=========================메인화면 상품리스트=================================
		

		
//=========================찜하기=================================

		
		
		
//좋아요
		@ResponseBody
		@RequestMapping(value="/like",method=RequestMethod.GET)
		public int likePOST(ProductVO pvo,HttpSession session, Model model) {
			log.info("좋아요 체크 실행 @@@@@@@@");
			int result=-1;
			String user_id = (String)session.getAttribute("user_id");
			if(user_id == null) {
				return result;
			}
					
					
			LikeVO vo = new LikeVO();
			vo.setBuyer_id(user_id);
			vo.setProd_num(pvo.getProduct_num());
					
			result = service.insertLike(vo);
			log.info(vo+"############");
					
			session.setAttribute("result", result);
					
//			model.addAttribute("user_id",user_id);
//			model.addAttribute("vo", vo);
//			model.addAttribute("result",result);
			return result;
		}
		
		
//=========================찜하기=================================
		
		
		
				
//-------------------------상품 판매내역--------------------------------- : 수정중 ..
	  
		// 게시판 리스트(페이징 처리) - GET
		@RequestMapping(value = "/listProductAll", method = RequestMethod.GET)
		public String listProductAllGET(Model model, PageVO vo, HttpSession session) throws Exception {
			// ==================================================== 페이징 처리
			// ====================================================
			String user_id = (String) session.getAttribute("user_id");
			// DB 내 모든 상품의 총 개수
			Integer sellProductListCnt = service.sellProductListCnt(vo,user_id);
			log.info("DB 내 상품의 총 개수 : " + sellProductListCnt + "개");
			
			// 페이징 처리 하단부 정보 저장
			PageMakerVO pm = new PageMakerVO();
			pm.setVo(vo); // 페이징 처리 하단부 정보를 vo에 받아오고
			pm.setTotalCnt(sellProductListCnt); // calData() 페이징처리에 필요한 계산식 계산 메서드가 포함된 전체 글 갯수 초기화 메서드 호출
			
			log.info("pmVO : " + pm);
			log.info("pageVO : " + vo);
			
			// 페이징 처리 객체(pm)을 어트리뷰트에 담아서 view로 보냄
			model.addAttribute("pm", pm);
			// ==================================================== 페이징 처리
			// ====================================================
			
			log.info(" 1. controller - listProductAllGET ");
			log.info(vo+"");

			log.info("############" + user_id);

			session.setAttribute("user_id", user_id);

			model.addAttribute("sellProductList", service.sellProductList(pm, user_id));
			log.info(service.sellProductList(pm, user_id)+"=======");
			

			session.setAttribute("isUpdate", false); // 조회수 때문에 주는 것

			return "/product/productList";
		}

//-------------------------상품 판매내역---------------------------------

		//-------------------------상품 구매내역--------------------------------- : 수정중 .. KHS
				
				// 게시판 리스트(페이징 처리) - GET
				@RequestMapping(value = "/listProductBuy", method = RequestMethod.GET)
				public String listProductBuyGET(Model model, PageVO vo, HttpSession session) throws Exception {
					// ==================================================== 페이징 처리
					// ====================================================
					String user_id = (String) session.getAttribute("user_id");
					// DB 내 모든 상품의 총 개수
					Integer buyProductListCnt = service.buyProductListCnt(vo,user_id);
					log.info("DB 내 상품의 총 개수 : " + buyProductListCnt + "개");
					
					// 페이징 처리 하단부 정보 저장
					PageMakerVO pm = new PageMakerVO();
					pm.setVo(vo); // 페이징 처리 하단부 정보를 vo에 받아오고
					pm.setTotalCnt(buyProductListCnt); // calData() 페이징처리에 필요한 계산식 계산 메서드가 포함된 전체 글 갯수 초기화 메서드 호출
					
					log.info("pmVO : " + pm);
					log.info("pageVO : " + vo);
					
					// 페이징 처리 객체(pm)을 어트리뷰트에 담아서 view로 보냄
					model.addAttribute("pm", pm);
					// ==================================================== 페이징 처리
					// ====================================================
					
					log.info(" 1. controller - listProductAllGET ");
					log.info(vo+"");
					
					log.info("############" + user_id);
					
					session.setAttribute("user_id", user_id);
					
					model.addAttribute("buyProductList", service.buyProductList(pm, user_id));
					log.info(service.buyProductList(pm, user_id)+"=======");

					
					
					session.setAttribute("isUpdate", false); // 조회수 때문에 주는 것
					
					return "/product/productBuyList";
				}
				
				/**
				 * 구매내역 가져오기
				 * @param reviewVO
				 * @param session
				 * @return
				 * @throws Exception
				 */
				@RequestMapping(value = "/buyGetProductInfo" , method = RequestMethod.POST)
				public ResponseEntity<?>  buyGetProductInfo(SellerReviewVO reviewVO, HttpSession session) throws Exception{
					String user_id = (String) session.getAttribute("user_id");
					reviewVO.setBuyer_id(user_id);
					
					log.info("buyProductWrite :  {} ", reviewVO.toString());
					//int result= service.buyGetProductInfo(reviewVO);			
					return ResponseEntity.status(HttpStatus.CREATED).body("success");
				}
				
				
				/**
				 * 리뷰 작성
				 * @param reviewVO
				 * @param session
				 * @return
				 * @throws Exception
				 */
				@RequestMapping(value = "/buyProductWrite", method = RequestMethod.POST)
				public ResponseEntity<?>  buyProductWrite(SellerReviewVO reviewVO, HttpSession session) throws Exception{
					String user_id = (String) session.getAttribute("user_id");
					reviewVO.setBuyer_id(user_id);
					
					log.info("buyProductWrite :  {} ", reviewVO.toString());
					int result= service.buyProductWrite(reviewVO);			
					return ResponseEntity.status(HttpStatus.CREATED).body(result==1?"success" :"failed");
				}
				
				
				// 작성한 리뷰가져오기		
				@RequestMapping(value = "/getReviewInfo", method = RequestMethod.POST)
				public ResponseEntity<?>  getReviewInfo(SellerReviewVO reviewVO, HttpSession session) throws Exception{
					log.info( " reviewVO 파라미터값 , {}", reviewVO.toString());
					String user_id = (String) session.getAttribute("user_id");
					reviewVO.setBuyer_id(user_id);
					
					log.info("buyProductWrite :  {} ", reviewVO.toString());
					SellerReviewVO getReviewInfo= service.getReviewInfo(reviewVO);			
					return ResponseEntity.status(HttpStatus.CREATED).body(getReviewInfo);
				}
								
				
		//-------------------------상품 구매내역---------------------------------
//-------------------------상품 거래중내역--------------------------------- 
		
		// 게시판 리스트(페이징 처리) - GET
		@RequestMapping(value = "/listProductDealing", method = RequestMethod.GET)
		public String listProductDealingGET(Model model, PageVO vo, HttpSession session) throws Exception {
			// ==================================================== 페이징 처리
			// ====================================================
			String user_id = (String) session.getAttribute("user_id");
			// DB 내 모든 상품의 총 개수
			Integer DealingProductListCnt = service.DealingProductListCnt(vo,user_id);
			log.info("DB 내 상품의 총 개수 : " + DealingProductListCnt + "개");
			
			// 페이징 처리 하단부 정보 저장
			PageMakerVO pm = new PageMakerVO();
			pm.setVo(vo); // 페이징 처리 하단부 정보를 vo에 받아오고
			pm.setTotalCnt(DealingProductListCnt); // calData() 페이징처리에 필요한 계산식 계산 메서드가 포함된 전체 글 갯수 초기화 메서드 호출
			
			log.info("pmVO : " + pm);
			log.info("pageVO : " + vo);
			
			// 페이징 처리 객체(pm)을 어트리뷰트에 담아서 view로 보냄
			model.addAttribute("pm", pm);
			// ==================================================== 페이징 처리
			// ====================================================
			
			log.info(" 1. controller - listProductAllGET ");
			log.info(vo+"");
			
			log.info("############" + user_id);
			
			session.setAttribute("user_id", user_id);
			
			model.addAttribute("DealingProductList", service.DealingProductList(pm, user_id));
			//log.info(service.sellProductList(pm, user_id)+"=======");
			
			
			session.setAttribute("isUpdate", false); // 조회수 때문에 주는 것
			
			return "/product/productDealingList";
		}
		
//-------------------------상품 거래중내역---------------------------------
		
//-------------------------상품 거래중내역: 거래중->거래후 ---------------------------------
			// 상품작성 삭제 - POST
	@RequestMapping(value = "/dealDone", method = RequestMethod.GET)
	public String dealDonePOST(DealVO vo,Model model) throws Exception {
		log.info(" dealDonePOST() 호출 ");

		//거래완료처리 메서드
		service.dealDone(vo);
	
		return "redirect:/product/listProductDealing?page=1";
	}
//-------------------------상품 거래중내역: 거래중->거래후 ---------------------------------
	
//-------------------------상품 상세페이지: 거래전->거래중  // 거래전->거래후---------------------------------
	@ResponseBody
	@RequestMapping(value="/BeforeAndDealing2",method=RequestMethod.POST)
	public Integer BeforeAndDealing(DealVO dvo,HttpSession session, Model model,@RequestParam("state") String state) throws Exception{
		log.info("AfterDealPOST 실행 @@@@@@@@");
		
		log.info("dvo : " + dvo);
		log.info(state);
		
		//String user_id = (String)session.getAttribute("user_id");
				
		Integer result = service.BeforeAndDealing(dvo);
		log.info(dvo+"############");
		
				
		session.setAttribute("result", result);
				

		return result;
	}
//-------------------------상품 상세페이지: 거래전->거래중  // 거래전->거래후---------------------------------
	

	// 채팅하기
		@RequestMapping(value = "/chatting", method = RequestMethod.GET)
		public void chattingGET(ChattingVO vo, Model model) throws Exception {
			log.info("chattingGET() 호출");
			log.info("vo : " + vo);
			
			ChattingVO vo2 = service2.chattingSelect(vo);
			log.info("vo2 : " + vo2);
			model.addAttribute("vo", vo2);
		}
		
		// 채팅목록
		@RequestMapping(value = "/chattingList", method = RequestMethod.GET)
		public void chattingListGET(HttpSession session, Model model, PageVO vo2) throws Exception {
			log.info("chattingListGET() 호출");
			
			String user_id = (String)session.getAttribute("user_id");
			List<ChattingVO> chattingList = service2.chattingList(user_id);
			
			model.addAttribute("chattingList", chattingList);
			
			// =================================================== 페이징 처리 ===================================================
			// DB 내 모든 상품의 총 개수
			Integer totalCnt = service2.getTotalCnt(user_id);
			log.info("DB 내 상품의 총 개수 : " + totalCnt + "개");
			// 페이징 처리 하단부 정보 저장
			PageMakerVO pm = new PageMakerVO();
			pm.setVo(vo2); // 페이징 처리 하단부 정보를 vo에 받아오고
			pm.setTotalCnt(totalCnt); // calData() 페이징처리에 필요한 계산식 계산 메서드가 포함된 전체 글 갯수 초기화 메서드 호출
			log.info("pmVO : " + pm);
			log.info("pageVO : " + vo2);
			// 페이징 처리 객체(pm)을 어트리뷰트에 담아서 view로 보냄
			model.addAttribute("pm", pm);
			// =================================================== 페이징 처리 ===================================================
			
		}
		
		// 지역정보 세션 만들기
		@RequestMapping(value = "/address", method = RequestMethod.GET)
		public void addrGET(@RequestParam("address") String address, HttpSession session) throws Exception {
			String[] addresses = address.split(" ");
			String addr = "";
			if(addresses[0].equals("서울")) {
				addr = addresses[0] + "특별시 " + addresses[1];
			} else if(addresses[0].equals("부산")) {
				addr = addresses[0] + "광역시 " + addresses[1];
			} else if(addresses[0].equals("대구")) {
				addr = addresses[0] + "광역시 " + addresses[1];
			} else if(addresses[0].equals("인천")) {
				addr = addresses[0] + "광역시 " + addresses[1];
			} else if(addresses[0].equals("광주")) {
				addr = addresses[0] + "광역시 " + addresses[1];
			} else if(addresses[0].equals("대전")) {
				addr = addresses[0] + "광역시 " + addresses[1];
			} else if(addresses[0].equals("울산")) {
				addr = addresses[0] + "광역시 " + addresses[1];
			} else if(addresses[0].equals("경기")) {
				addr = "경기도 " + addresses[1];
			} else if(addresses[0].equals("강원")) {
				addr = "강원도 " + addresses[1];
			} else if(addresses[0].equals("충북")) {
				addr = "충청북도 " + addresses[1];
			} else if(addresses[0].equals("충남")) {
				addr = "충청남도 " + addresses[1];
			} else if(addresses[0].equals("전북")) {
				addr = "전라북도 " + addresses[1];
			} else if(addresses[0].equals("전남")) {
				addr = "전라남도 " + addresses[1];
			} else if(addresses[0].equals("경북")) {
				addr = "경상북도 " + addresses[1];
			} else if(addresses[0].equals("경남")) {
				addr = "경상남도 " + addresses[1];
			} else {
				addr = addresses[0] + " " + addresses[1];
			}
			
			log.info(addr);
			session.setAttribute("addr", addr);
		}

	
	

}
