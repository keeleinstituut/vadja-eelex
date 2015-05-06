<xsl:transform version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
  xmlns:vot="vot">
  
  <!-- See moodul on osa projektist Vadja keele sõnastiku muundamine EELexi XMLiks 
       Copyright Kristian Kankainen, Eesti Keele Instituut, 2015 -->
  
  <xsl:variable name="kohanimed">
    <kohanimi nimi="J" liik="Läänevadja küla">
      <eesti>Jõgõperä</eesti>
      <vene>Краколье</vene>
    </kohanimi>
    <kohanimi nimi="Ja" liik="Läänevadja küla">
      <eesti>Jarvikoištšülä</eesti>
      <vene>Бабино</vene>
    </kohanimi>
    <kohanimi nimi="K" liik="Läänevadja küla">
      <eesti>Kattila</eesti>
      <vene>Котлы</vene>
    </kohanimi>
    <kohanimi nimi="Ke" liik="Läänevadja küla">
      <eesti>Kerstova</eesti>
      <vene>Керстово</vene>
    </kohanimi>
    <kohanimi nimi="Ki" liik="Läänevadja küla">
      <eesti>Kikeritsa</eesti>
      <vene>Кикерицы</vene>
    </kohanimi>
    <kohanimi nimi="Kõ" liik="Läänevadja küla">
      <eesti>Kõrvõttula</eesti>
      <vene>Корветино</vene>
    </kohanimi>
    <kohanimi nimi="L" liik="Läänevadja küla">
      <eesti>Lempola</eesti>
      <vene>Раннолово</vene>
    </kohanimi>
    <kohanimi nimi="Li" liik="Läänevadja küla">
      <eesti>Liivtšülä</eesti>
      <vene>Пески</vene>
    </kohanimi>
    <kohanimi nimi="Lu" liik="Läänevadja küla">
      <eesti>Luuditsa</eesti>
      <vene>Лужицы</vene>
    </kohanimi>
    <kohanimi nimi="M" liik="Läänevadja küla">
      <eesti>Mati</eesti>
      <vene>Маттия</vene>
    </kohanimi>
    <kohanimi nimi="Mu" liik="Läänevadja küla">
      <eesti>Muukkova</eesti>
      <vene>Мукково</vene>
    </kohanimi>
    <kohanimi nimi="P" liik="Läänevadja küla">
      <eesti>Pummala</eesti>
      <vene>Пумалицы</vene>
    </kohanimi>
    <kohanimi nimi="Pi" liik="Läänevadja küla">
      <eesti>Pihlaala</eesti>
      <vene>Пиллово</vene>
    </kohanimi>
    <kohanimi nimi="Po" liik="Läänevadja küla">
      <eesti>Pontizõõ</eesti>
      <vene>Понделово</vene>
    </kohanimi>
    <kohanimi nimi="R" liik="Läänevadja küla">
      <eesti>Rudja</eesti>
      <vene>Рудилово</vene>
    </kohanimi>
    <kohanimi nimi="Ra" liik="Läänevadja küla">
      <eesti>Rajo</eesti>
      <vene>Межники</vene>
    </kohanimi>
    <kohanimi nimi="S" liik="Läänevadja küla"> <!-- VKSis märgitud kui Sa ?? -->
      <eesti>Savvokkala</eesti>
      <vene>Савикино</vene>
    </kohanimi>
    <kohanimi nimi="U" liik="Läänevadja küla">
      <eesti>Undova</eesti>
      <vene>Ундово</vene>
    </kohanimi>
    <kohanimi nimi="V" liik="Läänevadja küla">
      <eesti>Velikkä</eesti>
      <vene>Великино</vene>
    </kohanimi>
    
    <kohanimi nimi="I" liik="Idavadja küla">
      <eesti>Itšäpäivä</eesti>
      <vene>Иципино</vene>
    </kohanimi>
    <kohanimi nimi="Ii" liik="Idavadja küla">
      <eesti>Iivanaisi</eesti>
      <vene>Ивановское</vene>
    </kohanimi>
    <kohanimi nimi="Kl" liik="Idavadja küla">
      <eesti>Kliimettina</eesti>
      <vene>Климотино</vene>
    </kohanimi>
    <kohanimi nimi="Ko" liik="Idavadja küla">
      <eesti>Kozlova</eesti>
      <vene>Козлово</vene>
    </kohanimi>
    <kohanimi nimi="Ma" liik="Idavadja küla">
      <eesti>Mahu</eesti>
      <vene>Подмошье</vene>
    </kohanimi>
    <kohanimi nimi="Ku" liik="Idavadja küla">
      <eesti>Kukkuzi</eesti>
      <vene>Куровицы</vene>
    </kohanimi>
    
    <kohanimi nimi="" liik="Veekogu">
      <eesti>Laugaz</eesti>
      <vene>река Луга</vene>
    </kohanimi>
    <kohanimi nimi="" liik="Veekogu">
      <eesti>Süväjärvi</eesti>
      <vene>Глубокое озеро</vene>
    </kohanimi>
    <kohanimi nimi="" liik="Veekogu">
      <eesti>Jarvikoisjärvi</eesti>
      <vene>Бабинское озеро</vene>
    </kohanimi>
    <kohanimi nimi="" liik="Veekogu">
      <eesti>Võhkajärvi</eesti>
      <vene>Лешее озеро</vene>
    </kohanimi>
    <kohanimi nimi="" liik="Veekogu">
      <eesti>Siista</eesti>
      <vene>река Систа</vene>
    </kohanimi>
    <kohanimi nimi="" liik="Veekogu">
      <eesti>Suma</eesti>
      <vene>река Сума</vene>
    </kohanimi>
    <kohanimi nimi="" liik="Veekogu">
      <eesti>Pärspää järvi</eesti>
      <vene>Липовское озеро</vene>
    </kohanimi>
    <kohanimi nimi="" liik="Veekogu">
      <eesti>Koppõni järvi</eesti>
      <vene>Копанское озеро</vene>
    </kohanimi>
    <kohanimi nimi="" liik="Veekogu">
      <eesti>Sairaa järvi</eesti>
      <vene>Хаболовское озеро</vene>
    </kohanimi>
    <kohanimi nimi="" liik="Veekogu">
      <eesti>Palokkaa järvi</eesti>
      <vene>Судачье озеро</vene>
    </kohanimi>
    <kohanimi nimi="" liik="Veekogu">
      <eesti>Peen meri</eesti>
      <vene>Лужская губа</vene>
    </kohanimi>
    <kohanimi nimi="" liik="Veekogu">
      <eesti>Kabrio lahti</eesti>
      <vene>Копорская губа</vene>
    </kohanimi>
    
    <kohanimi nimi="" liik="Poolsaar">
      <eesti>Kurkolaa nenä</eesti>
      <vene>Кургальский полуостров</vene>
    </kohanimi>
    <kohanimi nimi="" liik="Poolsaar">
      <eesti>Soikkolaa nenä</eesti>
      <vene>Сойкинский полуостров</vene>
    </kohanimi>
  </xsl:variable>
  
  <!-- Kohanimede loend koostatakse automaatselt $kohanimede @nimi-dest -->
  <xsl:variable name="kohanimede-loend"
    select="distinct-values($kohanimed/kohanimi/@nimi)"/>
  
  
  <!-- Allikad ja autorid -->
  <xsl:variable name="allikad">
    <allikas lühend="Ahl."></allikas>
    <allikas lühend="Al."></allikas>
    <allikas lühend="Ar."></allikas>
    <allikas lühend="Bor."></allikas>
    <allikas lühend="Eur."></allikas>
    <allikas lühend="Gro."></allikas>
    <allikas lühend="Kett."></allikas>
    <allikas lühend="Len."></allikas>
    <allikas lühend="Lön."></allikas>
    <allikas lühend="Must."></allikas>
    <allikas lühend="Mäg."></allikas>
    <allikas lühend="Pal."></allikas> <!-- alakirjas number? -->
    <allikas lühend="Pal."></allikas> <!-- alakirjas number? -->
    <allikas lühend="Por."></allikas>
    <allikas lühend="Reg."></allikas>
    <allikas lühend="reg."></allikas> <!-- alakirjas number? -->
    <allikas lühend="reg."></allikas> <!-- alakirjas number? -->
    <allikas lühend="Ränk."></allikas>  <!-- aga punkt? -->
    <allikas lühend="Salm."></allikas> <!-- alakirjas number? -->
    <allikas lühend="Salm."></allikas>
    <allikas lühend="Set."></allikas>
    <allikas lühend="Sj."></allikas>
    <allikas lühend="Tsv."></allikas>
    <allikas lühend="Tum."></allikas>
    <allikas lühend="Vilb."></allikas>
  </xsl:variable>
  
  <xsl:variable name="allikate-loend"
     select="distinct-values($allikad/allikas/@lühend)"/>
  
  
  <xsl:variable name="lühendid">
    <lühend akronüüm="a.">
      <eesti>aasta</eesti>
      <vene>год</vene>
    </lühend>
    <lühend akronüüm="abl.">
      <eesti>ablatiiv</eesti>
      <vene>аблатив</vene>
    </lühend>
    <lühend akronüüm="ad.">
      <eesti>adessiiv</eesti>
      <vene>адессив</vene>
    </lühend>
    <lühend akronüüm="adj.">
      <eesti>adjektiiv</eesti>
      <vene>имя прилагательное</vene>
    </lühend>
    <lühend akronüüm="adv.">
      <eesti>adverb</eesti>
      <vene>наречие</vene>
    </lühend>
    <lühend akronüüm="all.">
      <eesti>allatiiv</eesti>
      <vene>аллатив</vene>
    </lühend>
    <lühend akronüüm="dem.">
      <eesti>deminutiivne</eesti>
      <vene>уменьшительный</vene>
    </lühend>
    <lühend akronüüm="deskr.">
      <eesti>deskriptiivne</eesti>
      <vene>дескриптивный, описательный</vene>
    </lühend>
    <lühend akronüüm="e">
      <eesti>eesti</eesti>
      <vene>эстонский</vene>
    </lühend>
    <lühend akronüüm="e.">
      <eesti>ehk</eesti>
      <vene>или</vene>
    </lühend>
    <lühend akronüüm="el.">
      <eesti>elatiiv</eesti>
      <vene>элатив</vene>
    </lühend>
    <lühend akronüüm="fig.">
      <eesti>figuraalne</eesti>
      <vene>фигуральный, переносный</vene>
    </lühend>
    <lühend akronüüm="frekv.">
      <eesti>frekventatiivne</eesti>
      <vene>многократный</vene>
    </lühend>
    <lühend akronüüm="g.">
      <eesti>genitiiv</eesti>
      <vene>генитив</vene>
    </lühend>
    <lühend akronüüm="hrl.">
      <eesti>harilikult</eesti>
      <vene>обыкновенно</vene>
    </lühend>
    <lühend akronüüm="ill.">
      <eesti>illatiiv</eesti>
      <vene>иллатив</vene>
    </lühend>
    <lühend akronüüm="imper.">
      <eesti>imperatiiv</eesti>
      <vene>повелительное наклонение</vene>
    </lühend>
    <lühend akronüüm="imperf.">
      <eesti>imperfekt</eesti>
      <vene>имперфект</vene>
    </lühend>
    <lühend akronüüm="impers.">
      <eesti>impersonaalne</eesti>
      <vene>безличный</vene>
    </lühend>
    <lühend akronüüm="in.">
      <eesti>inessiiv</eesti>
      <vene>инессив</vene>
    </lühend>
    <lühend akronüüm="indekl.">
      <eesti>indeklinaabel</eesti>
      <vene>несклоняемый</vene>
    </lühend>
    <lühend akronüüm="inf.">
      <eesti>infinitiiv</eesti>
      <vene>инфинитив</vene>
    </lühend>
    <lühend akronüüm="interj.">
      <eesti>interjektsioon</eesti>
      <vene>междометие</vene>
    </lühend>
    <lühend akronüüm="interrog.">
      <eesti>interrogatiivpronoomen</eesti>
      <vene>вопросительное местоимение</vene>
    </lühend>
    <lühend akronüüm="intrans.">
      <eesti>intransitiivne</eesti>
      <vene>непереходный</vene>
    </lühend>
    <lühend akronüüm="is">
      <eesti>isuri</eesti>
      <vene>ижорский</vene>
    </lühend>
    <lühend akronüüm="jm.">
      <eesti>ja muud</eesti>
      <vene>и прочее</vene>
    </lühend>
    <lühend akronüüm="jms.">
      <eesti>ja muud sellised</eesti>
      <vene>и тому подобное</vene>
    </lühend>
    <lühend akronüüm="jne.">
      <eesti>ja nii edasi</eesti>
      <vene>и так далее</vene>
    </lühend>
    <lühend akronüüm="jt.">
      <eesti>ja teised</eesti>
      <vene>и другие</vene>
    </lühend>
    <lühend akronüüm="kk.">
      <eesti>kõnekäänd</eesti>
      <vene>поговорка</vene>
    </lühend>
    <lühend akronüüm="kom.">
      <eesti>komitatiiv</eesti>
      <vene>комитатив</vene>
    </lühend>
    <lühend akronüüm="komp.">
      <eesti>komparatiiv(ne)</eesti>
      <vene>сравнительная степень‚ сравнительный</vene>
    </lühend>
    <lühend akronüüm="kond.">
      <eesti>konditsionaal(ne)</eesti>
      <vene>условное наклонение, условный</vene>
    </lühend>
    <lühend akronüüm="konj.">
      <eesti>konjunktsioon</eesti>
      <vene>союз</vene>
    </lühend>
    <lühend akronüüm="Kr">
      <eesti>kreevini murre</eesti>
      <vene>кревинский диалект</vene>
    </lühend>
    <lühend akronüüm="Ku">
      <eesti>Kukkusi murre</eesti>
      <vene>диалект дер. Куровицы</vene>
    </lühend>
    <lühend akronüüm="kõnek.">
      <eesti>kõnekeelne</eesti>
      <vene>из разговорного языка</vene>
    </lühend>
    <lühend akronüüm="lastek.">
      <eesti>lastekeelne</eesti>
      <vene>из детского языка</vene>
    </lühend>
    <lühend akronüüm="lk.">
      <eesti>lehekülg</eesti>
      <vene>страница</vene>
    </lühend>
    <lühend akronüüm="mom.">
      <eesti>momentaanne</eesti>
      <vene>однократный</vene>
    </lühend>
    <lühend akronüüm="murd.">
      <eesti>murdeline</eesti>
      <vene>диалектный</vene>
    </lühend>
    <lühend akronüüm="mõist.">
      <eesti>mõistatus</eesti>
      <vene>загадка</vene>
    </lühend>
    <lühend akronüüm="nn.">
      <eesti>niinimetatud</eesti>
      <vene>так называемый</vene>
    </lühend>
    <lühend akronüüm="nom.">
      <eesti>nominatiiv</eesti>
      <vene>номинатив</vene>
    </lühend>
    <lühend akronüüm="num.">
      <eesti>numeraal</eesti>
      <vene>имя числитель-ное</vene>
    </lühend>
    <lühend akronüüm="näit.">
      <eesti>näiteks</eesti>
      <vene>например</vene>
    </lühend>
    <lühend akronüüm="orig.">
      <eesti>originaalis, kalgallikas</eesti>
      <vene>в оригинале</vene>
    </lühend>
    <!-- @NB! lisada lk 91 lühendid!
    <lühend akronüüm="">
      <eesti></eesti>
      <vene></vene>
    </lühend>
    -->
  </xsl:variable>
  
  <xsl:variable name="lühendite-loend"
    select="distinct-values($lühendid/lühend/@akronüüm)"/>
  
</xsl:transform>
