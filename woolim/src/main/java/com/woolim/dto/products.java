package com.woolim.dto;

public class products {
    private Integer no;

    private String productcode;

    private String productvalue;

    public Integer getNo() {
        return no;
    }

    public void setNo(Integer no) {
        this.no = no;
    }

    public String getProductcode() {
        return productcode;
    }

    public void setProductcode(String productcode) {
        this.productcode = productcode;
    }

    public String getProductvalue() {
        return productvalue;
    }

    public void setProductvalue(String productvalue) {
        this.productvalue = productvalue;
    }

    public products(Integer no, String productcode, String productvalue) {
      super();
      this.no = no;
      this.productcode = productcode;
      this.productvalue = productvalue;
    }

    public products() {
      super();
    }

    @Override
    public String toString() {
      return "productList [no=" + no + ", productcode=" + productcode + ", productvalue="
          + productvalue + "]";
    }

  
    

}
