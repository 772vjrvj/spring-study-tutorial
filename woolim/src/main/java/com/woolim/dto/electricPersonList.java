package com.woolim.dto;

public class electricPersonList {
    // ��ȣ 
    private Integer no;

    // ������� ����� �ڵ� 
    private String electricpersoncode;

    // ������� ����� �̸� 
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