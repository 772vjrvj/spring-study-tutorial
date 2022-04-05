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
    
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxgrid.pager.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxgrid.edit.js"/>'></script> 
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxdropdownlist.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxlistbox.js"/>'></script>


    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxcombobox.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/jqwidgets/jqxpanel.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/scripts/demos.js"/>'></script>
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/demos/Javascript & JQuery/jqxgrid/generatedata.js"/>'></script>

    
    <script type="text/javascript">
        $(document).ready(function () {           
            // prepare the data
            var ordersSource =
            {
                datatype: "xml",
                datafields: [
                    { name: 'ShippedDate', map: 'm\\:properties>d\\:ShippedDate', type: 'date' },
                    { name: 'Freight', map: 'm\\:properties>d\\:Freight', type: 'float' },
                    { name: 'ShipName', map: 'm\\:properties>d\\:ShipName', type: 'string' },
                    { name: 'ShipAddress', map: 'm\\:properties>d\\:ShipAddress', type: 'string' },
                    { name: 'ShipCity', map: 'm\\:properties>d\\:ShipCity', type: 'string' },
                    { name: 'ShipCountry', map: 'm\\:properties>d\\:ShipCountry', type: 'string' }
                ],
                root: "entry",
                record: "content",
                id: 'm\\:properties>d\\:OrderID',
                url: "/resources/js/jqwidgets-ver12.1.2/demos/sampledata/orders.xml",
                
                
                pager: function (pagenum, pagesize, oldpagenum) {
                    // callback called when a page or page size is changed.
                },
                updaterow: function (rowid, rowdata, result) {
                    // synchronize with the server - send update command
                    // call result with parameter true if the synchronization with the server is successful 
                    // and with parameter false if the synchronization failder.
                    result(true);
                }
            };
            var ordersAdapter = new $.jqx.dataAdapter(ordersSource);
            $("#grid").jqxGrid(
            {
                width: getWidth('Grid'),
                source: ordersAdapter,
                selectionmode: 'singlecell',
                editable: true,
                pageable: true,
                autoheight: true,
                columns: [
                    {
                        text: 'Ship City', datafield: 'ShipCity', width: 150, columntype: 'combobox',
                        createeditor: function (row, column, editor) {
                            // assign a new data source to the combobox.
                            var list = ['Stuttgart', 'Rio de Janeiro', 'Strasbourg'];
                            editor.jqxComboBox({ autoDropDownHeight: true, source: list, promptText: "Please Choose:" });
                        },
                        // update the editor's value before saving it.
                        cellvaluechanging: function (row, column, columntype, oldvalue, newvalue) {
                            // return the old value, if the new value is empty.
                            if (newvalue == "") return oldvalue;
                        }
                    },
                    {
                        text: 'Ship Country', datafield: 'ShipCountry', width: 150, columntype: 'dropdownlist',
                        createeditor: function (row, column, editor) {
                            // assign a new data source to the dropdownlist.
                            var list = ['Germany', 'Brazil', 'France'];
                            editor.jqxDropDownList({ autoDropDownHeight: true, source: list });
                        },
                        initeditor: function (row, cellvalue, editor, celltext, pressedkey) {
                            // set the editor's current value. The callback is called each time the editor is displayed.
                            console.log('cellvalue : ', cellvalue);
                            console.log('pressedkey : ', pressedkey);
                            editor.jqxDropDownList({ selectedIndex: 0 })
                        },
                        // update the editor's value before saving it.
                        cellvaluechanging: function (row, column, columntype, oldvalue, newvalue) {
                            // return the old value, if the new value is empty.
                            //if (newvalue == "") return oldvalue;
                            console.log('geteditorvalue row: ', row);
                            return 1;
                        },
                        geteditorvalue: function (row, cellvalue, editor) {
                      	  
                      	  console.log('geteditorvalue row: ', row);
                      	  console.log('geteditorvalue cellvalue: ', cellvalue);
                      	  console.log('geteditorvalue editor val: ', editor.val());
                            // return the editor's value.
                            return editor.val();
                        }
                    },
                    { text: 'Ship Name', datafield: 'ShipName', columntype: 'combobox' }
                ]
            });
        });
    </script>
</head>
<body class='default'>
    <div id="grid"></div>
</body>
</html>