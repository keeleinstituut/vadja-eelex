<xsl:transform version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
  xmlns:vot="vot">
  
  <xsl:output method="xml"
    indent="yes"
    encoding="utf-8"
  />
  <xsl:include href="VKS-konstandid.xsl"/>
  
  <!-- Alustame docx dokumendielemendist. Oletame, et see sisaldab ainult paragrahve -->
  <xsl:template name="eelex-sr" match="/">
    <xsl:result-document>
      <vot:sr>
        <xsl:apply-templates select="//w:p"/>
      </vot:sr>
    </xsl:result-document>
  </xsl:template>
  
  <!-- Paragrahv on meie jaoks üks märksõna artikkel, iga paragrahv koosneb jooksudest -->
  <xsl:template name="eelex-A" match="w:p">
    <vot:A>
      <xsl:apply-templates select="w:r"/>
    </vot:A><xsl:text>
</xsl:text>
  </xsl:template>
  
  <!-- Jooksud on ühtmoodi küljendatud tekstilõigud -->
  <xsl:template match="w:r">
    <!-- Käsitleme igat jooksu vastavalt selle küljendusele (<w:rPr/>)
         Suuname jooksu <w:t/> edasi õigele eelex-elemendi šabloonile -->
    <xsl:choose>
      <!-- Esimene jooks on ja peab olema märksõna -->
      <xsl:when test="position() = 1">
        <xsl:call-template name="eelex-m">
          <xsl:with-param name="element" select="."/>
        </xsl:call-template>
      </xsl:when>
      
      <!-- Ülakirjaga jooksud on märksõnade homonüümianumbrid, neid käsitatakse märksõnade all -->
      <xsl:when test="exists(./w:rPr/w:vertAlign[@w:val = 'superscript'])">
        <!-- ei tee midagi -->
      </xsl:when>
      
      <!-- Jooksu põhitekst püstkirjas saab eraldi sõelumist -->
      <xsl:when test="exists(./w:rPr/w:rFonts[@w:cs = 'TimesNewRomanPSMT'])
                      and not(empty(./w:t))">
        <xsl:analyze-string
          select="./w:t"
          regex="\P{{Z}}+"> <!-- kõik mis ei ole unikoodis tühemik -->
          
          <xsl:matching-substring>
            <xsl:choose>
              <!-- Märgi kohanimed -->
              <xsl:when test=". = $kohanimede-loend"><vot:kyla><xsl:value-of select="."/></vot:kyla></xsl:when>
              <!-- Märgi murded -->
              <xsl:when test="false()"><vot:murre><xsl:value-of select="."/></vot:murre></xsl:when>
              <!-- Märgi autorite ja allikate nimed -->
              <xsl:when test=". = $allikate-loend"><vot:autor><xsl:value-of select="."/></vot:autor></xsl:when>
              <!-- Ülejäänud tekstisõned lase lihtsalt läbi -->
              <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
            </xsl:choose>
          </xsl:matching-substring>
          
          <!-- väljastame kõik tühemikud jms mis me sõelumisel välja jätsime -->
          <xsl:non-matching-substring><xsl:value-of select="."/></xsl:non-matching-substring>

        </xsl:analyze-string>
      </xsl:when>
      
      <!-- ülejäänud juhtumid väljastatakse testimisel -->
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(w:t)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <!-- Märksõna ekstraheerimine -->
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