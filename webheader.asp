<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><title></title>
<link rel="stylesheet" type="text/css" href="style/polsat.css">
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<script type="text/javascript" src="/lang/b28n.js"></script>

<style>
td.headmenu	{
	text-align:center;
	//background:url(../graphics/menu_normal.png) no-repeat;
	width:192px;
    width:190px\0;
	/*width:152px;   ///5 menu */
	height:32px;		/*32 px*/
	font-family: Arial;
	font-size:12px;
	color: #F8F8FF;
	font-weight: bold;
	text-decoration:none;
	float:left;
	padding-top: 11px;
    /*padding-top: 7px;*/
}

td.headmenuFF7 {
	text-align:center;
	//background:url(../graphics/menu_normal.png) no-repeat;
	width:190px;
    width:190px\0;
	/*width:152px;   ///5 menu */
	height:32px;		/*32 px*/
	font-family: Arial;
	font-size:12px;
	color: #F8F8FF;
	font-weight: bold;
	text-decoration:none;
	float:left;
	padding-top: 11px;
    /*padding-top: 7px;*/
}

td.headmenuIE10	{
	text-align:center;
	//background:url(../graphics/menu_normal.png) no-repeat;
	width:192px;
    width:192px\0;
	/*width:152px;   ///5 menu */
	height:32px;		/*32 px*/
	font-family: Arial;
	font-size:12px;
	color: #F8F8FF;
	font-weight: bold;
	text-decoration:none;
	float:left;
	padding-top: 11px;
    /*padding-top: 7px;*/
}

td.headmenu:hover1 {
	background:url(../graphics/menu_hover.png) no-repeat;
}	

td.headmenu:active1 {
	background:url(../graphics/menu_pressed.png) no-repeat;
}

td.ltecm {
	background-position: 60;
	background:url(../graphics/header_lte_bg.png) no-repeat;
 	width:360px;
}

#ltecm {
	font-family: Arial;
	text-align:left;
	font-size:13px;
	white-space:nowrap;
}

td.productmode {
	background:url(../graphics/productmodel.png) no-repeat;
	width:120px;
}

#productmode {
	font-family: Arial;
	text-align:left;
	font-size:12px;
}
table.headerheight {
	position:relative;right:-6px;bottom:10px;
}
td.id_smspicen {
	position:absolute;left:320px;top:10px;
}
td.id_smspicpolish {
	position:absolute;left:300px;top:10px;
}
</style>

<script language="JavaScript" type="text/javascript">
Butterlate.setTextDomain("admin");

var a = new Array();
a = ["Connected","Unknown","USIM Ready","ATL2_AT_2.2.44","869983020642564","260121001396453","Unknown","7 (2600 MHz)","Cyfrowy Polsat"," -9 dB"," -97 dBm","Middle Signal","115","Unknown","10.160.241.134","Unknown","10.160.241.133","212.2.127.253","212.2.96.53","Cyfrowy Polsat","LTE"," 13 dB","64","5"," -81 dBm","FDD","Closed loop MIMO","Unknown","2850","002C860F","115","7944","66","420","487","Unknown","988421010110934635F6","1.22.5_NF","Unknown","Unknown","Unknown","Unknown","Unknown","Unknown",];
var homePage = 'idu/home.asp';
var curriduver = "CPE2_PT12_PL_V1.4.7.bin";
curriduver=curriduver.replace(".bin","") ;
var customer = 'polsat';
var getOperatorName = 'Cyfrowy Polsat';
var processtimes;
var oldprocesstimes = 0;
var remote;
var isMenuLock = 0;
var defaultMenuBg='url( ../graphics/menu_normal.png)';
var down="";
var apcl = "Connected" ;
var havesms = 0;
var fullsms = 0;
var arr = new Array();
var LTEConnectionType = '0';
var ODUlteconnectAgain = '';
var url = "http://"+"192.168.0.1"+"/"+homePage;
var OldConncectionStatus;
	for (i=0;i<1;i++)
	{
	     arr[i] = new Image();
	}
	 if(customer == "polsat")
	 arr[0].src = "pic/polsatlogo.png";
	 if(customer == "plus")
	 arr[0].src = "pic/pluslogo.png";
	 

