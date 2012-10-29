<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"></xsl:output>
	<xsl:template match="/">
		<h1>Шаблоны проектирования</h1>
		<xsl:apply-templates mode="pattern-name-list-view" />
		
		<h1>Шаблоны проектирования</h1>
		<xsl:apply-templates mode="pattern-diagram-view" />
		
		<h1>Шаблоны проектирования</h1>
		<xsl:apply-templates mode="full-view" />
		
		
	</xsl:template>
	
	<!-- mode pattern-name-list-view -->
	<xsl:template match="group" mode="pattern-name-list-view">
		<h2>
			<xsl:value-of select="@name_ru"></xsl:value-of>
		</h2>
		<ul>
			<xsl:apply-templates mode="pattern-name-list-view" />
		</ul>
	</xsl:template>

	<xsl:template match="pattern" mode="pattern-name-list-view">
		<li>
			<xsl:value-of select="@name_en" />
			—
			<xsl:value-of select="@name_ru" />
		</li>
	</xsl:template>
	
	<!-- mode pattern-diagram-view -->
	<xsl:template match="group" mode="pattern-diagram-view">
		<h2>
			<xsl:value-of select="@name_ru"></xsl:value-of>
		</h2>
		<xsl:apply-templates mode="pattern-diagram-view" />
		
	</xsl:template>

	<xsl:template match="pattern" mode="pattern-diagram-view">
		<h3>
			<xsl:value-of select="@name_en" />
			—
			<xsl:value-of select="@name_ru" />
		</h3>
		<img>
			<xsl:attribute name="src">
				img/<xsl:value-of select="@code"></xsl:value-of>.gif
			</xsl:attribute>
		</img>
	</xsl:template>
	
	<!-- mode full-view -->
	<xsl:template match="group" mode="full-view">
		<h2>
			<xsl:value-of select="@name_ru"></xsl:value-of>
		</h2>
		<xsl:apply-templates mode="full-view" />
	</xsl:template>

	<xsl:template match="pattern" mode="full-view">
		<h3>
			<xsl:value-of select="@name_en" />
			—
			<xsl:value-of select="@name_ru" />
		</h3>
		<img>
			<xsl:attribute name="src">
				img/<xsl:value-of select="@code"></xsl:value-of>.gif
			</xsl:attribute>
		</img>
		<p>
			<xsl:copy-of select="desc" />
		</p>
	</xsl:template>
	
</xsl:stylesheet>