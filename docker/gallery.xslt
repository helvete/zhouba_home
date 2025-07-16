<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="yes" />
<xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
    <html>
    <head>
        <title><xsl:value-of select="$title" /></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <style>
        img, video {
            display: inline;
            width: 23%;
            margin: 2mm;
            vertical-align: bottom;
            image-orientation: from-image;
        }
        @media all and (max-width: 20.4cm) {
            img {
                max-width: calc(100% - 4mm);
            }
        }
        body {
            margin: 0;
        }
        </style>
    </head>
    <body>
		<a href='..'>←</a>
		<br />
        <xsl:for-each select="list/directory">
		    <a href="{.}/"><xsl:value-of select="."/></a>
		    <br />
        </xsl:for-each>
        <xsl:for-each select="list/file">
            <xsl:choose>
                <xsl:when test="contains(' mp4 webm mkv avi wmv flv ogv ', concat(' ', substring-after(., '.'), ' '))">
                    <video controls="" src="{.}" alt="{.}" title="{.}"/>
                </xsl:when>
                <xsl:otherwise>
                    <a href="{.}" title="click to enlarge">
                        <img src="{.}" alt="{.}"/>
                    </a>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
		<br />
		<a href='..'>←</a>
    </body>
    </html>
</xsl:template>
</xsl:stylesheet>
