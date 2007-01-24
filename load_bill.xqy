(:
 : load_bill.xqy  loads the Shakespeare XML into MarkLogic Server
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

declare namespace dir="http://marklogic.com/xdmp/directory"

(: modify $playdir so it points to the directory in which the 
   Shakespeare XML files are located :)
let $playdir := "C:\development\shakespeare"
for $x in xdmp:filesystem-directory($playdir)//dir:pathname/text()
   [ends-with(lower-case(.), ".xml")]
return
(
xdmp:document-load($x, 
  <options xmlns="xdmp:document-load">
    <uri>{fn:concat("/shakespeare/plays/", 
                    fn:substring-after($x, fn:concat($playdir, "\")))}</uri>
    <repair>none</repair>
  </options>) ,
fn:concat("loaded ", $x, " with uri ", fn:concat("/shakespeare/plays/", 
                    fn:substring-after($x, fn:concat($playdir, "\"))) 
         )
)
,
"

done loading Shakespeare plays"

