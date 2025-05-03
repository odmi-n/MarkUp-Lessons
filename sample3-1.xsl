<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
  <html>
    <head>
      <title>八百広 商品一覧</title>
      <style>
        table {
          border-collapse: collapse;
          margin-bottom: 20px;
        }
        th, td {
          border: 1px solid black;
          padding: 5px 10px;
        }
        th {
          background-color: #f2f2f2;
        }
        h2 {
          margin-top: 20px;
        }
      </style>
    </head>
    <body>
      <h1>八百広 商品一覧</h1>
      
      <!-- 野菜のセクション -->
      <h2>野菜</h2>
      <table>
        <tr>
          <th>商品名</th>
          <th>価格</th>
          <th>産地</th>
        </tr>
        <xsl:for-each select="//item[@category='野菜']">
          <xsl:sort select="name"/>
          <tr>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="price"/>円</td>
            <td><xsl:value-of select="pref"/></td>
          </tr>
        </xsl:for-each>
      </table>
      
      <!-- 果物のセクション -->
      <h2>果物</h2>
      <table>
        <tr>
          <th>商品名</th>
          <th>価格</th>
          <th>産地</th>
        </tr>
        <xsl:for-each select="//item[@category='果物']">
          <xsl:sort select="name"/>
          <tr>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="price"/>円</td>
            <td><xsl:value-of select="pref"/></td>
          </tr>
        </xsl:for-each>
      </table>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet> 