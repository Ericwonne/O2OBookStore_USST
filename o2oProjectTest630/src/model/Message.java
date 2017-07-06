package model;

import java.util.Date;

public class Message {
	
	private int id;
	private int sender;
	private int accepter;
	private String content;
	private String release_time;
	private int record_id;
	private int status;
	private String senderName;
	private String senderSt_num;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public int getAccepter() {
		return accepter;
	}
	public void setAccepter(int accepter) {
		this.accepter = accepter;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getRelease_time() {
		return release_time;
	}
	public void setRelease_time(String release_time) {
		this.release_time = release_time;
	}
	public int getRecord_id() {
		return record_id;
	}
	public void setRecord_id(int record_id) {
		this.record_id = record_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSenderSt_num() {
		return senderSt_num;
	}
	public void setSenderSt_num(String senderSt_num) {
		this.senderSt_num = senderSt_num;
	}
	
	
	private int if_sale;
	public int getIf_sale() {
		return if_sale;
	}
	public void setIf_sale(int if_sale) {
		this.if_sale = if_sale;
	}
	public int getIf_private() {
		return if_private;
	}
	public void setIf_private(int if_private) {
		this.if_private = if_private;
	}


	private int if_private;

}
