package com.woolim.dto;

public class pageMaker {
  private int totalCount;    
  private int displayPageNum = 10;   
  
  private int startPage;     
  private int endPage;        
  private int pageGroup;        
  
  private boolean prev;       
  private boolean next;       
  
  
  private criteria cri;      

  public int getTotalCount() {
      return totalCount;
  }

  public void setTotalCount(int totalCount) {
      this.totalCount = totalCount;
      
      calcData();
  }
  
  private void calcData() {
      pageGroup = (int) (Math.ceil(cri.getPage() / (double) displayPageNum));
      startPage = displayPageNum*(pageGroup-1)+1;
      endPage = pageGroup * displayPageNum;
      
      int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
      
      if(endPage > tempEndPage) {
          endPage = tempEndPage;
      }
      
      prev = startPage == 1 ? false : true;
      
      next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
  }

  public int getStartPage() {
      return startPage;
  }

  public void setStartPage(int startPage) {
      this.startPage = startPage;
  }

  public int getEndPage() {
      return endPage;
  }

  public void setEndPage(int endPage) {
      this.endPage = endPage;
  }

  public boolean isPrev() {
      return prev;
  }

  public void setPrev(boolean prev) {
      this.prev = prev;
  }

  public boolean isNext() {
      return next;
  }

  public void setNext(boolean next) {
      this.next = next;
  }

  public int getDisplayPageNum() {
      return displayPageNum;
  }

  public void setDisplayPageNum(int displayPageNum) {
      this.displayPageNum = displayPageNum;
  }

  public criteria getCri() {
      return cri;
  }

  public void setCri(criteria cri) {
      this.cri = cri;
  }

  @Override
  public String toString() {
      return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
              + prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
  }
}
