$(document).ready(function () {
	
	oneqproduct.init();
	
});

$(window).bind("beforeunload", function(){
	return false;
});


$(window).on('load', function() {
	
//    $("#pagerjqxgrid").css({"z-index": "20", "width": "1100px", "top": "374px","height": "40px"})
//    .append("<div style='line-height: 26px; width: 100%; height: 100%; position: relative; top: 6px;'><div type='button' style='padding: 0px; margin-right: 3px; height: 26px; width: 26px; float: right; cursor: pointer;' title='next' id='jqxWidget5ee3ca180809' role='button' class='jqx-rc-all jqx-rc-all-energyblue jqx-button jqx-button-energyblue jqx-widget jqx-widget-energyblue jqx-fill-state-normal jqx-fill-state-normal-energyblue' aria-disabled='false' tabindex='29'><div style='margin-left: 6px; width: 15px; height: 26px;' class='jqx-icon-arrow-right jqx-icon-arrow-right-energyblue'></div></div><div type='button' style='padding: 0px; margin-right: 3px; height: 26px; width: 26px; float: right; cursor: pointer;' title='previous' id='jqxWidget63fab3d4df25' role='button' class='jqx-rc-all jqx-rc-all-energyblue jqx-button jqx-button-energyblue jqx-widget jqx-widget-energyblue jqx-fill-state-normal jqx-fill-state-normal-energyblue' aria-disabled='false' tabindex='28'><div style='margin-left: 6px; width: 15px; height: 26px;' class='jqx-icon-arrow-left jqx-icon-arrow-left-energyblue'></div></div><div style='margin-right: 7px; float: right;'>1-10 of 10</div><div id='gridpagerlistjqxgrid' style='margin-right: 7px; float: right; width: 47px; height: 26px;' class='jqx-dropdownlist jqx-dropdownlist-energyblue jqx-widget jqx-widget-energyblue jqx-dropdownlist-state-normal jqx-dropdownlist-state-normal-energyblue jqx-rc-all jqx-rc-all-energyblue jqx-fill-state-normal jqx-fill-state-normal-energyblue jqx-default jqx-default-energyblue' role='combobox' aria-autocomplete='both' aria-readonly='false' tabindex='27' aria-owns='listBoxgridpagerlistjqxgrid' aria-haspopup='true' hint='true' aria-disabled='false'><div style='background-color: transparent; -webkit-appearance: none; outline: none; width:100%; height: 100%; padding: 0px; margin: 0px; border: 0px; position: relative;'><div id='dropdownlistWrappergridpagerlistjqxgrid' style='overflow: hidden; outline: none; background-color: transparent; border: none; float: left; width:100%; height: 100%; position: relative;'><div id='dropdownlistContentgridpagerlistjqxgrid' unselectable='on' style='outline: none; background-color: transparent; border: none; float: left; position: relative; margin-top: 6px; margin-bottom: 6px; width: auto; height: 26px; left: 0px; top: 0px;' class='jqx-dropdownlist-content jqx-dropdownlist-content-energyblue jqx-disableselect jqx-disableselect-energyblue'>10</div><div id='dropdownlistArrowgridpagerlistjqxgrid' unselectable='on' style='background-color: transparent; border: none; float: right; position: relative; width: 17px; height: 26px;'><div unselectable='on' class='jqx-icon-arrow-down jqx-icon-arrow-down-energyblue jqx-icon jqx-icon-energyblue'></div></div><label class='jqx-input-label jqx-input-label-energyblue jqx-default jqx-default-energyblue'></label><span class='jqx-input-bar jqx-input-bar-energyblue jqx-default jqx-default-energyblue' style='top: 26px;'></span></div></div><input type='hidden' value='10'></div><div style='margin-right: 7px; float: right;'>Show rows:</div><div style='margin-right: 12px; height: 28px; float: right; visibility: inherit;' title='1 - 1'><input style='height:100%; box-sizing: border-box; text-align: right; width: 36px;' type='text' class='jqx-input jqx-input-energyblue jqx-widget-content jqx-widget-content-energyblue jqx-grid-pager-input jqx-grid-pager-input-energyblue jqx-rc-all jqx-rc-all-energyblue' tabindex='26'></div><div style='float: right; margin-right: 7px; visibility: inherit;'>Go to page:</div></div>");
	
//    $('div').remove('#pagerjqxgrid');
//    $('#wrapperjqxgrid').append("<div class='jqx-clear jqx-position-absolute jqx-grid-pager jqx-grid-pager-energyblue jqx-widget-header jqx-widget-header-energyblue' id='pagerjqxgrid' style='z-index: 20; width: 1100px; height: 40px; top: 374px;'><div style='line-height: 26px; width: 100%; height: 100%; position: relative; top: 6px;'><div type='button' style='padding: 0px; margin-right: 3px; height: 26px; width: 26px; float: right; cursor: pointer;' title='next' id='jqxWidget158298e9fa17' role='button' class='jqx-rc-all jqx-rc-all-energyblue jqx-button jqx-button-energyblue jqx-widget jqx-widget-energyblue jqx-fill-state-normal jqx-fill-state-normal-energyblue' aria-disabled='false' tabindex='29'><div style='margin-left: 6px; width: 15px; height: 26px;' class='jqx-icon-arrow-right jqx-icon-arrow-right-energyblue'></div></div><div type='button' style='padding: 0px; margin-right: 3px; height: 26px; width: 26px; float: right; cursor: pointer;' title='previous' id='jqxWidgetf4477b61a423' role='button' class='jqx-rc-all jqx-rc-all-energyblue jqx-button jqx-button-energyblue jqx-widget jqx-widget-energyblue jqx-fill-state-normal jqx-fill-state-normal-energyblue' aria-disabled='false' tabindex='28'><div style='margin-left: 6px; width: 15px; height: 26px;' class='jqx-icon-arrow-left jqx-icon-arrow-left-energyblue'></div></div><div style='margin-right: 7px; float: right;'>1-10 of 10</div><div id='gridpagerlistjqxgrid' style='margin-right: 7px; float: right; width: 47px; height: 26px;' class='jqx-dropdownlist jqx-dropdownlist-energyblue jqx-widget jqx-widget-energyblue jqx-dropdownlist-state-normal jqx-dropdownlist-state-normal-energyblue jqx-rc-all jqx-rc-all-energyblue jqx-fill-state-normal jqx-fill-state-normal-energyblue jqx-default jqx-default-energyblue' role='combobox' aria-autocomplete='both' aria-readonly='false' tabindex='27' aria-owns='listBoxgridpagerlistjqxgrid' aria-haspopup='true' hint='true' aria-disabled='false'><div style='background-color: transparent; -webkit-appearance: none; outline: none; width:100%; height: 100%; padding: 0px; margin: 0px; border: 0px; position: relative;'><div id='dropdownlistWrappergridpagerlistjqxgrid' style='overflow: hidden; outline: none; background-color: transparent; border: none; float: left; width:100%; height: 100%; position: relative;'><div id='dropdownlistContentgridpagerlistjqxgrid' unselectable='on' style='outline: none; background-color: transparent; border: none; float: left; position: relative; margin-top: 6px; margin-bottom: 6px; width: auto; height: 26px; left: 0px; top: 0px;' class='jqx-dropdownlist-content jqx-dropdownlist-content-energyblue jqx-disableselect jqx-disableselect-energyblue'>10</div><div id='dropdownlistArrowgridpagerlistjqxgrid' unselectable='on' style='background-color: transparent; border: none; float: right; position: relative; width: 17px; height: 26px;'><div unselectable='on' class='jqx-icon-arrow-down jqx-icon-arrow-down-energyblue jqx-icon jqx-icon-energyblue'></div></div><label class='jqx-input-label jqx-input-label-energyblue jqx-default jqx-default-energyblue'></label><span class='jqx-input-bar jqx-input-bar-energyblue jqx-default jqx-default-energyblue' style='top: 26px;'></span></div></div><input type='hidden' value='10'></div><div style='margin-right: 7px; float: right;'>Show rows:</div><div style='margin-right: 12px; height: 28px; float: right; visibility: inherit;' title='1 - 1'><input style='height:100%; box-sizing: border-box; text-align: right; width: 36px;' type='text' class='jqx-input jqx-input-energyblue jqx-widget-content jqx-widget-content-energyblue jqx-grid-pager-input jqx-grid-pager-input-energyblue jqx-rc-all jqx-rc-all-energyblue' tabindex='26'></div><div style='float: right; margin-right: 7px; visibility: inherit;'>Go to page:</div></div></div>")
//	
	
});

        
var oneqproduct = {

	gridID : '#jqxgrid',
	data: [],
	addMainRows: [],
	addSubRows: [],
	siList: [],
	guList: [],
	dongList: [],
	dataAdapter: null,
	_page: 1,
	_totalCnt: 0,
	_lastPage: 1,
	_rowsCount: 10,
	
	init : function() {
		var me = this;
		me.eventInit();
		me.gridInit();
		me.onSearch();
		me._page = $("#goPage").val();
		me._rowsCount = $("#viewSelectPage").val();
	},
	
	eventInit: function(){
		var me = this;

		me.siList = oneqUtil.siteList('', '', 'si');

        // update row.
        $("#updaterowbutton").on('click', me.onUpdaterow);
        
        // create new row.
        $("#addrowbutton").on('click', me.onAddrow);

        // delete row.
        $("#deleterowbutton").on('click', me.onDeleterow);
        $("#deleterowbutton").hide();
        
        
        
        $("#viewSelectPage").on('change', me.onSearch);
        
        $("#prePage").on('click', function(){
        	
        	var page;
        	var goPage = $("#goPage").val();
        	var prePage = Number(goPage) - 1;
        	if(prePage >= 1){
        		page = prePage;
        	}else{
        		page = 1;
        	}
        	//me._page = page;
        	me.onSearch(page);
        });
        
        $("#nextPage").on('click', function(){
        	
        	var page;
        	var goPage = $("#goPage").val();
        	var nextPage = Number(goPage) + 1;
        	if( nextPage <= me._lastPage){
        		page = nextPage;
        	}else{
        		page = me._lastPage;
        	}

        	//me._page = page;
        	me.onSearch(page);
        });
        
        $("#goPage").on('keydown', function(e){
        	
        	if(e.keyCode === 13){
        		
	    		var page = $("#goPage").val();
	    		
	    		if(me.goPageChk(page)){
	    			me.onSearch(page);
	    		}
        	}
        });
        
	},
	
	source: {
        datatype: "array",
        localdata: [],
        addrow: function (rowid, rowdata, position, commit) {
        	
        	if(rowdata.state === 'addMainRow'){
        	
        		oneqproduct.addMainRows.push(rowdata);
        		
        	}else if(rowdata.state === 'addSubRow'){
        		
        		oneqproduct.addSubRows.push(rowdata);
        	}

        	commit(true);
        },
        deleterow: function (rowid, commit) {
        	
        	var rowdata = $('#jqxgrid').jqxGrid('getrowdatabyid', rowid);
        	
        	if(rowdata.state === 'addMainRow'){
        		
        		var findIndex = oneqproduct.addMainRows.findIndex(function(val, idx){
        			return val.uid === rowid;
        		});
        		
        		oneqproduct.addMainRows.splice(findIndex, 1);
        		
        	}else if(rowdata.state === 'addSubRow'){
        		
        		var findIndex = oneqproduct.addSubRows.findIndex(function(val, idx){
        			return val.uid === rowid;
        		});
        		oneqproduct.addSubRows.splice(findIndex, 1);
        	}
        	
        	if(oneqproduct.addSubRows.length === 0 && oneqproduct.addMainRows.length === 0){
        		$("#deleterowbutton").hide();
        	}

            commit(true);
        },
        updaterow: function (rowid, newdata, commit) {

            commit(true);
        },
        datafields: [
	      {name: 'siName'       , type: 'string' },
	      {name: 'guName'     	, type: 'string' },
	      {name: 'dongName' 	, type: 'string' },
	      {name: 'storeName'	, type: 'string' },
	      {name: 'storeSeq' 	, type: 'string' },
	      {name: 'subStoreName' , type: 'string' },
	      {name: 'subStoreSeq'  , type: 'string' },
	      {name: 'customer'     , type: 'string' },
	      {name: 'price' 	    , type: 'string' },
	      {name: 'regID'  	    , type: 'string' },
	      {name: 'regDate'      , type: 'string' },
	      {name: 'finID'  	  	, type: 'string' },
	      {name: 'finDate'  	, type: 'string' },
	      {name: 'siCode'       , type: 'string' },
	      {name: 'guCode'     	, type: 'string' },
	      {name: 'dongCode' 	, type: 'string' },
          {name: 'id'       	, type: 'string' },
          {name: 'parentId'     , type: 'string' },
          {name: 'state'   		, type: 'string' },
        ],
    },
	
	gridInit: function() {
		var me = this;

        me.dataAdapter = new $.jqx.dataAdapter(me.source, {
            loadComplete: me.loadComplete,
            loadError: function (xhr, status, error) { },
            formatData: function (data){
            	return null; 
            }
        });
		
		$("#jqxgrid").jqxGrid({
			width: 1100,
			autoheight: true,
		    source: me.dataAdapter,
		    selectionmode: 'checkbox',
		    editable: true,
		    //pageable: true,
		    theme: 'energyblue',
		    columns: [
		      { text: '시', 			datafield: 'siName',       width: '100px',  	cellsalign: 'left',  cellclassname: me.cellclassname, editable: true, cellsrenderer: me.cellsrenderer,
	    	    columntype: 'dropdownlist'
	    	    ,cellbeginedit: oneqproduct.cellbeginedit
    	    	,createeditor: function (row, value, editor) {
                	editor.jqxDropDownList({ source: oneqproduct.siList, displayMember: 'label', valueMember: 'value', dropDownHeight: '120', autoDropDownHeight: true});
                }
    	    	,initeditor: function (row, value, editor) {
                	editor.jqxDropDownList({ source: oneqproduct.siList, displayMember: 'label', valueMember: 'value', dropDownHeight: '120', autoDropDownHeight: true});
                },
                geteditorvalue: function (row, cellvalue, editor) {
                	var value = editor.jqxDropDownList('val');
                	$("#jqxgrid").jqxGrid('setcellvalue', row, "siCode", value);
                	var item = editor.jqxDropDownList('getItemByValue', value);
                	if(item && item.label){
                		return item.label;
                	}
                	return '';
                },
                cellvaluechanging: function (row, datafield, columntype, oldvalue, newvalue) {
                	var data = $('#jqxgrid').jqxGrid('getrowdata', row);
                	me.guList = oneqUtil.siteList(data.siCode, '', 'gu');
                },
                cellendedit: oneqproduct.cellendedit
		      },
		      { text: '구',  		datafield: 'guName',       width: '120px',  	cellsalign: 'left',  cellclassname: me.cellclassname, editable: true, cellsrenderer: me.cellsrenderer,
		    	columntype: 'dropdownlist'
		    	,cellbeginedit: oneqproduct.cellbeginedit
	    		,createeditor: function (row, value, editor) {
                    editor.jqxDropDownList({ source: oneqproduct.guList, displayMember: 'label', valueMember: 'value', dropDownHeight: '120', autoDropDownHeight: true });
                }
			    ,initeditor: function (row, cellvalue, editor) {
			    	console.log('initeditor');
			    	editor.jqxDropDownList({ source: oneqproduct.guList, displayMember: 'label', valueMember: 'value', dropDownHeight: '120', autoDropDownHeight: true });
			    },
                geteditorvalue: function (row, cellvalue, editor) {
                	var value = editor.jqxDropDownList('val');
                	$("#jqxgrid").jqxGrid('setcellvalue', row, "guCode", value);
                	var item = editor.jqxDropDownList('getItemByValue', value);
                	if(item && item.label){
                		return item.label;
                	}
                	return '';
                },
                cellvaluechanging: function (row, datafield, columntype, oldvalue, newvalue) {
                	var data = $('#jqxgrid').jqxGrid('getrowdata', row);
                	me.dongList = oneqUtil.siteList(data.siCode, data.guCode, 'dong');
                },
                cellendedit: oneqproduct.cellendedit
		      },
		      { text: '동',    		datafield: 'dongName', 	   width: '120px',  	cellsalign: 'left',  cellclassname: me.cellclassname, editable: true, cellsrenderer: me.cellsrenderer,
		    	columntype: 'dropdownlist'
		    	,cellbeginedit: oneqproduct.cellbeginedit
	    		,createeditor: function (row, value, editor) {
                    editor.jqxDropDownList({ source: oneqproduct.dongList, displayMember: 'label', valueMember: 'value', dropDownHeight: '150' });
                }
			    ,initeditor: function (row, cellvalue, editor, celltext, pressedChar) {
			    	editor.jqxDropDownList({ source: oneqproduct.dongList, displayMember: 'label', valueMember: 'value', dropDownHeight: '150' });
			    },
		      },
		      { text: '빌딩',   		datafield: 'storeName',	   width: '150px',  cellsalign: 'left',  cellclassname: me.cellclassname, editable: true, cellbeginedit: oneqproduct.cellbeginedit},
		      { text: '빌딩 번호', 		datafield: 'storeSeq', 	   width: '70px',  	cellsalign: 'right', cellclassname: me.cellclassname, editable: false, cellsrenderer: me.cellsrenderer},
		      { text: 'Sub건물',   	datafield: 'subStoreName', width: '150px',  cellsalign: 'left',  cellclassname: me.cellclassname, editable: true, cellbeginedit: oneqproduct.cellbeginedit},
		      { text: 'Sub건물 번호', 	datafield: 'subStoreSeq',  width: '90px',  	cellsalign: 'right', cellclassname: me.cellclassname, editable: false, cellsrenderer: me.cellsrenderer},
		      { text: '고객', 		datafield: 'customer',     width: '70px',  	cellsalign: 'left',  cellclassname: me.cellclassname, editable: false},
		      { text: '월세', 		datafield: 'price', 	   width: '100px',  cellsalign: 'right', cellclassname: me.cellclassname, editable: false, cellsrenderer: me.cellsrenderer, cellsformat: 'c2'},
		      { text: '등록자', 		datafield: 'regID',  	   width: '70px',  	cellsalign: 'left',  cellclassname: me.cellclassname, editable: false},
		      { text: '등록일', 		datafield: 'regDate',  	   width: '90px',  	cellsalign: 'left',  cellclassname: me.cellclassname, editable: false},
		      { text: '수정자', 		datafield: 'finID',  	   width: '70px',  	cellsalign: 'left',  cellclassname: me.cellclassname, editable: false},
		      { text: '수정일', 		datafield: 'finDate',  	   width: '90px',  	cellsalign: 'left',  cellclassname: me.cellclassname, editable: false},
		      { text: '시Code', 		datafield: 'siCode',       width: '0',  	hidden: true},
		      { text: '구Code',  	datafield: 'guCode',       width: '0',  	hidden: true},
		      { text: '동Code',    	datafield: 'dongCode', 	   width: '0',  	hidden: true},
		      { text: 'id',  		datafield: 'id',      	   width: '0',  	hidden: true},
		      { text: 'parentId',   datafield: 'parentId', 	   width: '0',  	hidden: true},
		      { text: 'state',  	datafield: 'state', 	   width: '0',  	hidden: true},
		    ],
		    showtoolbar: false,
		}).on("cellclick", function (event) 
				{
		    // event arguments.
		    var args = event.args;
		    // row's bound index.
		    var rowBoundIndex = args.rowindex;
		    // row's visible index.
		    var rowVisibleIndex = args.visibleindex;
		    // right click.
		    var rightclick = args.rightclick; 
		    // original event.
		    var ev = args.originalEvent;
		    // column index.
		    var columnindex = args.columnindex;
		    // column data field.
		    var dataField = args.datafield;
		    // cell value
		    var value = args.value;
		    
		});     
		
		
		
	},
	
	cellbeginedit: function (row, datafield, columntype, value) {

		var me = this;
		var data = $('#jqxgrid').jqxGrid('getrowdata', row);
 	    if(data.state === 'addMainRow'){
 	    	if(datafield === 'siName'){
 	    		return true;
 	    	}else if(datafield === 'guName'){
 	    		return true;
 	    	}else if(datafield === 'dongName'){
 	    		return true;
 	    	}else if(datafield === 'storeName'){
 	    		return true;
 	    	}
 	    }else if(data.state === 'addSubRow'){
	    	
 	    	if(datafield === 'subStoreName'){
 	    		return true;
 	    	}
	    }else{
	    	return false;
	    }
 	   return false;
    },
    
    cellendedit: function (row, datafield, columntype, oldvalue, newvalue) {
		var me = this;
		var data = $('#jqxgrid').jqxGrid('getrowdata', row);
 	    if(data.state === 'addMainRow'){
 	    	if(datafield === 'siName'){
 	    		$("#jqxgrid").jqxGrid('setcellvalue', row, "guCode", '');
 	    		$("#jqxgrid").jqxGrid('setcellvalue', row, "guName", '');
 	    		$("#jqxgrid").jqxGrid('setcellvalue', row, "dongCode", '');
 	    		$("#jqxgrid").jqxGrid('setcellvalue', row, "dongName", '');
 	    	}else if(datafield === 'guName'){
 	    		$("#jqxgrid").jqxGrid('setcellvalue', row, "dongCode", '');
 	    		$("#jqxgrid").jqxGrid('setcellvalue', row, "dongName", '');
 	    	}
 	    }else if(data.state === 'addSubRow'){
	    	
 	    	if(datafield === 'subStoreName'){
 	    		
 	    	}
	    }else{
	    	
	    }
    },
    

	onSearch: function(page){
		var me = this;
		console.log('onSearch page: ', page);
		console.log('goPage: ', me._page);
		console.log('goPage: ', $("#goPage").val());
		console.log('rowsCount: ', $("#viewSelectPage").val());
		
		var searchPage;
		if(page){
			searchPage = page;	
		}else{
			var goPage = $("#goPage").val();
			if(me.goPageChk(goPage)){
				searchPage = $("#goPage").val();	
			}else{
				return false;
			}
		}
		
		var oneqcustomer = {
				page: searchPage-1, rowsCount: $("#viewSelectPage").val()
		};
		
		console.log('JSON.stringify(oneqcustomer) : ', JSON.stringify(oneqcustomer));
		
		$.ajax({
		    url:'/oneqMain1/onsearch', //request 보낼 서버의 경로
		    type:'post', // 메소드(get, post, put 등)
//		    localdata: [],
		    contentType: "application/json",
		    dataType: "json",
		    async: false, //동기: false, 비동기(기본값): ture
		    data: JSON.stringify(oneqcustomer), //보낼 데이터,
			timeout: 2*60*60*1000, //2 hours,
		    success: function(data) {
		    	oneqproduct.onSuccess(data);
		        //서버로부터 정상적으로 응답이 왔을 때 실행
		    },
		    error: function(err) {
		    	console.log('err : ', err);
		        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
		    }
		});
	},
	
	onSuccess: function(data){
		var me = this;
		me.source.localdata = data.result;
		me.dataAdapter.dataBind();
				
		var page = data.page;
		var totalCount = data.totalCount;
		var lastPage = Math.ceil(Number(data.totalCount)/Number(data.rowsCount));
		var rowsCount = data.rowsCount;
		
		me._page = page;
		me._totalCnt = totalCount;
		me._rowsCount = rowsCount;
		me._lastPage = lastPage;
		
		$("#goPage").val(page);
		$('#totalPage').text(totalCount);
		$("#viewSelectPage").val(data.rowsCount);
		
		if(totalCount === 0){
			$('#nowPage').text(0);
		}else if(totalCount === 1){
			$('#nowPage').text(1);
		}
		
		if(page < lastPage){
			
			var nowPage = (Number(page)-1) * Number(rowsCount) + 1 + '-' + Number(page) * Number(rowsCount)
			
			$('#nowPage').text(nowPage);
			
		}else if(((Number(lastPage)-1) * Number(rowsCount) + 1) === Number(totalCount)){
				
			$('#nowPage').text(totalCount);
			
		}else{
			
			var nowPage = (Number(lastPage)-1) * Number(rowsCount) + 1 + '-' + totalCount;
			
			$('#nowPage').text(nowPage);
			
		}



	},
	
	cellsrenderer: function(row, columnfield, value, defaulthtml, columnproperties){

		if(columnfield === 'subStoreSeq'){
			 if(value === '0'){
				 return '';
			 }
		}else if(columnfield === 'price'){
			 if(value === '0'){
				 return '';
			 }
		}else{
			var data = $('#jqxgrid').jqxGrid('getrowdata', row);
			if(!oneqUtil.isEmpty(data.parentId)){
				return '';
			}	
		}
	},
	
	cellclassname: function (row, column, value, data) {
		
		var rowData = $('#jqxgrid').jqxGrid('getrowdata', row);
		
		if(rowData && rowData.state){
			if(rowData.state === 'addMainRow' || rowData.state === 'addSubRow'){
				return 'cellGray';
			}	
		}
		
		
	},

	onAddrow: function(){
		
		$("#deleterowbutton").show();
		
		var me = oneqproduct;
		var selectedrowindexes = $(me.gridID).jqxGrid('selectedrowindexes');
		
		if(selectedrowindexes.length > 1){
			
			alert('1개 이상 선택할 수 없습니다.');
			
		}else if(selectedrowindexes.length === 1){
			
			var data = $('#jqxgrid').jqxGrid('getrowdata', selectedrowindexes[0]);				
			
			if(data.state === 'addMainRow'){
				alert('저장되지 않은 신규 건물 밑으로 추가 할 수 없습니다.');
				return false;
			}
			
			if(!oneqUtil.isEmpty(data.parentId) || data.state === 'addSubRow'){
				alert('Sub건물 밑으로는 추가할 수 없습니다.');
				return false;
			}	
   		
			if(me.addMainRows.length> 0){
				alert('작업중인 건물정보가 존재 합니다.');
				return false;
			}
			
			var addSubRow = {
         	  siCode : data.siCode,
         	  guCode : data.guCode,
         	  dongCode : data.dongCode,
         	  storeName : data.storeName,
         	  hiddenStoreSeq : data.storeSeq,
         	  state : 'addSubRow'
			}

			$(me.gridID).jqxGrid('addrow', null, addSubRow, selectedrowindexes[0]+1);
			
		}else{
			if(me.addSubRows.length > 0){
				alert('작업중인 Sub건물정보가 존재 합니다.');
				return false;
			}
			$(me.gridID).jqxGrid('addrow', null, {state: 'addMainRow'}, 'first');
		}
	},
	
	onDeleterow: function(){
		
		var me = oneqproduct;
		var selectedrowindexes = $(me.gridID).jqxGrid('selectedrowindexes');
		
		selectedrowindexes.sort();  //오름차순으로 정렬 (정렬하지 않으면 삭제할 때 꼬임)
		
		//저장된 데이터를 filter한다.
		var savedDatas = selectedrowindexes.filter(function(val, idx){
			
        	var data = $(me.gridID).jqxGrid('getrowdata', val);

        	return (data.state !== 'addMainRow' && data.state !== 'addSubRow');
		});
        
	
        if(!oneqUtil.isEmpty(savedDatas)){
        	alert('선택한 데이터에 저장된 데이터가 존재합니다.');
        	return false;
        }
		
		//저장되지 않은 데이터들을 삭제한다.
        for (var i = selectedrowindexes.length-1 ; i >= 0; i--) {

        	var id = $(me.gridID).jqxGrid('getrowid', selectedrowindexes[i]);        	
            $(me.gridID).jqxGrid('deleterow', id);
		}
	},
	
	onUpdaterow: function(){

	},
	
	goPageChk: function(page){
		var me = this;
		if(!oneqUtil.isEmpty(page)){
			
			if(oneqUtil.isNumber(page)){
				
	            if(page > me._lastPage ){
	            	
	            	alert('페이지 범위를 넘어갔습니다.');
	                $('#goPage').focus();
	                return false;
	            }else{
	            	return true;
	            }
			}
		}else{
			alert('값을 입력하세요');
			$('#goPage').focus();
			return false;
		}
	}
	


}