<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rss="http://purl.org/rss/1.0/"
    xmlns:dc="http://purl.org/dc/elements/1.1/">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>朝日新聞 RSS フィード</title>
                <meta charset="UTF-8"/>
            </head>
            <body>
                <h1><xsl:value-of select="/rdf:RDF/rss:channel/rss:title"/></h1>
                
                <div>
                    <p><strong>説明:</strong> <xsl:value-of select="/rdf:RDF/rss:channel/rss:description"/></p>
                    <p><strong>URL:</strong> <a href="{/rdf:RDF/rss:channel/rss:link}"><xsl:value-of select="/rdf:RDF/rss:channel/rss:link"/></a></p>
                    <p><strong>言語:</strong> <xsl:value-of select="/rdf:RDF/rss:channel/dc:language"/></p>
                    <p><strong>発行者:</strong> <xsl:value-of select="/rdf:RDF/rss:channel/dc:creator"/></p>
                    <p><strong>更新日時:</strong> <xsl:value-of select="/rdf:RDF/rss:channel/dc:date"/></p>
                </div>

                <!-- サブジェクト別にグループ化して表示 -->
                <xsl:variable name="subjects" select="/rdf:RDF/rss:item/dc:subject[not(. = preceding::dc:subject)]"/>
                
                <xsl:for-each select="$subjects">
                    <xsl:sort select="."/>
                    <xsl:variable name="currentSubject" select="."/>
                    
                    <h2>カテゴリ: <xsl:value-of select="$currentSubject"/></h2>
                    
                    <xsl:for-each select="/rdf:RDF/rss:item[dc:subject = $currentSubject]">
                        <xsl:sort select="dc:date" order="descending"/>
                        
                        <div>
                            <div>
                                <a href="{rss:link}">
                                    <xsl:value-of select="rss:title"/>
                                </a>
                            </div>
                            <div>
                                <xsl:value-of select="dc:date"/>
                            </div>
                        </div>
                    </xsl:for-each>
                </xsl:for-each>

                <!-- 全記事一覧 -->
                <h2>全記事一覧</h2>
                <xsl:for-each select="/rdf:RDF/rss:item">
                    <xsl:sort select="dc:date" order="descending"/>
                    
                    <div>
                        <div>
                            <a href="{rss:link}">
                                <xsl:value-of select="rss:title"/>
                            </a>
                            <span>（<xsl:value-of select="dc:subject"/>）</span>
                        </div>
                        <div>
                            <xsl:value-of select="dc:date"/>
                        </div>
                    </div>
                </xsl:for-each>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet> 