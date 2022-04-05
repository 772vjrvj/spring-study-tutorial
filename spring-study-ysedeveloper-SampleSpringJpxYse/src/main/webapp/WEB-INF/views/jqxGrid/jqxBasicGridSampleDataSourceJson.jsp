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

    <script type="text/javascript">
        $(document).ready(function () {
            var url = "/jqxBasicGridSampleDataSourceJson";
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
                    { name: 'name' },
                    { name: 'type' },
                    { name: 'calories' },
                    { name: 'totalfat' },
                    { name: 'protein' },
                ],
                id: 'id',
                url: url
            };
            var dataAdapter = new $.jqx.dataAdapter(source, {
                downloadComplete: function (data, status, xhr) { },
                loadComplete: function (data) { },
                loadError: function (xhr, status, error) { }
            });
            $("#jqxgrid").jqxGrid(
            {
                width: 670,
                source: dataAdapter,
                columns: [
                  { text: 'Name', datafield: 'name', width: 250 },
                  { text: 'Beverage Type', datafield: 'type', width: 250 },
                  { text: 'Calories', datafield: 'calories', width: 180 },
                  { text: 'Total Fat', datafield: 'totalfat', width: 120 },
                  { text: 'Protein', datafield: 'protein', width: 120 }
              ]
            });
        });
    </script>
</head>
<body class='default'>
    <div id='jqxWidget'>
        <div id="jqxgrid"></div>
    </div>
</body>
</html>