function topflush() {
    //top.location.href = url;
    window.location.reload(); 
}
function pin_pinnote() {
		this.usimstatus ="Unknown";
		this.pinfirst ="Unknown";
		this.pinstatus ="Unknown";
		this.pintime ="Unknown";
		this.pukstatus ="Unknown";
		this.puktime ="Unknown";
	}
		
var pin_note = new pin_pinnote();
	pin_note.usimstatus="USIM Ready";pin_note.pinfirst="0";pin_note.pinstatus="0";pin_note.pintime="3";pin_note.pukstatus="";pin_note.puktime="10";pin_note.pinclck2="0";
		
function go(zz) {
	if(!isMenuLock)
	top.webbody.location=zz;
}

function resetall()
{
	document.getElementById("menu1").style.background=defaultMenuBg;
	document.getElementById("menu2").style.background=defaultMenuBg;
	document.getElementById("menu3").style.background=defaultMenuBg;
	document.getElementById("menu4").style.background=defaultMenuBg;
	document.getElementById("menu5").style.background=defaultMenuBg;
}

function atelOver1(obj)
{
	obj.style.background='url( ../graphics/menu_hover.png)';
}
function atelMoveOut1(obj)
{
	if(down == obj.id)
		obj.style.background='url( ../graphics/menu_pressed.png)';
	else
		obj.style.background=defaultMenuBg;
}
function atelDown1(obj)
{
	down=obj.id;
	resetall();
	obj.style.background='url( ../graphics/menu_pressed.png)';
}

function hidemenu(num)
{
	if(num == 1)
	{
		document.getElementById("menu1").style.display="none";
		document.getElementById("menu1_2").style.display="block";
	}	
	else
	{
		document.getElementById("menu1").style.display="block";
		document.getElementById("menu1_2").style.display="none";
	}	

	if(num == 2)
	{
		document.getElementById("menu2").style.display="none";
		document.getElementById("menu2_2").style.display="block";
	}	
	else
	{
		document.getElementById("menu2").style.display="block";
		document.getElementById("menu2_2").style.display="none";
	}	
	
	if(num == 3)
	{
		document.getElementById("menu3").style.display="none";
		document.getElementById("menu3_2").style.display="block";
	}	
	else
	{
		document.getElementById("menu3").style.display="block";
		document.getElementById("menu3_2").style.display="none";
	}	
	if(num == 4)
	{
		document.getElementById("menu4").style.display="none";
		document.getElementById("menu4_2").style.display="block";
	}	
	else
	{
		document.getElementById("menu4").style.display="block";
		document.getElementById("menu4_2").style.display="none";
	}				
}	

var connectionStatus;
var singallevel;
var simcardstatus;
var singalrsrp;

function showsimcardStatus()
{
	if((simcardstatus == "USIM Ready") && connectionStatus != "DisApclConnect")
	{
		document.getElementById('imgsimstatus').src = "../graphics/validsimcard.png";
	}
	else if((simcardstatus == "Wait for PIN1") && connectionStatus != "DisApclConnect")
	{
		document.getElementById('imgsimstatus').src = "../graphics/validsimcard.png";
	}
	else
	{
		document.getElementById('imgsimstatus').src = "../graphics/invalidsimcard.png";
	}
}

function showConnectionStatus()
{
	if(connectionStatus == "Connected")
	{
		document.getElementById('imgconnectionstatus').src = "../graphics/connect.png";
	}
	else
	{
		document.getElementById('imgconnectionstatus').src = "../graphics/disconnect.png";
	}
}

