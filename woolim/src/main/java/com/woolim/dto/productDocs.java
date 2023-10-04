package com.woolim.dto;

import java.sql.Timestamp;

//������Ʈ ���⹮�� ������Ȳ���� GW�� ������Ȳ��ȸ�� ���� ��������
public class productDocs {

 // ��ȣ 
 private Integer no;

 // ���� �ڵ��ȣ(ǰ�ǹ�ȣ) FK. GW �ڵ����̺�
 private String doccode;

 // �ۼ����� 
 private Timestamp insertstartdate;

 // ������Ʈ �ڵ��ȣ FK. GW �ڵ����̺�
 private String projectcode;

 // ���� ������� ���� ���ۼ�/���/����������/�ݷ�/�Ϸ� ��
 private String docstatus;

 // ���� �ۼ����� ���繮�� �ۼ�����
 private Integer docorder;

 // ���⹰�ڵ� 
 private String productcode;

 // ��Ⱥμ� 
 private String department;

 // ����� 
 private String drafter;

 // ���� �� ���� 
 private String recepref;

 // ������ 
 private String projectperson;

 // �������� ������Ʈ �����Ͻ�
 private Timestamp projectstartdate;

 // ���� 
 private String title;

 // ���������׸� �׸�üũ(Y/N)
 private String selectlist;

 // �������� 
 private String preservationyear;

 // ������ 
 private String docbox;

 // ���ȵ�� 
 private String securitylevel;

 // ��� 
 private String emergency;

 public Integer getNo() {
     return no;
 }

 public void setNo(Integer no) {
     this.no = no;
 }

 public String getDoccode() {
     return doccode;
 }

 public void setDoccode(String doccode) {
     this.doccode = doccode;
 }

 public Timestamp getInsertstartdate() {
     return insertstartdate;
 }

 public void setInsertstartdate(Timestamp insertstartdate) {
     this.insertstartdate = insertstartdate;
 }

 public String getProjectcode() {
     return projectcode;
 }

 public void setProjectcode(String projectcode) {
     this.projectcode = projectcode;
 }

 public String getDocstatus() {
     return docstatus;
 }

 public void setDocstatus(String docstatus) {
     this.docstatus = docstatus;
 }

 public Integer getDocorder() {
     return docorder;
 }

 public void setDocorder(Integer docorder) {
     this.docorder = docorder;
 }

 public String getProductcode() {
     return productcode;
 }

 public void setProductcode(String productcode) {
     this.productcode = productcode;
 }

 public String getDepartment() {
     return department;
 }

 public void setDepartment(String department) {
     this.department = department;
 }

 public String getDrafter() {
     return drafter;
 }

 public void setDrafter(String drafter) {
     this.drafter = drafter;
 }

 public String getRecepref() {
     return recepref;
 }

 public void setRecepref(String recepref) {
     this.recepref = recepref;
 }

 public String getProjectperson() {
     return projectperson;
 }

 public void setProjectperson(String projectperson) {
     this.projectperson = projectperson;
 }

 public Timestamp getProjectstartdate() {
     return projectstartdate;
 }

 public void setProjectstartdate(Timestamp projectstartdate) {
     this.projectstartdate = projectstartdate;
 }

 public String getTitle() {
     return title;
 }

 public void setTitle(String title) {
     this.title = title;
 }

 public String getSelectlist() {
     return selectlist;
 }

 public void setSelectlist(String selectlist) {
     this.selectlist = selectlist;
 }

 public String getPreservationyear() {
     return preservationyear;
 }

 public void setPreservationyear(String preservationyear) {
     this.preservationyear = preservationyear;
 }

 public String getDocbox() {
     return docbox;
 }

 public void setDocbox(String docbox) {
     this.docbox = docbox;
 }

 public String getSecuritylevel() {
     return securitylevel;
 }

 public void setSecuritylevel(String securitylevel) {
     this.securitylevel = securitylevel;
 }

 public String getEmergency() {
     return emergency;
 }

 public void setEmergency(String emergency) {
     this.emergency = emergency;
 }

public productDocs(Integer no, String doccode, Timestamp insertstartdate, String projectcode,
    String docstatus, Integer docorder, String productcode, String department, String drafter,
    String recepref, String projectperson, Timestamp projectstartdate, String title,
    String selectlist, String preservationyear, String docbox, String securitylevel,
    String emergency) {
  super();
  this.no = no;
  this.doccode = doccode;
  this.insertstartdate = insertstartdate;
  this.projectcode = projectcode;
  this.docstatus = docstatus;
  this.docorder = docorder;
  this.productcode = productcode;
  this.department = department;
  this.drafter = drafter;
  this.recepref = recepref;
  this.projectperson = projectperson;
  this.projectstartdate = projectstartdate;
  this.title = title;
  this.selectlist = selectlist;
  this.preservationyear = preservationyear;
  this.docbox = docbox;
  this.securitylevel = securitylevel;
  this.emergency = emergency;
}



public productDocs() {
  super();
}

@Override
public String toString() {
  return "productDocs [no=" + no + ", doccode=" + doccode + ", insertstartdate=" + insertstartdate
      + ", projectcode=" + projectcode + ", docstatus=" + docstatus + ", docorder=" + docorder
      + ", productcode=" + productcode + ", department=" + department + ", drafter=" + drafter
      + ", recepref=" + recepref + ", projectperson=" + projectperson + ", projectstartdate="
      + projectstartdate + ", title=" + title + ", selectlist=" + selectlist + ", preservationyear="
      + preservationyear + ", docbox=" + docbox + ", securitylevel=" + securitylevel
      + ", emergency=" + emergency + "]";
}


 
}