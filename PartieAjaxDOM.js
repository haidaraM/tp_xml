/**
 * Created by elmhaidara on 14/04/15.
 */
// variables pour checker si un bouton a été cliqué
var clickBouton2 = false;
var clickBouton3 = false;
var clickBouton4 = false;
var clickBouton5 = false; // not used for the moment


//check if the first node is an element node
function recupererPremierElementEnfant(n) {
    x = n.firstChild;
    while ( x.nodeType != 1 ) { // Test if x is an element node (and not a text node or other)
        x = x.nextSibling;
    }
    return x;
}

// transforme un document xml à travers une feuille de style xsl
function xmlTransformByXsl(xmlDocumentUrl, xslDocumentUrl){
    var xsltProcessor = new XSLTProcessor();

    // Chargement du fichier XSL
    var xslDocument = getHttpXML(xslDocumentUrl);

    // Importation du .xsl
    xsltProcessor.importStylesheet(xslDocument);

    // Chargement du fichier XML
    var xmlDocument = getHttpXML(xmlDocumentUrl);

    // Création du document XML transformé par le XSL
    var newXmlDocuement = xsltProcessor.transformToDocument(xmlDocument);

    return newXmlDocuement;
}

// crée un div pour les informations en label et le retourne
function createDivLabel(responseJson){
    // Création de l'élément <div> correspondant aux caractéritiques du programme
    var moreInfos = document.createElement("div");

    // creation des labels
    var yearLabel = document.createElement("span");
    yearLabel.setAttribute("class", "label label-default");
    yearLabel.innerHTML = responseJson.Year;
    var ratedLabel = document.createElement("span");
    ratedLabel.setAttribute("class", "label label-default");
    ratedLabel.innerHTML = responseJson.Rated;
    var releasedLabel = document.createElement("span");
    releasedLabel.setAttribute("class", "label label-default");
    releasedLabel.innerHTML = responseJson.Released;
    var runtimeLabel = document.createElement("span");
    runtimeLabel.setAttribute("class", "label label-default");
    runtimeLabel.innerHTML = responseJson.Runtime;
    var genreLabel = document.createElement("span");
    genreLabel.setAttribute("class", "label label-default");
    genreLabel.innerHTML = responseJson.Genre;
    var languageLabel = document.createElement("span");
    languageLabel.setAttribute("class", "label label-default");
    languageLabel.innerHTML = responseJson.Language;
    var countryLabel = document.createElement("span");
    countryLabel.setAttribute("class", "label label-default");
    countryLabel.innerHTML = responseJson.Country;
    var imdbRatingLabel = document.createElement("span");
    // un peu de fantaisie
    if(responseJson.imdbRating >= 8){

        imdbRatingLabel.setAttribute("class", "label label-success");
    }
    else {
        imdbRatingLabel.setAttribute("class", "label label-warning");
    }
    imdbRatingLabel.innerHTML = responseJson.imdbRating;

    var imdbVotesLabel = document.createElement("span");
    imdbVotesLabel.setAttribute("class", "label label-default");
    imdbVotesLabel.innerHTML = responseJson.imdbVotes;

    //ajout des labels
    moreInfos.appendChild(yearLabel);
    moreInfos.appendChild(document.createTextNode (" "));
    moreInfos.appendChild(ratedLabel);
    moreInfos.appendChild(document.createTextNode (" "));
    moreInfos.appendChild(releasedLabel);
    moreInfos.appendChild(document.createTextNode (" "));
    moreInfos.appendChild(runtimeLabel);
    moreInfos.appendChild(document.createTextNode (" "));
    moreInfos.appendChild(genreLabel);
    moreInfos.appendChild(document.createTextNode (" "));
    moreInfos.appendChild(languageLabel);
    moreInfos.appendChild(document.createTextNode (" "));
    moreInfos.appendChild(countryLabel);
    moreInfos.appendChild(document.createTextNode (" "));
    moreInfos.appendChild(imdbRatingLabel);
    moreInfos.appendChild(document.createTextNode (" "));
    moreInfos.appendChild(imdbVotesLabel);

    return moreInfos;

}

