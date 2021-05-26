CREATE DATABASE poetaedb;
USE poetaedb;

CREATE TABLE Profilo(
	Id INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(25),
    Cognome VARCHAR(25),
    Biografia VARCHAR(255),
    Nascita DATE,
    Morte DATE,
    LuogoNascita VARCHAR(50),
    
    PRIMARY KEY(Id)
);

CREATE TABLE Percorso(
	Id INT NOT NULL AUTO_INCREMENT,
    Descrizione VARCHAR(50) UNIQUE,
    
    PRIMARY KEY(Id)
);

CREATE TABLE Percorsi(
	Id INT NOT NULL AUTO_INCREMENT,
    Profilo INT NOT NULL,
    Percorso INT NOT NULL,
    
    PRIMARY KEY(Id),
    FOREIGN KEY(Profilo) REFERENCES Profilo(Id),
    FOREIGN KEY(Percorso) REFERENCES Percorso(Id)
);

CREATE TABLE Poesia(
	Id INT NOT NULL AUTO_INCREMENT,
    Titolo VARCHAR(255),
    Descrizione VARCHAR(2024),
    Autore INT NOT NULL,
    Contenuto TEXT,
    
    PRIMARY KEY(Id),
    FOREIGN KEY(Autore) REFERENCES Profilo(Id)
);

CREATE TABLE Relazione(
	Id INT NOT NULL AUTO_INCREMENT,
    Profilo1 INT NOT NULL,
    Profilo2 INT NOT NULL,
    
    PRIMARY KEY(Id),
    FOREIGN KEY(Profilo1) REFERENCES Profilo(Id),
    FOREIGN KEY(Profilo2) REFERENCES Profilo(Id)
);

CREATE TABLE Utente(
	Id INT NOT NULL AUTO_INCREMENT,
    Username VARCHAR(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL UNIQUE,
    Password VARCHAR(32) NOT NULL,
    
    PRIMARY KEY(Id)
);

CREATE TABLE Segnalibri(
	Id INT NOT NULL AUTO_INCREMENT,
    Utente INT NOT NULL,
    Poesia INT NOT NULL,
    
    PRIMARY KEY(Id),
    FOREIGN KEY(Utente) REFERENCES Utente(Id),
    FOREIGN KEY(Poesia) REFERENCES Poesia(Id)
);

-- PROFILI
INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Ugo", "Foscolo", "È meno male non avere leggi, che violarle ogni giorno.", "1778-02-06", "1827-09-10", "Zante");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Ippolito", "Pindemonte", null, "1753-11-13", "1828-11-18", "Verona");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Melchiorre", "Cesarotti", null, "1730-05-15", "1808-11-04", "Padova");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Isabella", "Teotochi Albrizzi", null, "1763-11-28", "1836-09-27", "Corfù");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Vittorio", "Alfieri", null, "1749-01-16", "1803-10-08", "Asti");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Giuseppe", "Parini", null, "1729-05-23", "1799-08-15", "Bosisio");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Vincenzo", "Monti", null, "1754-02-19", "1828-10-13", "Alfonsine");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Silvio", "Pellico", null, "1789-06-24", "1854-01-31", "Saluzzo");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Alessandro", "Manzoni", "Si dovrebbe pensare più a fare bene che a star bene: e così si finirebbe anche a star meglio.", "1785-03-07", "1873-05-22", "Milano");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Vincenzo", "Cuoco", null, "1770-10-01", "1823-12-14", "Molise");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Claude", "Fauriel", null, "1772-10-21", "1844-07-15", "Saint-Étienne");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Enrichetta", "Blondel", null, "1791-07-11", "1833-12-23", "Casirate");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Ermes", "Visconti", null, "1784-03-15", "1841-01-21", "Milano");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Tommaso", "Grossi", null, "1790-01-23", "1853-12-10", "Bellano");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Giovanni", "Berchet", null, "1783-12-23", "1851-12-23", "Milano");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Carlo", "Porta", null, "1775-06-15", "1821-01-5", "Milano");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Massimo", "d' Azeglio", null, "1798-10-24", "1866-01-15", "Torino");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Gino", "Capponi", null, "1792-09-13", "1876-02-03", "Firenze");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Giuseppe", "Giusti", null, "1809-05-12", "1850-05-31", "Monsummano Terme");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Teresa", "Borri", null, "1799-11-11", "1861-08-23", "Brivio");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Giacomo", "Leopardi", "Sono convinto che anche nell'ultimo istante della nostra vita abbiamo la possibilità di cambiare il nostro destino.", "1798-06-29", "1837-06-14", "Recanati");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Pietro", "Giordani", null, "1774-01-01", "1848-09-02", "Piacenza");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Vincenzo", "Gioberti", null, "1801-04-05", "1852-10-26", "Torino");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Fanny", "Targioni Tozzetti", null, "1801-05-09", "1889-03-29", "Firenze");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Giosue", "Carducci", "Colui che potendo esprimere un concetto in dieci parole ne usa dodici, io lo ritengo capace delle peggiori azioni.", "1835-07-27", "1907-02-16", "Pietrasanta");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Elvira", "Menicucci", null, null, null, null);

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Giuseppe", "Chiarini", null, "1833-08-17", "1908-08-04", "Arezzo");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Severino", "Ferrari", null, "1856-03-26", "1905-12-24", "Molinella");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Enrico", "Nencioni", null, "1837-01-01", "1896-08-25", "Firenze");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Giovanni", "Marradi", null, "1852-09-21", "1922-02-06", "Livorno");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Guido", "Mazzoni", null, "1859-06-12", "1943-05-29", "Firenze");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Giovanni", "Verga", "Le parole hanno il valore che dà loro chi le ascolta.", "1840-09-02", "1922-01-27", "Vizzini");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Adriano", "Cecioni", null, "1836-07-26", "1886-05-23", "Firenze");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Nino", "Costa", null, "1886-06-28", "1945-11-05", "Torino");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Emilio", "Treves", null, "1834-12-31", "1916-01-30", "Trieste");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Luigi", "Capuana", null, "1839-05-28", "1915-11-29", "Mineo");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Federico", "De Roberto", null, "1861-01-16", "1927-08-26", "Napoli");

