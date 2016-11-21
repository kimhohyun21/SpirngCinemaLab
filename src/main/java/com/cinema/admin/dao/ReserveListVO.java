package com.cinema.admin.dao;

import java.util.*;

public class ReserveListVO {
	private int rno;
	private Date rdate;
	private String title;
	private String name;
	private String cancel;
	private String refund;
	private String seat;
	private int ticket;
	private String paytype;
	private int payment;
	private String payment_id;
	private String shop_id;
	private int serverpay;
	private String cardoknum;
	private String theater;
	private int theaterno;
	private String movietime;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getcancel() {
		return cancel;
	}
	public void setcancel(String cancel) {
		this.cancel = cancel;
	}
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public int getTicket() {
		return ticket;
	}
	public void setTicket(int ticket) {
		this.ticket = ticket;
	}
	public String getPaytype() {
		return paytype;
	}
	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public String getShop_id() {
		return shop_id;
	}
	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}
	public int getServerpay() {
		return serverpay;
	}
	public void setServerpay(int serverpay) {
		this.serverpay = serverpay;
	}
	public String getCardoknum() {
		return cardoknum;
	}
	public void setCardoknum(String cardoknum) {
		this.cardoknum = cardoknum;
	}
	public String getTheater() {
		return theater;
	}
	public void setTheater(String theater) {
		this.theater = theater;
	}
	public int getTheaterno() {
		return theaterno;
	}
	public void setTheaterno(int theaterno) {
		this.theaterno = theaterno;
	}
	public String getMovietime() {
		return movietime;
	}
	public void setMovietime(String movietime) {
		this.movietime = movietime;
	}
	
	
}
