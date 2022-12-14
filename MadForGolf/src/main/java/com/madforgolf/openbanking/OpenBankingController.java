package com.madforgolf.openbanking;


import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.madforgolf.domain.ProductVO;
import com.madforgolf.openbanking.domain.AccountSearchRequestVO;
import com.madforgolf.openbanking.domain.AccountSearchResponseVO;
import com.madforgolf.openbanking.domain.DepositRequestVO;
import com.madforgolf.openbanking.domain.DepositResponseVO;
import com.madforgolf.openbanking.domain.RequestTokenVO;
import com.madforgolf.openbanking.domain.ResponseTokenVO;
import com.madforgolf.openbanking.domain.UserInfoRequestVO;
import com.madforgolf.openbanking.domain.UserInfoResponseVO;
import com.madforgolf.openbanking.domain.WithdrawRequestVO;
import com.madforgolf.openbanking.domain.WithdrawResponseVO;


@Controller
@RequestMapping("/openbanking/*")
public class OpenBankingController {
	

	@Autowired
	private OpenBankingService openBankingService;
	
	
	
	//--------------------------------------------------------------------------------------------------
	
	
	
	
	//토큰발급
	@RequestMapping(value = "/callback",method = RequestMethod.GET)
	public String getToken(RequestTokenVO requestTokenVO, Model model, ProductVO productVO, HttpSession session) throws Exception{
		
		System.out.println(" @@@@@@@@ 1. OpenBankingController - getToken() 호출 ");
		
		//인증 정보
		System.out.println("########## 본인인증 코드 : "+requestTokenVO.getCode());
		System.out.println("########## 사용자 권한 범위 : "+requestTokenVO.getScope());
		System.out.println("########## 사용자 정보 : "+requestTokenVO.getClient_info());
		System.out.println("########## 난수값 : "+requestTokenVO.getState());
		
		//토큰발급
		ResponseTokenVO responseToken =
			openBankingService.requestToken(requestTokenVO);
		
		
		
		System.out.println("######### responseToken : "+responseToken.getAccess_token());
		
		int prod_num = (int)session.getAttribute("prod_num");
		
		System.out.println("********* 세션값 prod_num : "+ prod_num);
		
		//정보들고
		model.addAttribute("responseToken", responseToken);
		
		System.out.println(" @@@@@@@@ 4. OpenBankingController - getToken() 종료 ");

		return "/openbanking/bank_main";
	}
	
	
	
	//-------------------------------------------------------------------------------------------
	
	
	
	// 사용자 정보 조회
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String getUserInfo(UserInfoRequestVO userInfoRequestVO, Model model)throws Exception {
		
		System.out.println(" @@@@@@@@@@ 1. OpenBankingController - getUserInfo() 호출 ");

		
		// Service 객체의 findUser() 메서드를 호출하여 사용자 정보 조회
		// => 파라미터 : UserInfoRequestVO, 리턴타입 UserInfoResponseVO
		UserInfoResponseVO userInfo = openBankingService.findUser(userInfoRequestVO);

		System.out.println(" ########### userInfo : "+ userInfo);
		System.out.println(" ########### access_token : "+ userInfoRequestVO.getAccess_token());
		
		
		// Model 객체에 UserInfoResponseVO 객체와 엑세스토큰 저장
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("access_token", userInfoRequestVO.getAccess_token());
		
		System.out.println(" @@@@@@@@@@ 5. OpenBankingController - getUserInfo() 종료 ");

		return "/openbanking/userInfo";
	}
	
	

	
	//-------------------------------------------------------------------------------------------
	
	
	
	// 등록계좌 조회
	@RequestMapping(value = "/accountList", method = RequestMethod.GET)
	public String getAccountList(AccountSearchRequestVO accountSearchRequestVO, Model model) throws Exception {
		
		System.out.println(" @@@@@@@@@@ 1. OpenBankingController - getAccountList() 호출 ");

		
		// Service 객체의 findAccount() 메서드를 호출하여 등록계좌 조회
		// => 파라미터 : AccountSearchRequestVO, 리턴타입 AccountSearchResponseVO
		AccountSearchResponseVO accountList = openBankingService.findAccount(accountSearchRequestVO);

		// Model 객체에 AccountSearchResponseVO 객체와 엑세스토큰 저장
		model.addAttribute("accountList", accountList);
		model.addAttribute("access_token", accountSearchRequestVO.getAccess_token());

		System.out.println(" @@@@@@@@@@@ 4. OpenBankingController - getAccountList() 종료 ");

		
		return "/openbanking/accountList";
	}
	
	
	
	
	
	//-------------------------------------------------------------------------------------------
	
	
	
	
	
	// 출금이체
	@RequestMapping(value = "/withdraw", method = RequestMethod.POST)
	public @ResponseBody WithdrawResponseVO getWithdraw(@RequestBody WithdrawRequestVO withdrawRequestVO, Model model)
			throws IOException {
		// Service 객체의 findAccount() 메서드를 호출하여 사용자 정보 조회
		// => 파라미터 : AccountSearchRequestVO, 리턴타입 AccountSearchResponseVO
		// AccountSearchResponseVO accountList =
		// openBankingService.findAccount(accountSearchRequestVO);
		System.out.println(withdrawRequestVO + "@@@@@@@@@@@@@@@@@@@@@@@@");
		WithdrawResponseVO withdrawOK = openBankingService.getwithdraw(withdrawRequestVO);

		// Model 객체에 AccountSearchResponseVO 객체와 엑세스토큰 저장
		model.addAttribute("withdrawOK", withdrawOK);
		model.addAttribute("access_token", withdrawRequestVO.getAccess_token());
		System.out.println("결과@@@@@@@@@@@@@" + withdrawOK);
		// return "account/withdraw";
		return withdrawOK;
	}
	
	
	
	
	
	
	//-------------------------------------------------------------------------------------------
	
	
	
	
	
	
	//입금이체
	@RequestMapping(value = "/deposit", method = RequestMethod.POST)
	public @ResponseBody DepositResponseVO getDeposit(@RequestBody DepositRequestVO depositRequestVO,Model model)
			throws Exception {
		// Service 객체의 findAccount() 메서드를 호출하여 사용자 정보 조회
		// => 파라미터 : AccountSearchRequestVO, 리턴타입 AccountSearchResponseVO
		// AccountSearchResponseVO accountList =
		// openBankingService.findAccount(accountSearchRequestVO);
		System.out.println("##########################" + depositRequestVO);
		DepositResponseVO depositOK = openBankingService.getDeposit(depositRequestVO);
		System.out.println("@#@#@@#@#@#@@#갔다옴");
		//System.out.println("##########################" + depositOK);
		// Model 객체에 AccountSearchResponseVO 객체와 엑세스토큰 저장
		model.addAttribute("withdrawOK", depositOK);
		model.addAttribute("access_token", depositRequestVO.getAccess_token());
		System.out.println("결과###############" + depositOK);
		// return "account/withdraw";
	
		
		return depositOK;
	}
	
	
	
	
	
	

	
	
	
	
}
