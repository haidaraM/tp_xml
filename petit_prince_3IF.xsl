<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <html>

      <head>
        <title>
          <xsl:value-of select="//titre"/>
          <xsl:text> de </xsl:text>
          <xsl:value-of select="//auteur"/>
        </title>
      </head>
      <body style="background-color:white;">
        <xsl:apply-templates/>
        <h3>
          <xsl:text>Fin du texte.</xsl:text>
        </h3>
        <hr/>
      </body>
    </html>
  </xsl:template>


  <xsl:template match="titre">
    <h1 style="text-align:center; color:blue;">
      <xsl:apply-templates/>
    </h1>
  </xsl:template>
  <xsl:template match="auteur">
    <br/>
    <h2 style="text-align:center; font-style: italic;">
      <xsl:apply-templates/>
    </h2>
    <br/>
  </xsl:template>
  <xsl:template match="info_traitements">
    <img src="images/prince.png"/>
    <blockquote style="color:darkgreen;">
      <br/>
      <xsl:text> But du TP du </xsl:text>
      <xsl:value-of select="//date"/>
      <xsl:text>: </xsl:text>
      <xsl:value-of select="//but"/>
      <br/>
      <xsl:text> Auteurs : </xsl:text>
      <xsl:value-of select="//unCreateur"/>
      <xsl:text> et </xsl:text>
      <xsl:value-of select="//unCreateur[2]"/>
      <xsl:text> (</xsl:text>
      <xsl:value-of select="//NoBinome"/>
      <xsl:text>) </xsl:text>
      <br/>
      <xsl:text> Email du responsable : </xsl:text>
      <xsl:value-of select="//email"/>
    </blockquote>
    <hr/>
    <h3>
      <xsl:text> Début du texte : </xsl:text>
    </h3>
  </xsl:template>


  <xsl:template match="paragraphe[@type='dialogue']">
    <p>
      <xsl:for-each select="phrase[@langue='francais']">
        <xsl:apply-templates/>
      </xsl:for-each>
      <br/>
      <span style="color:brown; font-style:italic;">
        <xsl:for-each select="phrase[@langue='hongrois']">
          <xsl:apply-templates/>
        </xsl:for-each>
      </span>
    </p>
  </xsl:template>
  <xsl:template match="paragraphe[@type='narration']">
    <p>
      <xsl:for-each select="phrase[@langue='francais']">
        <xsl:apply-templates/>
      </xsl:for-each>
      <br/>
      <span style="color:brown; font-style:italic;">
        <xsl:for-each select="phrase[@langue='hongrois']">
          <xsl:apply-templates/>
        </xsl:for-each>
      </span>
    </p>

  </xsl:template>

</xsl:stylesheet>
