// "Butterfat internationalization" (b28n.js)
//  Released under the GNU GPL  by bmuller@buttterfat.net- http://www.gnu.org/licenses/gpl.txt
//  Modified by winfred_lu@ralinktech.com.tw for our need
/****************************************************************************************************

This script provides i18n support via a basic replica of GNU's gettext api.  To use it, pick a domain
("messages" is the traditional domain).  For each language, create a file named <domain>_<lang>.xml,
where lang is one of the two letter abbreviations found on http://www.loc.gov/standards/iso639-2/langcodes.html
(for instance, messages_en.xml is a good start).  The script will first look for a cookie with the name
"language", and if it is not set then it uses the browser langague.  It should be noted that this "browser
langague" is just the "navigator.language" or "navigator.browserLanguage" value, and NOT the "Accept-Language"
header sent by the browser.  This is something that should be set by the server, such as in a cookie.  The 
preferable method is for the server to take the "Accept-Language" header value and store it in a permanent cookie,
allowing this script to henceforth know which po file to use.  The text within the msgid and msgstr should, obviously
be html encoded.  Your javascript does not have to be html encoded.  For example, the call _("test\"test") with 
a message of "<message msgid="test&quot;test" msgstr="test&quot;test&quot;test" />" would return "test\"test\"test".

The po file should have the following syntax:

<po creationdate ="2005-10-12 12:08-0500" translator="FULL NAME EMAIL@ADDRESS">
  <message msgid="this is english" msgstr="this is spanish" />
</po>

The attributes for <po> are optional.  The html file needs only to include the b28n.js file
and then set the text domain via Butterlate.setTextDomain(<domain>,<location>).  <domain> is the domain
you used to create the above xml file, and <location> is the HTTP accessable directory of that xml
file (so, "http://<FQDN>/messages_en.xml").  Whenever you are showing text, just call the function
"_(<text>)" or "Butterlate.gettext(<text>)" and Butterlate will handle the rest.  The following
example will produce a page that says "this is spanish" (assuming you set up the setTextDomain correctly
and make the above xml available).

<html>
  <head>
    <title>I18N Test</title>
    <script type="text/javascript" src="b28n.js"></script>
    <script type="text/javascript">
      Butterlate.setTextDomain("messages","http://butterfat.net/~bmuller/i18n");
      function startUp() {
        var test = document.getElementById("test");
        test.innerHTML = _("this is english");
      }
    </script>
  </head>
  <body onload="startUp();">
    <div id="test">
  </body>
</html>

There is also the ability to have variables in your translations.  For instance, if you have a message
that says "hello <username>, how are you?" and the translation ends up being "blah blah <username> blah"
you need a way of handling the variable.  In the xml file, just use "%s" to denote a variable's placement-
for instance: " <message msgid="hello %s, how are you?" msgstr="blah blah %s blah" /> ".  Then in your 
javascript call either the function "__(<msgid>,<array of translations>)" or "vgettext(<msgid>,<array of translations>)".
The array of translations is just an array of strings in the same order as your %s's.  If there are more array
strings than variables, the extras are ignored.  If there are more %s's than array strings, the last string
in the array is simply repeated as many times as necessary.  If the array is empty, then the msgstr from the
xml file will be returned as-is.

*NOTE*: If the browser is set to a language for which you do not have an xml file, the original 
text will just be displayed and there will be no error messages.  The same goes for any text you
did not define in the xml file if it does exist.

*****************************************************************************************************/
var Butterlate = new Butterlation();
window._ = function(key) { return Butterlate.gettext(key); };
window.__ = function(key,replacements) { return Butterlate.vgettext(key,replacements); };

function Butterlation() {
  this.dict = new ButterDictionary();
  this.getLang = function() {
    var one, two, end;
    if((one=document.cookie.indexOf("language"))==-1) {
      //return ((navigator.language) ? navigator.language : navigator.browserLanguage).substring(0,2);   
      return "en";
    }
    end = (document.cookie.indexOf(';',one)!=-1) ? document.cookie.indexOf(';',one) : document.cookie.length;
    return unescape(document.cookie.substring(one+9,end));
  };
  this.lang = this.getLang();
  this.setTextDomain = function(domain) { this.po=window.location.protocol+"//"+window.location.host+"/lang/"+this.lang+"/"+domain+".xml"; this.initializeDictionary(); }
  this.initializeDictionary = function() {
    var request;
    try { request = new XMLHttpRequest(); } catch(e1) {
      try { request = new ActiveXObject("Msxml2.XMLHTTP"); } catch(e2) {
        try { request = new ActiveXObject("Microsoft.XMLHTTP"); } catch(e3) { return; }}};
    request.open("GET",this.po,false); 
    request.send(null);
    if(request.status==200 && request.responseXML.documentElement) { 
      var pos = request.responseXML.documentElement.getElementsByTagName("message");
      for(var i=0; i<pos.length; i++) this.dict.set(pos[i].getAttribute("msgid"),pos[i].getAttribute("msgstr"));
    }
  };
  this.gettext = function(key) { return this.dict.get(key); };
  this.vgettext = function(key,replacements) { 
    var nkey=this.gettext(key); var index; var count=0;
    if(replacements.length==0) return nkey;
    while((index=nkey.indexOf('%s'))!=-1) { 
      nkey=nkey.substring(0,index)+replacements[count]+nkey.substring(index+2,nkey.length); 
      count = ((count+1)==replacements.length) ? count : (count+1);
    }
    return nkey;
  };
}
      
