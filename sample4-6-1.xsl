<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- 出力はインデント付きの XML -->
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <!-- ルート: <output> を生成し <expr> にテンプレート適用 -->
  <xsl:template match="/">
    <output>
      <xsl:apply-templates select="input/expr"/>
    </output>
  </xsl:template>

  <!-- 各 <expr> 要素を演算して <data> に格納 -->
  <xsl:template match="expr">
    <data>
      <xsl:choose>
        <!-- 加算 a + b -->
        <xsl:when test="@operator = 'add'">
          <xsl:value-of select="p1 + p2"/>
        </xsl:when>

        <!-- 減算 a - b -->
        <xsl:when test="@operator = 'sub'">
          <xsl:value-of select="p1 - p2"/>
        </xsl:when>

        <!-- 乗算 a * b -->
        <xsl:when test="@operator = 'multiply'">
          <xsl:value-of select="p1 * p2"/>
        </xsl:when>

        <!-- 除算 a div b -->
        <xsl:when test="@operator = 'divide'">
          <xsl:value-of select="p1 div p2"/>
        </xsl:when>

        <!-- 余り a mod b -->
        <xsl:when test="@operator = 'mod'">
          <xsl:value-of select="p1 mod p2"/>
        </xsl:when>

        <!-- 想定外の演算子：エラー表示 -->
        <xsl:otherwise>
          <xsl:text>Unsupported operator</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </data>
  </xsl:template>

</xsl:stylesheet>
