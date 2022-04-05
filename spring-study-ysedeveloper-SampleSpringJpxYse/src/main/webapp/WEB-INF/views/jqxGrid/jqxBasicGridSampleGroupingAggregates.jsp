<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title id='Description'>Grid populated from JSON.</title>
    <link href="<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/styles/jqx.base.css"/>" rel='stylesheet' />   
    <script src='<c:url value="/resources/js/scripts/jquery-3.6.0.min.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxcore.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxdata.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxbuttons.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxscrollbar.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxmenu.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxgrid.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxgrid.selection.js"/>'></script>

    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxgrid.edit.js"/>'></script> 
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxlistbox.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxdropdownlist.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxcheckbox.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxinput.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxslider.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/scripts/demos.js"/>'></script>
    
	<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxcalendar.js"/>'></script>
	<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxnumberinput.js"/>'></script>
	<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxdatetimeinput.js"/>'></script>
	<script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/globalization/globalize.js"/>'></script>
    
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/demos/Javascript & JQuery/jqxgrid/generatedata.js"/>'></script>

    
<script type="text/javascript">
        $(document).ready(function () {
            // prepare the data
            var data = generatedata(200);
            var source =
            {
                localdata: data,
                datatype: "array",
                datafields:
                [
                    { name: 'firstname', type: 'string' },
                    { name: 'lastname', type: 'string' },
                    { name: 'productname', type: 'string' },
                    { name: 'available', type: 'bool' },
                    { name: 'quantity', type: 'number' },
                    { name: 'price', type: 'number' },
                    { name: 'date', type: 'date' }
                ],
                updaterow: function (rowid, rowdata, commit) {
                    // synchronize with the server - send update command   
                    commit(true);
                }
            };
            var cellbeginedit = function (row, datafield, columntype, value) {
                if (row == 0 || row == 2 || row == 5) return false;
            }
            var cellsrenderer = function (row, column, value, defaultHtml) {
                if (row == 0 || row == 2 || row == 5) {
                    var element = $(defaultHtml);
                    element.css('color', '#999');
                    return element[0].outerHTML;
                }
                return defaultHtml;
            }
            var dataAdapter = new $.jqx.dataAdapter(source);
            // initialize jqxGrid
            $("#grid").jqxGrid(
            {
                width: getWidth('Grid'),
                source: dataAdapter,
                editable: true,
                selectionmode: 'singlecell',
                columns: [
                  { text: 'First Name', columntype: 'textbox', datafield: 'firstname', width: 80, cellbeginedit: cellbeginedit, cellsrenderer: cellsrenderer },
                  { text: 'Last Name', datafield: 'lastname', columntype: 'textbox', width: 80, cellbeginedit: cellbeginedit, cellsrenderer: cellsrenderer },
                  { text: 'Product', columntype: 'dropdownlist', datafield: 'productname', width: 190, cellbeginedit: cellbeginedit, cellsrenderer: cellsrenderer },
                  { text: 'Available', datafield: 'available', columntype: 'checkbox', width: 67, cellbeginedit: cellbeginedit},
                  { text: 'Ship Date', datafield: 'date', columntype: 'datetimeinput', width: 110, cellsalign: 'right', cellsformat: 'd', cellbeginedit: cellbeginedit, 
                      validation: function (cell, value) {
                          var year = value.getFullYear();
                          if (year >= 2015) {
                              return { result: false, message: "Ship Date should be before 1/1/2015" };
                          }
                          return true;
                      }, cellsrenderer: cellsrenderer
                  },
                  { text: 'Quantity', datafield: 'quantity', width: 70, cellsalign: 'right', columntype: 'numberinput', 
                      validation: function (cell, value) {
                          if (value < 0 || value > 150) {
                              return { result: false, message: "Quantity should be in the 0-150 interval" };
                          }
                          return true;
                      },
                      initeditor: function (row, cellvalue, editor) {
                          editor.jqxNumberInput({ decimalDigits: 0, digits: 3 });
                      }, cellbeginedit: cellbeginedit, cellsrenderer: cellsrenderer
                  },
                  { text: 'Price', datafield: 'price', cellsalign: 'right', cellsformat: 'c2', columntype: 'numberinput',
                      validation: function (cell, value) {
                          if (value < 0 || value > 15) {
                              return { result: false, message: "Price should be in the 0-15 interval" };
                          }
                          return true;
                      },
                      initeditor: function (row, cellvalue, editor) {
                          editor.jqxNumberInput({ digits: 3 });
                      }, cellbeginedit: cellbeginedit, cellsrenderer: cellsrenderer
                  }
                ]
            });
            // events
            $("#grid").on('cellbeginedit', function (event) {
                var args = event.args;
                $("#cellbegineditevent").text("Event Type: cellbeginedit, Column: " + args.datafield + ", Row: " + (1 + args.rowindex) + ", Value: " + args.value);
            });
            $("#grid").on('cellendedit', function (event) {
                var args = event.args;
                $("#cellendeditevent").text("Event Type: cellendedit, Column: " + args.datafield + ", Row: " + (1 + args.rowindex) + ", Value: " + args.value);
            });
        });
    </script>
</head>
<body class='default'>
    <div id='jqxWidget'>
        <div id="grid"></div>
        <div style="margin-top: 30px;">
            <div id="cellbegineditevent"></div>
            <div style="margin-top: 10px;" id="cellendeditevent"></div>
       </div>
    </div>
</body>
</html>