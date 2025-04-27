<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
  <xsl:output method="html" version="4.01"
              encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html lang="ja">
      <head>
        <title>
          <xsl:value-of select="books/metadata/title"/>
        </title>
      </head>
      <body>
        <h1><xsl:value-of select="books/metadata/title"/></h1>
        <div>
          作成日：<xsl:value-of select="books/metadata/date_created"/>
        </div>
        <div>
          <xsl:value-of select="count(books/item)"/> 件のメタデータ
        </div>

        <ul>
          <!-- 各 item を処理 -->
          <xsl:apply-templates select="books/item"/>
        </ul>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="item">
    <li>
      <p>タイトル：<xsl:value-of select="title"/></p>
      <p>著者：<xsl:value-of select="creator"/></p>
      <p>出版社：<xsl:value-of select="publisher"/></p>

      <xsl:if test="price">
        <p>価格：<xsl:value-of select="price"/> 円</p>
      </xsl:if>

      <xsl:if test="isbn">
        <p>ISBN：<xsl:value-of select="isbn"/></p>
      </xsl:if>

      <xsl:if test="date">
        <p>
          発行日：
          <xsl:value-of select="date/year"/>年
          <xsl:value-of select="date/month"/>月
          <xsl:value-of select="date/day"/>日
        </p>
      </xsl:if>
    </li>
  </xsl:template>

</xsl:stylesheet>
