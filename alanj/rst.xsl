<?xml version="1.0" encoding="UTF-8"?>

<!-- edited with XML Spy v4.0 U (http://www.xmlspy.com) by Alan Jaffray (none) -->

<!--XXX - not touching tables. at least not yet. other omissions as well.-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>

	<!--variable definitions for use in translate(), because XSLT 1.0 is dumb and doesn't have a lowercase() function.-->

	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>

	<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'"/>

	<xsl:template match="document">

		<html>

			<head>

				<title>

					<xsl:value-of select="section/title"/>

				</title>

			</head>

			<body>

				<xsl:apply-templates/>

			</body>

		</html>

	</xsl:template>

	<xsl:template match="title">

		<a>

			<xsl:attribute name="name"><xsl:value-of select="translate(normalize-space(.),$uppercase,$lowercase)"/></xsl:attribute>

		</a>

		<xsl:variable name="depth">

			<xsl:value-of select="count(ancestor::section)"/>

		</xsl:variable>

		<xsl:element name="h{$depth}">

			<xsl:apply-templates/>

		</xsl:element>

	</xsl:template>

	<!--lists-->

	<xsl:template match="bullet_list">

		<ul>

			<xsl:apply-templates/>

		</ul>

	</xsl:template>

	<xsl:template match="enumerated_list">

		<!--Copy the start attribute if it's there.  Use the appropriate HTML type attribute if enumtype exists.  (Yeah, yeah, type is deprecated.)  Ignore suffix and prefix since it's unclear what to do with them.-->

		<xsl:element name="ol">

			<xsl:choose>

				<xsl:when test="@enumtype='arabic'">

					<xsl:attribute name="type">1</xsl:attribute>

				</xsl:when>

				<xsl:when test="@enumtype='loweralpha'">

					<xsl:attribute name="type">a</xsl:attribute>

				</xsl:when>

				<xsl:when test="@enumtype='upperalpha'">

					<xsl:attribute name="type">A</xsl:attribute>

				</xsl:when>

				<xsl:when test="@enumtype='lowerroman'">

					<xsl:attribute name="type">i</xsl:attribute>

				</xsl:when>

				<xsl:when test="@enumtype='upperroman'">

					<xsl:attribute name="type">I</xsl:attribute>

				</xsl:when>

			</xsl:choose>

			<xsl:copy-of select="@start"/>

			<xsl:apply-templates/>

		</xsl:element>

	</xsl:template>

	<xsl:template match="list_item">

		<li>

			<xsl:apply-templates/>

		</li>

	</xsl:template>

	<xsl:template match="field_list">

		<p>

			<xsl:apply-templates/>

		</p>

	</xsl:template>

	<xsl:template match="field">

		<b>

			<xsl:apply-templates select="field_name"/> : </b>

		<xsl:apply-templates select="field_body"/>

		<br/>

	</xsl:template>

	<xsl:template match="definition_list">

		<dl>

			<xsl:apply-templates/>

		</dl>

	</xsl:template>

	<xsl:template match="definition_list_item">

		<xsl:apply-templates/>

	</xsl:template>

	<xsl:template match="term">

		<dt>

			<xsl:apply-templates/>

		</dt>

	</xsl:template>

	<xsl:template match="definition">

		<dd>

			<xsl:apply-templates/>

		</dd>

	</xsl:template>

	<xsl:template match="option_list">

		<table>

			<xsl:apply-templates/>

		</table>

	</xsl:template>

	<xsl:template match="option_list_item">

		<tr>

			<xsl:apply-templates/>

		</tr>

	</xsl:template>

	<xsl:template match="option">

		<!--XXX - not sure how option_argument is supposed to work, or how to handle it-->

		<td>

			<code>

				<xsl:apply-templates/>

			</code>

		</td>

	</xsl:template>

	<xsl:template match="description">

		<td>

			<xsl:apply-templates/>

		</td>

	</xsl:template>

	<xsl:template match="list_item/paragraph[1] | definition_list_item/*/paragraph[1] | field/*/paragraph[1] | option/*/paragraph[1]">

		<!--XXX - Unclear how to handle multi-paragraph list items.  Certainly when they're single paragraphs, we don't want them wrapped in a <P> tag.  This seems to work okay.-->

		<xsl:apply-templates/>

	</xsl:template>

	<!--text styles-->

	<xsl:template match="paragraph">

		<p>

			<xsl:apply-templates/>

		</p>

	</xsl:template>

	<xsl:template match="emphasis">

		<em>

			<xsl:apply-templates/>

		</em>

	</xsl:template>

	<xsl:template match="strong">

		<strong>

			<xsl:apply-templates/>

		</strong>

	</xsl:template>

	<xsl:template match="block_quote">

		<blockquote>

			<xsl:apply-templates/>

		</blockquote>

	</xsl:template>

	<xsl:template match="literal">

		<code>

			<xsl:apply-templates/>

		</code>

	</xsl:template>

	<xsl:template match="literal_block">

		<pre>

			<xsl:apply-templates/>

		</pre>

	</xsl:template>

	<xsl:template match="interpreted">

		<!--XXX - Choosing to use "interpreted" to mean "pass through HTML code" - is this reasonable? should other blocks do this by default?-->

		<xsl:value-of select="." disable-output-escaping="yes"/>

	</xsl:template>

	<xsl:template match="comment"/>

	<!--footnotes. XXX - doesn't handle numbering mixed between autonumber and non-autonumber?-->

	<xsl:template match="footnote">

		<!--Add anchors for footnote autonumber and/or name, then output autonumber or name enclosed in brackets followed by a space as the text, then the contents of the footnote.-->

		<xsl:if test="@auto">

			<a>

				<xsl:attribute name="name"><xsl:call-template name="autonumber_refname"/></xsl:attribute>

			</a>

		</xsl:if>

		<xsl:choose>

			<xsl:when test="@name">

				<a name="{@name}"/>

			</xsl:when>

			<xsl:when test="@refname">

				<a name="{@refname}"/>

			</xsl:when>

		</xsl:choose>[<xsl:choose>

			<xsl:when test="label">

				<xsl:value-of select="label"/>

			</xsl:when>

			<xsl:when test="@name">

				<xsl:value-of select="@name"/>

			</xsl:when>

			<xsl:when test="@auto">

				<xsl:call-template name="autonumber"/>

			</xsl:when>

			<xsl:otherwise>

				<xsl:message terminate="yes">No footnote label!</xsl:message>

			</xsl:otherwise>

		</xsl:choose>] <xsl:apply-templates/>

	</xsl:template>

	<xsl:template match="footnote/paragraph[1]">

		<!--XXX - Same as with list item kludge...-->

		<xsl:apply-templates/>

	</xsl:template>

	<xsl:template match="footnote_reference">

		<a>

			<xsl:attribute name="href">#<xsl:choose><xsl:when test="@refname"><xsl:value-of select="@refname"/></xsl:when><xsl:when test="@auto"><xsl:call-template name="autonumber_refname"/></xsl:when><xsl:otherwise><xsl:message terminate="yes">What does this footnote reference point to?!</xsl:message></xsl:otherwise></xsl:choose></xsl:attribute>[<xsl:choose>

				<xsl:when test="@auto">

					<xsl:call-template name="autonumber"/>

				</xsl:when>

				<xsl:otherwise>

					<xsl:apply-templates/>

				</xsl:otherwise>

			</xsl:choose>] </a>

	</xsl:template>

	<xsl:template name="autonumber">

		<xsl:variable name="myname" select="name()"/>

		<xsl:if test="@auto">

			<xsl:number count="*[name()=$myname and @auto]" level="any"/>

		</xsl:if>

	</xsl:template>

	<xsl:template name="autonumber_refname">

		<xsl:param name="autonumber">

			<xsl:call-template name="autonumber"/>

		</xsl:param>autonumbered_footnote_<xsl:value-of select="$autonumber"/>

	</xsl:template>

	<!--links and targets - associate indirect external targets with links via keys-->

	<xsl:key name="indirect-target" match="target[node()]" use="@name"/>

	<xsl:template match="link">

		<a>

			<xsl:attribute name="href"><xsl:choose><xsl:when test="@refuri"><xsl:value-of select="@refuri"/></xsl:when><xsl:when test="@refname"><xsl:variable name="associated-url" select="key('indirect-target',@refname)"/><xsl:choose><xsl:when test="$associated-url"><xsl:value-of select="$associated-url"/></xsl:when><xsl:otherwise><xsl:text>#</xsl:text><xsl:value-of select="translate(normalize-space(@refname),$uppercase,$lowercase)"/></xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise><xsl:message terminate="yes">No link target?!</xsl:message></xsl:otherwise></xsl:choose></xsl:attribute>

			<xsl:apply-templates/>

		</a>

	</xsl:template>

	<xsl:template match="target">

		<xsl:choose>

			<xsl:when test="node()">

				<!--It's an external target.  We have a key pointing to it for use when we find an associated link.  We don't need to print anything now.-->

			</xsl:when>

			<xsl:otherwise>

				<!--Internal link target - print an empty anchor, then the name in brackets, then the contents.-->

				<a>

					<xsl:value-of select="translate(normalize-space(@name),$uppercase,$lowercase)"/>

				</a>[<xsl:value-of select="@name"/>] <xsl:apply-templates/>

			</xsl:otherwise>

		</xsl:choose>

	</xsl:template>

</xsl:stylesheet>

