package com.environment.mypuls.entity;

public class TWpOrderBuffer {
	
	private Integer iId;
	private String vEquipmentName;
	private String vOrderContent;
	private Integer iSendFlag;
	private String dtmCreate;
	
	public Integer getiId() {
		return iId;
	}
	public void setiId(Integer iId) {
		this.iId = iId;
	}
	public String getvEquipmentName() {
		return vEquipmentName;
	}
	public void setvEquipmentName(String vEquipmentName) {
		this.vEquipmentName = vEquipmentName;
	}
	public String getvOrderContent() {
		return vOrderContent;
	}
	public void setvOrderContent(String vOrderContent) {
		this.vOrderContent = vOrderContent;
	}
	
	public Integer getiSendFlag() {
		return iSendFlag;
	}
	public void setiSendFlag(Integer iSendFlag) {
		this.iSendFlag = iSendFlag;
	}
	public String getDtmCreate() {
		return dtmCreate;
	}
	public void setDtmCreate(String dtmCreate) {
		this.dtmCreate = dtmCreate;
	}
}