// Modifie la couleur de l'arrière plan et la couleur du bouton cliqué
function setBackgroundAndBoutonColor(){
    // récupération du body de la page
    var background = window.document.getElementById("body");
    background.style.backgroundColor ="#489AFF"; // couleur bleue

    // récuperation du bouton
    var bouton = window.document.getElementById("bouton1");
    bouton.style.color="white"
}

// Charge le fichier JSON se trouvant à l'URL donnée en paramètre et le retourne
function getHttpJSON(jsonDocumentUrl) {

    var httpAjax;

    httpAjax = window.XMLHttpRequest ?
        new XMLHttpRequest() :
        new ActiveXObject('Microsoft.XMLHTTP');

    if (httpAjax.overrideMimeType) {
        httpAjax.overrideMimeType('text/xml');
    }

    // chargement du fichier JSON à l'aide de XMLHttpRequest synchrone (le 3° paramètre est défini à false)
    httpAjax.open('GET', jsonDocumentUrl, false);
    httpAjax.send();

    var responseData = eval("(" + httpAjax.responseText + ")");

    return responseData;
}

//charge le fichier XML se trouvant à l'URL relative donné dans le paramètre et le retourne
function getHttpXML(xmlDocumentUrl) {

    var httpAjax;

    httpAjax = window.XMLHttpRequest ?
        new XMLHttpRequest() :
        new ActiveXObject('Microsoft.XMLHTTP');

    if (httpAjax.overrideMimeType) {
        httpAjax.overrideMimeType('text/xml');
    }

    //chargement du fichier XML à l'aide de XMLHttpRequest synchrone (le 3° paramètre est défini à false)
    httpAjax.open('GET', xmlDocumentUrl, false);
    httpAjax.send();

    return httpAjax.responseXML;
}

// affiche les informations des évènements dont le titre contient le mot "Workaholics"
function infoWorkaholics(xmlDocumentUrl,xslDocumentUrl,urlJson){

    // creation du bouton 3
    var bouton = document.createElement("button");
    // creation du texte du bouton 3
    var text = document.createTextNode("Bouton 3 (fn : MajInfoWorkaholics)");

    // attributs du bouton 3 : fonction à declencher et css
    var parameters = "MajInfoWorkaholics(\"" + urlJson +"\")";
    bouton.setAttribute("onclick",parameters);
    bouton.setAttribute("class","btn btn-default");
    bouton.setAttribute("id","bouton3");

    // ajout du texte au bouton 3
    bouton.appendChild(text);
    var li = document.createElement("li");
    // ajout du bouton 3 à la liste des boutons
    li.appendChild(bouton);

    // Création du document XML transformé par le XSL
    var newXmlDocument = xmlTransformByXsl(xmlDocumentUrl,xslDocumentUrl);

    // recuperation du noeud conserné dans le nouveau document
    // on prend le premier élément car normalement il n'y aura qu'un seul correspondant à Workaholics
    // et getElementsByTagName renvoie un
    var elementAInserer = newXmlDocument.getElementsByTagName("ul")[0];

    // pour éviter plusieurs fois les mêmes boutons et informations concernant la série
    if(clickBouton2 == false){
        clickBouton2 = true;

        //petit saut de ligne
        document.getElementById("liste_bouton").appendChild(document.createElement("br"));

        // ajout du bouton 3
        document.getElementById("liste_bouton").appendChild(li);

        // ajout du noeud recupéré à partir du document transformé
        document.getElementById("aCompleterBouton2").appendChild(elementAInserer);
    }
}

//crée un lien(une balise <a>) dans lequel il y'a une image dont l'url est passé en paramètre => renvoie le lien
function createImage(poster){

    // creation du lien et mise en place des attributs
    var lien = document.createElement("a");
    // boostrap
    lien.setAttribute("class","pull-left thumbnail-size");
    lien.setAttribute("href",poster);

    // creation de l'image et mise en place des attributs
    var image = document.createElement("img");
    image.setAttribute("class","media-object img-thumbnail responsive");
    image.setAttribute("src",poster);

    // ajout de l'image au lien
    lien.appendChild(image);

    return lien;

}

