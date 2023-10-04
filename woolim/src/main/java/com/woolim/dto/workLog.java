package com.woolim.dto;

public class workLog {
  
   // 번호 
   private Integer no;

   // 작성일자 
   private String worklogdate;

   // 사용자ID FK. GW의 사용자테이블 참조
   private String userid;

   // 근무형태 (0:정상근무,1:잔업근무,2:휴일근무,3:출퇴근)
   private Integer worktype;

   // 근무시작시각 
   private String workstarttime;

   // 근무종료시각 
   private String workendtime;

   // 프로젝트 년도 
   private Integer workprojectyear;

   // 수주 Y:수주, N:수주전
   private String projectcontract;

   // 프로젝트 코드번호 FK. GW의 코드테이블
   private String projectcode;

   // 프로젝트 진척도 
   private Float projectprocess;

   // 업무코드 FK. GW의 코드테이블
   private String workcode1;

   // 업무코드상세 FK. GW의 코드테이블
   private String workcode2;

   // 업무 진척도 
   private Float workprocess;

   // 실행내용 
   private String workcontents;

   // 업무장소 
   private String workplace;

   // 특이사항 
   private String consideration;

   // 결재승인자ID 
   private String confirm3;

   // 결재승인여부 Y:승인, N:미승인
   private String confirm3Ok;
   
   //작업시간
   private String worktime;
   
   //실제 날짜 
   private String thisdate;

   //서브시퀀스
   private String subseq;
   
  public workLog() {
    super();
    // TODO Auto-generated constructor stub
  }

  public Integer getNo() {
    return no;
  }

  public void setNo(Integer no) {
    this.no = no;
  }

  public String getWorklogdate() {
    return worklogdate;
  }

  public void setWorklogdate(String worklogdate) {
    this.worklogdate = worklogdate;
  }

  public String getUserid() {
    return userid;
  }

  public void setUserid(String userid) {
    this.userid = userid;
  }

  public Integer getWorktype() {
    return worktype;
  }

  public void setWorktype(Integer worktype) {
    this.worktype = worktype;
  }

  public String getWorkstarttime() {
    return workstarttime;
  }

  public void setWorkstarttime(String workstarttime) {
    this.workstarttime = workstarttime;
  }

  public String getWorkendtime() {
    return workendtime;
  }

  public void setWorkendtime(String workendtime) {
    this.workendtime = workendtime;
  }

  public Integer getWorkprojectyear() {
    return workprojectyear;
  }

  public void setWorkprojectyear(Integer workprojectyear) {
    this.workprojectyear = workprojectyear;
  }

  public String getProjectcontract() {
    return projectcontract;
  }

  public void setProjectcontract(String projectcontract) {
    this.projectcontract = projectcontract;
  }

  public String getProjectcode() {
    return projectcode;
  }

  public void setProjectcode(String projectcode) {
    this.projectcode = projectcode;
  }

  public Float getProjectprocess() {
    return projectprocess;
  }

  public void setProjectprocess(Float projectprocess) {
    this.projectprocess = projectprocess;
  }

  public String getWorkcode1() {
    return workcode1;
  }

  public void setWorkcode1(String workcode1) {
    this.workcode1 = workcode1;
  }

  public String getWorkcode2() {
    return workcode2;
  }

  public void setWorkcode2(String workcode2) {
    this.workcode2 = workcode2;
  }

  public Float getWorkprocess() {
    return workprocess;
  }

  public void setWorkprocess(Float workprocess) {
    this.workprocess = workprocess;
  }

  public String getWorkcontents() {
    return workcontents;
  }

  public void setWorkcontents(String workcontents) {
    this.workcontents = workcontents;
  }

  public String getWorkplace() {
    return workplace;
  }

  public void setWorkplace(String workplace) {
    this.workplace = workplace;
  }

  public String getConsideration() {
    return consideration;
  }

  public void setConsideration(String consideration) {
    this.consideration = consideration;
  }

  public String getConfirm3() {
    return confirm3;
  }

  public void setConfirm3(String confirm3) {
    this.confirm3 = confirm3;
  }

  public String getConfirm3Ok() {
    return confirm3Ok;
  }

  public void setConfirm3Ok(String confirm3Ok) {
    this.confirm3Ok = confirm3Ok;
  }

  public String getWorktime() {
    return worktime;
  }

  public void setWorktime(String worktime) {
    this.worktime = worktime;
  }

  public String getThisdate() {
    return thisdate;
  }

  public void setThisdate(String thisdate) {
    this.thisdate = thisdate;
  }

  public String getSubseq() {
    return subseq;
  }

  public void setSubseq(String subseq) {
    this.subseq = subseq;
  }

  public workLog(Integer no, String worklogdate, String userid, Integer worktype,
      String workstarttime, String workendtime, Integer workprojectyear, String projectcontract,
      String projectcode, Float projectprocess, String workcode1, String workcode2,
      Float workprocess, String workcontents, String workplace, String consideration,
      String confirm3, String confirm3Ok, String worktime, String thisdate, String subseq) {
    super();
    this.no = no;
    this.worklogdate = worklogdate;
    this.userid = userid;
    this.worktype = worktype;
    this.workstarttime = workstarttime;
    this.workendtime = workendtime;
    this.workprojectyear = workprojectyear;
    this.projectcontract = projectcontract;
    this.projectcode = projectcode;
    this.projectprocess = projectprocess;
    this.workcode1 = workcode1;
    this.workcode2 = workcode2;
    this.workprocess = workprocess;
    this.workcontents = workcontents;
    this.workplace = workplace;
    this.consideration = consideration;
    this.confirm3 = confirm3;
    this.confirm3Ok = confirm3Ok;
    this.worktime = worktime;
    this.thisdate = thisdate;
    this.subseq = subseq;
  }

  @Override
  public String toString() {
    return "workLog [no=" + no + ", worklogdate=" + worklogdate + ", userid=" + userid
        + ", worktype=" + worktype + ", workstarttime=" + workstarttime + ", workendtime="
        + workendtime + ", workprojectyear=" + workprojectyear + ", projectcontract="
        + projectcontract + ", projectcode=" + projectcode + ", projectprocess=" + projectprocess
        + ", workcode1=" + workcode1 + ", workcode2=" + workcode2 + ", workprocess=" + workprocess
        + ", workcontents=" + workcontents + ", workplace=" + workplace + ", consideration="
        + consideration + ", confirm3=" + confirm3 + ", confirm3Ok=" + confirm3Ok + ", worktime="
        + worktime + ", thisdate=" + thisdate + ", subseq=" + subseq + "]";
  }

   
}
