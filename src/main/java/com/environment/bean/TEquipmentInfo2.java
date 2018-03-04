package com.environment.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author niuchen
 * @since 2017-10-27
 */
@TableName("t_equipment_info2")
public class TEquipmentInfo2 extends Model<TEquipmentInfo2> {

    private static final long serialVersionUID = 1L;

    /**
     * 设备ID
     */
	@TableField("i_equipment_id")
	private Integer iEquipmentId;
    /**
     * 设备名称
     */
	@TableField("v_equipment_name")
	private String vEquipmentName;
    /**
     * 设备类型
     */
	@TableField("v_equipment_type")
	private String vEquipmentType;
    /**
     * 设备类型ID
     */
	@TableField("i_euiqpment_type_id")
	private Integer iEuiqpmentTypeId;
    /**
     * 设备验证码
     */
	@TableField("v_equipment_check_code")
	private String vEquipmentCheckCode;
    /**
     * 创建时间
     */
	@TableField("dtm_create")
	private Date dtmCreate;
    /**
     * 公司名称
     */
	@TableField("v_company")
	private String vCompany;
    /**
     * 联系电话
     */
	@TableField("v_phone")
	private String vPhone;
    /**
     * 设备地址
     */
	@TableField("v_address")
	private String vAddress;
    /**
     * 经度
     */
	@TableField("n_longitude")
	private Double nLongitude;
    /**
     * 纬度
     */
	@TableField("n_latitude")
	private Double nLatitude;
    /**
     * 百度经度
     */
	@TableField("n_longitude_bd")
	private Double nLongitudeBd;
    /**
     * 百度纬度
     */
	@TableField("n_latitude_bd")
	private Double nLatitudeBd;


	public Integer getiEquipmentId() {
		return iEquipmentId;
	}

	public void setiEquipmentId(Integer iEquipmentId) {
		this.iEquipmentId = iEquipmentId;
	}

	public String getvEquipmentName() {
		return vEquipmentName;
	}

	public void setvEquipmentName(String vEquipmentName) {
		this.vEquipmentName = vEquipmentName;
	}

	public String getvEquipmentType() {
		return vEquipmentType;
	}

	public void setvEquipmentType(String vEquipmentType) {
		this.vEquipmentType = vEquipmentType;
	}

	public Integer getiEuiqpmentTypeId() {
		return iEuiqpmentTypeId;
	}

	public void setiEuiqpmentTypeId(Integer iEuiqpmentTypeId) {
		this.iEuiqpmentTypeId = iEuiqpmentTypeId;
	}

	public String getvEquipmentCheckCode() {
		return vEquipmentCheckCode;
	}

	public void setvEquipmentCheckCode(String vEquipmentCheckCode) {
		this.vEquipmentCheckCode = vEquipmentCheckCode;
	}

	public Date getDtmCreate() {
		return dtmCreate;
	}

	public void setDtmCreate(Date dtmCreate) {
		this.dtmCreate = dtmCreate;
	}

	public String getvCompany() {
		return vCompany;
	}

	public void setvCompany(String vCompany) {
		this.vCompany = vCompany;
	}

	public String getvPhone() {
		return vPhone;
	}

	public void setvPhone(String vPhone) {
		this.vPhone = vPhone;
	}

	public String getvAddress() {
		return vAddress;
	}

	public void setvAddress(String vAddress) {
		this.vAddress = vAddress;
	}

	public Double getnLongitude() {
		return nLongitude;
	}

	public void setnLongitude(Double nLongitude) {
		this.nLongitude = nLongitude;
	}

	public Double getnLatitude() {
		return nLatitude;
	}

	public void setnLatitude(Double nLatitude) {
		this.nLatitude = nLatitude;
	}

	public Double getnLongitudeBd() {
		return nLongitudeBd;
	}

	public void setnLongitudeBd(Double nLongitudeBd) {
		this.nLongitudeBd = nLongitudeBd;
	}

	public Double getnLatitudeBd() {
		return nLatitudeBd;
	}

	public void setnLatitudeBd(Double nLatitudeBd) {
		this.nLatitudeBd = nLatitudeBd;
	}

	@Override
	protected Serializable pkVal() {
		return this.iEquipmentId;
	}

	@Override
	public String toString() {
		return "TEquipmentInfo2{" +
			", iEquipmentId=" + iEquipmentId +
			", vEquipmentName=" + vEquipmentName +
			", vEquipmentType=" + vEquipmentType +
			", iEuiqpmentTypeId=" + iEuiqpmentTypeId +
			", vEquipmentCheckCode=" + vEquipmentCheckCode +
			", dtmCreate=" + dtmCreate +
			", vCompany=" + vCompany +
			", vPhone=" + vPhone +
			", vAddress=" + vAddress +
			", nLongitude=" + nLongitude +
			", nLatitude=" + nLatitude +
			", nLongitudeBd=" + nLongitudeBd +
			", nLatitudeBd=" + nLatitudeBd +
			"}";
	}
}