// recupere les informations à partir de l'API omdb pour la série workaholics
// Fonction appelée par le bouton 3
function MajInfoWorkaholics(urlJSOn){

    // Chargement du fichier JSON
    var response = getHttpJSON(urlJSOn);

    // on recupere le noeud li de la media-list qui a été insérée par le bouton 2
    var liListe = document.getElementById("aCompleterBouton2").getElementsByClassName("media")[0];

    // Création de l'élément <div> correspondant aux caractéritiques du programme
    var moreInfos = createDivLabel(response);

    if(clickBouton3 == false){
        clickBouton3 = true;
        // création et ajout de l'image
        var lien = createImage(response.Poster);

        // insertion de l'image avant le media-body qui est le premier fils du noeud "media"
        liListe.insertBefore(lien,liListe.childNodes[0]);

        // ajout des labels dans le noeud
        liListe.getElementsByClassName("media-body")[0].appendChild(moreInfos);
    }

}

//affiche le calendrier complet en utilisant une feuille de style xsl
//fonction du bouton 4
function afficheCalendrier(xmlDocumentUrl,xslDocumentUrl){
    // creation du bouton
    var bouton = document.createElement("button");
    // creation du texte du bouton
    var text = document.createTextNode("Bouton 5 (fn : MajAfficheCalendrier)");

    // creation et récuperation du nouveau document transformé par la feuile de style xsl
    var xmlDocumentTransformed = xmlTransformByXsl(xmlDocumentUrl, xslDocumentUrl);
    // récuperation de la liste des elements
    var listeElementsAInserer = xmlDocumentTransformed.getElementsByTagName("ul");

    // attributs du bouton : fonction à declencher et css
    bouton.setAttribute("onclick","MajAfficheCalendrier()" );
    bouton.setAttribute("class","btn btn-default");
    bouton.setAttribute("id","bouton5");
    bouton.appendChild(text);
    var li = document.createElement("li");
    li.appendChild(bouton);

    if(clickBouton4 == false)
    {
        clickBouton4 = true;
        // affichage du bouton
        document.getElementById("liste_bouton2").appendChild(li);

        // parcours et affichage de la liste des éléments
        for(var j=0; j<listeElementsAInserer.length;j++){
            // ajout du noeud recupéré dans le document transformé
            document.getElementById("aCompleterBouton4").appendChild(listeElementsAInserer[j]);
            j--; // sans ça je ne sais pas pourquoi ça ne marche pas, le javascript est trop bizard
        }
        //petit saut de ligne
        document.getElementById("aCompleterBouton4").appendChild(document.createElement("br"));

    }
}

// met à jour le calendrier complet en ajoutant des images et autres infos
function MajAfficheCalendrier(){

    // récuperation de la liste des elements
    var listeElementsAInserer = document.getElementById("aCompleterBouton4").getElementsByClassName("media");

    for(var k=0; k<listeElementsAInserer.length;k++){
        // on recupère le titre de la série courante pour interoger l'api
        var titre = listeElementsAInserer[k].getElementsByClassName("media-heading")[0];

        //on cree l'url json avec le titre de la série
        var urlJson = "http://www.omdbapi.com/?t="+titre.innerHTML+"&y=&plot=short&r=json";

        // Chargement du fichier JSON
        var response = getHttpJSON(urlJson);

        // création de l'image
        var image = createImage(response.Poster);

        // insertion de l'image avant le media-body qui est le premier fils du noeud "media
        listeElementsAInserer[k].insertBefore(image,listeElementsAInserer[k].childNodes[0]);

        // création des informations complémentaires
        var moreInfo = createDivLabel(response);

        // ajout des labels dans le noeud
        listeElementsAInserer[k].getElementsByClassName("media-body")[0].appendChild(moreInfo);
    }
}

function bonus(){

    var key = "?api_key=1b283c3d0510278c26756184c950e78f";
    var config = "http://api.themoviedb.org/3/configuration?api_key=1b283c3d0510278c26756184c950e78f";
    var movieLinkByTmdbId = "https://api.themoviedb.org/3/movie/550?api_key=1b283c3d0510278c26756184c950e78f";

    var findlink ="http://api.themoviedb.org/3/find/tt2193021?external_source=imdb_id&api_key=1b283c3d0510278c26756184c950e78f";
    var episodeImage = "https://api.themoviedb.org/3/tv/198266?api_key=1b283c3d0510278c26756184c950e78f";
}