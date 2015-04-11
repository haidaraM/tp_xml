<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:value-of select="//titre"/>
          <xsl:text> de, </xsl:text>
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

  <xsl:template match="en-tete">
    <table align="center" cellspacing="50">
      <tbody>
        <tr>
          <td>
            <img src="{couverture/@chemin}"/>
          </td>
          <td>
            <h1 style="text-align:center; color:blue;">
              <xsl:value-of select="titre"/>
            </h1>
            <h2 style="text-align:center; font-style: italic;">
              <xsl:value-of select="auteur"/>
            </h2>
            <blockquote style="color:darkgreen;">
              <xsl:text> But du TP du </xsl:text>
              <xsl:value-of select="info_traitements/date"/>
              <xsl:text>: </xsl:text>
              <xsl:value-of select="info_traitements/but"/>
              <br/>
              <xsl:text> Auteurs : </xsl:text>
              <xsl:value-of select="info_traitements/mise_en_forme_par/unCreateur[1]"/>
              <xsl:text> et </xsl:text>
              <xsl:value-of select="info_traitements/mise_en_forme_par/unCreateur[2]"/>
              <xsl:text> (</xsl:text>
              <xsl:value-of select="info_traitements/mise_en_forme_par/NoBinome"/>
              <xsl:text>) </xsl:text>
              <br/>
              <xsl:text> Email du responsable : </xsl:text>
              <xsl:value-of select="info_traitements/email"/>
            </blockquote>
          </td>
        </tr>
      </tbody>
    </table>
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
