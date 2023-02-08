<html>
<head>
<title>Internet Domowy</title>
<link rel="shortcut icon" href="../graphics/cpe.ico" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html">
<script type="text/javascript" src="/lang/b28n.js"></script>
<script language="JavaScript" type="text/javascript">
function topPopAlert()
{
	jsSAlert();
}
function topcloseAlert()
{
	 jsSclose();
}
var lang = 'polish';
 if (lang == "en") {
 document.cookie="language=en; path=/";
 }
else if (lang == "polish") {
 document.cookie="language=polish; path=/";
 }
  
function initLanguage()
{
	var cook = "en";
	var lang_en = '1';
	var lang_polish = '1';

	if (document.cookie.length > 0) {
		var s = document.cookie.indexOf("language=");
		var e = document.cookie.indexOf(";", s);
		if (s != -1) {
			if (e == -1)
				cook = document.cookie.substring(s+9);
			else
				cook = document.cookie.substring(s+9, e);
		}
	}
 
	if (lang == "en") {
		document.cookie="language=en; path=/";
		if (cook != lang)
			window.location.reload();
		if (lang_en != "1") {
			 if (lang_polish == "1") {
				document.cookie="language=polish; path=/";
				window.location.reload();
			}
		}
	}
	else if (lang == "polish") {
		document.cookie="language=polish; path=/";
		if (cook != lang)
			window.location.reload();
		if (lang_polish != "1") {
			if (lang_en == "1") {
				document.cookie="language=en; path=/";
				window.location.reload();
			}
		}
	}
}

function onInit()
{
	initLanguage();
	/// 
}

function SetWinHeight(obj)
{
var webbody=obj;
if (document.getElementById)
{
       if (webbody ) ///&& !window.opera)
       {
        if (webbody.contentDocument && webbody.contentDocument.body.offsetHeight)
         webbody.height = webbody.contentDocument.body.offsetHeight; 
        else if(webbody.Document && webbody.Document.body.scrollHeight)
         webbody.height = webbody.Document.body.scrollHeight;
        //else 
        //	webbody.height = document.height-280;         
       }
}
}
</script>
</head>

<body onLoad="onInit()" style="overflow-y:scroll;">
<table width="800px" align="center">
	<tr><td>
		<iframe id="header" name="header" marginwidth=0 marginheight=0 src="webheader.asp" frameborder=0 scrolling="no" width="100%" height="95px"></iframe>
	</td></tr>	
	<tr><td>
		<iframe id="webbody" name="webbody" onload="Javascript:SetWinHeight(this)" marginwidth=7 marginheight=0 src="webbody.asp" frameborder=0 scrolling="no" width="100%" height="300px"></iframe>
	</td></tr>
	<tr><td>
		<iframe id="footer" name="footer" marginwidth=12 marginheight=0 src="webfooter.asp" frameborder=0 scrolling="no" width="100%" height="145px"></iframe>
	</td></tr>
</table>
</body>
</html>
