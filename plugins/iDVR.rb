##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-02-25 #
# Updated version detection
##
# Version 0.2 #
# Fixed regex
##
Plugin.define "iDVR" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.3"
description "iDVR (formerly Devloution Security System) is a video surveillance system for the Linux/X11 platform. - homepage: http://code.google.com/p/idvr/"
# default login: administrator/blank

# Google results as at 2010-07-20 #
# 247 for intitle:iDVR -intitle:"com | net | shop" -inurl:"asp | htm | pdf | html | php | shtml | com | at | cgi | tv"

# Dorks #
dorks [
'intitle:iDVR -intitle:"com | net | shop" -inurl:"asp | htm | pdf | html | php | shtml | com | at | cgi | tv"'
]

# Examples #
examples %w|
68.15.38.73
68.89.135.133
71.40.164.156
71.98.250.171
72.45.156.138
74.218.49.10
75.17.27.107
208.125.177.54
208.125.189.126
209.220.222.14
213.79.40.116
220.162.158.162/adv/
www.avinfo.cn/adv/
|

# Matches #
matches [

# Default Title
{ :text=>'<title>iDVR</title>' },

# Default JavaScript
{ :regexp=>/	  	'	  codebase="http:\/\/' + szDomainFull + '\/NSIDVRCtrlX.ocx#version=[\d]{1},[\d]{1},[\d]{1},[\d]{1}"\n'\+/ },
{ :text=>'		\'	  classid="clsid:16A017B9-6CB4-47C7-8E81-6E9396FAC2B6"\\n\' +' },
{ :regexp=>/		monitorDiv.innerHTML = "<object id='monitorObject' style='display:none' classid='clsid:574B47E8-A366-4AB9-B2EA-57F145CA3780' codebase='lib\/monitor.cab#version=[\d]{1},[\d]{1},[\d]{1},[\d]{1}' VIEWASTEXT><\/object>";/ },

# Version Detection # Default Title
{ :version=>/<title>iDVR (.*)[\d\.]+ \(Build ([\d\.]+)\)<\/title>/, :offset=>1 },

]

end