function showheadertitle()
{
	document.getElementById("networktype").title=_("network type");
	
	if(singalrsrp == "-141")
		singalrsrp = "---";

	if(connectionStatus != "DisApclConnect")
	{
		if(singalrsrp!="" || singalrsrp!=" " ||singalrsrp!="Unknown")
		{
		document.getElementById("imgsignallevel").title=_("signal strength RSRP")+": "+ singalrsrp;
		}
		else
		{  
			document.getElementById("imgsignallevel").title=_("signal strength RSRP")+": ---  dBm";
		}
	}else
	{
		document.getElementById("imgsignallevel").title=_("signal strength RSRP")+": ---  dBm";
		
	}
	
	if(connectionStatus == "Connected")
	{
		document.getElementById("imgconnectionstatus").title= _("Connected status");
	}else
	{
		document.getElementById("imgconnectionstatus").title= _("Disconnected status");
	}
	
	if(simcardstatus == "USIM Ready" && connectionStatus != "DisApclConnect")
	{
		document.getElementById("imgsimstatus").title=_("valid sim card");
	}
	else if(simcardstatus == "Wait for PIN1" && connectionStatus != "DisApclConnect")
	{
		if(pin_note.puktime == "0")
			document.getElementById("imgsimstatus").title=_("PUK sim lock");
		else
			document.getElementById("imgsimstatus").title=_("PIN sim lock");
	}
	else
	{
		if( apcl == "Connected" && a[19] == "NO USIM" || a[19] =="Not Available")
			document.getElementById("imgsimstatus").title= _("invalid sim card");
		else
			document.getElementById("imgsimstatus").title=_("disconnected invalid sim card");
	}
}

function showsmsstatus()
{
	if(fullsms == "1" || fullsms == 1)
	{
		document.getElementById("smsstatus").style.display = "block";
		document.getElementById("smsstatus").src = "pic/fullsms.png";
		document.getElementById("smsstatus").title=_("message is full");
	}
	else
	{
		if(havesms == "0" ||havesms == 0 )
		{
			document.getElementById("smsstatus").style.display = "none";
			//document.getElementById("smsstatus").src = "pic/linkicok.png";
		}
		else //default
		{
			document.getElementById("smsstatus").style.display = "block";
			document.getElementById("smsstatus").src = "pic/havesms.png";
			document.getElementById("smsstatus").title=_("message is unread");
		}
	}
}
function showLteSingalLevel()
{
	if(connectionStatus != "DisApclConnect"){
		if(singallevel == "Bad Signal") 
		{
			document.getElementById('imgsignallevel').src = "../graphics/lte_signal1.png";
		}else if(singallevel == "Low Signal")
		{
			document.getElementById('imgsignallevel').src = "../graphics/lte_signal2.png";
		}else if(singallevel == "Middle Signal")
		{
			document.getElementById('imgsignallevel').src = "../graphics/lte_signal3.png";
		}else if(singallevel == "Good Signal")
		{
			document.getElementById('imgsignallevel').src = "../graphics/lte_signal4.png";
		}else if(singallevel == "Excellent Signal")
		{
			document.getElementById('imgsignallevel').src = "../graphics/lte_signal5.png";
		}else
		{
			document.getElementById('imgsignallevel').src = "../graphics/lte_signal0.png";
		}	
	}else
	{
		document.getElementById('imgsignallevel').src = "../graphics/lte_signal0.png";
	}
}
var remotetag = 0;
function singalUpdateHTML(str)
{
	var all_str = new Array();
	all_str = str.split("\n");
	connectionStatus = all_str[0];
	singallevel = all_str[1];
	simcardstatus = all_str[2];
    singalrsrp  = all_str[4];
	remote = all_str[6];
 	iduver = all_str[7];
	oduver = all_str[8];
        dtbver = all_str[9];
	havesms = all_str[11];
	fullsms = all_str[12];
	getOperatorName=all_str[14];
	if(processtimes+60 < oldprocesstimes)
	{
		top.location.href = url;
	}
	oldprocesstimes = processtimes;
	
	iduver=iduver.replace(".bin","") ;
	if((oduver == "Disable"))
		oduver = "";
	 if(iduver == "Unknown")
	 {
		iduver = "";	 
	 }
	  if(oduver == "Unknown")
	 {
		oduver = "";	 
	 }
	
        if(connectionStatus == "Connected" && singallevel == "No Signal")
        {
               singallevel = "Low Signal";    
            
        }

          
    if(iduver == "" && oduver == "")
	{
		iduver = curriduver;
		oduver = a[3];
	}

        if((oduver == "Disable"))
            oduver = "";
		if((dtbver == "Disable"))
            dtbver = "";
			

	if(remote == 9)
	{
		 
		var r=confirm(document.getElementById("remotenewupdate").value)
  		if (r==true)
    	{
   			javascript:go('/goform/remoteUpgradeStart');
    	}
  		
		remotetag = 0;
	}
	
	if(remote == 100 && remotetag == 0)
	{
		alert(document.getElementById("updatealert100").value +" "+iduver + "  " + oduver + "\n"+document.getElementById("updatealert102").value);
		remotetag = 1;
	}
		
///wpeng remove it for Polsat II , otherwise refresh the top web every 5s	
/*	
	
	if((LTEConnectionType != "1")   && (connectionStatus ==  "Disconnected"))
	{
		connectionStatus = "Connecting";
	}
	if((LTEConnectionType == "1")  && (ODUlteconnectAgain ==  "connect") && connectionStatus == "Disconnected" )
	{
		connectionStatus = "Connecting";
	}
	if((connectionStatus == "DisApclConnect" &&  OldConncectionStatus != "DisApclConnect")  || (OldConncectionStatus == "DisApclConnect" && connectionStatus != "DisApclConnect") )
	{
		top.location.href = url;
	}
	OldConncectionStatus = connectionStatus;
*/	
	if(connectionStatus !=OldConncectionStatus)
	{
		OldConncectionStatus = connectionStatus;
		top.location.href = url;
	}
	
	showConnectionStatus();
	showLteSingalLevel();
	showsimcardStatus();
	showheadertitle();
	showsmsstatus();
	showoperatorname();
}

