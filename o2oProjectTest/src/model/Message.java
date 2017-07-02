package model;

import java.util.Date;

public class Message {
	
	private int id;
	private int sender;
	private int accepter;
	private String content;
	private Date release_time;
	private int record_id;
	private int status;
	private int if_private;
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
	public Date getRelease_time() {
		return release_time;
	}
	public void setRelease_time(Date release_time) {
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
	public int getIf_private() {
		return if_private;
	}
	public void setIf_private(int if_private) {
		this.if_private = if_private;
	}
	
	
	
}
