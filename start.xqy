(:
 : start.xqy  display the plays by category
 :
 : Copyright (c)2002-2006 Mark Logic Corporation. All Rights Reserved.
 :
 : Licensed under the Apache License, Version 2.0 (the "License");
 : you may not use this file except in compliance with the License.
 : You may obtain a copy of the License at
 :
 : http://www.apache.org/licenses/LICENSE-2.0
 :
 : Unless required by applicable law or agreed to in writing, software
 : distributed under the License is distributed on an "AS IS" BASIS,
 : WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 : See the License for the specific language governing permissions and
 : limitations under the License.
 :
 : The use of the Apache License does not indicate that this project is
 : affiliated with the Apache Software Foundation.
 :
 :)

declare namespace xh="http://www.w3.org/1999/xhtml"
declare namespace no=""
declare namespace apidoc="http://marklogic.com/xdmp/apidoc"
default element namespace = "http://www.w3.org/1999/xhtml"

xdmp:set-response-content-type("text/html"),

<html xmlns="http://www.w3.org/1999/xhtml">
	<head></head>
	<body>
	<table vspace="20" align="center">
	<tr><td><p>&nbsp;</p></td></tr>
	<tr><td><p>&nbsp;</p></td></tr>
	<tr><td align="center">
			<h1>The Plays of William Shakespeare</h1></td></tr>
	<tr><td><p>&nbsp;</p></td></tr>
        </table>
      <table width="90%" align="center" cellpadding="10">
                         <tr><th align="center">Comedies</th>
                             <th align="center">Tragedies</th>
                             <th align="center">Histories</th></tr>
      <tr><td valign="top" style="text-indent: -15">{
      for $play in xdmp:directory("/shakespeare/plays/")
      where $play/property::no:playtype/text() eq "COMEDY"
      order by $play/no:PLAY/no:TITLE/text()
      return
      <li><a href="displayScene.xqy?fname={fn:base-uri($play)}&drama=true">{
          normalize-space(string-join($play/no:PLAY/no:TITLE/text(), "") )}</a>
          </li>
         
      }</td>
      <td valign="top" style="text-indent: -15">{
      for $play in xdmp:directory("/shakespeare/plays/")
      where $play/property::no:playtype/text() eq "TRAGEDY"
      order by $play/no:PLAY/no:TITLE/text()
      return
      <li><a href="displayScene.xqy?fname={fn:base-uri($play)}&drama=true">{
          normalize-space(string-join($play/no:PLAY/no:TITLE/text(), "") )}</a>
          </li>
         
      }</td>
      <td valign="top" style="text-indent: -15">{
      for $play in xdmp:directory("/shakespeare/plays/")
      where $play/property::no:playtype/text() eq "HISTORY"
      order by $play/no:PLAY/no:TITLE/text()
      return
      <li><a href="displayScene.xqy?fname={fn:base-uri($play)}&drama=true">{
          normalize-space(string-join($play/no:PLAY/no:TITLE/text(), "") )}</a>
          </li>
         
      }</td></tr></table>

	</body>
</html>