function singalContents() 
{
	if (http_request.readyState == 4) 
	{
		if (http_request.status == 200) 
		{
			singalUpdateHTML(http_request.responseText);
		} 
	}
}

var http_request = false;
function makeRequest(url, content) {
	http_request = false;
	if (window.XMLHttpRequest) { // Mozilla, Safari,...
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) {
			http_request.overrideMimeType('text/xml');
		}
	} else if (window.ActiveXObject) { // IE
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
			http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {}
		}
	}
	if (!http_request) {
		alert('Giving up :( Cannot create an XMLHTTP instance');
		return false;
	}

	if (content == "singal")
		http_request.onreadystatechange = singalContents;
	
	http_request.open('POST', url, true);
	http_request.send(content);
}

function getLteSingalDate()
{
	makeRequest("/goform/showlteStatus", "singal");
}
function autoRefresh()
{
	setTimeout("autoRefresh();",5000);
	getLteSingalDate();
}

function forFF7menu()
{
	var agent = navigator.userAgent.toLowerCase() ;
	var regStr_ff = /firefox\/[\d.]+/gi;
	
	 if(agent.match(regStr_ff) == "firefox/7.0.1" )
	 {
		document.getElementById("menu1").className = "headmenuFF7";
		document.getElementById("menu1_2").className = "headmenuFF7";
		document.getElementById("menu2").className = "headmenuFF7";
		document.getElementById("menu2_2").className = "headmenuFF7";
		document.getElementById("menu3").className = "headmenuFF7";
		document.getElementById("menu3_2").className = "headmenuFF7";
		document.getElementById("menu4").className = "headmenuFF7";
		document.getElementById("menu4_2").className = "headmenuFF7";
	}
}	