INSERT INTO Profilo (Nome, Cognome, Biografia, Nascita, Morte, LuogoNascita)
VALUES ("Luigi", "Pirandello", null, "1867-06-28", "1936-12-10", "Agrigento");
-- ----------------------------------------------------------------------------


-- Percorsi singolari
INSERT INTO Percorso (Descrizione)
VALUES ("Poeta"),
	   ("Scrittore"),
       ("Traduttore"),
       ("Letterato"),
       ("Linguista"),
       ("Saggista"),
       ("Drammaturgo"),
       ("Abate"),
       ("Patriota"),
       ("Giurista"),
       ("Politico"),
       ("Storico"),
       ("Economista"),
       ("Critico letterario"),
       ("Moglie"),
       ("Pittore"),
       ("Filosofo"),
       ("Filologo"),
       ("Presbitero"),
       ("Accademico"),
       ("Insegnante"),
       ("Senatore"),
       ("Scultore"),
       ("Critico d'arte"),
       ("Imprenditore"),
       ("Editore"),
       ("Giornalista");
-- ----------------------------------------------------------------------------

-- Percorsi
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('1', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('1', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('1', '3');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('2', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('2', '4');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('2', '3');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('3', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('3', '3');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('3', '5');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('3', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('4', '4');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('4', '6');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('5', '7');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('5', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('5', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('6', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('6', '8');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('7', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('7', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('7', '3');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('8', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('8', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('8', '9');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('9', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('9', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('9', '7');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('10', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('10', '10');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('10', '11');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('10', '12');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('10', '13');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('11', '12');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('11', '5');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('11', '14');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('12', '15');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('13', '4');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('15', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('15', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('15', '3');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('15', '11');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('14', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('14', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('16', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('17', '11');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('17', '9');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('17', '16');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('17', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('18', '11');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('18', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('18', '12');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('19', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('19', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('20', '15');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('21', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('21', '17');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('21', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('21', '18');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('22', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('23', '9');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('23', '17');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('23', '19');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('25', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('25', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('25', '14');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('25', '20');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('26', '15');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('27', '4');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('27', '14');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('28', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('28', '14');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('28', '21');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('29', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('29', '14');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('29', '3');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('30', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('30', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('31', '4');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('31', '9');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('31', '11');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('32', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('32', '7');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('32', '22');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('33', '23');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('33', '16');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('33', '24');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('34', '1');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('35', '25');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('35', '26');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('35', '27');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('36', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('36', '14');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('36', '27');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('37', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('38', '7');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('38', '2');
INSERT INTO Percorsi (Profilo, Percorso) VALUES ('38', '1');
-- ----------------------------------------------------------------------------


-- RELAZIONI
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('1', '2');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('1', '3');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('1', '4');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('1', '5');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('1', '6');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('1', '7');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('1', '8');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('9', '10');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('9', '1');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('9', '7');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('9', '11');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('9', '12');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('9', '13');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('9', '15');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('9', '14');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('9', '16');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('9', '17');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('9', '18');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('9', '19');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('9', '20');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('21', '22');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('21', '7');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('21', '9');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('21', '23');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('21', '24');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('25', '26');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('25', '27');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('25', '28');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('25', '29');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('25', '30');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('25', '31');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('32', '33');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('32', '34');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('32', '35');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('32', '36');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('32', '37');
INSERT INTO Relazione (Profilo1, Profilo2) VALUES ('32', '38');
-- ----------------------------------------------------------------------------


-- Poemi
-- Alla Sera
INSERT INTO Poesia (Titolo, Descrizione, Autore, Contenuto) VALUES ("Alla Sera", "La sera offre, nel suo silenzio immobile, una momentanea immagine del dileguarsi di ogni forma di vita; il crepuscolo non è più sentito dal poeta come una drammatica sfida al destino, bensì come il perdersi dolce del sensibile e della vita stessa.", "1", "
Forse perché della fatal quïete
tu sei l'immago a me sì cara vieni
o Sera! E quando ti corteggian liete
le nubi estive e i zeffiri sereni,
 
5	e quando dal nevoso aere inquïete
tenebre e lunghe all'universo meni
sempre scendi invocata, e le secrete
vie del mio cor soavemente tieni.
 
Vagar mi fai co' miei pensier su l'orme
10	che vanno al nulla eterno; e intanto fugge
questo reo tempo, e van con lui le torme
 
delle cure onde meco egli si strugge;
e mentre io guardo la tua pace, dorme
quello spirto guerrier ch'entro mi rugge.");

-- A Zacinto
INSERT INTO Poesia (Titolo, Descrizione, Autore, Contenuto) VALUES ("A Zacinto", "Dedicato all'isola del mar Ionio (l'odierna Zante) dove Foscolo nacque,
ed affronta il tema dell'esilio, da lui autoproclamato dopo la cessione della Repubblica di Venezia,
che allora comprendeva Zante, da parte di Napoleone agli Austriaci, e della nostalgia della terra.
Il poeta paragona la sua condizione a quella di Ulisse,
che però fu più fortunato di lui in quanto riuscì a rimettere piede sulla sua amata Itaca,
mentre Foscolo è condannato ad una illacrimata sepoltura in terra straniera", "1", "
Né più mai toccherò le sacre sponde
ove il mio corpo fanciulletto giacque,
Zacinto mia, che te specchi nell'onde
del greco mar da cui vergine nacque

Venere, e fea quelle isole feconde
col suo primo sorriso, onde non tacque
le tue limpide nubi e le tue fronde
l'inclito verso di colui che l'acque

cantò fatali, ed il diverso esiglio
per cui bello di fama e di sventura
baciò la sua petrosa Itaca Ulisse.

Tu non altro che il canto avrai del figlio,
o materna mia terra; a noi prescrisse
il fato illacrimata sepoltura.");

-- All' amica risanata
INSERT INTO Poesia (Titolo, Descrizione, Autore, Contenuto) VALUES ("All' amica risanata", "Il canto diventa libero da ogni intento descrittivo e svela il nucleo romantico
del mito neoclassico della Bellezza che non è da intendere come sola gioia per gli occhi,
ma come rasserenamento e consolazione dell'animo.", "1", "
Qual dagli antri marini
 L'astro piú caro a Venere
 Co' rugiadosi crini
 Fra le fuggenti tenebre
5 Appare, e il suo vïaggio
 Orna col lume dell'eterno raggio,

 Sorgon cosí tue dive
 Membra dall'egro talamo
 E in te beltà rivive,
10 L'aurea beltade ond'ebbero
 Ristoro unico a' mali
 Le nate a vaneggiar menti mortali

Fiorir sul caro viso
 Veggo la rosa, tornano
15 I grandi occhi al sorriso
 Insidïando; e vegliano
 Per te in novelli pianti
 Trepide madri, e sospettose amanti.

 Le Ore che dianzi meste
20 Ministre eran de' farmachi
 Oggi l'indica veste,
 E i monili cui gemmano
 Effigïati Dei
 Inclito studio di scalpelli achei,

25 E i candidi coturni
 E gli amuleti recano
 Onde a' cori notturni
 Te, Dea, mirando obbliano
 I garzoni le danze,
30 Te, principio d'affanni e di speranze.

 O quando l'arpa adorni
 E co' novelli numeri
 E co' molli contorni
 Delle forme che facile
35 Bisso seconda, e intanto
 Fra il basso sospirar vola il tuo canto

 Piú periglioso; o quando
 Balli disegni, e l'agile
 Corpo all'aure fidando
40 Ignoti vezzi sfuggono
 Dai manti e dal negletto
 Velo scomposto sul sommosso petto.

 All'agitarti, lente
 Cascan le trecce, nitide
45 Per ambrosia recente,
 Mal fide all'aureo pettine
 E alla rosea ghirlanda
 Che or con l'alma salute april ti manda.

 Cosí ancelle d'Amore
50 A te d'intorno volano
 Invidïate l'Ore,
 Meste le Grazie mirino
 Chi la beltà fugace
 Ti membra, e il giorno dell'eterna pace.

55 Mortale guidatrice
 D'oceanine vergini
 La Parrasia pendice
 Tenea la casta Artemide
 E fea terror di cervi
60 Lungi fischiar d'arco cidonio i nervi.

 Lei predicò la fama
 Olimpia prole; pavido
 Diva il mondo la chiama,
 E le sacrò l'Elisio
65 Soglio, ed il certo telo,
 E i monti, e il carro della luna in cielo.

 Are cosí a Bellona,
 Un tempo invitta amazzone,
 Die' il vocale Elicona;
70 Ella il cimiero e l'egida
 Or contro l'Anglia avara
 E le cavalle ed il furor prepara.
 E quella a cui di sacro
 Mirto te veggo cingere

75 Devota il simulacro,
 Che presiede marmoreo
 Agli arcani tuoi lari
 Ove a me sol sacerdotessa appari
 Regina fu, Citera

80 E Cipro ove perpetua
 Odora primavera
 Regnò beata, e l'isole
 Che col selvoso dorso
 Rompono agli euri e al grande Ionio il corso.

85 Ebbi in quel mar la culla,
 Ivi erra ignudo lo spirito
 Di Faon la fanciulla,
 E se il notturno zeffiro
 Blando sui flutti spira
90 Suonano i liti un lamentar di lira:

 Ond'io, pien del nativo
 Aer sacro, su l'Itala 
 Grave cetra derivo
 Per te le corde eolie,
95 E avrai divina i voti
 Fra gl'inni miei delle insubri nipoti.");
 
-- L'esordio
INSERT INTO Poesia (Titolo, Descrizione, Autore, Contenuto) VALUES ("L'esordio", "La vicenda che riguarda il narratore-protagonista non solo non viene raccontata dall’inizio,
ma sembra che al personaggio sia già capitato tutto quel che di tragico potesse avvenire. 
All’amico Lorenzo Alderani Jacopo comunica le sue ultime volontà, aspettandosi di essere ucciso a breve.
In questa lettera iniziale, che lascia presupporre al lettore una missiva precedente di Lorenzo recante il consiglio di cercare scampo in Francia,
Ortis esprime la volontà di rimanere fedele ai propri ideali, nonostante essi siano stati vergognosamente traditi dalla politica napoleonica.", "1", "
			Libertà va cercando, ch’è sí cara,
			come sa chi per lei vita rifiuta.
						     Dante

Da’ colli Euganei, 11 Ottobre 1797
5  Il sacrificio della patria nostra è consumato: tutto è perduto; e la vita, seppure 
ne verrà concessa, non ci resterà che per piangere le nostre sciagure, e la nostra 
infamia. il sacrificio personale
  Il mio nome è nella lista di proscrizione, 
lo so: ma vuoi tu ch’io per salvarmi da chi 
10 m’opprime mi commetta a chi mi ha tradito? Consola mia madre: vinto dalle sue 
lagrime le ho ubbedito, e ho lasciato Venezia 
per evitare le prime persecuzioni, e le piú feroci. Or dovrò io abbandonare anche
questa mia solitudine antica, dove, senza perdere dagli occhi il mio sciagurato paese,
posso ancora sperare qualche giorno di pace? Tu mi fai raccapricciare, Lorenzo; quanti sono dunque gli sventurati? 
15 E noi, pur troppo, noi stessi italiani ci laviamo le mani nel sangue degl’italiani. 
Per me segua che può. Poichè ho disperato e della mia patria e di me, aspetto 
tranquillamente la prigione e la morte. 
20  Il mio cadavere almeno non cadrà fra braccia straniere; il mio nome sarà sommessamente compianto da’ pochi uomini buoni, compagni delle nostre miserie; 
e le mie ossa poseranno su la terra de’ miei padri.");
-- Il cinque maggio
INSERT INTO Poesia (Titolo, Descrizione, Autore, Contenuto) VALUES ("Il cinque maggio", "L’ode venne scritta da Manzoni dopo aver appreso, il 17 luglio 1821, la notizia della morte in esilio di Napoleone, avvenuta a Sant’Elena il 5 maggio. Il componimento circola rapidamente in tutta Europa, scavalcando la censura austriaca. 
Manzoni, che durante la vita del grande personaggio storico non aveva espresso giudizi pubblici su di lui, ora, alla sua 
morte, avverte pressante la necessità di meditare sul significato della sua parabola esistenziale.", "9", "
Ei fu. Siccome immobile,
 dato il mortal sospiro,
 stette la spoglia immemore
 orba di tanto spiro,
5 così percossa, attonita
 la terra al nunzio sta,

 muta pensando all’ultima
 ora dell’uom fatale;
 né sa quando una simile
10 orma di piè mortale
 la sua cruenta polvere
 a calpestar verrà.

 Lui folgorante in solio
 vide il mio genio e tacque;
15 quando, con vece assidua,
 cadde, risorse e giacque,
 di mille voci al sonito
 mista la sua non ha:

vergin di servo encomio
20 e di codardo oltraggio,
 sorge or commosso al subito
 sparir di tanto raggio;
 e scioglie all’urna un cantico
 che forse non morrà.

25 Dall’Alpi alle Piramidi,
 dal Manzanarre al Reno,
 di quel securo il fulmine
 tenea dietro al baleno;
 scoppiò da Scilla al Tanai,
30 dall’uno all’altro mar.

 Fu vera gloria? Ai posteri
 l’ardua sentenza: nui
 chiniam la fronte al Massimo
 Fattor, che volle in lui
35 del creator suo spirito
 più vasta orma stampar.

 La procellosa e trepida
 gioia d’un gran disegno,
 l’ansia d’un cor che indocile
40 serve, pensando al regno;
 e il giunge, e tiene un premio
 ch’era follia sperar;

 tutto ei provò: la gloria
 maggior dopo il periglio,
45 la fuga e la vittoria,
 la reggia e il tristo esiglio;
due volte nella polvere,
 due volte sull’altar.

 Ei si nomò: due secoli,
50 l’un contro l’altro armato,
 sommessi a lui si volsero,
 come aspettando il fato;
 ei fe’ silenzio, ed arbitro
 s’assise in mezzo a lor.

55 E sparve, e i dì nell’ozio
 chiuse in sì breve sponda,
 segno d’immensa invidia
 e di pietà profonda,
 d’inestinguibil odio
60 e d’indomato amor.

 Come sul capo al naufrago
 l’onda s’avvolve e pesa,
 l’onda su cui del misero,
 alta pur dianzi e tesa,
65 scorrea la vista a scernere
 prode remote invan

 tal su quell’alma il cumulo
 delle memorie scese!
 Oh quante volte ai posteri
70 narrar se stesso imprese,
 e sull’eterne pagine
 cadde la stanca man!

 Oh quante volte, al tacito
 morir d’un giorno inerte,
75 chinati i rai fulminei,
 le braccia al sen conserte,
 stette, e dei dì che furono
 l’assalse il sovvenir!

E ripensò le mobili
80 tende, e i percossi valli,
 e il lampo de’ manipoli,
 e l’onda dei cavalli,
 e il concitato imperio
 e il celere ubbidir.

85 Ahi! forse a tanto strazio
 cadde lo spirto anelo,
 e disperò; ma valida
 venne una man dal cielo,
 e in più spirabil aere
90 pietosa il trasportò;

 e l’avviò, pei floridi
 sentier della speranza,
 ai campi eterni, al premio
 che i desideri avanza,
95 dov’è silenzio e tenebre
 la gloria che passò.

 Bella Immortal! benefica
 fede ai trionfi avvezza!
 Scrivi ancor questo, allegrati;
100 ché più superba altezza
 al disonor del Golgota
 giammai non si chinò.

 Tu dalle stanche ceneri
 sperdi ogni ria parola:
105 il Dio che atterra e suscita,
 che affanna e che consola,
 sulla deserta coltrice
 accanto a lui posò.");
 
 -- L’infinito
INSERT INTO Poesia (Titolo, Descrizione, Autore, Contenuto) VALUES ("L’infinito", "Tutta la poesia è giocata sul paradosso, sul voler rendere il concetto dell’infinito attraverso la negazione del finito: l’io 
è seduto immobile con la visuale impedita da una siepe, ma viaggia verso spazi e tempi infiniti; non sente null’altro che 
la voce del vento e immagina il suono dell’«età presente»; il suo pensiero si annulla ma il naufragio è dolce. Ed è proprio 
il senso paradossale di un piacere prodotto in un attimo dal naufragio della ragione che rende unico questo idillio e lo 
consegnerà alla grande poesia del Novecento.", "21", "
  Sempre caro mi fu quest’ermo colle,
E questa siepe, che da tanta parte
Dell’ultimo orizzonte il guardo esclude. 
Ma sedendo e mirando, interminati 
5 Spazi di là da quella, e sovrumani 
Silenzi, e profondissima quiete
Io nel pensier mi fingo; ove per poco 
Il cor non si spaura. E come il vento
Odo stormir tra queste piante, io quello
10 Infinito silenzio a questa voce 
Vo comparando: e mi sovvien l’eterno,
E le morte stagioni, e la presente
E viva, e il suon di lei. Così tra questa
Immensità s’annega il pensier mio:
15 E il naufragar m’è dolce in questo mare.");

-- A Silvia
INSERT INTO Poesia (Titolo, Descrizione, Autore, Contenuto) VALUES ("A Silvia", "Si presenta come il canto della rinascita poetica, dopo una lunga pausa coincidente per lo più con la stesura 
di gran parte delle Operette morali. Una rinascita che è strettamente collegata al tema della memoria da cui si generano 
i canti del 1828-30. È anche la prima canzone libera e il canto in cui, sullo sfondo di una visione pessimistica fondata sul 
materialismo e sull’indifferenza della Natura, Leopardi tematizza la caduta definitiva delle illusioni e delle speranze, di 
cui Silvia, morta nella primavera della vita, è chiara personificazione.", "21", "
   Silvia rimembri ancora
Quel tempo della tua vita mortale,
Quando beltà splendea 
Negli occhi tuoi ridenti e fuggitivi,
5 E tu, lieta e pensosa, il limitare 
Di gioventù salivi?

Sonavan le quiete 
Stanze, e le vie dintorno, 
Al tuo perpetuo canto, 
10 Allor che all’opre femminili intenta 
Sedevi, assai contenta 
Di quel vago avvenir che in mente avevi. 
Era il maggio odoroso: e tu solevi 
Così menare il giorno. 

15 Io gli studi leggiadri 
Talor lasciando e le sudate carte, 
Ove il tempo mio primo 
E di me si spendea la miglior parte,D’in su i veroni del paterno ostello 
20 Porgea gli orecchi al suon della tua voce, 
Ed alla man veloce 
Che percorrea la faticosa tela. 
Mirava il ciel sereno, 
Le vie dorate e gli orti, 
25 E quinci il mar da lungi, e quindi il monte. 
Lingua mortal non dice 
Quel ch’io sentiva in seno. 

 Che pensieri soavi, 
Che speranze, che cori, o Silvia mia! 
30 Quale allor ci apparia 
La vita umana e il fato! 
Quando sovviemmi di cotanta speme,
Un affetto mi preme 
Acerbo e sconsolato, 
35 E tornami a doler di mia sventura. 
O natura, o natura, 
Perchè non rendi poi 
Quel che prometti allor? perchè di tanto 
Inganni i figli tuoi? 

40  Tu pria che l’erbe inaridisse il verno, 
Da chiuso morbo combattuta e vinta, 
Perivi, o tenerella. E non vedevi 
Il fior degli anni tuoi; 
Non ti molceva il core 
45 La dolce lode or delle negre chiome,
Or degli sguardi innamorati e schivi; 
Nè teco le compagne ai dì festivi 
Ragionavan d’amore. 

Anche peria fra poco 
50 La speranza mia dolce: agli anni miei 
Anche negaro i fati 
La giovanezza. Ahi come, 
Come passata sei, 
Cara compagna dell’età mia nova, 
55 Mia lacrimata speme! 
Questo è quel mondo? questi 
I diletti, l’amor, l’opre, gli eventi 
Onde cotanto ragionammo insieme? 
Questa la sorte dell’umane genti? 
60 All’apparir del vero 
Tu, misera, cadesti: e con la mano 
La fredda morte ed una tomba ignuda 
Mostravi di lontano.");

-- Pianto antico
INSERT INTO Poesia (Titolo, Descrizione, Autore, Contenuto) VALUES ("Pianto antico", "Questa lirica fu composta nel giugno 1871 per la morte del figlioletto Dante 
di tre anni, avvenuta appena pochi mesi prima, il 9 novembre 1870. Il testo 
ha per tema il contrasto tra la natura, che torna a fiorire a 
ogni stagione, e il poeta, che si sente come una pianta ormai inaridita dal 
dolore per la perdita del bimbo", "25", "
L’albero a cui tendevi
La pargoletta mano,
Il verde melograno,
Da’ bei vermigli fior,

5 Nel muto orto solingo
Rinverdì tutto or ora
E giugno lo ristora
Di luce e di calor.

Tu fior de la mia pianta
10 Percossa e inaridita,
Tu de l’inutil vita
Estremo unico fior,

Sei ne la terra fredda,
Sei ne la terra negra;
15 Né il sol più ti rallegra
Né ti risveglia amor.");
-- ----------------------------------------------------------------------------

-- Utente
INSERT INTO Utente (Username, Password) VALUES ("Smau", "81dc9bdb52d04dc20036dbd8313ed055");
-- ----------------------------------------------------------------------------

-- Segnalibri
INSERT INTO Segnalibri (Utente, Poesia) VALUES (1, 1);
INSERT INTO Segnalibri (Utente, Poesia) VALUES (1, 2);
INSERT INTO Segnalibri (Utente, Poesia) VALUES (1, 3);
-- ----------------------------------------------------------------------------