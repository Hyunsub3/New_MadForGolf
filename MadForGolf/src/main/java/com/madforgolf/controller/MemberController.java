package com.madforgolf.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.madforgolf.domain.KakaoLoginBO;
import com.madforgolf.domain.LikeListVO;
import com.madforgolf.domain.LikeVO;
import com.madforgolf.domain.MemberVO;
import com.madforgolf.domain.NaverLoginBO;
import com.madforgolf.domain.PageMakerVO;
import com.madforgolf.domain.PageVO;
import com.madforgolf.service.MemberService;
import com.madforgolf.domain.ProductVO;
import com.madforgolf.service.HomeService;
import com.madforgolf.service.MemberServiceImpl;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	// 서비스 객체 필요(의존적)
	@Inject
	private MemberService service;
	
	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
	@Inject
	private NaverLoginBO naverLoginBO;
	
	private String apiResult = null;
	
	@Autowired
	private KakaoLoginBO kakaoLoginBO;
	
	
	// ------------------------ 회원가입 시작 ------------------------------------
	
	
	
	// 회원가입 - GET
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertGET(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		log.info("@@@@@ insertGET() 호출");
		log.info(" /member/sign (get) -> /member/insert.jsp 로 연결");
		
		// 네이버 URL
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		log.info("@@@@@ naver : "+naverAuthUrl);
		model.addAttribute("naverURL", naverAuthUrl);
		
		// 카카오 URL
		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
		log.info("@@@@@ kakao :" + kakaoAuthUrl);		
		model.addAttribute("kakaoURL", kakaoAuthUrl);
	}
	
	// 회원가입 - POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPOST(MemberVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("insertPOST() 호출");
		log.info("@@@@@"+vo);
		int result = service.idCheck(vo);

		try {
			if (result == 1) {
				return "/member/insert";
			} else if (result == 0) {
				log.info(vo + "");
				service.insert(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}

		log.info("@@@@@회원가입 성공! ");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('회원가입완료!');");
		out.println("location.href='/member/login'");
		out.println("</script>");
		out.close();
	   

		return "redirect:/member/login";
	}

	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(MemberVO vo) throws Exception {
		log.info("idCheck() 호출");
		log.info("@@@@@@"+vo);
		String result = service.idCheck(vo)+"";
		return result;
	}
		
	// 전화번호 중복 체크
	@ResponseBody
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.POST)
	public String phoneCheck(MemberVO vo) throws Exception {
		log.info("phoneCheck() 호출");
		log.info("@@@@@@"+vo);
		String result = service.phoneCheck(vo)+"";
		return result;
	}
	
	
	// 카카오 로그인