function forIE10menu()
{
	 var getiever = navigator.appVersion.match(/10.0/i);
	 var getie = navigator.appName.match("Microsoft Internet Explorer");
		
		if(getiever == "10.0" && getie == "Microsoft Internet Explorer")
		{
			document.getElementById("menu1").className = "headmenuIE10";
			document.getElementById("menu1_2").className = "headmenuIE10";
			document.getElementById("menu2").className = "headmenuIE10";
			document.getElementById("menu2_2").className = "headmenuIE10";
			document.getElementById("menu3").className = "headmenuIE10";
			document.getElementById("menu3_2").className = "headmenuIE10";
			document.getElementById("menu4").className = "headmenuIE10";
			document.getElementById("menu4_2").className = "headmenuIE10";
		}
		else
		{
			document.getElementById("menu1").className = "headmenu";
			document.getElementById("menu1_2").className = "headmenu";
			document.getElementById("menu2").className = "headmenu";
			document.getElementById("menu2_2").className = "headmenu";
			document.getElementById("menu3").className = "headmenu";
			document.getElementById("menu3_2").className = "headmenu";
			document.getElementById("menu4").className = "headmenu";
			document.getElementById("menu4_2").className = "headmenu";
		}
}	

function initValue() {
	var lang_element = document.getElementById("langSelection");
	var lang_en = '1';
	var lang_polish = '1';
	
	//hidemenu(0);
	initTranslation();
	
	getsimcard();
	
	lteinit();
	getcustomer();
	autoRefresh();
	forIE10menu();
	forFF7menu();
	
	//lang_element.options.length = 0;
		lang_element.options[lang_element.length] = new Option('English', 'en');
		lang_element.options[lang_element.length] = new Option('Polski', 'polish');

	if (document.cookie.length > 0) {
		var s = document.cookie.indexOf("language=");
		var e = document.cookie.indexOf(";", s);
		var lang = "en";
		var i;

		if (s != -1) {
			if (e == -1)
				lang = document.cookie.substring(s+9);
			else
				lang = document.cookie.substring(s+9, e);
		}
		for (i=0; i<lang_element.options.length; i++) {
			if (lang == lang_element.options[i].value) {
				lang_element.options.selectedIndex = i;
				break;
			}
		}
	}
		var getlanguage = document.getElementById("help").innerHTML;
        if(getlanguage == "Pomoc")
        {
			document.getElementById("help").style.position="relative";
	        document.getElementById("help").style.right="0px";
	        document.getElementById("langSelection").style.width = "105px";
	        document.getElementById("id_smspic").className = "id_smspicpolish";
    	}
    	else
    	{
    		document.getElementById("help").style.position="relative";
	        document.getElementById("help").style.right="0px";
    		document.getElementById("langSelection").style.width = "86px";
    		document.getElementById("id_smspic").className = "id_smspicen";
    	}	
        		
        setTimeout("topflush();",305000);
}

function initTranslation()
{
	var e = document.getElementById("menu1");
	e.innerHTML = _("header menu1");
	e = document.getElementById("menu2");
	e.innerHTML = _("header menu2");
	e = document.getElementById("menu3");
	e.innerHTML = _("header menu3");
	/*e = document.getElementById("menu4");
	e.innerHTML = _("header menu4");*/
	e = document.getElementById("menu1_2");
	e.innerHTML = _("header menu1");
	e = document.getElementById("menu2_2");
	e.innerHTML = _("header menu2");
	e = document.getElementById("menu3_2");
	e.innerHTML = _("header menu3");
	/*e = document.getElementById("menu4_2");
	e.innerHTML = _("header menu4");*/
	e = document.getElementById("remotenewupdate");
	e.value = _("header remotenewupdate");
	e = document.getElementById("updatealert100");
	e.value = _("update alert100");
	e = document.getElementById("updatealert102");
	e.value = _("update alert102");
	/*e = document.getElementById("id_customer");
	e.innerHTML = _("I connected O Limitedser");
	e = document.getElementById("id_customer");
	e.innerHTML = _("I disconnected O Limitedser");
	*/
	//e = document.getElementById("menu5");
	//e.innerHTML = _("header menu5");
	//e = document.getElementById("advanced");
	//e.innerHTML = _("header advanced");
	e = document.getElementById("help");
	e.innerHTML = _("Help");
	e = document.getElementById("logout");
	e.innerHTML = _("Logout");
/*	e = document.getElementById("networktype");
	e.innerHTML = _("network type");
	e = document.getElementById("imgsignallevel");
	e.innerHTML = _("signal strength");
	e = document.getElementById("imgconnectionstatus");
	e.innerHTML = _("Connected status");
	e = document.getElementById("imgconnectionstatus");
	e.innerHTML = _("Disconnected status");
	e = document.getElementById("imgsimstatus");
	e.innerHTML = _("valid sim card");
	e = document.getElementById("imgsimstatus");
	e.innerHTML = _("invalid sim card");
	e = document.getElementById("imgsimstatus");
	e.innerHTML = _("disconnected invalid sim card");*/
	e = document.getElementById("logouttitle");
	e.value = _("logout title");
}	

