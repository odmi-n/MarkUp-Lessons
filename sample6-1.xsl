<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  
  <!-- ルートテンプレート -->
  <xsl:template match="/">
    <xsl:element name="store">
      <!-- メタ情報の変換 -->
      <xsl:element name="store-info">
        <xsl:for-each select="list/meta/*">
          <xsl:element name="{name()}">
            <xsl:value-of select="."/>
          </xsl:element>
        </xsl:for-each>
      </xsl:element>
      
      <!-- 商品情報の変換 -->
      <xsl:element name="products">
        <xsl:for-each select="list/item">
          <xsl:element name="product">
            <!-- 属性の設定 -->
            <xsl:attribute name="product-id">
              <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:attribute name="type">
              <xsl:value-of select="@category"/>
            </xsl:attribute>
            
            <!-- 商品データ要素 -->
            <xsl:element name="product-name">
              <xsl:value-of select="name"/>
            </xsl:element>
            <xsl:element name="price">
              <xsl:attribute name="currency">JPY</xsl:attribute>
              <xsl:value-of select="price"/>
            </xsl:element>
            <xsl:element name="origin">
              <xsl:value-of select="pref"/>
            </xsl:element>
          </xsl:element>
        </xsl:for-each>
      </xsl:element>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet> 