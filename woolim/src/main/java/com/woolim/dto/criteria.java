package com.woolim.dto;

public class criteria {
  private int page;          
  private int perPageNum;   
  
  public criteria() {
      this.page = 1;
      this.perPageNum = 10;
  }

  public int getPage() {
      return page;
  }

  public void setPage(int page) {
      if(page <= 0) {
          this.page = 1;
          return;
      }
      
      this.page = page;
  }

  public int getPerPageNum() {
      return perPageNum;
  }

  public void setPerPageNum(int perPageNum) {

      this.perPageNum = perPageNum;
  }
  

  public int getPageStart() {
      return (this.page -1) * perPageNum;
  }
  
  public int getPageEnd() {
      return (this.page ) * perPageNum;
  }   
  
  
  
  
  

  @Override
  public String toString() {
      return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
  }
}
