package egovframework.example.join.service;

import java.util.ArrayList;
import java.util.List;

public class JoinVO {
	
	private String mbrNo		= ""; //회원번호
	private String mbrNm		= ""; //회원명
	private String loginId		= ""; //로그인 아이디
	private String pwd			= ""; //비밀번호
	private String pwdConfirm	= ""; //비밀번호 확인
	private String cpNo			= ""; //휴대폰번호
	private String zipCode		= ""; //우편번호
	private String bsAddr		= "";
	private String dtAddr		= "";
	private String email		= ""; //이메일
	private String smsRcpYn		= ""; //문자수신여부
	private String emailRcpYn	= ""; //이메일수신여부
	
	private List<String> chkAgreement = new ArrayList<String>();
	
	public String getMbrNo() {
		return mbrNo;
	}
	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}
	public String getMbrNm() {
		return mbrNm;
	}
	public void setMbrNm(String mbrNm) {
		this.mbrNm = mbrNm;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwdConfirm() {
		return pwdConfirm;
	}
	public void setPwdConfirm(String pwdConfirm) {
		this.pwdConfirm = pwdConfirm;
	}
	public String getCpNo() {
		return cpNo;
	}
	public void setCpNo(String cpNo) {
		this.cpNo = cpNo;
	}

	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getBsAddr() {
		return bsAddr;
	}
	public void setBsAddr(String bsAddr) {
		this.bsAddr = bsAddr;
	}
	public String getDtAddr() {
		return dtAddr;
	}
	public void setDtAddr(String dtAddr) {
		this.dtAddr = dtAddr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSmsRcpYn() {
		return smsRcpYn;
	}
	public void setSmsRcpYn(String smsRcpYn) {
		this.smsRcpYn = smsRcpYn;
	}
	public String getEmailRcpYn() {
		return emailRcpYn;
	}
	public void setEmailRcpYn(String emailRcpYn) {
		this.emailRcpYn = emailRcpYn;
	}
	public List<String> getChkAgreement() {
		return chkAgreement;
	}
	public void setChkAgreement(List<String> chkAgreement) {
		this.chkAgreement = chkAgreement;
	}
	@Override
	public String toString() {
		return "JoinVO [mbrNo=" + mbrNo + ", mbrNm=" + mbrNm + ", loginId=" + loginId + ", pwd=" + pwd + ", pwdConfirm="
				+ pwdConfirm + ", cpNo=" + cpNo + ", zipCode=" + zipCode + ", bsAddr=" + bsAddr + ", dtAddr=" + dtAddr
				+ ", email=" + email + ", smsRcpYn=" + smsRcpYn + ", emailRcpYn=" + emailRcpYn + ", chkAgreement="
				+ chkAgreement + "]";
	}

	
	
	
}
