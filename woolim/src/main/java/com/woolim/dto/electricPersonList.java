package com.woolim.dto;

public class electricPersonList {
    // 번호 
    private Integer no;

    // 전기공사 담당자 코드 
    private String electricpersoncode;

    // 전기공사 담당자 이름 
    private String electricpersonvalue;

    public Integer getNo() {
        return no;
    }

    public void setNo(Integer no) {
        this.no = no;
    }

    public String getElectricpersoncode() {
        return electricpersoncode;
    }

    public void setElectricpersoncode(String electricpersoncode) {
        this.electricpersoncode = electricpersoncode;
    }

    public String getElectricpersonvalue() {
        return electricpersonvalue;
    }

    public void setElectricpersonvalue(String electricpersonvalue) {
        this.electricpersonvalue = electricpersonvalue;
    }

    public electricPersonList(Integer no, String electricpersoncode, String electricpersonvalue) {
      super();
      this.no = no;
      this.electricpersoncode = electricpersoncode;
      this.electricpersonvalue = electricpersonvalue;
    }

    @Override
    public String toString() {
      return "electricPersonList [no=" + no + ", electricpersoncode=" + electricpersoncode
          + ", electricpersonvalue=" + electricpersonvalue + "]";
    }


}