function setLanguage()
{
	document.cookie="language="+document.Lang.langSelection.value+"; path=/";
	document.Lang.submit();
//	top.location.reload();
	return true;
}
var plmn;
var plmnCustomer;
function showoperatorname()
{
	///operator name
	document.getElementById("networktype").innerHTML = "";	
	document.getElementById("id_customer").innerHTML = "";
	if ((connectionStatus == "Disconnected") || (connectionStatus == "Connecting") )	///Lack of Service
	{
		plmn = a[5];
		
		if(plmn.length == 15)
		{
			plmnCustomer = plmn.substr(0, 5);
			
			 if(plmnCustomer.indexOf("26012") != -1)
			{
				if(getOperatorName.length > 3 && getOperatorName != "" && getOperatorName != "Unknown")
				{		
					document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;"+getOperatorName;
				}	
				else
				{
					document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;Cyfrowy Polsat";
				}
			}
			else if(plmnCustomer.indexOf("26001")!= -1)
			{
				if(getOperatorName.length > 3 && getOperatorName != "" && getOperatorName != "Unknown")
				{		
					document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;"+getOperatorName;
				}	
				else
				{
					document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plus";
				}
			}
			else if(plmnCustomer.indexOf("26002") != -1)
			{
				document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;T-Mobile";
			}
			else if(plmnCustomer.indexOf("26003") != -1)
			{
				document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;Orange";
			}
			else if(plmnCustomer.indexOf("26006") != -1)
			{
				document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Play";
			}
			else if(plmnCustomer.indexOf("26017") != -1)
			{
				document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;Aero2";
			}
			else if(plmnCustomer.indexOf("26016") != -1)
			{
				document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;Mobyland";
			}
			else if(plmnCustomer.indexOf("26015") != -1)
			{
				document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;Centernet";
			}
			else if(plmnCustomer.indexOf("26010") != -1)
			{
				document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;Sferia";
			}else
			{
				document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;"+plmnCustomer;
			}
	
		
		}
		else
		{
			document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;"+_("I disconnected O Limitedser");
		}
	}
	else if (connectionStatus == "Connected")
	{
		document.getElementById("networktype").innerHTML = "LTE";
		if(getOperatorName == "Plus")
			document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plus";
		else if(getOperatorName.length > 3 && getOperatorName != "")
			document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;"+getOperatorName;				
	
	}
	else if ((connectionStatus != "Connected")  && (getOperatorName.length > 3 && getOperatorName != "unknown"))/// LTE only on demand
	{
		document.getElementById("networktype").innerHTML = "LTE";
		if(getOperatorName == "Plus")
			document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plus";
		else if(getOperatorName.length > 3 && getOperatorName != "")
			document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;"+getOperatorName;	
		else
			document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;"+_("I disconnected O Limitedser");
	}		
	else     ///Limited Service
	{
		document.getElementById("id_customer").innerHTML = "&nbsp;&nbsp;"+_("I connected O Limitedser");
	}	
}	

