package com.madforgolf.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.madforgolf.domain.DealVO;
import com.madforgolf.domain.ProductVO;
import com.madforgolf.service.DealService;

@Controller
@RequestMapping("/deal/*")
public class DealController {
	

	private static final Logger log = LoggerFactory.getLogger(DealController.class);
	
	@Inject
	private DealService service;
	
	
	///////////////////////////////////////////////////////////////////////////////////
	
	
	//거래 생성
	@RequestMapping(value = "insertDeal",method = RequestMethod.GET)
	public void insertDeal(DealVO dealVo, HttpSession session, @ModelAttribute("ProductVo") ProductVO productVo, HttpServletResponse response) throws Exception{
		
		log.info(" 1. DealController - insertDeal(DealVO) ");
		
		dealVo.setSeller_id(productVo.getSeller_id());
		dealVo.setPrice(productVo.getPrice());
		dealVo.setState("거래전");
		dealVo.setProd_num(productVo.getProd_num());
		
		log.info(productVo.getSeller_id());
		
		service.insertDeal(dealVo);
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('상품등록 및 거래전 세팅 완료');");
		out.println("location.href='/product/listAll2'");
		out.println("</script>");
		out.flush();

	}
	
	
	//---------------------------------------------------------------------------------
	
	
	
	//구매자 정보 입력하기
	@RequestMapping(value = "updateDeal",method = RequestMethod.POST)
	public String updateDeal(HttpSession session,DealVO vo) throws Exception{
		log.info(" 1. DealController - updateDeal(DealVO, buyer_id) ");
		String buyer_id = (String)session.getAttribute("user_id");
		Integer deal_num = vo.getDeal_num();
		
		log.info(" buyer_id 세션값 : "+session.getAttribute("user_id"));
		log.info(" deal_num 값 : "+vo.getDeal_num());

		session.setAttribute("prod_num", deal_num);
		session.setAttribute("deal_num", deal_num);

		log.info(" deal_num 세션값 : "+session.getAttribute("deal_num"));
		
		service.updateDeal(deal_num,buyer_id);
		
//		return Integer.parseInt((String)session.getAttribute("prod_num"));
		return "/deal/getDeal";
	}
	
	
	//구매자 정보 삭제하기
	@RequestMapping(value = "deleteBuyer",method = RequestMethod.GET)
	public void deleteBuyer(Model model, @RequestParam("deal_num") Integer deal_num) throws Exception{
		log.info(" 1. DealController - deleteBuyer(deal_num) ");

		service.deleteBuyer(deal_num);
		
	}
	

	

	
}
