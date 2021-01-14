#Calcul du nombre de handle dans l'array
def array_journalist_length(x)
  puts "Le nombre de handle dans l'array est: #{x.length}"
end

#Affiche le handle le plus court
def array_min_handle(x)
  min_handle = x.min {|a, b| a.length <=> b.length} #Compare le handle le plus petit
  puts "Le handle le plus court est: #{min_handle}"
end

#Affiche le nombre de handle contenant 5 caratères sans prendre @ en compte
def array_nb_handle_5(x)
  nb_handle_5 = 0 #Initialise le nombre d'handle contenant 5
  x.length.times do |i| #Boucle pour parcourir chaque handle de l'array
    if x[i].length == 6 #Si la taille du handle est égal à 6 carractères (@ + 5 caractères), incrémente le nombre d'array
      nb_handle_5 += 1
    end
  end
  puts "Le nombre de handle contenant 5 caractères, hors @ est: #{nb_handle_5}" #Affiche le nombre de handle contenant 5 caractères
end

#Affiche le nombre de handle qui commence par un majuscule, hors @
def count_maj(x)
  puts x.count {|i| i[1,1] =~ /[A-Z]/} #Le regex permet de selctionner les caractères à comparer
end

#Trie la liste de handle par ordre alphabétique
def array_alpahbetic(x)
 puts x.sort_by(&:downcase) #le downcase permet de tirer les minuscules et les majuscules entres elles
end

#Trie la liste de handle par taille des handle (les plus petits en premiers, les plus grands après)
def array_sort_length(x)
  puts x.sort_by(&:length)
end

#Quelle est la position dans l'array de la personne @epenser ?
def epenser(x)
  puts x.index("@epenser")
end

#Répartition des handle par taille
def sort_by_length(x)
  array_length_global = Array.new #Création d'un nouvel array
  #Mets la taille des handle du array journalist dans le nouvel array
  x.length.times do |i| 
    array_length_global[i] = x[i].length
  end
  counts = Hash.new(0) #Création d'un hash pour stocker les valeurs semblables
  array_length_global.each { |i| counts[i] += 1} #Compte le nombre de handle qui ont la même taille

  counts_tri = counts.sort #Trie le hash pour un afichage dans l'ordre
  #Affichage du résultat
  counts_tri.each do |key, value|
    puts "Il y a #{value} handle qui ont #{key} caractères"
  end
end

