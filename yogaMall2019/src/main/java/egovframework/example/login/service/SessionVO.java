package egovframework.example.login.service;

public class SessionVO {

	private String mbrNo			= "";
	private String mbrNm			= "";
	private String loginId			= "";
	private String pwd				= "";
	private String mbrGrdCd 		= "";
	private String cpNo				= "";
	private String email			= "";
	private String zipCode			= "";
	private String roadNmBscAddr 	= "";
	private String roadNmDtlAddr 	= "";
		
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
	public String getMbrGrdCd() {
		return mbrGrdCd;
	}
	public void setMbrGrdCd(String mbrGrdCd) {
		this.mbrGrdCd = mbrGrdCd;
	}
	
	public String getCpNo() {
		return cpNo;
	}
	public void setCpNo(String cpNo) {
		this.cpNo = cpNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRoadNmBscAddr() {
		return roadNmBscAddr;
	}
	public void setRoadNmBscAddr(String roadNmBscAddr) {
		this.roadNmBscAddr = roadNmBscAddr;
	}
	public String getRoadNmDtlAddr() {
		return roadNmDtlAddr;
	}
	public void setRoadNmDtlAddr(String roadNmDtlAddr) {
		this.roadNmDtlAddr = roadNmDtlAddr;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	@Override
	public String toString() {
		return "SessionVO [mbrNo=" + mbrNo + ", mbrNm=" + mbrNm + ", loginId=" + loginId + ", pwd=" + pwd
				+ ", mbrGrdCd=" + mbrGrdCd + ", cpNo=" + cpNo + ", email=" + email + ", zipCode=" + zipCode
				+ ", roadNmBscAddr=" + roadNmBscAddr + ", roadNmDtlAddr=" + roadNmDtlAddr + "]";
	}
	
	
		
}
