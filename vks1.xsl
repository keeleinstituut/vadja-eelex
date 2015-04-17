<xsl:transform version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
  xmlns:vot="vot">
  
  <xsl:output method="xml"
    indent="yes"
    encoding="utf-8"/>
  
  <xsl:template name="eelex-sr" match="/">
    <xsl:result-document>
      <vot:sr>
        <xsl:apply-templates select="//w:p"/>
      </vot:sr>
    </xsl:result-document>
  </xsl:template>
  
  <xsl:template name="eelex-A" match="w:p">
    <vot:A>
      <xsl:apply-templates select="w:r"/>
    </vot:A><xsl:text>
</xsl:text>
  </xsl:template>
  
  <xsl:template match="w:r">
    <!-- kirjuta case juhtumid, mis sõltuvad w:rPr elemendist ja
         suunab w:t edasi õigele eelex-elemendi šabloonile -->
    <xsl:choose>
      <!-- Esimene jooks on ja peab olema märksõna -->
      <xsl:when test="position() = 1">
        <xsl:call-template name="eelex-m">
          <xsl:with-param name="element" select="."/>
        </xsl:call-template>
      </xsl:when>
      
      <!-- homonüümianumbrit peaks käsitlema eelex-m all -->
      <!-- <xsl:when test="w:rPr/w:vertAlign[@w:val = 'superscript']">
        <vot:hom><xsl:value-of select="w:t"/></vot:hom>
      </xsl:when>
      -->
      
      <!-- ülejäänud juhtumeid ei peaks lõpuks olema -->
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(w:t)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="eelex-m">
    <xsl:param name="element"/>
    <vot:m>
      <!-- homonüümianumber, kui järgmine jooks sisaldab ülakirja -->
      <xsl:if test="$element/following-sibling::w:r[1]
                    /w:rPr/w:vertAlign[@w:val = 'superscript']">
        <xsl:attribute name="vot:i"
          select="xs:integer($element/following-sibling::w:r[1]/w:t)"/>
      </xsl:if>
      
      <!-- järjestuselement -->
      <!-- @todo tee funktsiooniga mis teisendab täppidega teksti! -->
      <xsl:attribute name="vot:O" select="normalize-space($element/w:t)"/>
      
      <!-- märksõna tekst -->
      <xsl:value-of select="normalize-space($element/w:t)"/>
    </vot:m>
  </xsl:template>
  
</xsl:transform>