<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <!-- Corps HTML -->
        <html>
            <head>
                <title>
                    <xsl:value-of select="//titre"/>
                    <xsl:text> de </xsl:text>
                    <xsl:value-of select="//auteur"/>
                </title>
                <link href="fichiersPourAjax/css/bootstrap.min.css" rel="stylesheet"/>
                <link href="fichiersPourAjax/css/bootstrap-theme.css" rel="stylesheet"/>
            </head>
            <body class="container">
                <xsl:apply-templates/>
                <h3>
                    <xsl:text>Fin du texte.</xsl:text>
                </h3>
                <hr/>
            </body>
        </html>
    </xsl:template>

    <!-- Mise en forme de l'en-tete -->
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

    <!-- mise en forme des paragraphes -->
    <xsl:template match="//paragraphe">
        <xsl:choose>
            <xsl:when test="self::node()[@type='narration']">
                <div class="bs-callout bs-callout-info">
                    <h4>
                        <xsl:value-of select="@type"/>
                        <xsl:text> </xsl:text>
                        <span class="label label-info">
                            <xsl:value-of select="count(phrase)"/>
                        </span>
                    </h4>
                    <p>
                        <xsl:apply-templates/>
                    </p>
                </div>
            </xsl:when>
            <xsl:when test="self::node()[@type='dialogue']">
                <div class="bs-callout bs-callout-default">
                    <h4>
                        <xsl:value-of select="@type"/>
                        <xsl:text> </xsl:text>
                        <span class="label label-default">
                            <xsl:value-of select="count(phrase[@langue='francais'])"/>
                        </span>
                    </h4>
                    <p>
                        <xsl:apply-templates/>
                    </p>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- mise en forme des phrase -->
    <xsl:template match="//paragraphe[@type='dialogue']/phrase[@langue='francais']">
        <strong>
            <xsl:value-of select="@locuteur"/>
        </strong>
        <xsl:text> : </xsl:text>
        <xsl:apply-templates/>
        <br/>
    </xsl:template>

    <xsl:template match="//phrase[@langue='hongrois']">

    </xsl:template>


</xsl:stylesheet>