function lteinit()
{

	var a = new Array();
	all_str = ["Connected","Middle Signal","USIM Ready"," -81 dBm"," -97 dBm"];
	connectionStatus = all_str[0];
	singallevel = all_str[1];
	simcardstatus = all_str[2];
        singalrsrp  = all_str[4];
	showConnectionStatus();
	showLteSingalLevel();
	showsimcardStatus();
	showheadertitle();
	showoperatorname();
	OldConncectionStatus = connectionStatus;
}

var lte_apn_name = "NULL";

function getcustomer()
{
	var operator_name="";
	var apcl = "Connected" ;

	if(apcl != "Connected")
		customer = "default";

	///logo
	if(customer == "polsat")
	{
		document.getElementById("id_logo").src = "pic/polsatlogo.png";
	}
	else if(customer == "plus")
	{
		document.getElementById("id_logo").src = "pic/pluslogo.png";
	}
	else //default
	{
		document.getElementById("id_logo").style.display = "none";	
	}
	
}

function getsimcard()
{
	if(customer == "polsat"){
		//document.getElementById("headerhelp").href = "http://www.cyfrowypolsat.pl/CMS/media/img/v4/imgRD/obrazki/rozne/internet-domowy-instrukcja-obslugi.pdf";
		document.getElementById("headerhelp").href = "http://www.cyfrowypolsat.pl/uploaded-files/reg-repo/internet-domowy-ii-instrukcja-obslugi.pdf";
		document.getElementById("verticalline").style.display = "block";
	}
	else if(customer == "plus"){
		//document.getElementById("headerhelp").href = "http://www.plus.pl/pobierz/odu-idu-pomoc.pdf";
		document.getElementById("headerhelp").href = "http://www.cyfrowypolsat.pl/uploaded-files/reg-repo/internet-domowy-ii-instrukcja-obslugi.pdf";
		document.getElementById("verticalline").style.display = "block";
	}
	else{
		document.getElementById("headerhelp").style.display = "none";
		document.getElementById("verticalline").style.display = "none";
	}
}

function clickmessagemenu()
{
	//javascript:go('./bodylte.asp');
	//document.getElementById("menu1").style.background='url( graphics/menu_normal.png)';
	//document.getElementById("menu4").style.background='url( graphics/menu_pressed.png)';
	document.getElementById("menu1").style.background='url( graphics/menu_normal.png)';
	hidemenu(4);
	javascript:go('./bodylte.asp');
}

function clickhomemenu()
{
	hidemenu(1);
	javascript:go('./bodyset_menubody.asp');
	document.getElementById("menu4").style.background='url( graphics/menu_normal.png)';
}
function clickinformationmenu()
{
	document.getElementById("menu4").style.background='url( graphics/menu_normal.png)';
	document.getElementById("menu1").style.background='url( graphics/menu_normal.png)';
	hidemenu(2);
	javascript:go('./bodyinformation.asp');
}
function clicksettingmenu()
{
	document.getElementById("menu4").style.background='url( graphics/menu_normal.png)';
	document.getElementById("menu1").style.background='url( graphics/menu_normal.png)';
	hidemenu(3);
	javascript:go('./bodysetting.asp');
}
function clickltemenu()
{
	document.getElementById("menu1").style.background='url( graphics/menu_normal.png)';
	hidemenu(4);
	javascript:go('./bodylte.asp');
}

function logoutreturnvalue()
{
	alert(document.getElementById("logouttitle").value);
	javascript:go('/goform/douserlogout');
}	

function diffcustomerlinkheader()
{
	var customer = 'polsat';
	
	if(customer == "polsat")
	{	
		window.open('http://www.cyfrowypolsat.pl', '_blank');
	}
		else if(customer == "plus")
	{
		window.open('http://www.plus.pl', '_blank');
	}
	else
	{
		
	}		
}

</script>
</head>

