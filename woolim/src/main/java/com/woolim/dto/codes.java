package com.woolim.dto;

public class codes {
   private Integer no;

   private String code;

   private String upcode;

   private Integer codeorder;

   public Integer getNo() {
       return no;
   }

   public void setNo(Integer no) {
       this.no = no;
   }

   public String getCode() {
       return code;
   }

   public void setCode(String code) {
       this.code = code;
   }

   public String getUpcode() {
       return upcode;
   }

   public void setUpcode(String upcode) {
       this.upcode = upcode;
   }

   public Integer getcodeorder() {
       return codeorder;
   }

   public void setcodeorder(Integer codeorder) {
       this.codeorder = codeorder;
   }

   public codes() {
     super();
   }   
   
  public codes(Integer no, String code, String upcode, Integer codeorder) {
    super();
    this.no = no;
    this.code = code;
    this.upcode = upcode;
    this.codeorder = codeorder;
  }

  public codes(String code, String upcode, Integer codeorder) {
    super();
    this.code = code;
    this.upcode = upcode;
    this.codeorder = codeorder;
  }  
  
  
  @Override
  public String toString() {
    return "codes [no=" + no + ", code=" + code + ", upcode=" + upcode + ", codeorder=" + codeorder + "]";
  }


   
   
   
}