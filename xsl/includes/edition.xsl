<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">
    
    <xsl:template match="tei:teiCorpus/tei:text/tei:back">
        <xsl:result-document format="html" encoding="UTF-8" href="edition.html">
            <!-- pour déclaration DOCTYPE html 5 : -->
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$header"/>
                    <xsl:copy-of select="$headerSlide"/>
                    <div class="row">
                        <xsl:apply-templates select="tei:div[@type='about']"/>
                    </div>
                    <xsl:apply-templates select="//tei:listBibl" mode="bibl"/>
                    <xsl:apply-templates select="tei:div[@type='about']/tei:div[./tei:head='Équipe']"/>
                    <xsl:copy-of select="$footer"/>
                    <xsl:copy-of select="$js"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:listBibl" mode="bibl">
        <div class="row">
            <div class="large-8 large-offset-4 columns">
                <h2>Bibliographie</h2>
                <ul class="no-bullet">
                    <xsl:for-each select="tei:bibl">
                        <xsl:sort select="tei:author[1] | tei:title[not(ancestor::tei:bibl/tei:author)]" order="ascending" case-order="upper-first"/>
                        <li>
                            <xsl:for-each select="./*">
                                <xsl:choose>
                                    <xsl:when test="position() != last()"><xsl:apply-templates select="." mode="bibl"/><xsl:text>, </xsl:text></xsl:when>
                                    <xsl:otherwise><xsl:apply-templates select="." mode="bibl"/><xsl:text>.</xsl:text></xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </li>
                    </xsl:for-each>
                </ul>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:author[ancestor::tei:listBibl]" mode="bibl">
        <xsl:choose>
            <xsl:when test="tei:surname"><span class="persName"><xsl:apply-templates select="tei:surname"/></span><xsl:text> (</xsl:text><xsl:apply-templates select="tei:forename"/><xsl:text>)</xsl:text></xsl:when>
            <xsl:when test="tei:orgName"><span class="persName"><xsl:apply-templates select="tei:orgName"></xsl:apply-templates></span></xsl:when>
            <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:title[ancestor::tei:listBibl]" mode="bibl">
        <xsl:choose>
            <xsl:when test="ancestor::tei:bibl[@type='monographie']"><span class="italic"><xsl:apply-templates/></span></xsl:when>
            <xsl:when test="ancestor::tei:bibl[@type='article' or @type='dossier']"><xsl:text>« </xsl:text><span class="italic"><xsl:apply-templates/></span><xsl:text> »</xsl:text></xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:ref[ancestor::tei:listBibl]" mode="bibl">
        <a href="{@target}" target="_blank"><span class="persName">url</span></a>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='about']">
        <div class="large-4 columns">
            <h4>Liens annexes : </h4>
            <ul class="no-bullet">
                <xsl:for-each select="tei:div[@type='ressourcesExt']/tei:list/tei:item">
                    <li>
                        <a href="{./tei:ref/@target}"><xsl:apply-templates select="./tei:ref"/></a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
        <div class="large-8 columns"> 
            <h1>Édition électronique de correspondance</h1>
            <xsl:for-each select="tei:div[not(@type='ressourcesExt')][not(./tei:head='Équipe')]">
                <xsl:if test="tei:head"><h2><xsl:apply-templates select="tei:head"/></h2></xsl:if>
                <xsl:for-each select="tei:p | tei:list">
                    <p><xsl:apply-templates select="."/></p>
                </xsl:for-each>
            </xsl:for-each>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='about']/tei:div[./tei:head='Équipe']">
        <div class="row">
            <div class="large-8 large-offset-4 columns">
                <xsl:if test="tei:head"><h2><xsl:apply-templates select="tei:head"/></h2></xsl:if>
                <xsl:for-each select="tei:p | tei:list">
                    <p><xsl:apply-templates select="."/></p>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:list[ancestor::tei:div[@type='about']][not(@*)]">
        <ul class="no-bullet">
            <xsl:for-each select="tei:item">
                <li><xsl:apply-templates select="."/></li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
</xsl:stylesheet>