function ButterDictionary() {
  this.keys = new Array();
  this.values = new Array();
  this.set = function(key,value) { 
    var index = this.getIndex(key);
    if(index==-1) { this.keys.push(key); this.values.push(value); }
    else this.values[index]=value;
  };
  this.get = function(key) {
    var index;
    if((index=this.getIndex(key))!=-1) return this.values[index];
    return key;
  };
  this.getIndex = function(key) {
    var index=-1;
    for(var i=0; i<this.keys.length; i++) if(this.keys[i]==key) { index=i; break; }
    return index;
  };
  this.keyExists = function(key) { return (this.getIndex(key)!=1); };
  this.deleteKey = function(key) { 
    var index = getIndex(key);
    if(index!=-1) { this.keys.splice(index,1); this.values.splice(index,1); }
  };
}

function EV_myScrollTop(){  
    var n=window.pageYOffset   
    || document.documentElement.scrollTop   
    || document.body.scrollTop || 0;  
    return n;  
}  

function EV_myScrollLeft(){  
    var n=window.pageXOffset   
    || document.documentElement.scrollLeft   
    || document.body.scrollLeft || 0;  
    return n;  
}  

function EV_myClientWidth(){  
    var n=document.documentElement.clientWidth   
    || document.body.clientWidth || 0;  
    return n;  
}  

function EV_myClientHeight(){  
    var n=document.documentElement.clientHeight   
    || document.body.clientHeight || 0;  
    return n;  
}  

function sAlert()
{
	top.window.topPopAlert();
}

var lang = '<% getCfgGeneral(1, "Language"); %>';
var t = 0;
function jsSAlert(){
	
    clearTimeout(t);
    var msgw,msgh,bordercolor; 
    msgw=400;
    msgh=100;
    titleheight=25 ;
    bordercolor="#336699";
    titlecolor="#99CCFF";

    var sWidth,sHeight; 
   
	var bgTop=EV_myScrollTop();  
    var bgLeft=EV_myScrollLeft(); 
    var bgObj=document.createElement("div"); 
    bgObj.setAttribute('id','bgDiv'); 
	bgObj.style.position   = "absolute";  
    bgObj.style.top        = "0px";  
    bgObj.style.left       = "0px";
	if(document.body.scrollHeight > window.screen.availHeight)
	sHeight = document.body.scrollHeight;
	else
	sHeight = window.screen.availHeight;

	if(document.body.scrollWidth > window.screen.availWidth)
	sWidth = document.body.scrollWidth;
	else
	sWidth = window.screen.availWidth;

    bgObj.style.height     = sHeight;   
    bgObj.style.width	   = sWidth;
    bgObj.style.zIndex     = "10000";  
    bgObj.style.background = "#777";  
    bgObj.style.filter     = "progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=60,finishOpacity=60);";  
    bgObj.style.opacity    = "0.6";  
	
	
    document.body.appendChild(bgObj);
    var msgObj=document.createElement("div") 
    msgObj.setAttribute("id","msgDiv"); 
    msgObj.setAttribute("align","center"); 
    msgObj.style.background="white"; 
    msgObj.style.border="1px solid " + bordercolor; 
    msgObj.style.position = "absolute"; 
    msgObj.style.left = "54%"; 
    msgObj.style.top = "50%"; 
    msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif"; 
    msgObj.style.marginLeft = "-242px" ; 
    msgObj.style.marginTop = -75+bgTop+"px"; 
    msgObj.style.width = msgw + "px"; 
    msgObj.style.height =msgh + "px"; 
    msgObj.style.textAlign = "center"; 
    msgObj.style.lineHeight ="25px"; 
    msgObj.style.zIndex = "10001";
	msgObj.style.overflow="auto";

    var title=document.createElement("h4"); 
    title.setAttribute("id","msgTitle"); 
    title.setAttribute("align","right"); 
    title.style.margin="0"; 
    title.style.padding="3px"; 
    title.style.background=bordercolor; 
    title.style.filter="progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);"; 
    title.style.opacity="0.75"; 
    title.style.border="1px solid " + bordercolor; 
    title.style.height="18px"; 
    title.style.font="12px Verdana, Geneva, Arial, Helvetica, sans-serif"; 
    title.style.color="white"; 
    title.style.cursor="pointer"; 

   
    document.body.appendChild(msgObj); 
    document.getElementById("msgDiv").appendChild(title); 
    var txt=document.createElement("p"); 
    txt.style.margin="1em 0" 
    txt.setAttribute("id","msgTxt"); 
	var customer = "<% getCustomer(); %>"; 
	if ((customer == "polsat" || customer == "plus" || customer == "default"))
	{
		if (lang == "polish") {
			txt.innerHTML="Przetwarzanie ...";
		}else
		{
			txt.innerHTML="Processing ...";
		}
	}
	else
	{	if(lang == "en")
			txt.innerHTML="Applying changes, please wait...";
		else if(lang == "zhcn")
			txt.innerHTML="���ڱ�������, ���Ե�...";
		else if(lang == "polish")
			txt.innerHTML="Przetwarzanie konfiguracji w toku...";
		else 
			txt.innerHTML="Applying changes, please wait...";
	}
    //txt.innerHTML=_("alert Processing");
	document.getElementById("msgDiv").appendChild(txt);
}

function jsSclose(){ 
    if(document.getElementById("bgDiv") != null)
    {
        document.body.removeChild(document.getElementById("bgDiv")); 
        document.getElementById("msgDiv").removeChild(document.getElementById("msgTxt")); 
        document.body.removeChild(document.getElementById("msgDiv"));
    }
}

function alertclose()
{
		top.window.topcloseAlert();
}
