<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title id='Description'>In this sample is illustrated the jqxTreeGrid Data Paging.</title>
    <meta name="description" content="Data Paging - JavaScript Tree Grid Demo | jQWidgets">  
    <link href="<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/styles/jqx.base.css"/>" rel='stylesheet' />  
   	<link rel="stylesheet" href="/resources/js/jqwidgets-ver12.1.2/jqwidgets/styles/jqx.energyblue.css" type="text/css" />
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />	 
   	<script src='<c:url value="/resources/js/scripts/jquery-1.11.1.min.js"/>'></script>


    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxcore.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxdata.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxbuttons.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxscrollbar.js"/>'></script>
	<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxlistbox.js"/>'></script>       
	<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxdropdownlist.js"/>'></script>  
	<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxdatatable.js"/>'></script>     
	<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxtreegrid.js"/>'></script>      
	<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/scripts/demos.js"/>'></script>      
	<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxtreegrid.js"/>'></script>      
	<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/scripts/demos.js"/>'></script>
	<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/demos/sampledata/generatedata2.js"/>'></script>	
	<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxgrid.selection.js"/>'></script>      	
	
	      
    <script type="text/javascript">
        $(document).ready(function () {
        	var resultDatas = generateordersdata();
        	console.log(' resultDatas : ', resultDatas);
            // prepare the data
            var source =
            {
                dataType: "array",
                dataFields: [
                 	{ name: 'firstname', type: "string" },
                 	{ name: 'lastname', type: "string" },
                    { name: "name", type: "string" },
                    { name: "quantity", type: "number" },
                    { name: "id", type: "number" },
                    { name: "parentid", type: "number" },
                    { name: "price", type: "number" },
                    { name: "date", type: "date" },
                    { name: "customer", type: "string" },
                    { name: "state", type: "string" },
                ],
                hierarchy:
                {
                    keyDataField: { name: 'id' },
                    parentDataField: { name: 'parentid' }
                },
                id: 'id',
                localData: generateordersdata()
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            // create Tree Grid
            $("#treegrid").jqxTreeGrid(
            {
               width:  getWidth("TreeGrid"),
                source: dataAdapter,
                editable: true,
                sortable: true,
                pageable: true,
                checkboxes: true,
                pagerMode: 'advanced',
                theme: 'energyblue',
                ready: function () {
                    $("#treegrid").jqxTreeGrid('expandRow', '0');
                },
                columns: [
               	  { text: 'firstname', dataField: "firstname", align: 'center', width: 250 },
               	  { text: 'lastname', dataField: "lastname", align: 'center', width: 250 },
                  { text: 'Order Name', dataField: "name", align: 'center', width: 250 },
                  { text: 'Customer', dataField: "customer", align: 'center', width: 250 },
                  { text: 'Price', dataField: "price", cellsFormat: "c2", align: 'center', cellsAlign: 'right', width: 80 },
                  {
                      text: 'Order Date', dataField: "date", align: 'center', cellsFormat: "dd-MMMM-yyyy hh:mm", cellsRenderer: function (rowKey, column, cellValue, rowData, cellText) {
                          if (rowData.level === 0) {
                              return dataAdapter.formatDate(cellValue, "dd-MMMM-yyyy");
                          }
                          return cellText;
                      }
                  },
                  { text: 'state', dataField: "state", align: 'center', width: 250, hidden: true, },
                ]
            });
            
            $("#jqxAddbutton").jqxButton({
                theme: 'energyblue',
                width: 200,
                height: 30
            });
            $('#jqxAddbutton').click(function () {
            	
                var checkedRows = $("#treegrid").jqxTreeGrid('getCheckedRows');
                                
                if(checkedRows.length === 0){
                	
                }else{
                	
                	var ChkParentRows = checkedRows.filter(function(val, idx){
                    	return val.parentid === null;
                    });
                	
                    if(ChkParentRows === null || ChkParentRows === undefined){
                    	return;
                    }
                    
                    for (var i = ChkParentRows.length-1; i >= 0; i--) {
                    	var newRow = {};
                    	newRow.firstname = ChkParentRows[i].firstname;
                    	newRow.lastname = ChkParentRows[i].lastname;
                    	newRow.parentid = ChkParentRows[i].id;
                    	newRow.state = 'new';

                    	console.log('newRow : ', newRow);
                    	$("#treegrid").jqxTreeGrid('addRow', null, newRow, 'first');
					}
                }
                
            });
            
            
            $("#jqxDeletebutton").jqxButton({
                theme: 'energyblue',
                width: 200,
                height: 30
            });
            $('#jqxDeletebutton').click(function () {
            	
                var checkedRows = $("#treegrid").jqxTreeGrid('getCheckedRows');
                                
                if(checkedRows.length === 0){
                	
                }else{
                	
                	var ChkAddRows = checkedRows.filter(function(val, idx){
                    	return val.state === 'new';
                    });
                	
                    if(ChkAddRows === null || ChkAddRows === undefined){
                    	return;
                    }
                    
                    for (var i = ChkAddRows.length-1; i >= 0; i--) {
                    	
                    	  $("#treegrid").jqxTreeGrid('deleteRow', ChkAddRows[i].uid);
					}
                }
                
            });
            
            
            $("#jqxUpdatebutton").jqxButton({
                theme: 'energyblue',
                width: 200,
                height: 30
            });

            
        });

    </script>
</head>
<body class='default'>
	<input type="button" style="margin: 20px;" id="jqxAddbutton" value="Add new row" />
	<input type="button" style="margin: 20px;" id="jqxDeletebutton" value="Delete add row" />
	<input type="button" style="margin: 20px;" id="jqxUpdatebutton" value="Update row" />
    <div id="treegrid">
    </div>
</body>
</html>