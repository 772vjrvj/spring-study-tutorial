package com.woolim.dto;

public class controlPersonList {

    // ��ȣ 
    private Integer no;

    // �ڵ����� ����� �ڵ� 
    private String controlpersoncode;

    // �ڵ����� ����� �̸� 
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