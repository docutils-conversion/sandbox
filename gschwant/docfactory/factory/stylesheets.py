"""
:author:  Dr. Gunnar Schwant
:contact: g.schwant@gmx.de
:version: 0.2.2
"""

classic = '''
/*
:Author: David Goodger
:Contact: goodger@users.sourceforge.net
:date: $Date$
:version: $Revision$
:copyright: This stylesheet has been placed in the public domain.

Default cascading style sheet for the HTML output of Docutils.
*/

.first {
  margin-top: 0 }

.last {
  margin-bottom: 0 }

a.toc-backref {
  text-decoration: none ;
  color: black }

dd {
  margin-bottom: 0.5em }

div.abstract {
  margin: 2em 5em }

div.abstract p.topic-title {
  font-weight: bold ;
  text-align: center }

div.attention, div.caution, div.danger, div.error, div.hint,
div.important, div.note, div.tip, div.warning {
  margin: 2em ;
  border: medium outset ;
  padding: 1em }

div.attention p.admonition-title, div.caution p.admonition-title,
div.danger p.admonition-title, div.error p.admonition-title,
div.warning p.admonition-title {
  color: red ;
  font-weight: bold ;
  font-family: sans-serif }

div.hint p.admonition-title, div.important p.admonition-title,
div.note p.admonition-title, div.tip p.admonition-title {
  font-weight: bold ;
  font-family: sans-serif }

div.dedication {
  margin: 2em 5em ;
  text-align: center ;
  font-style: italic }

div.dedication p.topic-title {
  font-weight: bold ;
  font-style: normal }

div.figure {
  margin-left: 2em }

div.footer, div.header {
  font-size: smaller }

div.system-messages {
  margin: 5em }

div.system-messages h1 {
  color: red }

div.system-message {
  border: medium outset ;
  padding: 1em }

div.system-message p.system-message-title {
  color: red ;
  font-weight: bold }

div.topic {
  margin: 2em }

h1.title {
  text-align: center }

h2.subtitle {
  text-align: center }

hr {
  width: 75% }

ol.simple, ul.simple {
  margin-bottom: 1em }

ol.arabic {
  list-style: decimal }

ol.loweralpha {
  list-style: lower-alpha }

ol.upperalpha {
  list-style: upper-alpha }

ol.lowerroman {
  list-style: lower-roman }

ol.upperroman {
  list-style: upper-roman }

p.caption {
  font-style: italic }

p.credits {
  font-style: italic ;
  font-size: smaller }

p.label {
  white-space: nowrap }

p.topic-title {
  font-weight: bold }

pre.address {
  margin-bottom: 0 ;
  margin-top: 0 ;
  font-family: serif ;
  font-size: 100% }

pre.line-block {
  font-family: serif ;
  font-size: 100% }

pre.literal-block, pre.doctest-block {
  margin-left: 2em ;
  margin-right: 2em ;
  background-color: #eeeeee }

span.classifier {
  font-family: sans-serif ;
  font-style: oblique }

span.classifier-delimiter {
  font-family: sans-serif ;
  font-weight: bold }

span.interpreted {
  font-family: sans-serif }

span.option-argument {
  font-style: italic }

span.pre {
  white-space: pre }

span.problematic {
  color: red }

table {
  margin-top: 0.5em ;
  margin-bottom: 0.5em }

table.citation {
  border-left: solid thin gray ;
  padding-left: 0.5ex }

table.docinfo {
  margin: 2em 4em }

table.footnote {
  border-left: solid thin black ;
  padding-left: 0.5ex }

td, th {
  padding-left: 0.5em ;
  padding-right: 0.5em ;
  vertical-align: top }

th.docinfo-name, th.field-name {
  font-weight: bold ;
  text-align: left ;
  white-space: nowrap }

h1 tt, h2 tt, h3 tt, h4 tt, h5 tt, h6 tt {
  font-size: 100% }

tt {
  background-color: #eeeeee }

ul.auto-toc {
  list-style-type: none }
'''

