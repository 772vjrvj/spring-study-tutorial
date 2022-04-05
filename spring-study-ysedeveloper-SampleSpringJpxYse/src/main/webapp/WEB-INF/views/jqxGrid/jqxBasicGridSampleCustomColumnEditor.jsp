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
    <script src='<c:url value="/resources/js/jqwidgets-ver12.1.2/demos/Javascript & JQuery/jqxgrid/generatedata.js"/>'></script>

    
    <script type="text/javascript">
        $(document).ready(function () {
            // prepare the data
            var data = generatedata(200);
            var source =
            {
                localdata: data,
                datatype: "array",
                updaterow: function (rowid, rowdata, commit) {
                    // synchronize with the server - send update command
                    // call commit with parameter true if the synchronization with the server is successful 
                    // and with parameter false if the synchronization failder.
                    commit(true);
                },
                datafields:
                [
                    { name: 'firstname', type: 'string' },
                    { name: 'lastname', type: 'string' },
                    { name: 'productname', type: 'string' },
                    { name: 'available', type: 'bool' },
                    { name: 'quantity', type: 'number' },
                    { name: 'price', type: 'number' },
                    { name: 'date', type: 'date' }
                ]
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            var getEditorDataAdapter = function (datafield) {
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
                       ]
                 };
                var dataAdapter = new $.jqx.dataAdapter(source, { uniqueDataFields: [datafield] });
                
                console.log('datafield:', datafield);
                console.log('dataAdapter :', dataAdapter);
                return dataAdapter;
            }
            // initialize jqxGrid
            $("#grid").jqxGrid(
            {
                width: getWidth('Grid'),
                source: dataAdapter,
                editable: true,
                selectionmode: 'singlecell',
                columns: [
                  {
                      text: 'First Name', columntype: 'template', datafield: 'firstname', width: 80, createeditor: function (row, cellvalue, editor, cellText, width, height) {
                          // construct the editor.
                          var inputElement = $("<input/>").prependTo(editor);
                          inputElement.jqxInput({ source: getEditorDataAdapter('firstname'), displayMember: "firstname", width: width, height: height});
                      },
                      initeditor: function (row, cellvalue, editor, celltext, pressedkey) {
                          // set the editor's current value. The callback is called each time the editor is displayed.
                          var inputField = editor.find('input');
                          if (pressedkey) {
                              inputField.val(pressedkey);
                              inputField.jqxInput('selectLast');
                          }
                          else {
                              inputField.val(cellvalue);
                              inputField.jqxInput('selectAll');
                          }
                      },
                      geteditorvalue: function (row, cellvalue, editor) {
                          // return the editor's value.
                          return editor.find('input').val();
                      }
                  },
                  {
                      text: 'Last Name', datafield: 'lastname', columntype: 'template', width: 80, createeditor: function (row, cellvalue, editor, cellText, width, height) {
                          // construct the editor.
                          var inputElement = $("<input/>").prependTo(editor);
                          inputElement.jqxInput({ source: getEditorDataAdapter('lastname'), displayMember: "lastname", width: width, height: height});
                      },
                      initeditor: function (row, cellvalue, editor, celltext, pressedkey) {
                          // set the editor's current value. The callback is called each time the editor is displayed.
                          var inputField = editor.find('input');
                          if (pressedkey) {
                              inputField.val(pressedkey);
                              inputField.jqxInput('selectLast');
                          }
                          else {
                              inputField.val(cellvalue);
                              inputField.jqxInput('selectAll');
                          }
                      },
                      geteditorvalue: function (row, cellvalue, editor) {
                          // return the editor's value.
                          return editor.find('input').val();
                      }
                  },
                  {
                      text: 'Products', columntype: 'template', datafield: 'productname',
                      createeditor: function (row, cellvalue, editor, cellText, width, height) {
                          // construct the editor. 
                          editor.jqxDropDownList({
                              checkboxes: true, source: getEditorDataAdapter('productname'), displayMember: 'productname', valueMember: 'productname', width: width, height: height, 
                              selectionRenderer: function () {
                                  return "<span style='top:4px; position: relative;'>Please Choose:</span>";
                              }
                          });
                      },
                      initeditor: function (row, cellvalue, editor, celltext, pressedkey) {
                    	  console.log('editor initeditor : ', editor.val());
                          // set the editor's current value. The callback is called each time the editor is displayed.
                          var items = editor.jqxDropDownList('getItems');
                          editor.jqxDropDownList('uncheckAll');
                          var values = cellvalue.split(/,\s*/);
                          for (var j = 0; j < values.length; j++) {
                              for (var i = 0; i < items.length; i++) {
                                  if (items[i].label === values[j]) {
                                      editor.jqxDropDownList('checkIndex', i);
                                  }
                              }
                          }
                      },
                      geteditorvalue: function (row, cellvalue, editor) {
                    	  
                    	  console.log('row: ', row);
                    	  console.log('cellvalue: ', cellvalue);
                    	  console.log('editor: ', editor.val());
                    	  console.log('editor: ', editor.data());
                          // return the editor's value.
                          return editor.val();
                      }
                  },
                 {
                     text: 'Quantity', width: 200, columntype: 'custom', datafield: 'quantity',
                     createeditor: function (row, cellvalue, editor, cellText, width, height) {
                         // construct the editor. 
                         editor.css('margin-top', '2px');
                         editor.jqxSlider({ step: 1, mode: 'fixed', showTicks: false, min: 0, max: 30, width: width, height: height });
                     },
                     initeditor: function (row, cellvalue, editor, celltext, pressedkey) {
                         // set the editor's current value. The callback is called each time the editor is displayed.
                         var value = parseInt(cellvalue);
                         if (isNaN(value)) value = 0;
                         editor.jqxSlider('setValue', value);
                     },
                     geteditorvalue: function (row, cellvalue, editor) {
                         // return the editor's value.
                           return editor.val();
                     }
                 }
                ]
            });
        });
    </script>
</head>
<body class='default'>
    <div id="grid"></div>
</body>
</html>