#Création du menu
def menu
  loop do #Permet d'afficher le menu tant qu'un bon input n'a pas été donné
    puts "Bienvenue dans le menu du projet Big data de THP"
    puts "Choisi un numéro si dessous pour afficher la réponse à la question"
    puts "1 : Combien y a-t-il de handle dans cette array ?"
    puts "2 : Quel est le handle le plus court de cette liste ?"
    puts "3 : Combien y-a-t'il de handle contenant 5 caractères (le @ ne compte pas pour un caractère)"
    puts "4 : Combien commencent par une majuscule (première lettre juste après le @) ?"
    puts "5 : Trie la liste de handle par ordre alphabétique."
    puts "6 : Trie la liste de handle par taille des handle (les plus petits en premiers, les plus grands après)"
    puts "7 : Quelle est la position dans l'array de la personne @epenser ?"
    puts "8 : Sors-moi une répartition des handle par taille de ces derniers (nombre de handle avec 1 caractère, nombre de handle avec 2 caractères, nombre de handle avec 3 caractères, etc)"
    print "> "
    choice_user = gets.chomp.to_i #Prend le choix de l'utilisateur
    #Creation de l'array avec la liste des journalists
    array_journalist = ["@jcunniet","@PaulLampon","@Aziliz31","@ssoumier","@marionsouzeau","@gaellombart","@bendarag","@AurelieLebelle","@julienduffe","@thomaspoupeau","@LilyRossignol","@ClairGuedon","@stephanieauguy","@claw_prolongeau","@_JulieMenard","@LColcomb","@Zlauwereys","@MeLonguet","@DorotheeLN","@NolwennCosson","@ADaboval","@Remibaldy","@bderveaux","@amandechap","@ELODIESOULIE","@nbongarcon","@HeloAb","@Panamorama","@gregplou","@BenoitBerthe","@LauraBruneau89","@Anthony_Lieures","@Sharonwaj","@mcsonkin","@pverduzier","@emiliel3","@Julien_MARION","@SophiFay","@bdelombre","@annalecerf","@AdriaBudry","@DejNikolic","@iJaffre","@CyrusleVirus","@GPardigon","@e_vallerey","@IsabelleSouquet","@AudeDavidRossi","@Yoann_Pa","@CeliaPenavaire","@perraultvincent","@cboulate","@JustineWeyl","@Paulinejacot","@juliechab","@aslechevallier","@phnou","@Seb_Pommier","@Alex_Bensaid","@GuillaumeGaven","@annelaurechouin","@Oliviader","@guerricp","@JMMarchaut","@cyceron","@gregory_raymond","@vhunsinger","@l_peillon","@fannyguinochet","@EAssayag","@KibweAdom","@YvonHerry","@JohanGarciajg","@saidlabidi","@lauranneprov","@LeaDavy","@francois_remy","@CGuicheteau","@FloMaillet","@m_perroud","@oBrunet_TSMF","@MoonVdc","@jc2taille","@NellyMoussu","@VirginK","@b_misa","@FabriceCouste","@barbara_prose","@lelia2m","@brunoaskenazi","@laurenechamp","@ysisbox","@juliengagliardi","@PierreLel","@kdeniau","@_TerraInc","@DominicArpin","@antoinfonteneau","@nanotousch","@jb_roch","@YaniKhezzar","@Anne_Bechet","@NCapart","@SamyBenNaceur","@Joumany","@Julietteraynal","@TGiraudet","@SaraTanit","@HappeFrederic","@antoinellorca","@michelpicot","@Sev_Ryne","@bobdobolino","@murdever","@YGrandmontagne","@Mnyo","@EdKOSCIANSKI","@tnoisette","@jankari","@delbello_rom","@rflechaux","@NadiaSorelli","@IT_Digital","@abarbaux","@PhilippeLeroy","@schaptal","@marionspee","@lisavignoli","@ChloeAeberhardt","@MartineJacot","@JuliaPascualita","@curieusedetout","@sgraveleau","@bif_o","@ElisaPineau","@zinebdryef","@apiquard","@pierrehaski","@StephanieDelmas","@Blandine_Garot","@vergara_i","@evan_lebastard","@SophieVclt","@OlivierLevrault","@alicedorgeval","@LouiseMalnoy","@alix_fx","@pierre_baudis","@LucMagoutier","@AgatheMuller","@SGianninelli","@PaulineBoyer33","@NaomiHalll","@romaindlx","@marionbr","@Burtschy","@JacobEtienne","@as_lizzani","@marie_simon","@LaureDaussy","@FabriceAmedeo","@min","@LoubnaChlaikhy","@PlummerWilliam","@OlivierMarin1","@alaurefremont","@mwesfreid","@ChBaDe","@pmathon","@theobaldmarie","@Lnpagesy","@marclandre","@paoliniesther","@Feertchak","@JBLitzler","@GuillaumeErrard","@quentinperinel","@TristanQM","@mlbo","@constancejamet","@LoraTerrazas","@emiliegeffray","@Mathilde_Sd","@CaroPiquet","@DCanivez","@TIM_7375","@blandinelc","@ivanrioufol","@arthurberdah","@SarahLecoeuvre","@guillaume_gui","@DamienMercereau","@W_Chloe","@Assma_MD","@EugenieBastie","@HiTech_lexpress","@bcondominas","@Laurie_Z_","@jeanfrancgerard","@MathieuPagura","@BGUYF","@AlainPiffaretti","@AudreyKucinskas","@julienhory","@Pierrefalga","@TiphThuillier","@cdaniez","@LigerBaptiste","@D_Peras","@julie_dlb","@Fatiha_Temmouri","@julian2lamancha","@GaetaneDeljurie","@JulianMattei","@M_Vicuna","@DeBruynOlivier","@Nehed_Jendoubi","@antoine_grenapi","@ColonnaGen","@VictoriaGairin","@Clement_Lacombe","@TVigoureux","@MargauxObriot","@solinedelos","@RocheSabine","@dangerkens","@EdouardDutour","@MDondeyne","@DupuisNathalie1","@bouscarel","@Mathieu2jean","@Sophie_T_J","@laurentcalixte","@patrockwilliams","@PascaleKremer","@AlexJaquin","@LauraIsaaz","@cath_robin","@Del_Gautherin","@Isaduriez","@lucietuile","@AugeyBastien","@mcastagnet","@AminaKalache","@mvaudano","@CParrot","@ombelinetips","@_JoinLion","@BarbolosiRose","@ToiBruno1","@FloraClodic","@xjbdx","@ceci_est_un_handle_vraiment_long","@AlexiaEy","@Emjy_STARK","@elcoco01","@rabilebon","@pflovens_","@FabriceFrossard","@MorganeSERRES","@MarjolaineKoch","@edgarsnow","@SRNLF","@CChassigneux","@KerinecMoran","@NassiraELM","@NewsRicard","@Sandreene","@Emilezrt","@Pierre_Do","@Micode","@CColumelli","@DavidAbiker","@ClementBergantz","@benjaminrabier","@celinekallmann","@edwyplenel","@C_Barbier","@JJBourdin_RMC","@LaurenceFerrari","@aslapix","@IsaMillet","@MaximeSwitek","@tomjoubert","@jszanchi","@roqueeva","@XavierBiseul","@florencesantrot","@AntoineCrochet","@freeman59","@MaudeML","@philippe_gulpi","@mathieum76","@kiouari","@imanemoustakir","@BenedicteMallet","@Emilie_Brouze","@antoinebarret","@_nicolasbocquet","@remibuhagiar","@CourretB","@AymericRobert","@miraelmartins","@pmaniere","@jesuisraphk","@David_Ingram","@pcelerier","@technomedia","@Geraldinedauver","@ThierryLabro","@Newsdusud","@nrauline","@gbregeras","@SCouasnonBFM","@actualites_nrv","@dimitrimoulins","@oli_aura","@FabieChiche","@Vincent_Raimblt","@ChristophGreuet","@PAlbuchay","@MarrauddesGrot","@vtalmon","@cedric","@olivierfrigara","@Julien_Jay","@LydiaBerroyer","@Shuua","@datisdaz","@Steuph","@ameliecharnay","@Bruno_LesNums","@LelloucheNico","@CciliaDiQuinzio","@Elodie_C","@SylvRolland","@Kocobe","@FL_Debes","@jdupontcalbo","@GarciaVictor_","@NicoRichaud","@RHoueix","@simottel","@DamienLicata","@annabelle_L","@Lea_Lejeune","@axel_deb","@marin_eben","@ptiberry","@MatthieuDelach","@sandrinecassini","@benjaminferran","@ppgarcia75","@NotPatrick","@ivalerio","@FabienneSchmitt","@alexgoude","@JeromeColombain","@manhack","@Capucine_Cousin","@Fsorel","@oliviertesquet","@marjoriepaillon","@ginades","@PierreTran","@DelphineCuny","@reesmarc","@lauratenoudji","@ldupin","@carolinedescham","@Lucile_Quillet","@cgabizon","@Allocab","@epenser","@JAGventeprivee","@frwrds","@Laure__Bourdon","@Xavier75","@maximeverner","@s_jourdain","@LoriHelloc"]
    case choice_user #Permet de mettre d'aficher et appel la méthode choisie par l'utilisateur
    when 1
      puts
      array_journalist_length(array_journalist) #Appel la méthode
      puts
      puts "Changer de question (Y) ou sortir ? (N)" #Option pour continuer et retourner au menu
      print "> "
      input = gets.chomp #Choix de l'utilisateur
      if input.upcase != "Y" #Si l'utilisateur choisi autre chose...
        break #... fin du programme
      end
      puts
    when 2
      puts
      array_min_handle(array_journalist)
      puts
      puts "Changer de question (Y) ou sortir ? (N)"
      print "> "
      input = gets.chomp
      if input.upcase != "Y"
        break
      end
      puts
    when 3
      puts
      array_nb_handle_5(array_journalist)
      puts
      puts "Changer de question (Y) ou sortir ? (N)"
      print "> "
      input = gets.chomp
      if input.upcase != "Y"
        break
      end
      puts
    when 4
      puts
      count_maj(array_journalist)
      puts
      puts "Changer de question (Y) ou sortir ? (N)"
      print "> "
      input = gets.chomp
      if input.upcase != "Y"
        break
      end
      puts
    when 5
      puts
      array_alpahbetic(array_journalist)
      puts
      puts "Changer de question (Y) ou sortir ? (N)"
      print "> "
      input = gets.chomp
      if input.upcase != "Y"
        break
      end
      puts
    when 6
      puts
      array_sort_length(array_journalist)
      puts
      puts "Changer de question (Y) ou sortir ? (N)"
      print "> "
      input = gets.chomp
      if input.upcase != "Y"
        break
      end
      puts
    when 7
      puts
      epenser(array_journalist)
      puts
      puts "Changer de question (Y) ou sortir ? (N)"
      print "> "
      input = gets.chomp
      if input.upcase != "Y"
        break
      end
      puts
    when 8
      puts
      sort_by_length(array_journalist)
      puts
      puts "Changer de question (Y) ou sortir ? (N)"
      print "> "
      input = gets.chomp
      if input.upcase != "Y"
        break
      end
      puts
    end
    puts
  end
end

#Appel du menu
menu