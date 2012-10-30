<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" doctype-system="" />
	<xsl:template match="/">
		<html>
			<head>
				<link href="design-patterns.css" rel="stylesheet" type="text/css">
				</link>
			</head>
			<body>
 
				<section id="pattern-name-list-view">
					<h1>Перечень шаблонов проектирования</h1>
					<xsl:apply-templates mode="pattern-name-list-view" />
				</section>

				<section id="pattern-diagram-view">
					<h1>Шаблоны проектирования в картинках</h1>
					<xsl:apply-templates mode="pattern-diagram-view" />
				</section>
 
				<section id="full-view">
					<h1>Шаблоны проектирования с описанием</h1>
					<xsl:apply-templates mode="full-view" />
				</section>
				
			</body>
		</html>

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
		<section>
		<h2>
			<xsl:value-of select="@name_ru"></xsl:value-of>
		</h2>
		<xsl:apply-templates mode="pattern-diagram-view" />
		</section>

	</xsl:template>

	<xsl:template match="pattern" mode="pattern-diagram-view">
		<article>
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
		<img>
			<xsl:attribute name="src">
				img/<xsl:value-of select="@code"></xsl:value-of>.svg
			</xsl:attribute>
		</img>
		
		<img>
			<xsl:attribute name="src">
				img/<xsl:value-of select="@code"></xsl:value-of>.png
			</xsl:attribute>
		</img>
		
		</article>
	</xsl:template>

	<!-- mode full-view -->
	<xsl:template match="group" mode="full-view">
		<section>
		<h2>
			<xsl:value-of select="@name_ru"></xsl:value-of>
		</h2>
		<xsl:apply-templates mode="full-view" />
		</section>
	</xsl:template>

	<xsl:template match="pattern" mode="full-view">
		<article>
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
			<div id="pattern-desc_section">
				<xsl:copy-of select="desc" />
			</div>
		</article>
	</xsl:template>

</xsl:stylesheet>