<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" version="1.0"/>
    <xsl:template match="//event[contains(title,'Workaholics')]">
        <ul class="media-list">
            <li class="media">
                <div class="media-body">
                    <h4 class="media-heading">
                        <xsl:value-of select="title"/>
                    </h4>
                    <div>
                        le <xsl:value-of select="substring(dtstart,7,2)"/>-<xsl:value-of
                            select="substring(dtstart,5,2)"/>-<xsl:value-of select="substring(dtstart,1,4)"/>
                        de <xsl:value-of select="substring(dtstart,10,2)"/>h<xsl:value-of
                            select="substring(dtstart,12,2)"/> à
                        <xsl:value-of select="substring(dtend,10,2)"/>h<xsl:value-of select="substring(dtend,12,2)"/>
                    </div>
                    <div>
                        <xsl:value-of select="summary"/>
                    </div>
                    <div>
                        <a href="{url}">
                            <xsl:value-of select="url"/>
                        </a>
                    </div>
                    <div>
                        <xsl:value-of select="description"/>
                    </div>
                </div>
            </li>

        </ul>
    </xsl:template>
</xsl:stylesheet>