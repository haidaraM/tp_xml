<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <!-- Corps HTML -->
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

    <!-- Mise en forme des dialogues -->
    <xsl:template match="paragraphe[@type='dialogue']">
        <table width="90%" align="center">
            <tbody>
                <tr>
                    <td width="45%">
                        <table width="100%" cellpadding="10" border="1">
                            <tbody>
                                <xsl:for-each select="phrase[@langue='francais']">
                                    <tr>
                                        <td width="50">
                                            <img src="images/{@locuteur}.png" title="{@locuteur}"/>
                                        </td>
                                        <td>
                                            <!-- Si la phrase contient un mouton -->
                                            <xsl:if test="contains(.,'mouton')">
                                                <span style="font-size:24; font-weight:bold">
                                                    <xsl:apply-templates/>
                                                    <img src="images/moutonDessin.png" title="Mouton"/>
                                                </span>
                                            </xsl:if>
                                            <!-- Sinon -->
                                            <xsl:if test="not(contains(.,'mouton'))">
                                                <xsl:apply-templates/>
                                            </xsl:if>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </td>
                    <td/>
                    <td width="45%">
                        <table width="100%" cellpadding="10" border="1">
                            <tbody>
                                <xsl:for-each select="phrase[@langue='hongrois']">
                                    <tr>
                                        <td width="50">
                                            <img src="images/{@locuteur}.png" title="{@locuteur}"/>
                                        </td>
                                        <td>
                                            <span style="color:brown; font-style:italic;">
                                                <xsl:apply-templates/>
                                            </span>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <!-- Mise en forme des narrations -->
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

    <!-- Image de la caisse du mouton -->
    <xsl:template match="image">
        <div style="text-align:center">
            <img src="{@chemin}" alt=""/>
        </div>
    </xsl:template>

</xsl:stylesheet>
