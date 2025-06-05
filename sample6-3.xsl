<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- HTMLとして出力 -->
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <!-- ルートテンプレート -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Yahoo!ニュース - 主要</title>
                <meta charset="UTF-8"/>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                        background-color: #f5f5f5;
                    }
                    .header {
                        background-color: #ff6600;
                        color: white;
                        padding: 20px;
                        border-radius: 10px;
                        margin-bottom: 20px;
                        text-align: center;
                    }
                    .news-item {
                        background-color: white;
                        margin: 10px 0;
                        padding: 20px;
                        border-radius: 8px;
                        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                        border-left: 4px solid #ff6600;
                    }
                    .news-title {
                        font-size: 18px;
                        font-weight: bold;
                        color: #333;
                        margin-bottom: 10px;
                    }
                    .news-link {
                        color: #0066cc;
                        text-decoration: none;
                    }
                    .news-link:hover {
                        text-decoration: underline;
                    }
                    .news-date {
                        font-size: 12px;
                        color: #666;
                        margin-top: 10px;
                    }
                    .news-count {
                        text-align: center;
                        color: #666;
                        margin-bottom: 20px;
                    }
                </style>
            </head>
            <body>
                <div class="header">
                    <h1><xsl:value-of select="rss/channel/title"/></h1>
                    <p><xsl:value-of select="rss/channel/description"/></p>
                    <p>最終更新: <xsl:value-of select="rss/channel/pubDate"/></p>
                </div>
                
                <div class="news-count">
                    合計記事数: <xsl:value-of select="count(rss/channel/item)"/>件
                </div>
                
                <!-- 各ニュース項目を処理 -->
                <xsl:for-each select="rss/channel/item">
                    <div class="news-item">
                        <div class="news-title">
                            <a href="{link}" class="news-link" target="_blank">
                                <xsl:value-of select="title"/>
                            </a>
                        </div>
                        <div class="news-date">
                            公開日時: <xsl:value-of select="pubDate"/>
                        </div>
                        <div class="news-date">
                            コメント: <a href="{comments}" class="news-link" target="_blank">コメントを見る</a>
                        </div>
                    </div>
                </xsl:for-each>
                
                <div style="text-align: center; margin-top: 30px; color: #666;">
                    <p>© LY Corporation - Yahoo!ニュース</p>
                    <p>このページは<a href="{rss/channel/link}" class="news-link">Yahoo!ニュース</a>のRSSフィードから生成されました</p>
                </div>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet> 