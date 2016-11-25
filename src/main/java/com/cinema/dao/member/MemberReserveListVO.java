package com.cinema.dao.member;

import java.util.Date;

public class MemberReserveListVO {
	private int rNo;
	private String seat;
	private int ticket;
	private String paytype;
	private int payment;
	private String local;
	private String theater;
	private int theaterno;
	private String movietime;
	private String title;
	private String poster;
	private int mno;
	private Date dbday;
	private Date rdate;
	private int check;
	private String listdate;
	
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public String getListdate() {
		return listdate;
	}
	public void setListdate(String listdate) {
		this.listdate = listdate;
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
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public Date getDbday() {
		return dbday;
	}
	public void setDbday(Date dbday) {
		this.dbday = dbday;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public int getCheck() {
		return check;
	}
	public void setCheck(int check) {
		this.check = check;
	}
	
}