modern = classic + '''

/*
Additional styles for "modern"-style of DocFactory.

:Author: Gunnar Schwant
:Contact: g.schwant@gmx.de
*/

.first {
  font-size: 10pt }

.last {
  font-size: 10pt }

a {
  text-decoration: none }

a.reference {
  color: #0000BF }

a:hover {
  background-color: #003366 ;
  color: white }

body {
  font-family: arial,helvetica,univers ;
  font-size: 10pt ;
  padding-top: 1cm ;
  margin-left:0.5cm ;
  margin-right:0.5cm ;
  margin-bottom:0.5cm }

dd {
  font-size: 10pt ;
  padding-top: 0.1cm
}

dt {
  font-size: 10pt ;
  font-weight: bold ;
  background-color: #C8DBEB ;
  padding-left: 0.1cm ;
  padding-top: 0.1cm ;
  padding-bottom: 0.1cm }

div.abstract {
  font-size: 10pt }

div.abstract p.topic-title {
  font-size: 10pt }

div.attention, div.caution, div.danger, div.error, div.hint,
div.important, div.note, div.tip, div.warning {
  font-size: 10pt }

div.attention p.admonition-title, div.caution p.admonition-title,
div.danger p.admonition-title, div.error p.admonition-title,
div.warning p.admonition-title, div.hint p.admonition-title, 
div.important p.admonition-title, div.note p.admonition-title, 
div.tip p.admonition-title {
  margin-top: 0em ;
  font-size: 12pt ;
  font-family: arial,helvetica,univers }

div.dedication {
  font-size: 10pt }

div.dedication p.topic-title {
  font-size: 10pt }

div.figure {
  font-size: 10pt }

div.footer, div.header {
  font-size: 8pt }

div.system-messages {
  font-size: 10pt }

div.system-messages h1 {
  font-size: 12pt }

div.system-message {
  font-size: 10pt }

div.system-message p.system-message-title {
  font-size: 10pt }

div.topic {
  font-size: 10pt }

h1, h2, h3, h4, h5, h6 {
  padding-top: 0.5cm ;
  page-break-after: avoid ;
  font-family: arial,helvetica,univers }

h1 {
  font-size: 18pt }

h1.title {
  padding-top: 0cm }

h2 {
  font-size: 16pt }

h2.subtitle {
  padding-top: 0cm }

h3 {
  font-size: 14pt }

h4 {
  font-size: 12pt }

h5, h6 {
  font-size: 10pt }

hr {
  width: 100%;
  page-break-after: always }

li {
  padding-top: 1mm ;
  padding-bottom: 1mm }

ol.simple, ul.simple {
  font-size: 10pt }

ol.arabic {
  font-size: 10pt }

ol.loweralpha {
  font-size: 10pt }

ol.upperalpha {
  font-size: 10pt }

ol.lowerroman {
  font-size: 10pt }

ol.upperroman {
  font-size: 10pt }

p.caption {
  font-size: 10pt }

p.credits {
  font-style: italic ;
  font-size: 8pt }

p.label {
  font-size: 10pt }

p.topic-title {
  font-size: 10pt }

pre.address {
  font-family: arial,helvetica,univers ;
  font-size: 10pt }

pre.line-block {
  font-size: 10pt }

pre.literal-block, pre.doctest-block {
  border-width: 1pt ;
  border-style: solid ;
  border-color: #999999 ;
  color: #0000C0 ;
  background-color: #ffffe0 ;
  font-size: 9pt }

span.classifier {
  font-size: 10pt ;
  font-family: arial,helvetica,univers }

span.classifier-delimiter {
  font-size: 10pt ;
  font-family: arial,helvetica,univers }

span.field-argument {
  font-size: 10pt }

span.interpreted {
  font-size: 10pt ;
  font-family: arial,helvetica,univers }

span.option-argument {
  font-size: 10pt }

span.problematic {
  font-size: 10pt }

table {
  font-size: 10pt ;
  border-collapse: collapse ;
  border-width: 1.5pt ;
  border-color: #003366 }

table.citation {
  font-size: 10pt }

table.docinfo {
  font-size: 10pt }

table.footnote {
  font-size: 8pt ;
  text-align: left }

table.table {
  width: 100% }

th {
  border-width: 1.5pt }

td {
  border-width: 1pt }

td, th {
  font-size: 10pt ;
  border-style: thin ;
  border-color: #003366 }

td.docinfo-name, th.field-name {
  font-size: 10pt }

h1 tt, h2 tt, h3 tt, h4 tt, h5 tt, h6 tt {
  font-size: 10pt }
'''

stylesheets = { 'classic': classic, 'modern': modern }
