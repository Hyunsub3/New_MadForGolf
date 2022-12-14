package com.madforgolf.persistence;

import com.madforgolf.domain.DealVO;

public interface DealDAO {
	
	//거래 생성
	public void insertDeal(DealVO vo) throws Exception;
	
	//거래 수정(구매자 정보 입력)
	public void updateDeal(Integer deal_num, String buyer_id) throws Exception;

	// 거래 수정(거래 - 상품번호 입력)
	public void addProd_num(int prod_num);

	// 구매자 정보 삭제
	public void deleteBuyer(Integer deal_num);

	
}
