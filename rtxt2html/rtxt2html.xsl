<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">

<xsl:template match="/">
	<xsl:for-each select="document">
		<HTML>
			<LINK REL="stylesheet" HREF="rtxt2html.css" TYPE="text/css" />
			<HEAD>
				<title><xsl:value-of select="section/title" /></title>
			</HEAD>
			<BODY>
				<xsl:apply-templates /> 
			</BODY>
		</HTML>
	</xsl:for-each>
</xsl:template>

<xsl:template match="textnode()"><xsl:value-of /> </xsl:template>
<xsl:template match="paragraph"><P><xsl:apply-templates/></P></xsl:template>

<xsl:template match="section"><xsl:element name="A"><xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute></xsl:element><xsl:apply-templates/></xsl:template>
<xsl:template match="section/title"><A></A><H1><xsl:apply-templates/><xsl:value-of select="@name"/></H1></xsl:template>
<xsl:template match="section/section/title"><A></A><H2><xsl:apply-templates/></H2></xsl:template>
<xsl:template match="section/section/section/title"><A></A><H3><xsl:apply-templates/></H3></xsl:template>
<xsl:template match="section/section/section/section/title"><A></A><H4><xsl:apply-templates/></H4></xsl:template>
<xsl:template match="section/section/section/section/section/title"><A></A><H5><xsl:apply-templates/></H5></xsl:template>
<xsl:template match="section/section/section/section/section/section/title"><A></A><H6><xsl:apply-templates/></H6></xsl:template>

<xsl:template match="emphasis"><EM><xsl:apply-templates/></EM></xsl:template>
<xsl:template match="strong"><STRONG><xsl:apply-templates/></STRONG></xsl:template>
<xsl:template match="interpreted"><U><xsl:apply-templates/></U></xsl:template>
<xsl:template match="literal"><CODE><xsl:apply-templates/></CODE></xsl:template>
<xsl:template match="literal_block"><PRE><xsl:apply-templates/></PRE></xsl:template>

<xsl:template match="enumerated_list"><OL><xsl:apply-templates/></OL></xsl:template>
<xsl:template match="list_item"><LI><xsl:apply-templates/></LI></xsl:template>
<xsl:template match="list_item/paragraph"><xsl:apply-templates/></xsl:template>

<xsl:template match="field_list"><UL><xsl:apply-templates/></UL></xsl:template>
<xsl:template match="field"><LI><xsl:apply-templates/></LI></xsl:template>
<xsl:template match="field_name"><B><xsl:apply-templates/> : </B></xsl:template>
<xsl:template match="field_body"><xsl:apply-templates/></xsl:template>
<xsl:template match="field_body/paragraph"><xsl:apply-templates/></xsl:template>

<xsl:template match="definition_list"><xsl:apply-templates/></xsl:template>
<xsl:template match="definition_list_item"><xsl:apply-templates/></xsl:template>
<xsl:template match="term"><B><xsl:apply-templates/></B></xsl:template>
<xsl:template match="definition"><BLOCKQUOTE><P><xsl:apply-templates/></P></BLOCKQUOTE></xsl:template>

<xsl:template match="bullet_list"><UL><xsl:apply-templates/></UL></xsl:template>
<xsl:template match="block_quote"><BLOCKQUOTE><xsl:apply-templates/></BLOCKQUOTE></xsl:template>
<xsl:template match="system_warning"><DIV class="error"><xsl:apply-templates/></DIV></xsl:template>
<xsl:template match="target/paragraph | footnote/paragraph"><A></A><xsl:apply-templates /><BR /></xsl:template>

<xsl:template match="directive">
	<xsl:element name="IMG">
		<xsl:attribute name="src"><xsl:value-of select="@data" /></xsl:attribute><xsl:apply-templates /> 
	</xsl:element>
</xsl:template>

<xsl:template match="footnote_reference">
	<xsl:element name="A">
		<xsl:attribute name="href">#<xsl:value-of href="@refname" /></xsl:attribute>[<xsl:apply-templates />]
	</xsl:element>
	<A></A>
</xsl:template>



<xsl:template match="footnote">
	<xsl:element name="A">
		<xsl:attribute name="name"><xsl:value-of select="@name" /></xsl:attribute>
		[<xsl:value-of select="@name" />]
		<xsl:apply-templates /> 
	</xsl:element>
</xsl:template>

<xsl:template match="target">
	<xsl:element name="A">
		<xsl:attribute name="name"><xsl:value-of select="@name" /></xsl:attribute>
		
	</xsl:element>
	<A></A>
	[<xsl:value-of select="@name" />]
	<xsl:element name="A">
		<xsl:attribute name="href"><xsl:apply-templates /> </xsl:attribute>
		<xsl:apply-templates /> 
	</xsl:element>
	<A></A>
	<BR/>
</xsl:template>

<xsl:template match="link">
	<xsl:if test="@refuri">
		<xsl:element name="A">
			<xsl:attribute name="href"><xsl:value-of select="@refuri" /></xsl:attribute><xsl:apply-templates /> 
		</xsl:element>
	</xsl:if>
	<xsl:if test="@refname">
		<xsl:element name="A">
			<xsl:attribute name="href">#<xsl:value-of select="@refname" /></xsl:attribute><xsl:apply-templates />
		</xsl:element>
	</xsl:if>
	<A></A>
</xsl:template>

</xsl:stylesheet>