<body onLoad="initValue()">
<table  width="780" style="position:absolute;top:-3px;left:-1px;" id="polsatheader" align="center">
	<tr>
		<td width="7px">&nbsp;</td>
		<td width="150px" height="45px"><img id="id_logo" onclick="javascript:diffcustomerlinkheader();" /></td>
		<td id="id_smspic" width="100px" height="45px" style="position:relative;top:1px;left:140px;"><img style="cursor:pointer"  id="smsstatus" onclick="javascript:clickmessagemenu()" ></td>
		<td width="400px">&nbsp;</td>
		<td class="ltecm">
			<div id="ltecm" style="cursor:default">&nbsp;&nbsp;&nbsp;<span style="font-size:12px;display:inline-block;width:78px;" id="id_customer" title="Operator"></span> &nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:12px;display:inline-block;width:20px;" id="networktype">LTE</span>&nbsp;&nbsp;
			<img style="vertical-align:middle;" id="imgsignallevel" src="../graphics/lte_signal0.png"/>&nbsp;&nbsp;<img style="vertical-align:middle;" id="imgconnectionstatus" src="../graphics/disconnect.png" />
			&nbsp;<img style="vertical-align:middle;" id="imgsimstatus" src="../graphics/invalidsimcard.png" /></div>
		</td>

		<td class="productmode" style="display:none;">
			<div id="productmode">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ATEL ALR-PT3</div>
		</td>	
			
		<td>
			<table style="position:relative;right:-7px;top:-9px" class="headerheight"><tr><td>
				<form method="post" name="Lang" action="/goform/setSysLang">
				<select name="langSelection" id="langSelection" onChange="return setLanguage()">

				</select>
				</form>
				</td></tr>
			</table>
		</td>
	
	</tr>
</table>
<table style="position:absolute;right:-1px;top:27px;">
	<tr>
		<td><a id="headerhelp" style="text-decoration:none;color:#000000;font-weight: bold;font-family: Arial;" target="_blank"><span id="help"></span></a></td>
		<td id="verticalline" style="color:Grey;">&nbsp;|&nbsp;</td>
		<td>
<!--&nbsp;&nbsp;&nbsp;<a style="position:relative;right:13px;text-decoration:none;color:#000000;font-weight: bold;font-family: Arial;" href="javascript:go('/goform/douserlogout');"><span id="logout"></span></a>-->
&nbsp;&nbsp;&nbsp;<a style="position:relative;right:13px;text-decoration:none;color:#000000;font-weight: bold;font-family: Arial;" onClick="logoutreturnvalue()"><span style="cursor:pointer;" id="logout"></span></a>
		</td>
<input type="hidden" id="remotenewupdate" value="0"/>
<input type="hidden" id="updatealert100" value="0"/>   
<input type="hidden" id="updatealert102" value="0"/>  
	</tr>
</table>
<!-- ----------------- MENU ----------------- -->
<table style="position:absolute;left:12px;top:55px;" align="center" border="0" cellpadding="0" cellspacing="0">
	<tr style="cursor:pointer;">
		<td id="menu1" class="headmenu" style="background:url( ../graphics/menu_pressed.png);" onmousedown="clickhomemenu()">Home</td>
		<td id="menu1_2" class="headmenu" style="background:url( ../graphics/menu_pressed.png);display:none;">Home</td>
		<td id="menu2" class="headmenu" style="background:url( ../graphics/menu_normal.png);" onmousedown="clickinformationmenu()">Status</td>
		<td id="menu2_2" class="headmenu" style="background:url( ../graphics/menu_pressed.png);display:none;" >Status</td>
		<td id="menu3" class="headmenu" style="background:url( ../graphics/menu_normal.png);" onmousedown="clicksettingmenu()">Settings</td>
		<td id="menu3_2" class="headmenu" style="background:url( ../graphics/menu_pressed.png);display:none;">Settings</td>
		<td id="menu4" class="headmenu" style="background:url( ../graphics/menu_normal.png);" onmousedown="clickltemenu()">SMS</td>
		<td id="menu4_2" class="headmenu" style="background:url( ../graphics/menu_pressed.png);display:none;">SMS</td>
	</tr>	
	<tr><input type="hidden" id="logouttitle" value="0"/></tr>
</table>


</body>
</html>