//	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
//	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session) throws Exception {
//		log.info("kakaoLogin() 호출");
//		
//		log.info("#########" + code);
//		
//		String access_Token = service.getAccessToken(code);
//		log.info("###access_Token#### : " + access_Token);
//		
//		MemberVO userInfo = service.getUserInfo(access_Token);
//		
//		log.info("###access_Token#### : " + access_Token);
//		log.info("###nickname#### : " + userInfo.getUser_name());
//		log.info("###email#### : " + userInfo.getUser_id());
//		
//		if(userInfo.getUser_id() != null) {
//			session.setAttribute("user_id", userInfo.getUser_id());
//			session.setAttribute("access_Token", access_Token);
//			log.info("세션등록완료@@@@@ email : "+ session.getAttribute("user_id"));
//			
//			return "redirect:/member/address";
//		}else {
//			return "redirect:index";
//		}
//	}
	
	
	
	
	
	
	
	
	// ------------------------ 회원가입 끝 ------------------------------------
	
	
		
	// ------------------------ 로그인, 로그아웃 ------------------------------------
		
	
	
	// http://localhost:8088/member/login
	// 로그인 - GET
	@RequestMapping(value = "/login",method = RequestMethod.GET )
	public String login(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		log.info(" login() 실행 ");
		log.info(" 연결된 뷰 페이지로 이동 ");
					
		// 네이버 URL
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		log.info("네이버: "+naverAuthUrl);
		 model.addAttribute("naverURL", naverAuthUrl);
		 
		// 카카오 URL
		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
		log.info("@@@@@ kakao :" + kakaoAuthUrl);		
		model.addAttribute("kakaoURL", kakaoAuthUrl);
		
		
		return "/member/login";
	}
					
	// 로그인 - POST
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr, Model model) throws Exception {
		log.info(" loginPOST() 호출 ");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
		//  String id = request.getParameter("id");
		//  vo.setUser_id(id);
		//  vo.setUser_id(request.getParameter("user_id"));
		//  log.info("controller user_id : " + id);
		                    
		//  log.info("user_id" + user_id);
		                            
		log.info("@@@@ login : "+vo);
		                            
		MemberVO loginVO = service.login(vo);
		log.info("**** loginVO : "+loginVO);
		                                    
		// 로그인 여부 확인
		if(loginVO != null) {
		                    
		session.setAttribute("user_id", loginVO.getUser_id());
		session.setAttribute("loginVO", loginVO);
		session.setAttribute("user_name", loginVO.getUser_name());
		String user_id = (String)session.getAttribute("user_id");
		String user_name = (String)session.getAttribute("user_name");
		
		log.info(user_id + "세션값");
		                                        
		//  session.setAttribute("loginVO", loginVO);
		//  log.info(loginVO+" 세션값 ");
		                                    
		return "redirect:index";
		                            
		}else {
	                                
			// 실패 -> 로그인페이지 이동
	                    
			return "/member/msg";
	                                
		}
	}

	// 홈컨트롤러 index.jsp에 상품목록리스트 띄우기 위해 HomeService 객체 주입  
	@Inject
	private HomeService service1;

	// http://localhost:8088/member/main
	// 메인페이지 - GET
	@RequestMapping(value = "index", method = RequestMethod.GET )
	public String main(ProductVO vo,Model model,HttpSession session)throws Exception {
		log.info(" mainGET() 호출 ");
		log.info(" void 리턴 : /main.jsp 뷰 호출 ");
		
		 
		//------------------------------------------------------------------
		// 서비스 - 글전체 목록 가져오는 메서드
		List<ProductVO> productList = service1.listMain(vo);
		log.info("상품 개수 : " + productList.size() + "개");
	
		// 출력되는 상품 리스트를 어트리뷰트에 담아서 view로 보냄
		model.addAttribute("productList", productList);
	
		// 세션객체 - isUpdate 정보전달
		session.setAttribute("isUpdate", false);
	
		 //------------------------------------------------------------------
			
		return "index";
	}
				
	// http://localhost:8088/member/mypage
	// 마이페이지 -  GET    
	@RequestMapping(value = "/mypage", method = RequestMethod.GET )
	public String mypage() {
		log.info(" mypage() 호출 ");			
		log.info(" void 리턴 : /mypage.jsp 뷰 호출 ");
					
		return "member/mypage";
	}
				
				
	// 로그아웃 GET/POST
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// 로그아웃 -> 세션초기화
		session.invalidate();
		log.info(" 세션 초기화 완료 => 로그아웃 ");
					
		// 페이지 이동	
		return "redirect:/";
	}
			
			
		

	// ------------------------ 로그인, 로그아웃 끝 ------------------------------------
			
	
			
	// ------------------------ 아이디, 비밀번호 찾기 시작 ------------------------------------
	// 아이디 찾기
	@RequestMapping(value="/findId",method=RequestMethod.GET)
	public String findIdGET() throws Exception {
		log.info("findIdGET() 호출");
				
		return "member/findId";
	}
			
	@RequestMapping(value="/findId",method=RequestMethod.POST)
	public String findIdPOST(MemberVO vo, Model model) throws Exception {
		log.info("findIdPOST(MemberVO vo, Model model) 호출");
				
		MemberVO findIdVo = service.findId(vo);
		// System.out.println(findIdVo.getUser_id());
				
		if(findIdVo == null) {
			model.addAttribute("check",1);
				return "/member/msg";
		}else {
			model.addAttribute("check", 0);
			model.addAttribute("user_id", findIdVo.getUser_id());
			return "/member/resultId";
		}
				
	}
			
	// 아이디 결과
	@RequestMapping(value="/resultId", method=RequestMethod.GET)
	public String resultIdGET(HttpServletRequest request,Model model, @RequestParam(required=false,value="user_name") String user_name, @RequestParam(required=false,value="user_phone") String user_phone, MemberVO searchVO) throws Exception{
				
		searchVO.setUser_name(user_name);
		searchVO.setUser_phone(user_phone);
		MemberVO findId = service.findId(searchVO);
				
				
		model.addAttribute("searchVO", findId);
				
				
		return "member/resultId";
	}
			
			
			
	// 비밀번호 찾기
	@RequestMapping(value="/findPw",method=RequestMethod.GET)
	public String findPwGET() throws Exception {
		log.info("findPwGET() 호출");
				
		return "member/findPw";
	}
			
	@RequestMapping(value="/findPw",method= RequestMethod.POST)
	public String findPwPOST(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		log.info("findPwPOST(MemberVO vo, Model model) 호출");
				
		log.info("@@@@@@@@@@@@@@"+vo);
				
		// System.out.println("입력한 정보: "+vo);
		MemberVO findPwVo = service.findPw(vo);
		// String pw = findPwVo.getUser_pw();
		log.info("가져온정보: "+findPwVo);
				
		if(findPwVo == null) {
			rttr.addFlashAttribute("check",1);
			return "/member/msg";
		}else {
			findPwVo.setUser_id(vo.getUser_id());
			rttr.addFlashAttribute("check", 0);
			rttr.addFlashAttribute("findPwVo", findPwVo);
			log.info("가져온정보: "+findPwVo);
			return "redirect:/member/updatePw";
		}
				
	}
			
			
			
	// 비밀번호 변경 GET
	@RequestMapping(value="/updatePw",method=RequestMethod.GET)
	public void updatePwGET(@RequestParam(value="updatePw", defaultValue="", required=false) String user_id, MemberVO vo) throws Exception{
		log.info("updatePwGET() 호출");
	}
			
	// 비밀번호 변경 POST
	@RequestMapping(value="/member/updatePw",method=RequestMethod.POST)
	public String updatePwPOST(@RequestParam(value="updatePw", defaultValue="", required=false) String user_id, MemberVO vo) throws Exception{
		log.info("updatePwPOST() 호출");
		log.info(""+vo);
		// vo.setUser_id("user_id");
		service.updatePw(vo);
				
		return "redirect:/member/login";
	}
	// ------------------------ 아이디, 비밀번호 찾기 끝 ------------------------------------
			
			
	
