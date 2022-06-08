<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<xsl:output method="xml" omit-xml-declaration="yes" version="1.0" encoding="utf-8" indent="yes"/>

<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

<xsl:template match="/">
<xsl:apply-templates select="text()|node()"/>
</xsl:template>

<xsl:template match="/*/text()"/>

<xsl:template match="/*/node()">
<xsl:copy-of select="."/>
</xsl:template>

<!--
<xsl:template match="/">
<xsl:copy-of select="/*/node()"/>
</xsl:template>
-->

<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

</xsl:stylesheet>
