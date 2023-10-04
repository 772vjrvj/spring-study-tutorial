package com.woolim.dto;

public class controlPersonList {

    // 번호 
    private Integer no;

    // 자동제어 담당자 코드 
    private String controlpersoncode;

    // 자동제어 담당자 이름 
    private String controlpersonname;

    public Integer getNo() {
        return no;
    }

    public void setNo(Integer no) {
        this.no = no;
    }

    public String getControlpersoncode() {
        return controlpersoncode;
    }

    public void setControlpersoncode(String controlpersoncode) {
        this.controlpersoncode = controlpersoncode;
    }

    public String getControlpersonname() {
        return controlpersonname;
    }

    public void setControlpersonname(String controlpersonname) {
        this.controlpersonname = controlpersonname;
    }

    public controlPersonList(Integer no, String controlpersoncode, String controlpersonname) {
      super();
      this.no = no;
      this.controlpersoncode = controlpersoncode;
      this.controlpersonname = controlpersonname;
    }

    @Override
    public String toString() {
      return "controlPersonList [no=" + no + ", controlpersoncode=" + controlpersoncode
          + ", controlpersonname=" + controlpersonname + "]";
    }


    
}