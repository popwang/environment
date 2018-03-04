package com.environment.mypuls.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author niuchen
 * @since 2017-10-25
 */
public class User extends Model<User> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId("test_id")
	private Long testId;

	public Long getTest_id() {
		return test_id;
	}

	public void setTest_id(Long test_id) {
		this.test_id = test_id;
	}

	private Long test_id;
    /**
     * 租户ID
     */
	@TableField("tenant_id")
	private Long tenantId;
    /**
     * 名称
     */
	private String name;
    /**
     * 年龄
     */
	private Integer age;
    /**
     * 测试下划线字段命名类型
     */
	@TableField("test_type")
	private Integer testType;
    /**
     * 日期
     */
	@TableField("test_date")
	private Date testDate;
    /**
     * 测试
     */
	private Long role;
    /**
     * 手机号码
     */
	private String phone;


	public Long getTestId() {
		return testId;
	}

	public void setTestId(Long testId) {
		this.testId = testId;
	}

	public Long getTenantId() {
		return tenantId;
	}

	public void setTenantId(Long tenantId) {
		this.tenantId = tenantId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getTestType() {
		return testType;
	}

	public void setTestType(Integer testType) {
		this.testType = testType;
	}

	public Date getTestDate() {
		return testDate;
	}

	public void setTestDate(Date testDate) {
		this.testDate = testDate;
	}

	public Long getRole() {
		return role;
	}

	public void setRole(Long role) {
		this.role = role;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	protected Serializable pkVal() {
		return this.test_id;
	}

	@Override
	public String toString() {
		return "User{" +
			", testId=" + testId +
			", tenantId=" + tenantId +
			", name=" + name +
			", age=" + age +
			", testType=" + testType +
			", testDate=" + testDate +
			", role=" + role +
			", phone=" + phone +
			"}";
	}
}
