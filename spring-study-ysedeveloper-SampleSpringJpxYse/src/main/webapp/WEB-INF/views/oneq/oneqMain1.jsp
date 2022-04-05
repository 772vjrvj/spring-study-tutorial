<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title id='Description'>This example shows how to create a Grid from Array data.</title>
<link href="<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/styles/jqx.base.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/styles/jqx.energyblue.css"/>" rel='stylesheet' />
<script src='<c:url value="/resources/js/jquery-3.6.0.min.js"/>'></script>
<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxcore.js"/>'></script>
<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxdata.js"/>'></script>
<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxbuttons.js"/>'></script>
<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxscrollbar.js"/>'></script>
<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxmenu.js"/>'></script>
<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxgrid.js"/>'></script>
<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxgrid.edit.js"/>'></script>
<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxgrid.selection.js"/>'></script>
<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxcheckbox.js"/>'></script>
<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxlistbox.js"/>'></script>
<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxgrid.pager.js"/>'></script>
<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxdropdownlist.js"/>'></script>
<script src='<c:url value="/resources/js/oneq/oneqcustomer.js"/>'></script>
<script src='<c:url value="/resources/js/oneq/oneqUtil.js"/>'></script>
<style type="text/css">
.cellGray {
	background-color: eee9e9;
	border: eee9e9;
}

.paging{
	float: right;
}

.paging li {
	list-style: none;
	display: inline-block;
	margin-left: 20px;
}

.paging li span {
	padding: 0 5px;
}

a {
	text-decoration: none;
	background: #00000;
}

.paging li a {
	padding: 0 5px;
}

.paging li input {
	width: 30px;
	text-align: right;
}



.goPage {
	width: 20px;
}

.goPage:focus {
	outline: none;
}

.gridButton {
	margin-left: 5px; background-color: white
}

.viewSelectPage{
	width: 50px;
	padding: 3px;
}

.viewSelectPage:focus{
	outline: none;
}

</style>
<script type="text/javascript">
	
</script>
</head>
<body class='default'>
	<div id='jqxWidget'
		style="font-size: 13px; font-family: Verdana; float: left;">
		<div style='margin: 5px; text-align: right;'>
			<select name="viewSelectPage" class="viewSelectPage" id="viewSelectPage">
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
			</select> 
			<input class="gridButton" id="deleterowbutton" type="button" value="삭제" /> 
			<input class="gridButton" id="updaterowbutton" type="button" value="수정" /> 
			<input class="gridButton" id="addrowbutton"    type="button" value="추가" />
		</div>
		<div id="jqxgrid"></div>
		<div>
        	<ul class="paging">
        		<li><span>Go to Page</span><input type="text" class="goPage" id="goPage" value="1"></li>
        		<li><span id="nowPage">1-3</span><span>of</span><span id="totalPage">100</span></li>
        		<li><a id="prePage" href="#">◀</a><a id="nextPage" href="#">▶</a></li>
        	</ul>
        </div> 
	</div>
</body>
</html>