// ------------------------ 회원 정보 수정 시작 ------------------------
		
		
		

// => /WEB-INF/views/member/update.jsp
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(HttpSession session, Model model) {
		// 세션값 가져오기
		String id =(String)session.getAttribute("user_id");
					
		// 수정할 정보 가지고 감.
		MemberVO vo=service.getMember(id);
//		request.setAttribute("vo",vo);
		model.addAttribute("vo",vo);
		log.info("@@@@@" + id+"");
		// 가상주소 변경없이 jsp 이동
		//  /WEB-INF/views/member/update.jsp
		return "member/update";
		// redirect:/ (==) /index
	}
			
	// 수정처리 메시지 "MemberController updatePro()"		
	@RequestMapping(value = "/updatePro", method = RequestMethod.POST)
	public ResponseEntity<?> updatePro(MemberVO vo, HttpSession session) throws Exception {
					  
		log.info( "updatePro() 호출");
		// 세션값 가져오기
		String id =(String)session.getAttribute("user_id");				
		vo.setUser_id(id);
		
		log.info( "updatePro() 호출  {} ", vo.toString());
		service.updateMember(vo);		
		
		//세션정보 업데이트 처리            
		MemberVO loginVO = service.login(vo);
		log.info("**** loginVO : "+loginVO);			   
		session.setAttribute("user_id", loginVO.getUser_id());
		session.setAttribute("loginVO", loginVO);
					
		return ResponseEntity.status(HttpStatus.OK).body("success");
		
		// loginMember 비밀번호 일치 여부 확인
		//MemberVO vo2 = service.loginMember(vo);
		// 아이디 비밀번호 일치 => 수정처리 => /main/main 이동
		// 아이디 비밀번호  틀림  => msg.jsp  뒤로이동
		//if(vo2!=null) {
			// 아이디 비밀번호 일치
			//수정처리
			
		//	service.updateMember(vo);
		//	log.info("회원정보 수정 동작");
			// 메인 페이지로 이동
			// 주소가 변경되면서 가상주소 이동
			// response.sendRedirect()
		//	return "/member/login";
		//}
//		else {
//			//  아이디 
//			//  /WEB-INF/views/member/msg.jsp
//			return "/member/login";
//		}
		//	return "member/update";
	}
	
	// 전화번호 업데이트처리
		@ResponseBody
		@RequestMapping(value = "/updatePhone", method = RequestMethod.POST)
		public ResponseEntity<?> updatePhoneCheck(MemberVO vo, HttpSession session)  {
			try {
				
				log.info("updatePhoneCheck() 호출");
				
				// 세션값 가져오기
				String id =(String)session.getAttribute("user_id");				
				vo.setUser_id(id);
				log.info("@@@@@@  {}", vo.toString());				
				return ResponseEntity.status(HttpStatus.OK).body(service.updatePhone(vo));
				
				
			}catch (Exception e) {
				log.info("전화 번호 중복 ");
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(-2);
			}

		}
		
	// ------------------------ 회원 정보 수정 끝 ------------------------

		
		
	// ------------------------ 회원 탈퇴 시작 ------------------------
	// http://localhost:8080/member/delete
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public void deleteGET() throws Exception {
		log.info("deleteGET() 호출");
				
	}
	
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String deletePOST(MemberVO dvo, HttpSession session, RedirectAttributes rttr) throws Exception {
		log.info("deletePOST() 호출");
		log.info("Controller @@@@@@"+dvo);
				
		MemberVO deleteVo = (MemberVO)session.getAttribute("loginVO");
				
		log.info("가져온정보: "+dvo);
				
				
		String voPw = dvo.getUser_pw();
		String sessionPw = deleteVo.getUser_pw();
				
		if(!(sessionPw.equals(voPw))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/delete";
		}
				
		service.deleteMember(dvo);
		session.invalidate();
				
		log.info("회원탈퇴 성공");
				
		return "redirect:index";
				
				
	}
	
	
	
	// 비밀번호 체크
	@ResponseBody
	@RequestMapping(value="/pwCheck",method=RequestMethod.POST)
	public int pwCheck(MemberVO vo) throws Exception{
		int result = service.pwCheck(vo);
				
		return result;
	}
	
	
	// ------------------------ 회원 탈퇴 끝 ------------------------
	
	
	

	// ------------------------ SNS 로그인 ---------------------------
	// 네이버 아이디 로그인 성공 시
		@RequestMapping(value = "/naverLogin", method = { RequestMethod.GET, RequestMethod.POST })
		public String callback(Model model, @RequestParam String code, RedirectAttributes rttr, @RequestParam String state, HttpSession session,
				HttpServletRequest request) throws Exception {
			log.info("여기는 callback");
			log.info("세션: "+session);
			log.info("코드: "+code);
			log.info("스테이트: "+state);
			
			OAuth2AccessToken oauthToken;
			oauthToken = naverLoginBO.getAccessToken(session, code, state);			
			log.info("토큰: "+oauthToken);
			//1. 로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
			/** apiResult json 구조
			{"resultcode":"00",
			"message":"success",
			"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
			**/
			//2. String형식인 apiResult를 json형태로 바꿈
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			//3. 데이터 파싱
			//Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			//response의 nickname값 파싱
			String id = ((String)response_obj.get("id")).substring(0,20);
			log.info("암호화된 네이버 아이디 앞에서 20자리: "+id);
			String pw = (String)response_obj.get("user_id");
			log.info("기존의 암호화된 네이버 아이디를 비밀번호로 사용:" +pw);
			String name = (String)response_obj.get("name");
			String phone = "0"+((String)response_obj.get("mobile_e164")).substring(3);

			MemberVO member = new MemberVO();
				member.setUser_id(id);
				member.setUser_pw(pw);
				member.setUser_name(name);
				member.setUser_phone(phone);
			if(service.getMember(id)!=null) {
				log.info("네이버 아이디로 이미 가입한 회원");
				// 네이버 아이디로 이미 회원가입 한 경우
				// 바로 로그인 하러 가기~
				session.setAttribute("user_id", id);
				rttr.addFlashAttribute("msg", name+"님, 환영합니다♡");
				return "redirect:index";
			} 
			// 네이버에서 사용하는 닉네임이 이미 DB에 존재할 경우
			/*if(service.getMemberNick(nick)!=null) {
				log.info("닉네임 :"+nick);
				model.addAttribute("msg", "'"+nick+"'"+"은 이미 존재하는 닉네임입니다.");
				model.addAttribute("msg2", "새로운 닉네임 입력 페이지로 이동합니다.");
				session.setAttribute("member", member);
				return "/main/nickCheck";
			} else {*/
			
			
			// 네이버 정보로 회원가입한 적 없는 회원이 경우 자동 회원가입
			log.info("회원가입 한 적 없는 사용자입니다.");
			
				service.insert(member);
				
				
				
				//4.파싱 아이디 세션으로 저장
				session.setAttribute("user_id",id); //세션 생성
				/*
				 * rttr.addFlashAttribute("message", nick+"님의 회원가입 완료!");
				 * rttr.addFlashAttribute("message2",
				 * "현재 임시 비밀번호 상태이니 마이페이지에서 	반드시 비밀번호를 변경해주세요.");
				 */
				return "redirect:/member/address";
			}
		
		
		// 카카오 로그인 성공시
		@RequestMapping(value = "/kakaoLogin", method = { RequestMethod.GET, RequestMethod.POST })
		public String callbackKakao(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, RedirectAttributes rttr) 
				throws Exception {
			System.out.println("로그인 성공 callbackKako");
			OAuth2AccessToken oauthToken;
			oauthToken = kakaoLoginBO.getAccessToken(session, code, state);	
			// 로그인 사용자 정보를 읽어온다
			apiResult = kakaoLoginBO.getUserProfile(oauthToken);
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj;
			
			jsonObj = (JSONObject) jsonParser.parse(apiResult);
			JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");	
			JSONObject response_obj2 = (JSONObject) response_obj.get("profile");
			// 프로필 조회
			String email = (String) response_obj.get("email");
			String name = (String) response_obj2.get("nickname");
			// 세션에 사용자 정보 등록
			// session.setAttribute("islogin_r", "Y");
			session.setAttribute("signIn", apiResult);
			session.setAttribute("user_id", email);
			session.setAttribute("user_name", name);
			
			MemberVO member = new MemberVO();
			member.setUser_id(email);
			member.setUser_name(name);
			if(service.getMember(email)!=null) {
				log.info("카카오 아이디로 이미 가입한 회원");
				// 네이버 아이디로 이미 회원가입 한 경우
				// 바로 로그인 하러 가기~
				session.setAttribute("user_id", email);
				rttr.addFlashAttribute("msg", name+"님, 환영합니다♡");
				return "redirect:index";
		} 
		// 네이버에서 사용하는 닉네임이 이미 DB에 존재할 경우
		/*if(service.getMemberNick(nick)!=null) {
			log.info("닉네임 :"+nick);
			model.addAttribute("msg", "'"+nick+"'"+"은 이미 존재하는 닉네임입니다.");
			model.addAttribute("msg2", "새로운 닉네임 입력 페이지로 이동합니다.");
			session.setAttribute("member", member);
			return "/main/nickCheck";
		} else {*/
		
		
		// 네이버 정보로 회원가입한 적 없는 회원이 경우 자동 회원가입
		log.info("회원가입 한 적 없는 사용자입니다.");
		
			service.insert(member);
			
			
			
			//4.파싱 아이디 세션으로 저장
			session.setAttribute("user_id",email); //세션 생성
			/*
			 * rttr.addFlashAttribute("message", nick+"님의 회원가입 완료!");
			 * rttr.addFlashAttribute("message2",
			 * "현재 임시 비밀번호 상태이니 마이페이지에서 	반드시 비밀번호를 변경해주세요.");
			 */
			return "redirect:/member/address";
		}
	    
		// 소셜 로그인 성공 페이지
