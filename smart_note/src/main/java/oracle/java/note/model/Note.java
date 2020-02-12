package oracle.java.note.model;

import java.util.Date;

public class Note {
	String note_id;
	String sub_id;
	String mem_id;
	String note_title;
	String note_contents;
	Date note_date;
	int note_share;
	
	public String getNote_id() {
		return note_id;
	}
	public void setNote_id(String note_id) {
		this.note_id = note_id;
	}
	public String getSub_id() {
		return sub_id;
	}
	public void setSub_id(String sub_id) {
		this.sub_id = sub_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getNote_title() {
		return note_title;
	}
	public void setNote_title(String note_title) {
		this.note_title = note_title;
	}
	public String getNote_contents() {
		return note_contents;
	}
	public void setNote_contents(String note_contents) {
		this.note_contents = note_contents;
	}
	public Date getNote_date() {
		return note_date;
	}
	public void setNote_date(Date note_date) {
		this.note_date = note_date;
	}
	public int getNote_share() {
		return note_share;
	}
	public void setNote_share(int note_share) {
		this.note_share = note_share;
	}
}
