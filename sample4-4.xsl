<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html" encoding="UTF-8" />

<xsl:template match="/">
    <html>
        <head>
          <meta charset="utf-8" />
          <title>品名順商品リスト</title>
        </head>
        <body>
            <h1>商品リスト（品名順）</h1>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>品名</th>
                    <th>産地</th>
                    <th>値段</th>
                </tr>
                <!-- yomi属性を使って五十音順（昇順）にソート -->
                <xsl:apply-templates select="list/item">
                    <xsl:sort select="@yomi" data-type="text" order="ascending"/>
                </xsl:apply-templates>
            </table>
        </body>
    </html>
</xsl:template>

<xsl:template match="item">
    <tr>
        <td><xsl:value-of select="@id" /></td>
        <td><xsl:value-of select="n" /></td>
        <td><xsl:value-of select="pref" /></td>
        <td><xsl:value-of select="price" />円</td>
    </tr>
</xsl:template>

</xsl:stylesheet> 