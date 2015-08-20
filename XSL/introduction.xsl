<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <!-- pour déclaration DOCTYPE html 5 : -->
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title>Correspondance d'Armand Horel</title>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <!--feuilles de style-->  
                <link rel="stylesheet" href="../STYLE/foundation/css/foundation.css" />
                <link rel="stylesheet" type="text/css" href="../STYLE/personnalisation/style.css"/>
                <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>                
                <script src="../STYLE/foundation/js/vendor/modernizr.js">/*Pour transformation xslt*/</script>  
                <script src="../JS/js/jquery.js">/*Pour transformation xslt*/</script>
                <script src="../JS/menu/long_dropdown.js">/*Pour transformation xslt*/</script>
            </head>
            <body>                                                                                     
                <header class="row border-top">                    
                    <img src="../IMAGES/photos_site/logo_bdic.gif" alt="logo_BDIC"/>                                                                                                                                    
                    <div class="contain-to-grid sticky">
                        <nav class="top-bar" data-topbar="yes" role="navigation">                    
                            <ul class="title-area">                        
                                <li class="name"><h1><a href="http://www.bdic.fr/">BDIC</a></h1></li>                            
                                <!-- Menu pour petits écrans -->                                                            
                                <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>                                 
                            </ul>                        
                            <section class="top-bar-section">                        
                                <!-- Partie gauche du menu -->                            
                                <ul class="left">                            
                                    <li><a href="../index.html">Accueil</a></li>                                    
                                    <li class="has-dropdown">                                
                                        <a href="#">Correspondance d'Armand Horel</a>                                    
                                        <ul class="dropdown">                                    
                                            <li class="has-dropdown">
                                                <a href="#">Accès par expéditeur</a>
                                                <ul class="dropdown">
                                                    <xsl:apply-templates select="//tei:particDesc/tei:listPerson[@type='sentBy']" mode="lien"/>
                                                </ul>
                                            </li>      
                                            <li><a href="projet/chronologie.html">Accès chronologique</a></li>                                        
                                            <li><a href="projet/geographie.html">Accès géographique</a></li>                                            
                                        </ul>                                    
                                    </li>                                                              
                                </ul>                            
                                <!-- Partie droite -->                            
                                <ul class="right">                            
                                    <li><a href="projet/index_edition.html">Index</a></li>                                
                                    <li><a href="#">A propos de l'édition</a></li>                                    
                                </ul>                              
                            </section>                        
                        </nav>
                    </div>                                            
                </header>
                <div class="row">
                    <img src="../IMAGES/photos_site/slide_14_18_1.jpg" alt="header"/>
                </div>
                <div class="row border">
                    <div class="large-4 columns">                         
                        <h4>Liens annexes : </h4>                        
                        <xsl:apply-templates select="//tei:front/tei:div[@xml:id='introduction_generale']/tei:linkGrp"/>
                    </div>
                    <div class="large-8 columns"> 
                        <h1>Correspondance d'Armand Horel, un marin dans la campagne d'Orient.</h1>                        
                        <xsl:apply-templates select="//tei:front/tei:div[@xml:id='introduction_generale']"/>                        
                    </div>                    
                </div>                 
                <footer class="row border">
                    <div class="small-12 medium-12 large-6 columns">                                                                                 
                        <div class="block_footer_img">
                            <a href="http://www.bdic.fr/"><img style="margin-top:5px;" src="../IMAGES/photos_site/logo_bdic.gif" alt="logo_BDIC"/></a>
                            <a href="http://www.u-paris10.fr/"><img style="margin-top:5px;" src="../IMAGES/photos_site/paris_ouest.png" alt="logo_Paris_Ouest"/></a>
                            <a href="http://www.u-plum.fr/"><img style="margin-top:5px;" src="../IMAGES/photos_site/paris_lumieres.png" alt="logo_Paris_Lumiere"/></a>
                        </div>
                    </div>
                    <div class="small-12 medium-12 large-6 columns">
                        <div class="row">
                            <div class="small-6 medium-6 large-6 columns">                            
                                <div class="block_footer">
                                    <b>La bibliothèque</b>                            
                                    <ul class="link">                                
                                        <li>Site de Nanterre</li>                                
                                        <li>6, allée de l'Université</li>                                
                                        <li>F-92001 Nanterre Cedex</li>                                                                                                                                
                                    </ul>
                                </div>                                    
                            </div>
                            <div class="small-6 medium-6 large-6 columns">                            
                                <div class="block_footer">
                                    <b>Le musée</b>                            
                                    <ul class="link">                                
                                        <li>Site de Paris</li>                                
                                        <li>Hôtel national des Invalides</li>                                
                                        <li>129, rue de Grenelle 75007 Paris</li>                                                                                                                                
                                    </ul>
                                </div>                                    
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-12 text-right">
                                <a class="lien_footer" href="projet/credits.html">Crédits</a>                        
                            </div>
                        </div>
                    </div>
                </footer>               
                <!--Permettent aux listes de se dérouler automatiquement + menu adaptatif (doivent être placés en bas de page)-->    
                <script src="../STYLE/foundation/js/vendor/jquery.js">/*Pour transformation xslt*/</script>
                <script src="../STYLE/foundation/js/foundation.min.js">/*Pour transformation xslt*/</script>
                <script>$(document).foundation();</script>
            </body>  
        </html>    
    </xsl:template>
    
    <xsl:template match="//tei:front/tei:div[@xml:id='introduction_generale']">
        <xsl:for-each select="tei:div">
            <xsl:if test="tei:head">
                <h2 class="subheader"><xsl:apply-templates select="tei:head"/></h2>
            </xsl:if>
            <xsl:for-each select="tei:p">
                <p><xsl:apply-templates/></p>
            </xsl:for-each>
        </xsl:for-each>               
   </xsl:template>
    
    <xsl:template match="//tei:front[@xml:id='introduction_generale']//tei:hi">
        <xsl:if test="@rend='super'">
            <sup>
                <xsl:apply-templates/>
            </sup>
        </xsl:if>
        <xsl:if test="@rend='italic'">
            <i>
                <xsl:apply-templates/>
            </i>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="//tei:front/tei:div[@xml:id='introduction_generale']/tei:linkGrp">
        <xsl:choose>
            <xsl:when test="@type='Sender'">
                <ul>
                    <li>
                        <xsl:variable name="name" select="replace(@corresp,'#','')"/>
                        <xsl:apply-templates select="//tei:person[@xml:id=$name]/tei:persName" mode="ref_lien"/>
                        <ul>
                            <xsl:if test="tei:link[@type='naissance']">
                                <xsl:variable name="link" select="tei:link[@type='naissance']/@target"/>                                
                                <li>
                                    <a href="{$link}">Acte de naissance</a>
                                </li>
                            </xsl:if>
                            <xsl:if test="tei:link[@type='registre_matricule']">
                                <xsl:variable name="link" select="tei:link[@type='registre_matricule']/@target"/>                                
                                <li>
                                    <a href="{$link}">Fiche matricule</a>
                                </li>
                            </xsl:if>
                        </ul>
                    </li>                                                            
                </ul>                
            </xsl:when>
            <xsl:when test="@type='received'">
                <ul>
                    <li>
                        <xsl:variable name="name" select="replace(@corresp,'#','')"/>
                        <xsl:apply-templates select="//tei:person[@xml:id=$name]/tei:persName" mode="ref_lien"/>
                        <ul>
                            <xsl:if test="tei:link[@type='naissance']">
                                <xsl:variable name="link" select="tei:link[@type='naissance']/@target"/>                                
                                <li>
                                    <a href="{$link}">Acte de naissance</a>
                                </li>
                            </xsl:if>
                            <xsl:if test="tei:link[@type='registre_matricule']">
                                <xsl:variable name="link" select="tei:link[@type='registre_matricule']/@target"/>                                
                                <li>
                                    <a href="{$link}">Fiche matricule</a>
                                </li>
                            </xsl:if>
                        </ul>
                    </li>                                                            
                </ul>                
            </xsl:when>
            <xsl:when test="@type='bibliotheque_num'">
                <xsl:variable name="link" select="tei:link[@type='bibliotheque_num']/@target"/>
                <ul>
                    <li>Bibliothèque numérique Argonnaute</li>
                    <ul>
                        <li>
                            <a href="{$link}">Accédez à l'intégralité du fonds</a>
                        </li>
                    </ul>
                </ul>
            </xsl:when>
            <xsl:otherwise>
                <ul>
                    <li>
                        <xsl:variable name="name" select="replace(@corresp,'#','')"/>
                        <xsl:apply-templates select="//tei:person[@xml:id=$name]/tei:persName" mode="ref_lien"/>
                        <ul>
                            <xsl:if test="tei:link[@type='naissance']">
                                <xsl:variable name="link" select="tei:link[@type='naissance']/@target"/>                                
                                <li>
                                    <a href="{$link}">Acte de naissance</a>
                                </li>
                            </xsl:if>
                            <xsl:if test="tei:link[@type='registre_matricule']">
                                <xsl:variable name="link" select="tei:link[@type='registre_matricule']/@target"/>                                
                                <li>
                                    <a href="{$link}">Fiche matricule</a>
                                </li>
                            </xsl:if>
                            <xsl:if test="tei:link[@type='mpf']">
                                <xsl:variable name="link" select="tei:link[@type='mpf']/@target"/>                                
                                <li>
                                    <a href="{$link}">Base des morts pour la France</a>
                                </li>
                            </xsl:if>
                        </ul>
                    </li>                                                            
                </ul>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    
    
    <xsl:template match="//tei:listPerson[@xml:id='person']/tei:person/tei:persName" mode="ref_lien">
        <xsl:value-of select="normalize-space(tei:forename)"/>
        <xsl:text> </xsl:text>                                
        <xsl:apply-templates select="tei:surname"/>               
        <xsl:text>.</xsl:text>                
    </xsl:template>
    
    <xsl:template match="//tei:particDesc/tei:listPerson[@type='sentBy']" mode="lien">
        <xsl:for-each select="tei:person">
            <xsl:variable name="id" select="concat('#',@xml:id)"/>
            <xsl:if test="//tei:correspDesc//tei:ref/tei:persName[@corresp=$id]">
                <li class="has-dropdown">
                    <a class="link" href="#">
                        <xsl:apply-templates select="tei:persName"/><xsl:text> à :</xsl:text>
                    </a>
                    <ul class="dropdown">                    
                        <xsl:for-each select="//tei:correspDesc//tei:ref[descendant::tei:persName[@corresp=$id]]">
                            <xsl:sort select=" tei:date/@cert" order="ascending" data-type="text"/>
                            <xsl:sort select="replace(tei:date/@when, '-', '')" order="ascending" data-type="number"/>
                            <xsl:variable name="target" select="replace(@target,'\.\./','')"/>
                            <xsl:variable name="link" select="replace($target,'xml','html')"/>
                            <li><a href="{$link}"><xsl:value-of select="tei:persName[@type='deliveredTo']"/><xsl:text> : </xsl:text><xsl:value-of select="tei:placeName"/><xsl:text>, </xsl:text><xsl:value-of select="tei:date"/></a></li>
                        </xsl:for-each>
                    </ul>
                </li>    
            </xsl:if>                        
        </xsl:for-each>        
    </xsl:template>
    
</xsl:stylesheet>