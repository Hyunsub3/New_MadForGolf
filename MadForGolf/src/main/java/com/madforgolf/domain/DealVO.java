package com.madforgolf.domain;

import java.sql.Timestamp;
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class DealVO {
	private int deal_num;			// 거래 번호
	private String seller_id;		// 판매자 ID
	private String buyer_id;		// 구매자 ID
	private int prod_num;			// 상품 번호
	private int price;				// 가격
	private String state;			// 거래 상태
	private Timestamp deal_date;	// 거래 일시
	
	private MemberVO seller;	// 판매자
	private MemberVO buyer;		// 구매자
	private ProductVO product;	// 상품
	
	private int review_count;    // 리뷰 작성 상태 0 이면 등록 안됨, 

	public int getDeal_num() {		
		return deal_num;
	}
	public void setDeal_num(int deal_num) {
		this.deal_num = deal_num;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getProd_num() {
		return prod_num;
	}
	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Timestamp getDeal_date() {
		return deal_date;
	}
	public void setDeal_date(Timestamp deal_date) {
		this.deal_date = deal_date;
	}
	public MemberVO getBuyer() {
		return buyer;
	}
	public void setBuyer(MemberVO buyer) {
		this.buyer = buyer;
	}
	public ProductVO getProduct() {
		return product;
	}
	public void setProduct(ProductVO product) {
		this.product = product;
	}
	public MemberVO getSeller() {
		return seller;
	}
	public void setSeller(MemberVO seller) {
		this.seller = seller;
	}
	
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	
	@Override
	public String toString() {
		return "DealVO [deal_num=" + deal_num + ", seller_id=" + seller_id + ", buyer_id=" + buyer_id + ", prod_num="
				+ prod_num + ", price=" + price + ", state=" + state + ", deal_date=" + deal_date + ", buyer=" + buyer
				+ ", product=" + product + ", seller=" + seller + "]";
	}
		
}