//		@RequestMapping("/loginSuccess.do")
//		public String loginSuccess() {
//			return "loginSuccess";
//		}
//		
		
		
		// ------------------------ SNS 로그인 ---------------------------

		
		
		//카카오톡 위도경도 받아오기 ############################
				@RequestMapping(value="/lalong" , method = RequestMethod.POST)
				public String lalong(@RequestParam HashMap<String, String> paramMap, HttpServletResponse response) throws Exception {
					String roadFullAddr = paramMap.get("roadFullAddr");
					String jsonString =  memberServiceImpl.getKakaoApiFromAddress(roadFullAddr);

					// x = 경도(longitude), y = 위도(latitude)
					HashMap<String, String> XYMap = memberServiceImpl.getXYMapfromJson(jsonString);
					paramMap.put("latitude", XYMap.get("y"));
					paramMap.put("longitude", XYMap.get("x"));


					memberServiceImpl.lalong(paramMap);
					log.info("@@@@@회원가입 성공! ");

					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out=response.getWriter();
					out.println("<script>");
					out.println("alert('회원가입완료!');");
					out.println("location.href='/member/login'");
					out.println("</script>");
					out.close();


					return "/member/login";
				}
				
				//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@SNS 가입회원 주소입력  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
				@RequestMapping(value="/address" , method = RequestMethod.POST)
				public String lalongAddr(@RequestParam HashMap<String, String> paramMap, HttpServletResponse response, HttpSession session, Model model) throws Exception {
					// 세션값 가져오기
					String id =(String) session.getAttribute("user_id");
					log.info("id@@@@@@@@@@@@@@@@@@@@@@@@ : "+id);
					if (id == null || "".equals(id)) {
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out=response.getWriter();
						out.println("<script>");
						out.println("alert('세션없음!');");
						out.println("location.href='/member/login'");
						out.println("</script>");
						out.close();
						
					}
					MemberVO vo=service.getMember(id);
					String roadFullAddr = paramMap.get("roadFullAddr");
					String jsonString =  memberServiceImpl.getKakaoApiFromAddress(roadFullAddr);

					// x = 경도(longitude), y = 위도(latitude)
					HashMap<String, String> XYMap = memberServiceImpl.getXYMapfromJson(jsonString);
					paramMap.put("latitude", XYMap.get("y"));
					paramMap.put("longitude", XYMap.get("x"));
					paramMap.put("user_id", vo.getUser_id());

						 
					memberServiceImpl.lalongAddr(paramMap);
					
				
					
					
					return "/index";
				}
				
				
				// ------------------------ 지역인증 시작 (SNS 가입 회원 전용) ------------------

				
				// http://localhost:8088/member/address  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
				// SNS 가입 회원 주소 인증 페이지 -  GET (템플릿 X)
				@RequestMapping(value = "/address", method = RequestMethod.GET )
				public String address(Model model) {
					log.info(" addressGET() 호출 ");
					log.info(" void 리턴 : /address.jsp 뷰 호출 ");
							
							
							
					return "/member/address";
				}
						
						
				// http://localhost:8088/member/addressCheck  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
				// SNS 가입 회원 주소 저장 후 값 보여주는 페이지 -  GET (템플릿 X)    
				@RequestMapping(value = "/addressCheck", method = RequestMethod.GET )
				public String addressCheck(Model model) {
					log.info(" addressCheck() 호출 ");
					log.info(" void 리턴 : /addressCheck.jsp 뷰 호출 ");
							
							
							
					return "member/addressCheck";
				}
						
								
				
				// 위도경도 처리 - 서하 ############################
				@ResponseBody
				@RequestMapping(value="/sendAddr", method=RequestMethod.POST)
				public int sendAddr(@RequestParam("address") String address, HttpSession session, HttpServletResponse response) throws Exception {
					
					log.info("수정 전 address : " + address);
					
					
					log.info("수정 후 address : " + address);
					
					MemberVO vo = new MemberVO();
					vo.setRoadFullAddr(address);
					
					if(session.getAttribute("user_id") != null) {
						vo.setUser_id(session.getAttribute("user_id").toString());	
					} else {
						return 2;	
					}
					
					log.info("session 값  {}", session.getAttribute("user_id"));
					service.saveAddr(vo);
					log.info("역지오코딩 주소 저장 완료");
					return 1;
				}
		
		// ------------------------ 지역인증 끝 (SNS 가입 회원 전용) ------------------
						
						
						
		
						
						
}




