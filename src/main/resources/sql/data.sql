--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: antrag; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.antrag (
    id bigint NOT NULL,
    antragsteller character varying(255),
    datum_erstellung timestamp without time zone,
    datum_genehmigung timestamp without time zone,
    json_modul_aenderung text,
    modul_id bigint
);


ALTER TABLE public.antrag OWNER TO root;

--
-- Name: antrag_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.antrag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.antrag_id_seq OWNER TO root;

--
-- Name: antrag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.antrag_id_seq OWNED BY public.antrag.id;


--
-- Name: modul; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.modul (
    id bigint NOT NULL,
    datum_aenderung timestamp without time zone,
    datum_erstellung timestamp without time zone,
    gesamt_leistungspunkte character varying(255),
    modulbeauftragte character varying(255),
    modulkategorie integer,
    sichtbar boolean,
    studiengang character varying(255),
    titel_deutsch character varying(255),
    titel_englisch character varying(255)
);


ALTER TABLE public.modul OWNER TO root;

--
-- Name: modul_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.modul_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modul_id_seq OWNER TO root;

--
-- Name: modul_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.modul_id_seq OWNED BY public.modul.id;


--
-- Name: veranstaltung; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.veranstaltung (
    id bigint NOT NULL,
    haeufigkeit character varying(10000),
    inhalte character varying(10000),
    lernergebnisse character varying(10000),
    literatur character varying(10000),
    sprache character varying(255),
    verwendbarkeit character varying(10000),
    voraussetzungen_bestehen character varying(10000),
    leistungspunkte character varying(255),
    titel character varying(255),
    voraussetzungen_teilnahme character varying(10000),
    modul_id bigint
);


ALTER TABLE public.veranstaltung OWNER TO root;

--
-- Name: veranstaltung_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.veranstaltung_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veranstaltung_id_seq OWNER TO root;

--
-- Name: veranstaltung_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.veranstaltung_id_seq OWNED BY public.veranstaltung.id;


--
-- Name: veranstaltung_semester; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.veranstaltung_semester (
    veranstaltung_id bigint NOT NULL,
    semester character varying(255)
);


ALTER TABLE public.veranstaltung_semester OWNER TO root;

--
-- Name: veranstaltungsform; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.veranstaltungsform (
    id bigint NOT NULL,
    form character varying(10000),
    semester_wochen_stunden integer NOT NULL,
    veranstaltung_id bigint
);


ALTER TABLE public.veranstaltungsform OWNER TO root;

--
-- Name: veranstaltungsform_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.veranstaltungsform_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veranstaltungsform_id_seq OWNER TO root;

--
-- Name: veranstaltungsform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.veranstaltungsform_id_seq OWNED BY public.veranstaltungsform.id;


--
-- Name: zusatzfeld; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.zusatzfeld (
    id bigint NOT NULL,
    inhalt character varying(10000),
    titel character varying(255),
    veranstaltung_id bigint
);


ALTER TABLE public.zusatzfeld OWNER TO root;

--
-- Name: zusatzfeld_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.zusatzfeld_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zusatzfeld_id_seq OWNER TO root;

--
-- Name: zusatzfeld_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.zusatzfeld_id_seq OWNED BY public.zusatzfeld.id;


--
-- Name: antrag id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.antrag ALTER COLUMN id SET DEFAULT nextval('public.antrag_id_seq'::regclass);


--
-- Name: modul id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modul ALTER COLUMN id SET DEFAULT nextval('public.modul_id_seq'::regclass);


--
-- Name: veranstaltung id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.veranstaltung ALTER COLUMN id SET DEFAULT nextval('public.veranstaltung_id_seq'::regclass);


--
-- Name: veranstaltungsform id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.veranstaltungsform ALTER COLUMN id SET DEFAULT nextval('public.veranstaltungsform_id_seq'::regclass);


--
-- Name: zusatzfeld id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.zusatzfeld ALTER COLUMN id SET DEFAULT nextval('public.zusatzfeld_id_seq'::regclass);


--
-- Data for Name: antrag; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.antrag VALUES (1, 'Initiale Erstellung', '2020-04-06 00:26:34.244807', '2020-04-06 00:26:34.521312', '{"titelDeutsch":"Programmierung","titelEnglisch":"Programming","veranstaltungen":[{"titel":"Programmierung","leistungspunkte":"10 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Programmierung“","semesterWochenStunden":4}],"beschreibung":{"inhalte":"Dieses Modul vermittelt grundlegende Programmierkenntnisse in einer objektorientierten Programmiersprache. Darüber hinaus werden einführend Aspekte von Algorithmen und Datenstrukturen behandelt. Es wird keine Programmiererfahrung vorausgesetzt.\n\n* Grundlegende Begriffe der Informatik\n* Primitive Datentypen und Variablen\n* Kontrollstrukturen\n* Eigene Datentypen (Klassen) und Arrays\n* Programmstrukturen im Speicher (Heap, Stack)\n* Konzepte der Objektorientierung (Polymorphie, Schnittstellen)\n* Rekursion\n* Fehlerbehandlung\n* Dynamische Datenstrukturen (Listen, Binärbäume, Hashing)\n* Suchen und Sortieren (ausgewählte Algorithmen, u.a. binäre Suche, BubbleSort, QuickSort)\n* Datenströme (Standard-Eingabe und -Ausgabe, einfache 2D-Grafik, Dateien)","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n    \n* Begriffe der Informatik und der Programmierung zu nennen und zu erläutern\n* einfache Algorithmen (iterativ und rekursiv) zu verstehen, deren Ablauf zu beschreiben, sowie selbst zu erstellen\n* eigene Datentypen zu konzipieren und anzuwenden\n* einfache objektorientierte Programme mit Polymorphie, Vererbung und Schnittstellen zu entwickeln\n* die behandelten dynamischen Datenstrukturen anzuwenden","literatur":"* R. Schiedermeier, „Programmieren mit Java“, Pearson Studium, 2010.\n* C. Ullenboom, „Java ist auch eine Insel“, 11. Aufl., 2014\n* R. Sedgewick \u0026 K. Wayne, „Introduction to Programming in Java“, Addison-Wesley, 2007.","verwendbarkeit":"* Pflichtbereich\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik\n* Modul D1 im Studienbereich Informatik (D) im Integrativen Bachelor-Studiengang Sprachtechnologie und Informationswissenschaft","voraussetzungenBestehen":"* aktive und erfolgreiche Mitwirkung in den theoretischen und praktischen Übungen\n* schriftliche Prüfung (Klausur, i.d.R. 90 Minuten)","haeufigkeit":"Jedes Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Keine"}],"modulbeauftragte":"Prof. Dr. Stefan Harmeling, Prof. Dr. Michael Schöttner","gesamtLeistungspunkte":"10 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"PFLICHT_INFO","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":227239900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":228215500}}}', 1);
INSERT INTO public.antrag VALUES (2, 'Initiale Erstellung', '2020-04-06 00:26:34.556445', '2020-04-06 00:26:34.5867', '{"titelDeutsch":"Analysis II","titelEnglisch":"Calculus of Several Variables","veranstaltungen":[{"titel":"Analysis II","leistungspunkte":"10 LP","veranstaltungsformen":[{"form":"Vorlesung „Analysis II“","semesterWochenStunden":4},{"form":"Übung","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Differentialrechnung mehrerer Veränderlicher, Mittelwertsätze und Taylor-Formel in mehreren Veränderlichen, Satz über implizite Funktionen, Extremwerte mit und ohne Nebenbedingungen, normierte und metrische Räume, Banachscher Fixpunktsatz, gewöhnliche Differentialgleichungen, Existenz- und Eindeutigkeitssätze, spezielle Lösungsmethoden, lineare Differentialgleichungen, Systeme mit konstanten Koeffizienten, Stabilität","lernergebnisse":"Die Studierenden bewältigen die Begriffsbildungen und grundlegenden Resultate der mehrdimensionalen Analysis sowie der gewöhnlichen Differentialgleichungen. Sie argumentieren anhand der Definitionen und Sätze und können intuitive Vorstellungen mathematisch präzisieren. Sie sind in der Lage, Übungsaufgaben selbstständig zu lösen und diese Lösungen in den Übungsgruppen zu präsentieren sowie kritisch zu diskutieren. Sie verfügen über Methoden der systematischen und effizienten Wissensaneignung.","literatur":"* H. Amann, J. Escher: Analysis II.\n* R. Denk, R. Racke: Kompendium der Analysis. Band 1.","verwendbarkeit":"* Bachelor-Studiengang Informatik\n* Bachelor-Studiengang Mathematik\n* Bachelor-Studiengang Physik","voraussetzungenBestehen":"* Erfolgreiche Teilnahme an den Übungsgruppen\n* Schriftliche Prüfung (Anmeldung in der Vorlesung)\n* Die Klausuren zu beiden Lehrveranstaltungen müssen bestanden werden; das Modul wird nicht benotet.","haeufigkeit":"Jedes Semester","sprache":""},"voraussetzungenTeilnahme":"Voraussetzungen nach Prüfungsordnungen: Keine; Empfohlene Voraussetzung: Analysis I"}],"modulbeauftragte":"Die Dozenten der Mathematik (Festlegung jeweils 1 Jahr im Voraus in einer Sitzung der Wissenschaftlichen Einrichtung)","gesamtLeistungspunkte":"10 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"PFLICHT_MATHE","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":556445400}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":556445400}}}', 2);
INSERT INTO public.antrag VALUES (3, 'Initiale Erstellung', '2020-04-06 00:26:34.599386', '2020-04-06 00:26:34.643125', '{"titelDeutsch":"Angewandte Mathematik (Wahlweise Numerik I oder Stochastik)","titelEnglisch":"Applied Mathematics","veranstaltungen":[{"titel":"Numerik I","leistungspunkte":"10 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Numerik I (Numerical Analysis I)“","semesterWochenStunden":4},{"form":"Programmierübung","semesterWochenStunden":1}],"beschreibung":{"inhalte":"Interpolation und Approximation, Quadraturverfahren, direkte Verfahren zur Lösung linearer Gleichungssysteme, Iterative Verfahren zur Lösung nichtlinearer Gleichungssysteme, Fehleranalyse","lernergebnisse":"Die Studierenden bewältigen die Begriffsbildungen und grundlegenden Resultate der numerischen Mathematik. Sie argumentieren anhand der Definitionen und Sätze und können intuitive Vorstellungen mathematisch präzisieren. Sie sind in der Lage, Übungsaufgaben selbstständig zu lösen und diese Lösungen in den Übungsgruppen zu präsentieren sowie kritisch zu diskutieren. Sie können abstrakte Algorithmen zu einem konkreten Programm umsetzen. Sie verfügen über Methoden der systematischen und effizienten Wissensaneignung.","literatur":"* P. Deuflhard, A.Hohmann: Numerische Mathematik 1.\n* R. Freund, R. Hoppe: Stoer/Bulirsch: Numerische Mathematik 1.","verwendbarkeit":"* Bachelor-Studiengang Informatik\n* Bachelor-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreiche Teilnahme an den Übungsgruppen\n* Schriftliche Prüfung (Anmeldung in der Vorlesung)\n* Die Klausur muss bestanden werden; das Modul wird nicht benotet.","haeufigkeit":"Jedes Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Voraussetzungen nach Prüfungsordnungen: Keine; Empfohlene Voraussetzung: Analysis I-II, Lineare Algebra I, Computergestützte Mathematik zur linearen Algebra"},{"titel":"Stochastik","leistungspunkte":"10 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Stochastik (Modelling in Stochastics)“","semesterWochenStunden":4}],"beschreibung":{"inhalte":"Grundlagen der Wahrscheinlichkeitsrechnung, Modelle für Zufallsexperimente, Anwendungsbeispiele in der Informatik und den Naturwissenschaften, Unabhängigkeit von Zufallsvariablen, erzeugende Funktionen, Gesetz der großen Zahlen, zentraler Grenzwertsatz, Maximum-Likelihood-Schätzer, Signifikanztests, lineare Regression","lernergebnisse":"Die Studierenden bewältigen die Begriffsbildungen und grundlegenden Resultate der Stochastik. Sie argumentieren anhand der Definitionen und Sätze und können intuitive Vorstellungen mathematisch präzisieren. Sie sind in der Lage, Übungsaufgaben selbstständig zu lösen und diese Lösungen in den Übungsgruppen zu präsentieren sowie kritisch zu diskutieren. Sie verfügen über Methoden der systematischen und effizienten Wissensaneignung.","literatur":"* N. Henze: Stochastik für Einsteiger.\n* U. Krengel: Einführung in die Wahrscheinlichkeitstheorie und Statistik.","verwendbarkeit":"* Bachelor-Studiengang Informatik\n* Bachelor-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreiche Teilnahme an den Übungsgruppen\n* Schriftliche Prüfung (Anmeldung in der Vorlesung)\n* Die Klausur muss bestanden werden; das Modul wird nicht benotet.","haeufigkeit":"Jedes Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Voraussetzungen nach Prüfungsordnungen: Keine; Empfohlene Voraussetzung: Analysis I, Lineare Algebra I"}],"modulbeauftragte":"Die Dozenten der Mathematik (Festlegung jeweils 1 Jahr im Voraus in einer Sitzung der Wissenschaftlichen Einrichtung)","gesamtLeistungspunkte":"10 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"PFLICHT_MATHE","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":598410300}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":598410300}}}', 3);
INSERT INTO public.antrag VALUES (4, 'Initiale Erstellung', '2020-04-06 00:26:34.652884', '2020-04-06 00:26:34.676307', '{"titelDeutsch":"Praxis- und Berufsorientierung","titelEnglisch":"Professional Issues","veranstaltungen":[{"titel":"Praxis- und Berufsorientierung","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Aus dem Angebot der Heinrich-Heine-Universität Düsseldorf sind Lehrveranstaltungen zur Praxis- und Berufsorientierung zu besuchen.\nDabei müssen zumindest zwei LP in Lehrveranstaltungen erworben werden, die Techniken des wissenschaftlichen Arbeitens oder Präsentationstechniken vermitteln. Hierzu zählen unter anderem:\n\n* Rhetorikseminare / -kurse\n* Seminare in der Informatik oder im gewählten Nebenfach\n* Veranstaltungen des KUBUS-Programms zu Techniken des wissenschaftlichen Arbeitens oder zu Präsentationstechniken\n\nDie übrigen Leistungspunkte (maximal 3 LP) können in einer oder mehreren der folgenden Veranstaltungsarten erworben werden:\n\n* Praktika mit hohem Informatik-Anteil innerhalb oder außerhalb der Universität (jedoch nicht im Rahmen von Lehrveranstaltungen). Für die Anerkennung ist eine [Praktikumsbescheinigung](https://www.cs.hhu.de/studium-lehre-informatik/studierende/praxis-und-berufsorientierung.html) erforderlich, die den Zeitumfang ausweist und detailliert die Inhalte des Praktikums beschreibt; weiterhin muss durch die Studierenden anhand der vom Fachbereich bereitgestellten Vorlage ein aussagekräftiger [Praktikumsbericht](https://www.cs.hhu.de/fileadmin/redaktion/Fakultaeten/Mathematisch-Naturwissenschaftliche_Fakultaet/Informatik/Studium/Allgemeines/Leitfaden_PraktikumsberichtMJL.pdf) erstellt werden.\n* Veranstaltungen rheinjug\n* Bewerbungstraining","semesterWochenStunden":0}],"beschreibung":{"inhalte":"Die Studierenden sollen in diesem Modul die Grundlagen von wissenschaftlichen Arbeitstechniken bzw. die professionelle Präsentation von Ergebnissen erlernen.\nDie Studierenden können weiterhin im Rahmen eines Industriepraktikums im Umfeld der Informatik ihre theoretischen Kenntnisse praktisch anwenden und vertiefen. Ferner lernen Sie die betrieblichen Abläufe kennen und können ihre sozialen Kompetenzen weiter verbessern.","lernergebnisse":"","literatur":"","verwendbarkeit":"Bachelor-Studiengang Informatik","voraussetzungenBestehen":"Erfolgreiche Teilnahme an den ausgewählten Veranstaltungen; der Erwerb von Leistungspunkten richtet sich nach den jeweiligen Regelungen für die besuchten Veranstaltungen. Bei Praktika richtet sich die Vergabe von Leistungspunkten nach der Dauer des Praktikums: 1 LP entspricht dabei in der Regel 28 Stunden Praktikum, zusätzlich ca. 2 Stunden Nachbereitung.","haeufigkeit":"regelmäßige Angebote der Universität","sprache":""},"voraussetzungenTeilnahme":"Keine"}],"modulbeauftragte":"Lehrende der jeweiligen Fächer","gesamtLeistungspunkte":"5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"PRAXIS","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":652884100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":652884100}}}', 4);
INSERT INTO public.antrag VALUES (5, 'Initiale Erstellung', '2020-04-06 00:26:34.694849', '2020-04-06 00:26:34.722175', '{"titelDeutsch":"Algorithmen und Datenstrukturen","titelEnglisch":"Algorithms and Data Structures","veranstaltungen":[{"titel":"Algorithmen und Datenstrukturen","leistungspunkte":"10 LP","veranstaltungsformen":[{"form":"* Vorlesung „Algorithmen und Datenstrukturen“, 4 SWS\n* Übung, 2 SWS\n* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere 4 SWS","semesterWochenStunden":0}],"beschreibung":{"inhalte":"Dieses Modul vermittelt grundlegende Kenntnisse aus folgenden Bereichen.\n    \n* Algorithmen und ihre formalen Grundlagen\n* Rechenmodelle, Effizienzmaße\n* Sortierverfahren (Quicksort, Heapsort, Mergesort, ...)\n* Aufwandsabschätzung im Mittel\n* Suchstrategien (Binärsuche, Interpolationsuche, Textsuche, ...)\n* Dictionaries (offene Hashverfahren, dynamische Hashverfahren)\n* Suchbäume (AVL-Bäume, B-Bäume, Splay-Trees, ...)\n* Vorrangswarteschlangen (Heaps, Binominal Queues, Fibonacci-Heaps, ...)\n* Amortisierte Laufzeitanalysen\n* Einführung in Graphenalgorithmen (Tiefensuche, Breitensuche, Zusammenhangsprobleme, ...)","lernergebnisse":"Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein Basisverständnis der wichtigsten Grundlagen über Algorithmen. Sie haben die Fähigkeit zur Problemspezifikation und algorithmischen Problembearbeitung erworben.","literatur":"* Thomas Ottmann, Peter Widmayer: Algorithmen und Datenstrukturen, Spektrum Akademischer Verlag, 5. Auflage, 2012\n* Richard Johnsonbaugh, Marcus Schäfer: Algorithms, Pearson Education, 2004\n* Jon Kleinberg, Eva Tardos: Algorithm Design, Addison Wesley, 2006","verwendbarkeit":"* Pflichtbereich\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* aktive Mitarbeit in den Übungen\n* Abgabe der Hausaufgaben\n* schriftliche Klausur (i.d.R. 90 Minuten) oder mündliche Prüfung am Ende des Semesters","haeufigkeit":"Jedes Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Keine"}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski, Prof. Dr. Gunnar W. Klau, Prof. Dr. Martin Lercher, Prof. Dr. Egon Wanke","gesamtLeistungspunkte":"10 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"PFLICHT_INFO","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":693873100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":693873100}}}', 5);
INSERT INTO public.antrag VALUES (6, 'Initiale Erstellung', '2020-04-06 00:26:34.732911', '2020-04-06 00:26:34.76414', '{"titelDeutsch":"Einführung Rechnernetze, Datenbanken und Betriebssysteme","titelEnglisch":"Introduction to Computer Networks, Databases, and Operating Systems","veranstaltungen":[{"titel":"Einführung Rechnernetze, Datenbanken und Betriebssysteme","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"* Vorlesung „Einführung Rechnernetze, Datenbanken und Betriebssysteme“, 2 SWS\n* Übung, 1 SWS\n* Selbststudium, 100h","semesterWochenStunden":0}],"beschreibung":{"inhalte":"Die Vorlesung gibt einen Überblick über verschiedene Themen der praktischen Informatik. In der Übung werden diese Inhalte eingeübt.\n\n* Aufbau und grundlegende Funktionsweise des Internets\n* Socketprogrammierung\n* Speicherverwaltung (virtueller Speicher, Heap, Stack)\n* Grundlegende Funktionsweise von Dateisystemen\n* Nebenläufigkeit (Threads, Scheduling, Synchronisierung)\n* Entity-Relationship-Modellierung\n* Relationenmodell\n* Grundlagen von SQL","lernergebnisse":"Nach erfolgreicher Teilnahme an den Veranstaltungen dieses Moduls können die Studierenden\n    \n* die wichtigsten Komponenten des Internets benennen,\n* sowie deren Beziehungen untereinander und Ihre grundsätzliche Funktion beschreiben,\n* einfache Programme mit Netzwerknutzung schreiben,\n* grundlegende Funktionen eines Betriebssystems benennen und erläutern,\n* einfache nebenläufige Programme schreiben,\n* die Aufgaben eines Datenbanksystems benennen,\n* Datenbanken in Form von ER Modellen darstellen und\n* einfache Datenbankanfragen in SQL schreiben.","literatur":"* J. F. Kurose, K. W. Ross: Computer Networking – A Top-Down Approach Featuring the Internet; 6th Edition; Pearson, 2012\n* A. Heuer, G. Saake, K.-U. Sattler: Datenbanken – Konzepte und Sprachen, 5. Aufl., mitp-Verlag, Bonn, 2013\n* A. Tanenbaum: Modern Operating Systems, 4. Aufl., Prentice Hall, 2014.\n* W. Stallings, Operating Systems: Internals and Design Principles, Prentice Hall, 8. Aufl., 2014.","verwendbarkeit":"* Pflichtbereich\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* aktive und erfolgreiche Teilnahme an den Übungen\n* schriftliche Prüfung (i.d.R. 60 Minuten) am Ende des Semesters","haeufigkeit":"Jedes Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Keine"}],"modulbeauftragte":"Prof. Dr. Stefan Conrad, Prof. Dr. Martin Mauve, Prof. Dr. Michael Schöttner","gesamtLeistungspunkte":"5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"PFLICHT_INFO","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":731934900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":731934900}}}', 6);
INSERT INTO public.antrag VALUES (7, 'Initiale Erstellung', '2020-04-06 00:26:34.775851', '2020-04-06 00:26:34.812524', '{"titelDeutsch":"Rechnerarchitektur","titelEnglisch":"Computer Architecture","veranstaltungen":[{"titel":"Hardwarenahe Programmierung","leistungspunkte":"4 LP","veranstaltungsformen":[{"form":"* Vorlesung „Hardwarenahe Programmierung“, 15h (im Block)\n* Praktische Übung „Hardwarenahe Programmierung“, 35h (im Block) (Vorlesung und Praktische Übung 4 LP)\n* Selbststudium, 175h","semesterWochenStunden":0}],"beschreibung":{"inhalte":"Die Vorlesung „Hardwarenahe Programmierung“ und die praktische Übung (4 LP) vermitteln Kenntnisse in der Assemblerprogrammierung sowie einer systemnahen imperativen Programmiersprache. Es wird vorausgesetzt, dass die Teilnehmer übliche Programmelemente, wie Variablen, Verzweigungen, Schleifen und Funktionen sicher verwenden können.\n\n* Grundlagen der Assembler Programmierung\n* Programmierung in einer systemnahen imperativen Programmiersprache\n* dynamische Speicherverwaltung inkl. Identifizierung von Speicherlecks\n* ein zur Programmiersprache passendes Build-Tool sowie eine geeignete Testumgebung","lernergebnisse":"Nach erfolgreicher Teilnahme an den Veranstaltungen dieses Moduls können die Studierenden\n\n* wiedergeben wie ein moderner Computer aufgebaut ist,\n* die verschiedenen Schichten einer Rechnerarchitektur beschreiben und dabei auf ihre Verbindung untereinander eingehen,\n* erklären, wie eine CPU/ALU aus elementaren digitalen Schaltungen konstruiert wird,\n* zentrale Funktionen eines Betriebssystems identifizieren und ihre Arbeitsweise an einfachen Beispielen darstellen,\n* einfache digitale Schaltungen entwerfen und optimieren,\n* einfache Assemblerprogramme in x86 Assembler entwickeln,\n* sich selbstständig Kenntnisse in einer neuen Programmiersprache aneignen,\n* Programme in der Programmiersprache C unter Berücksichtigung dynamischer Speicherverwaltung entwickeln und\n* Werkzeuge für typische Aufgaben bei der Programmierung (Speicherverwaltung, Build-Prozesse, Tests) verwenden.","literatur":"Die primären Lehrbücher zu den verschiedenen Bestandteilen dieses Moduls sind:\n    \n* Andrew S. Tanenbaum and Todd Austin: Structured Computer Organization; 6th Edition; Pearson; 2013. Prentice Hall; 5th Edition; 2006\n* David Griffiths and Dawn Griffiths (dt. Lars Schulten): C von Kopf bis Fuß; O‘Reilly Verlag; 2012\n* Paul A. Carter: PC Assembly Language; Online; 2003","verwendbarkeit":"* Pflichtbereich\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* aktive und erfolgreiche Teilnahme an den Übungen zur Vorlesung „Rechnerarchitektur“\n* aktive und erfolgreiche Teilnahme an den praktischen Übungen\n* schriftliche Prüfung (Klausur, i.d.R. 60 Minuten)","haeufigkeit":"Die Vorlesung „Assemblerprogrammierung“ und die praktische Übung werden in der vorlesungsfreien Zeit im Anschluss an das Sommersemester angeboten.","sprache":""},"voraussetzungenTeilnahme":"Keine"},{"titel":"Rechnerarchitektur","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Vorlesung „Rechnerarchitektur“","semesterWochenStunden":2},{"form":"Übung","semesterWochenStunden":1}],"beschreibung":{"inhalte":"Die Vorlesung „Rechnerarchitektur“ sowie die dazugehörige Übung (5 LP) behandelt den Aufbau eines Rechners. Dabei wird insbesondere auf folgende Themengebiete eingegangen:\n* Datendarstellung\n* einfache Fehlererkennende und -korrigierende Codes\n* Konzepte zur effizienten Datenverarbeitung (Pipelines, Caches)\n* digitale Logik\n* digitale Schaltungen\n* Mikroprogrammierung","lernergebnisse":"Nach erfolgreicher Teilnahme an den Veranstaltungen dieses Moduls können die Studierenden\n* wiedergeben wie ein moderner Computer aufgebaut ist,\n* die verschiedenen Schichten einer Rechnerarchitektur beschreiben und dabei auf ihre Verbindung untereinander eingehen,\n* erklären, wie eine CPU/ALU aus elementaren digitalen Schaltungen konstruiert wird,\n* zentrale Funktionen eines Betriebssystems identifizieren und ihre Arbeitsweise an einfachen Beispielen darstellen,\n* einfache digitale Schaltungen entwerfen und optimieren,\n* einfache Assemblerprogramme in x86 Assembler entwickeln,\n* sich selbstständig Kenntnisse in einer neuen Programmiersprache aneignen,\n* Programme in der Programmiersprache C unter Berücksichtigung dynamischer Speicherverwaltung entwickeln und\n* Werkzeuge für typische Aufgaben bei der Programmierung (Speicherverwaltung, Build-Prozesse, Tests) verwenden.","literatur":"Die primären Lehrbücher zu den verschiedenen Bestandteilen dieses Moduls sind:\n* Andrew S. Tanenbaum and Todd Austin: Structured Computer Organization; 6th Edition; Pearson; 2013. Prentice Hall; 5th Edition; 2006\n* David Griffiths and Dawn Griffiths (dt. Lars Schulten): C von Kopf bis Fuß; O‘Reilly Verlag; 2012\n* Paul A. Carter: PC Assembly Language; Online; 2003","verwendbarkeit":"* Pflichtbereich\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* aktive und erfolgreiche Teilnahme an den Übungen zur Vorlesung „Rechnerarchitektur“\n* aktive und erfolgreiche Teilnahme an den praktischen Übungen\n* schriftliche Prüfung (Klausur, i.d.R. 60 Minuten)","haeufigkeit":"Die Vorlesung „Rechnerarchitektur“ mit zugehöriger Übung wird jedes Sommersemester angeboten.","sprache":""},"voraussetzungenTeilnahme":"Keine"}],"modulbeauftragte":"Prof. Dr. Stefan Conrad, Prof. Dr. Martin Mauve","gesamtLeistungspunkte":"9 LP ab PO 2016, alte PO‘s 10 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"PFLICHT_INFO","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":775850900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":775850900}}}', 7);
INSERT INTO public.antrag VALUES (8, 'Initiale Erstellung', '2020-04-06 00:26:34.824235', '2020-04-06 00:26:34.845706', '{"titelDeutsch":"Professionelle Softwareentwicklung (Programmierpraktikum I)","titelEnglisch":"Professional Software Development (Programming Project I)","veranstaltungen":[{"titel":"Professionelle Softwareentwicklung (Programmierpraktikum I)","leistungspunkte":"8 LP ab PO 2016, alte PO‘s 10 LP","veranstaltungsformen":[{"form":"* Vorlesung „Professionelle Softwareentwicklung“, 2 SWS\n* Übung, 2 SWS\n* Selbststudium, 180h","semesterWochenStunden":0}],"beschreibung":{"inhalte":"* Prinzipien objektorientierter Software Entwicklung\n* Prozesse in der professionellen Softwareentwicklung\n* Grundlegende Softwarearchitekturen\n* Werkzeuge der Softwareentwicklung","lernergebnisse":"Studierende sollen nach erfolgreichem Abschluss des Moduls\n    \n* grundlegende Architekturen beschreiben können\n* selbständig Problemstellungen analysieren können\n* aus einfachen Problemstellungen ein objektorientiertes System zur Lösung entwerfen können\n* eine Lösung hinsichtlich der Wartbarkeit analysieren und verbessern können\n* mit den gängigen Werkzeugen (z.B. IDE) umgehen können","literatur":"* Robert C. Martin, Clean Code: A Handbook of Agile Software Craftsmanship, Prentice Hall, 2008\n* Robert C. Martin, The Clean Coder: A Code of Conduct for Professional Programmers, Prentice Hall, 2011","verwendbarkeit":"* Professionelle Softwareentwicklung\n* Modul D2 im Studienbereich Informatik (D) im Integrativen Bachelor-Studiengang Sprachtechnologie und Informationswissenschaft","voraussetzungenBestehen":"* Aktive und erfolgreiche Mitwirkung in den Übungen (Projekten)\n* Abschlusstest (unbenotet) zum Ende der Vorlesungszeit","haeufigkeit":"Jedes Sommersemester.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss des Moduls:\n\n* „Programmierung”"}],"modulbeauftragte":"Dr. Jens Bendisposto","gesamtLeistungspunkte":"8 LP ab PO 2016, alte PO‘s 10 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"PFLICHT_INFO","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":823259200}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":823259200}}}', 8);
INSERT INTO public.antrag VALUES (9, 'Initiale Erstellung', '2020-04-06 00:26:34.858393', '2020-04-06 00:26:34.880839', '{"titelDeutsch":"Softwareentwicklung im Team (Programmierpraktikum II)","titelEnglisch":"Teamwork in Software Development (Programming Project II)","veranstaltungen":[{"titel":"Softwareentwicklung im Team (Programmierpraktikum II)","leistungspunkte":"8 LP","veranstaltungsformen":[{"form":"* Vorlesung „Softwareentwicklung im Team“, 2 SWS\n* Übung, 2 SWS\n* Praktische Übung, 120h (Blockveranstaltung)\n* Selbststudium, 60h","semesterWochenStunden":0}],"beschreibung":{"inhalte":"* Projektbezogene Gruppenarbeit\n* Entwurf und Gliederung eines umfangreicheren Programms\n* Dokumentation\n* Diskussion über Softwareaufbau und Design im Team\n* Werkzeuge zur Teamkoordination","lernergebnisse":"Nach erfolgreichem Abschluss des Moduls sollen die Studierenden in der Lage sein,\n    \n* grundlegende Entwicklungsprozesse beschreiben zu können,\n* eine gestellte komplexere Aufgabe verstehen und in Teilaufgaben strukturieren zu können,\n* die Teilaufgaben in einem Team entsprechend eines Entwicklungsprozesses implementieren zu können,\n* die einzelnen Bestandteile sowie das Gesamtprogramms mit geeigneten Verfahren testen zu können,\n* mit den Werkzeugen zur Softwareentwicklung im Team (Versionskontrolle, CI Systeme, Bugtracker) sicher umgehen zu können.","literatur":"* Robert C. Martin, Clean Code: A Handbook of Agile Software Craftsmanship, Prentice Hall, 2008\n* Robert C. Martin, The Clean Coder: A Code of Conduct for Professional Programmers, Prentice Hall, 2011","verwendbarkeit":"* Softwareentwicklung im Team","voraussetzungenBestehen":"* Aktive und erfolgreiche Mitwirkung an dem Gruppenprojekt\n* Abschlusstest (unbenotet) zum Ende der Vorlesungszeit\n* Vortrag/Vorstellung der Ergebnisse im Plenum","haeufigkeit":"Jedes Wintersemester.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss des Moduls:\n\n* „Professionelle Softwareentwicklung (Programmierpraktikum I)”"}],"modulbeauftragte":"Dr. Jens Bendisposto","gesamtLeistungspunkte":"8 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"PFLICHT_INFO","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":858392900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":858392900}}}', 9);
INSERT INTO public.antrag VALUES (10, 'Initiale Erstellung', '2020-04-06 00:26:34.890598', '2020-04-06 00:26:34.92378', '{"titelDeutsch":"Theoretische Informatik","titelEnglisch":"Theoretical Computer Science","veranstaltungen":[{"titel":"Theoretische Informatik","leistungspunkte":"10 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Theoretische Informatik“","semesterWochenStunden":4}],"beschreibung":{"inhalte":"* Formale Sprachen und Automaten\n  * Grundbegriffe\n    * Wörter, Sprachen und Grammatiken\n    * Die Chomsky-Hierarchie\n  * Reguläre Sprachen\n    * Endliche Automaten\n    * Reguläre Ausdrücke\n    * Gleichungssysteme\n    * Das Pumping-Lemma\n    * Satz von Myhill und Nerode und Minimalautomaten\n    * Abschlusseigenschaften regulärer Sprachen\n    * Charakterisierungen regulärer Sprachen\n  * Kontextfreie Sprachen\n    * Normalformen\n    * Das Pumping-Lemma\n    * Der Satz von Parikh\n    * Abschlusseigenschaften kontextfreier Sprachen\n    * Der Algorithmus von Cocke, Younger und Kasami\n    * Kellerautomaten\n  * Deterministisch kontextfreie Sprachen\n    * Deterministische Kellerautomaten\n    * LR(k)- und LL(k)-Grammatiken\n    * Anwendung: Syntaxanalyse durch LL(k)-Parser\n  * Kontextsensitive und L0-Sprachen\n    * Turingmaschinen\n    * Linear beschränkte Automaten\n    * Zusammenfassung\n* Berechenbarkeit\n  * Intuitiver Berechenbarkeitsbegriff und die These von Church\n  * Turing-Berechenbarkeit\n  * LOOP-, WHILE- und GOTO-Berechenbarkeit\n    * LOOP-Berechenbarkeit\n    * WHILE-Berechenbarkeit\n    * GOTO-Berechenbarkeit\n  * Primitiv rekursive und partiell rekursive Funktionen\n    * Primitiv rekursive Funktionen\n    * Die Ackermann-Funktion\n    * Allgemein und partiell rekursive Funktionen\n    * Der Hauptsatz der Berechenbarkeitstheorie\n  * Entscheidbarkeit und Aufzählbarkeit\n    * Einige grundlegende Sätze\n    * Entscheidbarkeit\n    * Rekursiv aufzählbare Mengen\n  * Unentscheidbarkeit\n    * Der Satz von Rice\n    * Reduzierbarkeit\n    * Das Postsche Korrespondenzproblem\n    * Unentscheidbarkeit in der Chomsky-Hierarchie\n    * Zusammenfassung","lernergebnisse":"Ziel dieser Veranstaltung ist die Vermittlung von Grundlagenwissen aus den Bereichen Formale Sprachen und Automaten sowie Berechenbarkeitstheorie. Am Ende der Veranstaltung sollten Studierende in der Lage sein, formale Sprachen in die Chomsky-Hierarchie einzuordnen, verschiedene äquivalente Automatenmodelle ineinander bzw. in Grammatiken des entsprechenden Typs umzuformen, Argumente für die In-Äquivalenz von bestimmten Automatenmodellen bzw. Grammatiktypen zu geben, die algorithmische Entscheidbarkeit von Problemen einzuschätzen und Argumente für die Nichtentscheidbarkeit von Problemen zu geben. Auch sollten sie die Erkenntnis gewonnen haben, dass es nicht berechenbare Funktionen gibt, und eine Vorstellung vom Aufbau eines Compilers und von lexikalischer und Syntaxanalyse erworben haben. Neben diesen Kenntnissen sollten sie sich auch Fertigkeiten im Umgang mit formalen Begriffs- und Modellbildungen sowie mit formalen Argumentationsweisen sowie bestimmte Beweistechniken (wie etwa Diagonalisierung) angeeignet haben.","literatur":"* Uwe Schöning: Theoretische Informatik - kurz gefasst, Spektrum Akademischer Verlag, 2. Auflage, 1995.\n* John E. Hopcroft, Rajeev Motwani, Jeffrey D. Ullman: Einführung in die Automatentheorie, Formale Sprachen und Komplexitätstheorie, Pearson Studium, 2. Auflage, 2002.\n* Klaus W. Wagner: Theoretische Informatik. Eine kompakte Einführung, Springer-Verlag, 2. Auflage, Berlin, Heidelberg, 2003.\n\n### Ergänzende Literatur\n\n* Norbert Blum: Theoretische Informatik. Eine anwendungsorientierte Einführung, Oldenbourg, 2001.\n* Alexander Asteroth, Christel Baier: Theoretische Informatik. Eine Einführung in Berechenbarkeit, Komplexität und formale Sprachen mit 101 Beispielen, Pearson Studium, 2002.","verwendbarkeit":"* Pflichtbereich\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* erfolgreiche Bearbeitung der Übungsaufgaben\n* Bestehen der schriftlichen Prüfung (Klausur)","haeufigkeit":"Jedes Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Keine"}],"modulbeauftragte":"Prof. Dr. Michael Leuschel, Prof. Dr. Jörg Rothe, Jun.-Prof. Dr. Dorothea Baumeister","gesamtLeistungspunkte":"10 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"PFLICHT_INFO","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":889621800}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":889621800}}}', 10);
INSERT INTO public.antrag VALUES (11, 'Initiale Erstellung', '2020-04-06 00:26:34.932563', '2020-04-06 00:26:34.962552', '{"titelDeutsch":"Lineare Algebra I","titelEnglisch":"Linear Algebra I","veranstaltungen":[{"titel":"Lineare Algebra I","leistungspunkte":"10 LP","veranstaltungsformen":[{"form":"Vorlesung „Lineare Algebra I“","semesterWochenStunden":4},{"form":"Übung","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Lineare Gleichungssysteme, Mengen, Gruppen, Ringe, Körper, komplexe Zahlen, endliche Primkörper, Vektorräume, Basen, Summenvektorräume, Äquivalenzrelationen, Quotientenvektorräume, lineare Abbildungen, Matrizen, Kern und Bild, Isomorphiesatz, Rang, Gauß-Algorithmus, Endomorphismen, Determinante, Laplace-Entwicklung, Eigenwerte und Eigenvektoren, charakteristisches Polynom, Diagonalisierbarkeit, Skalarprodukte, Länge und Winkel, Gram-Schmidt-Verfahren, orthogonale und unitäre Endomorphismen","lernergebnisse":"Die Studierenden bewältigen die Begriffsbildungen und grundlegenden Resultate der linearen Algebra. Sie argumentieren anhand der Definitionen und Sätze und können intuitive Vorstellungen mathematisch präzisieren. Sie sind in der Lage, Übungsaufgaben selbstständig zu lösen und diese Lösungen in den Übungsgruppen zu präsentieren sowie kritisch zu diskutieren. Sie verfügen über Methoden der systematischen und effizienten Wissensaneignung.","literatur":"* S. Bosch: Lineare Algebra.\n* G. Fischer: Lineare Algebra.","verwendbarkeit":"* Bachelor-Studiengang Informatik\n* Bachelor-Studiengang Mathematik\n* Bachelor-Studiengang Physik","voraussetzungenBestehen":"* Erfolgreiche Teilnahme an der Übungsgruppen\n* Schriftliche Prüfung (Anmeldung in der Vorlesung)\n* Die Klausur muss bestanden werden; das Modul wird nicht benotet.","haeufigkeit":"Jedes Semester","sprache":""},"voraussetzungenTeilnahme":"Voraussetzungen nach Prüfungsordnungen: Keine; Empfohlene Voraussetzung: Keine"}],"modulbeauftragte":"Die Dozenten der Mathematik (Festlegung jeweils 1 Jahr im Voraus in einer Sitzung der Wissenschaftlichen Einrichtung)","gesamtLeistungspunkte":"10 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"PFLICHT_MATHE","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":931587100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":931587100}}}', 11);
INSERT INTO public.antrag VALUES (12, 'Initiale Erstellung', '2020-04-06 00:26:34.973289', '2020-04-06 00:26:35.005051', '{"titelDeutsch":"Analysis I","titelEnglisch":"Calculus of One Variable","veranstaltungen":[{"titel":"Analysis I","leistungspunkte":"10 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Analysis I“","semesterWochenStunden":4}],"beschreibung":{"inhalte":"Reelle und komplexe Zahlen, Folgen, Konvergenz, Cauchy-Folgen, Grenzwerte, Reihen, Stetigkeit, Kompaktheit, spezielle Funktionen, Differentialrechnung, Integralrechnung, Funktionenfolgen, Potenzreihen, Taylor-Entwicklung","lernergebnisse":"Die Studierenden bewältigen die Begriffsbildungen und grundlegenden Resultate der Analysis einer Veränderlichen. Sie argumentieren anhand der Definitionen und Satze und können intuitive Vorstellungen mathematisch präzisieren. Sie sind in der Lage, Übungsaufgaben selbstständig zu lösen und diese Lösungen in den Übungsgruppen zu präsentieren sowie kritisch zu diskutieren. Sie verfügen über Methoden der systematischen und effizienten Wissensaneignung.","literatur":"* H. Amann, J. Escher: Analysis I.\n* R. Denk, R. Racke: Kompendium der Analysis. Band 1.","verwendbarkeit":"* Bachelor-Studiengang Informatik\n* Bachelor-Studiengang Mathematik\n* Bachelor-Studiengang Physik","voraussetzungenBestehen":"* Erfolgreiche Teilnahme an den Übungsgruppen\n* Schriftliche Prüfung (Anmeldung in der Vorlesung)\n* Die Klausur muss bestanden werden; das Modul wird nicht benotet.","haeufigkeit":"Jedes Semester","sprache":""},"voraussetzungenTeilnahme":"Voraussetzungen nach Prüfungsordnungen: Keine; Empfohlene Voraussetzung: Keine"}],"modulbeauftragte":"Die Dozenten der Mathematik (Festlegung jeweils 1 Jahr im Voraus in einer Sitzung der Wissenschaftlichen Einrichtung)","gesamtLeistungspunkte":"10 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"PFLICHT_MATHE","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":972311900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":34,"nano":972311900}}}', 12);
INSERT INTO public.antrag VALUES (13, 'Initiale Erstellung', '2020-04-06 00:26:35.014813', '2020-04-06 00:26:35.035813', '{"titelDeutsch":"Verteilte Systeme","titelEnglisch":"Distributed Systems","veranstaltungen":[{"titel":"Verteilte Systeme","leistungspunkte":"10 LP","veranstaltungsformen":[{"form":"Vorlesung „Verteilte Systeme“","semesterWochenStunden":4},{"form":"Übung","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Architekturformen\n* Grundlagen (Prozesse, Threads, Sperren)\n* Kommunikation: Nachrichten, entfernte Methodenaufrufe und gemeinsamer Speicher\n* Namensdienste (DNS, Gnutella, Chord, CAN, Pastry)\n* Koordination: Zeit, wechselseitiger Ausschluss und globale Zustände, Transaktionen\n* Replikation und Konsistenz\n* Gruppenkommunikation (atomarer Multicast, Overlay-Multicast)\n* Fehlertoleranz: Fehlermodelle, Checkpointing\n* Konsensus (flooding consensus, Paxos, byzantinische Generäle)\n* Verteilte Dateisysteme (NFS, GoogleFS, CFS, IVY, OceanStore)\n* Sicherheit: Grundlagen Verschlüsselung und Authentisierung\n\nIn den Übungen wird neben Aufgaben auf Papier auch ein verteilter In-Memory Key-Value-Store entwickelt. Die Implementierung erfolgt in mehreren Stufen und dientder Vertiefung der verteilten und parallelen Konzepte aus der Vorlesung.","lernergebnisse":"Studierende können nach erfolgreichem Abschluss dieses Moduls Begriffe und Konzepte im Umfeld verteil-ter Systeme in eigenen Worten erklären. Ferner können Sie die behandelten Algorithmen auf Papier und in eigenen Programmen anwenden und vergleichen.","literatur":"* G. Coulouris et.al., „Distributed Systems: Concepts and Design“, Addison-Wesley, 5. Aufl. 2011\n* A. Tanenbaum and M. van Steen: „Distributed Systems: Principles and Paradigms”, 3. Auflage, Pren-tice Hall, 2013.\n* K. Birman, „Guide to Reliable Distributed Systems: Building High-Assurance Applications and Cloud-Hosted Services“, Springer, 1. Auflage, 2012.\n* Weitere relevante Publikationen werden in der Vorlesung bekannt gegeben","verwendbarkeit":"* WahlpflichtbereichPraktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"Erfolgreiche Bearbeitung der Übungsaufgaben. Erfolgreiche Teilnahme an der Prüfung am Ende der Veran-staltung.","haeufigkeit":"I.d.R. jährlich","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Michael Schöttner","gesamtLeistungspunkte":"10 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":12858500}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":12858500}}}', 13);
INSERT INTO public.antrag VALUES (14, 'Initiale Erstellung', '2020-04-06 00:26:35.041669', '2020-04-06 00:26:35.068019', '{"titelDeutsch":"Verteilte und Parallele Programmierung","titelEnglisch":"Distributed and Parallel Programming","veranstaltungen":[{"titel":"Verteilte und Parallele Programmierung","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Verteilte und Parallele Programmierung“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Grundlagen der Parallelisierung\n* Prozesse, Threads, Synchronisierung (mit und ohne Sperren)\n* Transactional Memory\n* Sockets\n* Infiniband\n* Fallstudien\n* OpenMP\n* Message Passing Interface (MPI)\n\nIn den Übungen warden die Programmiersprachen Java und C verwendet.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* einfache Algorithmen zu parallelisieren\n* die besprochenen Konzepteanzuwenden\n* parallele Problemstellung korrekt zu synchronisieren und gegebene Lösungen zubewerten","literatur":"Wird in der Vorlesung bekannt gegeben.","verwendbarkeit":"* WahlpflichtbereichPraktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreiche Bearbeitung von Übungsaufgaben\n* Abschließende Prüfung am Ende des Semesters","haeufigkeit":"Wird nicht mehr angeboten.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"keine"}]}],"modulbeauftragte":"Prof. Dr. Michael Schöttner","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":41668500}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":41668500}}}', 14);
INSERT INTO public.antrag VALUES (15, 'Initiale Erstellung', '2020-04-06 00:26:35.073874', '2020-04-06 00:26:35.1012', '{"titelDeutsch":"Vertiefung Logische Programmierung","titelEnglisch":"Advanced Logic Programming","veranstaltungen":[{"titel":"Vertiefung Logische Programmierung","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Praktische Übung","semesterWochenStunden":1},{"form":"Übung","semesterWochenStunden":1},{"form":"Vorlesung „Vertiefung Logische Programmierung“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Dieses Modul beschäftigt sich mit fortgeschrittenen Themen der logischenProgrammierung. Dazu gehören vertiefende Themen aus dem Constraint LogicProgramming. Weiterhin befasst sich das Modul mit der Ent-wicklung vonInterpretern sowie Programmanalyse-und Verifikationswerkzeugen in Prolog.\n\nDie Themen sind:\n\n* Fortgeschrittene Programmiertechniken in Prolog\n* Metaprogrammierung in Prolog und Anwendungen\n* Anwendung von Constraint Logic Programming\n* Entwicklung eigener Constraint Solver\n* Interpreterentwicklung in Prolog\n* Programmanalyse mit abstrakter Interpretation und Datenflussanalyse","lernergebnisse":"Nach erfolgreichem Abschluss des Moduls sollten die Studierenden:\n\n* Problemstellungen mit Hilfe von Constraint Solvern lösen können\n* gängige Techniken für die Implementierung von Constraint Solvern kennen und umsetzen können\n* eigene Constraint Solver entwickeln können\n* verstehen wie Programmiersprachen mit Interpretern implementiert werden können\n* in der Lage sein für eine neue Programmiersprache einen Interpreter in Prolog selber zu entwickeln\n* in der Lage sein einen Interpreter für Prolog in Prolog zu schreiben\n* die Grundzüge der abstrakten Interpretation und ihrer Anwendung zur Programmverifikation erläutern und vergleichen können\n* einfache Analyse und Verifikationswerkzeuge in Prolog entwickeln können","literatur":"Als Lehrbuch wird ein eigenes Skript verwendet.","verwendbarkeit":"* WahlpflichtbereichPraktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreiche Bearbeitung der Pflichtübungen\n* Bestehen der Klausur","haeufigkeit":"Normalerweise jedes Jahr im Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"Grundlagen der logischen Programmierung und von Prolog (zum Beispiel aus dem Modul „Einführung in die logische Programmierung”)"}]}],"modulbeauftragte":"Prof. Dr. Michael Leuschel","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":73873800}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":73873800}}}', 15);
INSERT INTO public.antrag VALUES (16, 'Initiale Erstellung', '2020-04-06 00:26:35.109008', '2020-04-06 00:26:35.131455', '{"titelDeutsch":"Vertiefung Rechnernetze","titelEnglisch":"Advanced Computer Networks","veranstaltungen":[{"titel":"Vertiefung Rechnernetze","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Vorlesung „Vertiefung Rechnernetze“","semesterWochenStunden":2},{"form":"Durcharbeiten von wissenschaftlichen Veröffentlichungen","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Rechnernetze im Allgemeinen und das Internet im Besonderen wurden seit den frühen Anfängen des ARPA-NET maßgeblich durch wissenschaftliche Arbeiten geprägt. Ziel der Veranstaltung ist es, das Grundwissen aus der Vorlesung Rechnernetze durch ein intensives Studium der richtungsweisenden Veröffentlichungen im Bereich Rechnernetze zu vertiefen. Um dieses Lernziel zu erreichen wird folgende Lehrform verwendet: jede Woche wird den Teilnehmern eine wissenschaftliche Veröffentlichung genannt. Diese ist prinzipiell in englischer Sprache verfasst. Die Teilnehmer arbeiten diese Veröffentlichung selbständig durch, so dass sie in der Lage sind, deren Inhalt vor allen anderen Teilnehmern an der Tafel zu präsentieren. Jede Woche fin-det eine Diskussionsveranstaltung statt, bei der zufällig ausgewählte Teilnehmer die Veröffentlichung vorstel-len. Anschließend diskutieren alle Teilnehmer die Veröffentlichung.","lernergebnisse":"Studierende haben nach erfolgreichem Abschluss dieses Moduls ein vertieftes Verständnis der Funktionsweise von Computernetzwerken. Sie können wissenschaftliche Veröffentlichungen systematisch aufarbeiten, deren Inhalte prägnant zusammenfassen und kritisch bewerten.","literatur":"Zu dieser Veranstaltung gibt es kein Lehrbuch.","verwendbarkeit":"* WahlpflichtbereichPraktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Mitarbeit in Vorlesung\n* aktiveVorbereitung der Veröffentlichungen\n* mündliche Prüfung","haeufigkeit":"Jedes Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"Rechnernetze"}]}],"modulbeauftragte":"Prof. Dr. Martin Mauve","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":109008100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":109008100}}}', 16);
INSERT INTO public.antrag VALUES (17, 'Initiale Erstellung', '2020-04-06 00:26:35.138285', '2020-04-06 00:26:35.157804', '{"titelDeutsch":"Zeichnen von Graphen","titelEnglisch":"Graph Drawing","veranstaltungen":[{"titel":"Zeichnen von Graphen","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Zeichnen von Graphen“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Beim Zeichnen von Graphen betrachtet man das Problem der Visualisierung struktureller Informationen, wel-che sich als Graphen darstellen lassen. Das automatische Zeichnen von Graphen hat wichtige Anwendun-gen in vielen Bereichen der Informatik, wie z.B. Datenbanken, VLSI-und Netzwerk-Design, Software Engine-ering und visuelle Benutzerschnittstellen. Dieses Modul befasst sich mit verschiedenen Arten zum Zeichnen von Graphen und Algorithmen, welche diese Zeichnungen konstruieren.\n\n* Grundlagen\n* Zeichnen von Bäumen\n* Zeichnen von planaren Graphen\n* Flüsse und orthogonale Zeichnungen\n* Hierarchische Zeichenverfahren\n* Kräftebasierte Zeichenverfahren","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die besprochenen Zeichenvarianten für Graphen zu erläutern und formal zu definieren\n* die behandelten Algorithmen zu verstehen und für konkrete Eingaben Zeichnungen zu konstruieren\n* für die Algorithmen zum Zeichnen auf Gittern den Platzbedarf von Zeichnungen zu ermitteln\n* Vor-und Nachteile spezieller Grapheigenschaften beim Zeichnen zu hinterfragen","literatur":"* G. Di Battista, P. Eades, I.G. Tollis, R. Tamassia: Graph Drawing: Algorithms for the Visualization of Graphs, Prentice Hall, 1999.\n* M. Jünger, P. Mutzel: Graph Drawing Software, Springer Verlag, 2004.\n* M. Kaufmann, D. Wagner: Drawing Graphs: Methods and Models, Springer Verlag, 2001.\n* T. Nishizeki, MD S. Rahman: Planar Graph Drawing, World Scientific Pub Co, 2004.","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"Aktive Mitarbeit in den Übungen, Abgabe der Übungsaufgaben, Bestehen der Klausur zum Ende des Semesters","haeufigkeit":"Dieses Modul wird in unregelmäßigen Abständen angeboten.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":137309000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":138285200}}}', 17);
INSERT INTO public.antrag VALUES (18, 'Initiale Erstellung', '2020-04-06 00:26:35.164635', '2020-04-06 00:26:35.179277', '{"titelDeutsch":"Projektarbeit","titelEnglisch":"Individual Research Project","veranstaltungen":[{"titel":"Projektarbeit","leistungspunkte":"20 LP","veranstaltungsformen":[{"form":"Die Projektarbeit wird in der Regel in der Arbeitsgruppe durchgeführt, in der später dann auch die Master-Arbeitgeschrieben wird. Jede Arbeitsgruppe baut dieses Modul so auf, dass es am besten auf eine Master-Arbeitvorbereitet. Die Studierenden werden auch in die Forschungsarbeiten der Arbeitsgruppe eingebunden. Die Projektarbeit kann auch als Gruppenarbeit durchgeführt werden, sofern die individuelle Leistung hinreichend festgestellt werden kann.\n\nFolgendes sind typische Bestandteile der Projektarbeit:\n\n* Seminare/Projektpräsentationen\n* individuelle Entwurfs-und Programmieraufgaben\n* Durchführen von Experimenten oder Evaluierungen\n* Lesen und Verarbeiten von Fachliteratur\n* Mitwirken in Forschungsprojekten","semesterWochenStunden":0}],"beschreibung":{"inhalte":"In diesem Modul soll der Student das selbständige wissenschaftliche Arbeiten erwerben und sich auf die Master-Arbeitvorbereiten. Die Inhalte hängen deshalb sehr stark vom jeweiligen Fachgebiet und den Inte-ressensgebieten des Studenten ab.","lernergebnisse":"Nach erfolgreichem Abschluss des Moduls sollte der Student\n\n* die wichtigen Konzepte des Fachgebiets der Projekt-bzw.zukünftigen Master-Arbeitzusammenfas-sen und veranschaulichen können\n* wichtige Artikel und Bücher für spezifische Problemstellungen des Fachgebiets ermitteln können\n* Konzepte des Fachgebiets hinterfragen können und entscheiden können welche für seine zukünftige Master-Arbeitin Betracht kommen\n* die wissenschaftlichen Methoden des Fachbereichs beschreiben undanwenden können","literatur":"","verwendbarkeit":"* Projektarbeit","voraussetzungenBestehen":"Die konkreten Anforderungen hängen von der zu bearbeitenden Aufgabenstellung ab. Daher sind die Kriterien zum Erwerb der Leistungspunkte zu Beginn der Projektarbeit individuell festzulegen.","haeufigkeit":"Jedes Semester (je Arbeitsgruppe i.d.R. mindestens jährlich)","sprache":""},"voraussetzungenTeilnahme":"* Keine"}],"modulbeauftragte":"Die Dozenten der Informatik sowie gegebenenfalls der Mathematisch-Naturwissenschaftlichen Schwerpunktfächer","gesamtLeistungspunkte":"20 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"PROJEKTARBEIT","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":163658800}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":163658800}}}', 18);
INSERT INTO public.antrag VALUES (19, 'Initiale Erstellung', '2020-04-06 00:26:35.187081', '2020-04-06 00:26:35.204484', '{"titelDeutsch":"Master-Arbeit","titelEnglisch":"Master’s Thesis","veranstaltungen":[{"titel":"Master-Arbeit","leistungspunkte":"30 LP","beschreibung":{"inhalte":"Der Inhalt der Master-Arbeit liegt im ausgewählten Schwerpunktfach","lernergebnisse":"Mit der schriftlichen Abschlussarbeit sollen die Studierenden nachweisen, dass sie in der Lage sind, innerhalb einer vorgegebenen Frist (von 6 Monaten) ein Themaaus dem von ihnen gewählten Schwerpunkfach selbstständig mit wissenschaftlichen Methoden zu analysieren sowie die Erkenntnisse prägnant zu entwickeln und kompetent zu bewerten bzw. zu interpretieren. Die Master-Arbeitmuss in deutscher oder englischer Sprache verfasst und in einem mündlichen Vortrag präsentiert werden.","literatur":"","verwendbarkeit":"* Master-Arbeit","voraussetzungenBestehen":"Erfolgreiche Bearbeitung des Themas und Darstellung in einer fristgerecht abgegebenen Ausarbeitung (Master-Arbeit); Präsentation in einem mündlichen Vortrag mit Diskussion","haeufigkeit":"Bei Vorliegen der Voraussetzungen ist der Beginn der Abschlussarbeit jederzeit möglich, d.h. die Vergabe von Themen ist nicht an bestimmte Zeiten im Semester gebunden.","sprache":""},"voraussetzungenTeilnahme":"Für die Anmeldung zur Master-Arbeit müssen mindestens 60 der im Rahmen des Master-Studiums zu erwerbenden Leistungspunkte nachgewiesen werden. Das Thema der Master-Arbeit wird aus dem Gebiet des gewählten Schwerpunktfachs vergeben. Dazu sollten üblicherweise beide Module im Schwerpunktfach erfolgreich abgeschlossen sein."}],"modulbeauftragte":"Dozenten der Informatik sowie der als Schwerpunktfach wählbaren mathematisch-naturwissenschaftlichen Fächer","gesamtLeistungspunkte":"30 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"MASTERARBEIT","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":187081400}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":187081400}}}', 19);
INSERT INTO public.antrag VALUES (25, 'Initiale Erstellung', '2020-04-06 00:26:35.36934', '2020-04-06 00:26:35.393738', '{"titelDeutsch":"Graphenalgorithmen I","titelEnglisch":"Algorithms for Graphs I","veranstaltungen":[{"titel":"Graphenalgorithmen I","leistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","veranstaltungsformen":[{"form":"* Vorlesung „Graphenalgorithmen I“, 2 SWS\n* Übung, 2 SWS\n* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere 2 SWS","semesterWochenStunden":0}],"beschreibung":{"inhalte":"Dieses Modul vermittelt grundlegende Kenntnisse aus folgenden Bereichen.\n\n* Suchmethoden auf Graphen\n* Topologische Anordnungen\n* Zusammenhangsprobleme\n* Kürzeste Wege\n* Minimale Spannbäume\n* Netzwerkfluss-Probleme\n* Matching-Probleme","lernergebnisse":"Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein erweitertes Verständnis der theoretischen Grundlagen über den Entwurf von Graphalgorithmen.","literatur":"Verschiedene aktuelle Lehrbücher über Graphenalgorithmen","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* aktive Mitarbeit in den Übungen\n* Abgabe der Hausaufgaben\n* schriftliche Klausur (i.d.R. 90 Minuten) oder mündliche Prüfung am Ende des Semesters","haeufigkeit":"Jedes Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Prof. Dr. Egon Wanke","gesamtLeistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":369339900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":369339900}}}', 25);
INSERT INTO public.antrag VALUES (42, 'Initiale Erstellung', '2020-04-06 00:26:36.030261', '2020-04-06 00:26:36.058093', '{"titelDeutsch":"Algorithmen zur Visualisierung von Graphen","titelEnglisch":"Algorithms for the Visualization of Graphs","veranstaltungen":[{"titel":"Algorithmen zur Visualisierung von Graphen","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Algorithmen zur Visualisierung von Graphen“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Dieses Modul befasst sich mit verschiedenen Arten zur Visualisierung von Graphen und Algorithmen, welche diese konstruieren.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein, die besprochenen Visualisierungen für Graphen zu erläutern, die behandelten Algorithmen zu verstehen und auf konkrete Eingaben anzuwenden.","literatur":"* G. Di Battista, P. Eades, I.G. Tollis, R. Tamassia: Graph Drawing: Algorithms for the Visualization of Graphs, Prentice Hall, 1999.\n* M. Jünger, P. Mutzel: Graph Drawing Software, Springer Verlag, 2004.\n* M. Kaufmann, D. Wagner: Drawing Graphs: Methods and Models, Springer Verlag, 2001.\n* T. Nishizeki, MD S. Rahman: Planar Graph Drawing, World Scientific Pub Co, 2004.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"Aktive Mitarbeit in den Übungen, Bestehen der Klausur zum Ende des Semesters","haeufigkeit":"Dieses Halb-Modul wird in unregelmäßigen Abständen angeboten.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski","gesamtLeistungspunkte":"5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":30261000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":30261000}}}', 42);
INSERT INTO public.antrag VALUES (43, 'Initiale Erstellung', '2020-04-06 00:26:36.064925', '2020-04-06 00:26:36.093728', '{"titelDeutsch":"Algorithmische Eigenschaften von Wahlsystemen","titelEnglisch":"Algorithmic Properties of Voting Systems I","veranstaltungen":[{"titel":"Algorithmische Eigenschaften von Wahlsystemen","leistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","veranstaltungsformen":[{"form":"Vorlesung „Algorithmische Eigenschaften von Wahlsystemen I“","semesterWochenStunden":2},{"form":"Übung","semesterWochenStunden":1}],"beschreibung":{"inhalte":"* Grundlagen der Social-Choice-Theorie\n  * Wahlen\n  * Wahlsysteme\n  * Eigenschaften von Wahlsystemen\n  * Einige Wahl-Paradoxa und Unmöglichkeitssätze\n* Algorithmik und Komplexität von Wahlproblemen\n  * Gewinnerbestimmung\n  * Mögliche und notwendige Gewinner\n  * Manipulation","lernergebnisse":"Ziel in diesem Modul ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem jungen, sich rasant entwickelnden, interdisziplinären Gebiet Computational Social Choice zu vermitteln, welches derzeit in der Abteilung „Komplexitätstheorie und Kryptologie“ (Prof. Jörg Rothe und Jun.-Prof. Dorothea Baumeister) intensiv in der Forschung bearbeitet wird, und in dem bevorzugt Themen für Bachelor- und Master-Arbeiten ausgegeben werden. Am Ende der Veranstaltung sollten Studierende die wichtigsten Wahlverfahren und ihre „social-choice“-theoretischen Eigenschaften sowie die damit im Zusammenhang stehenden Entscheidungsprobleme (Gewinnerbestimmung, Manipulation usw.) und die zu ihrer Lösung entwickelten Algorithmen und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können. Ebenso sollten sie die Komplexität dieser Probleme formal bestimmen und beschreiben können.","literatur":"* Jörg Rothe (ed.): Economics and Computation: An Introduction to Algorithmic Game Theory,\nComputational Social Choice, and Fair Division, Springer-Verlag, 2015.\n\nEine kürzere deutsche Version dieses Buches erschien als:\n\n* Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational\nSocial Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und\nTeilen, Spektrum Akademischer Verlag (Springer), 2011.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* erfolgreiche Bearbeitung der Übungsaufgaben\n* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung","haeufigkeit":"Etwa alle vier Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”","zusatzfelder":[{"titel":"Ergänzende Literatur","inhalt":"* Piotr Faliszewski, Lane A. Hemaspaandra, Edith Hemaspaandra, and Jörg Rothe: A Richer Understanding of the Complexity of Election Systems, Chapter 14 in: „Fundamental Problems in Computing: Essays in Honor of Professor Daniel J. Rosenkrantz,” pp. 375-406, S. Ravi and S. Shukla (eds.), Springer, 2009.\n* Felix Brandt, Vincent Conitzer, Ulle Endriss, Jerome Lang, and Ariel Procaccia (eds.): Handbook of Computational Social Choice, Cambridge University Press, 2015.\n* Steven J. Brams and Peter C. Fishburn: Voting Procedures, Chapter 4 in: „Handbook of Social Choice and Welfare,” Kenneth J. Arrow, Amartya Sen, and Kotaro Suzumura (eds.), North-Holland, 2002."}]}],"modulbeauftragte":"Prof. Dr. Jörg Rothe","gesamtLeistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":64925000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":64925000}}}', 43);
INSERT INTO public.antrag VALUES (20, 'Initiale Erstellung', '2020-04-06 00:26:35.212292', '2020-04-06 00:26:35.243056', '{"titelDeutsch":"Algorithmen in der Bioinformatik","titelEnglisch":"Algorithms in Bioinformatics I","veranstaltungen":[{"titel":"Algorithmen in der Bioinformatik","leistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP (Bachelor, ohne Seminar)\n7,5 LP (Master, inkl. Seminar)","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Algorithmen in der Bioinformatik“","semesterWochenStunden":2},{"form":"Seminar (nur Master)","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Biologische und algorithmische Grundlagen\n* Exhaustive Suche: DNA-Motive\n* Gierige Algorithmen: Genom-Umordnungen\n* Dynamische Programmierung: Sequenz-Alignment\n* Graphen-Algorithmen: Sequenzierung\n* Kombinatorische Mustersuche, BLAST\n* Hidden Markov Modelle\n* Cluster \u0026 Cliquen\n* Phylogenetische Bäume und molekulare Evolution\n* Maximum-Likelihood und Bayesianische Methoden\n* Randomisierte Motivsuche","lernergebnisse":"Nach der Veranstaltung werden die Studierende in der Lage sein:\n\n* verschiedene Klassen von Algorithmen zu differenzieren;\n* klassische Algorithmen und spezielle bioinformatische Algorithmen auf biologische Probleme anzuwenden;\n* gelernte Algorithmen exemplarisch in der Programmiersprache Python umzusetzen;\n* bioinformatische Probleme mit den vorgestellten Algorithmen selbständig lösen zu können.","literatur":"* Neil C. Jones, Pavel A. Pevzner: An Introduction to Bioinformatics Algorithms. The MIT Press, 2004.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik\n* Teil eines Master-Moduls im Master-Studiengang Biologie","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen\n* erfolgreiches Bearbeiten der Übungsaufgaben (50%)\n* abschließende Prüfung (i.d.R. schriftlich)","haeufigkeit":"Jedes Studienjahr, in der Regel im Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung“\n* „Rechnerarchitektur“\n\nMaster-Studierende müssen zusätzlich folgende Module erfolgreich abgeschlossen haben:\n\n* „Algorithmen und Datenstrukturen“\n* „Theoretische Informatik“"}],"modulbeauftragte":"Prof. Dr. Gunnar W. Klau","gesamtLeistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP (Bachelor, ohne Seminar)\n7,5 LP (Master, inkl. Seminar)","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":212292200}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":212292200}}}', 20);
INSERT INTO public.antrag VALUES (21, 'Initiale Erstellung', '2020-04-06 00:26:35.250862', '2020-04-06 00:26:35.271356', '{"titelDeutsch":"Betriebssysteme und Systemprogrammierung","titelEnglisch":"Operating Systems and System Programming","veranstaltungen":[{"titel":"Betriebssysteme und Systemprogrammierung","leistungspunkte":"10 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Betriebssysteme und Systemprogrammierung”","semesterWochenStunden":4},{"form":"Praktische Übung","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Grundlagen: C- und UNIX Shell-Programmierung\n* Grundlegende Betriebssystemkonzepte, u.a. Speicher (Heap, Stack), Adressräume, Prozesse und Threads, Scheduling, Synchronisierung, Interrupts, Dateisysteme, Interprozess-Kommunikation, Schutzmechanismen\n* Programmierung von Systemsoftware\n* Praktische Übungen, direkt am Rechner","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* Betriebssystemkonzepte zu erläutern\n* Zusammenhänge zwischen der Ausführung von Programmen und dem Betriebssystemen zu verstehen und zu erklären\n* Synchronisierungsprobleme in parallelen Threads zu erkennen und eigene Synchronisierungslösungen zu konzipieren\n* einfache Systemprogramme auf Basis der Systemaufrufschnittstelle UNIX-ähnlicher Betriebssysteme in der Programmiersprache C zu entwickeln","literatur":"* Andrew S. Tanenbaum: „Modern Operating Systems”, 4. Auflage, Prentice Hall, 2014.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"Erfolgreiche Bearbeitung der Übungsaufgaben. Erfolgreiche Teilnahme an der Prüfung am Ende der Veranstaltung.","haeufigkeit":"I.d.R. jährlich","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Prof. Dr. Michael Schöttner","gesamtLeistungspunkte":"10 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":250861700}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":250861700}}}', 21);
INSERT INTO public.antrag VALUES (22, 'Initiale Erstellung', '2020-04-06 00:26:35.277212', '2020-04-06 00:26:35.298628', '{"titelDeutsch":"Compilerbau","titelEnglisch":"Compiler Construction","veranstaltungen":[{"titel":"Compilerbau","leistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Compilerbau“","semesterWochenStunden":2},{"form":"Praktische Übung","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Die Inhalte dieses Moduls sind wie folgt:\n\n* Grundlagen des Compilerbaus\n* Lexikale Analyse (reguläre Ausdrücke und endliche Automaten)\n* Syntaxanalyse (kontextfreie Grammatiken und deterministisches Parsing)\n* Semantische Analyse\n* Code-Generierung\n* Benutzen von Werkzeugen zur automatischen Erzeugung von Compilern","lernergebnisse":"Nach erfolgreichem Abschluss des Moduls sollte der Student:\n\n* verstehen wie Programmiersprachen übersetzt und implementiert werden\n* Syntaxbeschreibungen einer Programmiersprache verstehen und anpassen können. Insbesondere soll der Student ermitteln können ob die Beschreibung für eine automatisierte Bearbeitung in einem Compiler geeignet ist\n* in der Lage sein für eine neue Programmiersprache einen Parser, bzw. Compiler selbst zu entwickeln","literatur":"* Andrew W. Appel, Modern Compiler Implementation in Java, 2nd Edition, Cambridge University Press, (ISBN-13: 9780521820608 — ISBN-10: 052182060X).\n* Alfred V. Aho, Monica S. Lam, Ravi Sethi, Jeffrey D. Ullman, Compilers: Principles, Techniques, and Tools (2nd Edition), Addison Wesley, ISBN-13: 978-0321486813.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"Erfolgreiche Bearbeitung der Pflichtübungen; Erfolgreiche Entwicklung eines eigenen Compilers; Bestehen der Klausur;","haeufigkeit":"Jährlich im Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Prof. Dr. Michael Leuschel","gesamtLeistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":277212300}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":277212300}}}', 22);
INSERT INTO public.antrag VALUES (23, 'Initiale Erstellung', '2020-04-06 00:26:35.30546', '2020-04-06 00:26:35.327905', '{"titelDeutsch":"Datenbanksysteme","titelEnglisch":"Database Systems","veranstaltungen":[{"titel":"Datenbanksysteme","leistungspunkte":"10 LP ab PO 2013, alte PO’s 15 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Praktische Übung bzw. Praktikum","semesterWochenStunden":2},{"form":"Vorlesung „Datenbanksysteme“","semesterWochenStunden":4}],"beschreibung":{"inhalte":"Dieses Modul vermittelt grundlegende Kenntnisse zu Datenbanksystemen. Der Schwerpunkt liegt auf relationalen Datenbanksystemen. Neben den verschiedenen Phasen des Datenbankentwurfs werden ausführlich Anfragen und Anwendungsprogrammierung behandelt. Darüber hinaus werden weitere Themen (u.a. Architektur, Transaktionsverwaltung, Anfrageoptimierung) angesprochen. Im Einzelnen werden behandelt:\n\n* Aufgaben eines Datenbanksystems\n* Architektur von Datenbanksystemen\n* Daten(bank)modelle; hierarchische Modelle, Netzwerkmodell, Relationales Modell\n* Anfragesprachen für relationale Datenbanken und ihre Grundlagen; Relationale Algebra, Tupel- und Bereichskalkül, QBE, SQL\n* konzeptioneller Datenbankentwurf\n* logischer Datenbankentwurf; Normalisierung\n* Datenbankanwendungsprogrammierung; Datenbankanbindung im Web\n* Transaktionen und Grundlagen der Transaktionsverwaltung\n* Anfrageverarbeitung und -optimierung","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die Aufgaben und Funktionen eines Datenbanksystems zu nennen und zu erläutern\n* selbstständig Datenbanken zu entwerfen,\n* Datenbankanfragen in verschiedenen Formalismen (SQL, Relationenalgebra, Tupelkalkül) zu formulieren und die Effizienz der Auswertung verschiedener Formulierungen zu bewerten,\n* Datenbankanwendungen zu programmieren,\n* die grundlegenden Aspekte der Transaktionsverwaltung Nebenläufigkeit und der Synchronisierung zu verstehen","literatur":"* Heuer, A., Saake, G., Sattler, K.-U.: Datenbanken - Konzepte und Sprachen.5. Aufl., mitp-Verlag, Bonn, 2013\n* Vossen, G.; Datenbankmodelle, Datenbanksprachen und Datenbankmanagement-Systeme. 5. Aufl., Oldenbourg, München, 2008\n* Kemper, A., Eickler, A.; Datenbanksysteme --Eine Einführung. 9. Aufl., Oldenbourg, München, 2013\n* Elmasri, R.; Navathe, S.B.; Fundamentals of Database Systems, Addison-Wesley / Pearson, 2011\n* Date, C.J.; An Introduction to Database Systems, 8/e; Addison-Wesley / Pearson, 2004\n* Garcia-Molina, H., Ullman, J.D., Widom, J.; Database Systems: The Complete Book. 2/e, Prentice Hall / Pearson, 2009","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik\n* Modul D3 im Studienbereich Informatik (D) im Integrativen Bachelor-Studiengang Sprachtechnologie und Informationswissenschaft","voraussetzungenBestehen":"* Aktive und erfolgreiche Teilnahme an den Übungen (in der Regel mit Hausaufgaben)\n* erfolgreicher Abschluss der Praktischen Übungen durch ein kleines Projekt, in dem eine Aufgabe mit Datenbankentwurf und Datenbankanwendungsprogrammierung zu bearbeiten ist\n* schriftliche Prüfung (Klausur, i.d.R. 90 Minuten)","haeufigkeit":"Jährlich im Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”\n\nWünschenswert sind zudem fundierte Kenntnisse aus dem Modul Algorithmen und Datenstrukturen"}],"modulbeauftragte":"Prof. Dr. Stefan Conrad","gesamtLeistungspunkte":"10 LP ab PO 2013, alte PO’s 15 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":305459800}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":305459800}}}', 23);
INSERT INTO public.antrag VALUES (24, 'Initiale Erstellung', '2020-04-06 00:26:35.335713', '2020-04-06 00:26:35.362508', '{"titelDeutsch":"Einführung in die naturwissenschaftliche Informatik","titelEnglisch":"Introduction to Scientific Computer Science","veranstaltungen":[{"titel":"Einführung in die naturwissenschaftliche Informatik","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Einführung in die naturwissenschaftliche Informatik“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Implementierung verschiedener Algorithmen in der Programmiersprache Python: z.B.\n\n* Rekursion am Beispiel des Problems der unabhängigen phylogenetischen Kontraste\n* Lateraler Gentransfer oder phylogenetische Artefakte? Statistischer Test der Übereinstimmung von Bäumen mit nicht-identischen Blattmengen ohne einen verlässlichen Referenzbaum\n* MAD: Wurzeln phylogenetischer Stammbäume mit Hilfe des Mean-Ancestor-Deviation-Verfahrens\n* Gruppierungsverfahren: Neighbor-Joining, Markov-Clustering-Algorithmus, k-Means, Expectation Maximization\n* Pebble-Game-Algorithmus und die Steifigkeitsanalyse von Biomolekülen\n* Gibbs-Sampling zur Motivsuche in DNA-Sequenzen\n\nDer Kurs beschreibt mit Hilfe ausgewählter Beispiele die Anwendung der Informatik und Statistik zur Lösung\nverschiedener Probleme aus Biologie, Physik und Chemie.","lernergebnisse":"Die Studierenden verstehen die zugrundeliegenden naturwissenschaftlichen Hintergründe und die damit verbundenen Problemstellungen. Sie beherrschen die zur Problemlösung angewendeten Algorithmen und statistischen Verfahren. Sie können diese eigenständig in der Programmiersprache Python implementieren und sind in der Lage, verschiedene Lösungswege kritisch miteinander zu vergleichen und zu diskutieren.","literatur":"Wird im Rahmen der Vorlesung vorgestellt","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete","voraussetzungenBestehen":"* Mindestens 50 Prozent der Punkte aus den Übungsaufgaben\n* Bestehen der Abschlussprüfung","haeufigkeit":"Jährlich im Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Prof. Dr. Martin Lercher, Dr. Mayo Röttger","gesamtLeistungspunkte":"5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":335713300}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":335713300}}}', 24);
INSERT INTO public.antrag VALUES (26, 'Initiale Erstellung', '2020-04-06 00:26:35.40252', '2020-04-06 00:26:35.439606', '{"titelDeutsch":"Grundlagen Verteilter Systeme","titelEnglisch":"Foundations of Distributed Systems","veranstaltungen":[{"titel":"Grundlagen Verteilter Systeme","leistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","veranstaltungsformen":[{"form":"Übung/Seminar","semesterWochenStunden":2},{"form":"Vorlesung „Grundlagen Verteilter Systeme“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Architekturformen: Client/Server, P2P, hybride Ansätze\n* Kommunikation Sockets (UDP, TCP), entfernter Methodenaufruf (RMI), verteilter gemeinsamer Speicher (DSM)\n* Koordination: Uhrensynchronisierung, logische Zeit, wechselseitiger Ausschluss, globale Zustände, Wahlen, Terminierung, Verklemmungen\n* Replikation und Konsistenz: daten- und klientenzentrierte Modelle, Aktualisierungsmethoden\n* Fehlertoleranz: Fehlermodelle, Konsensus, Checkpointing\n* Sicherheit: Grundlagen Verschlüsselung und Authentisierung","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* Kommunikationsformen (Nachrichten, entfernte Aufrufe, gemeinsamer Speicher) in eigenen Programmen anzuwenden.\n* Koordinationsalgorithmen zu verstehen und zu konzipieren.\n* Konsistenzstrategien für Replikate zu vergleichen und zu bewerten\n* Grundlegende Fehlertoleranz und Sicherheitsaspekte in verteilten Systemen zu erläutern","literatur":"* G. Coulouris et.al., „Distributed Systems: Concepts and Design“, Addison-Wesley, 5. Aufl. 2011\n* A. Tanenbaum and M. van Steen: „Distributed Systems: Principles and Paradigms”, 3. Auflage, Prentice Hall, 2013.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* Erfolgreiche Teilnahme an der Prüfung am Ende der Veranstaltung.","haeufigkeit":"Wird nicht mehr angeboten","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Prof. Dr. Michael Schöttner","gesamtLeistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":402520300}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":402520300}}}', 26);
INSERT INTO public.antrag VALUES (27, 'Initiale Erstellung', '2020-04-06 00:26:35.454245', '2020-04-06 00:26:35.48645', '{"titelDeutsch":"Introduction to Logic Programming (vormals Einführung in die logische Programmierung)","titelEnglisch":"Introduction to Logic Programming","veranstaltungen":[{"titel":"Introduction to Logic Programming (vormals Einführung in die logische Programmierung)","leistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","veranstaltungsformen":[{"form":"Vorlesung „Einführung in die logische Programmierung“","semesterWochenStunden":2},{"form":"Übung","semesterWochenStunden":2},{"form":"Praktische Übung bzw. Praktikum","semesterWochenStunden":2}],"beschreibung":{"inhalte":"In der imperativen Programmierung werden Programme durch Sequenzen von Instruktionen dargestellt. In der logischen Programmierung beschreibt man statt einer Lösung für ein Problem in Form eines Algorithmus das Problem durch Fakten und Regeln und der Computer findet selbständig eine Lösung. Das eröffnet einen völlig neuen und radikal unterschiedlichen Blickwinkel auf das Programmieren der auch bei der alltäglichen Entwicklung mit C oder Java sehr nützlich ist.\n\nDie Vorlesung behandelt die Themen:\n\n* Aussagenlogik, Prädikatenlogik\n* Resolution\n* Programmieren mit Horn Klauseln\n* Praktische Grundlagen von Prolog\n* Suchalgorithmen und Künstliche Intelligenz mit Prolog\n* Grundzüge der Constraint-Programmierung","lernergebnisse":"Nach erfolgreichem Abschluss des Moduls sollte der Student\n\n* die logischen Grundlagen von Prolog verstehen und logische Berechnungen in Aussagenlogik und Prädikatenlogik durchführen können\n* die praktischen Datenstrukturen von Prolog benutzen können\n* in der Lage sein kleinere Prolog Programme eigenständig entwickeln zu können\n* wichtige Suchalgorithmen vergleichen können und praktisch in Prolog umsetzen\n* kleinere Aufgaben der künstlichen Intelligenz in Prolog lösen können","literatur":"* Nilsson, Maluszynski - Logic, Programming and Prolog (eBook)\n* Blackburn, Bos, Striegnitz, Learn Prolog Now!, College Publications","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik\n* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science","voraussetzungenBestehen":"* Aktive und erfolgreiche Mitwirkung in den Übungen\n* Erfolgreiche Teilnahme an der Abschlussprüfung","haeufigkeit":"Jährlich im Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Prof. Dr. Michael Leuschel","gesamtLeistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":453268600}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":453268600}}}', 27);
INSERT INTO public.antrag VALUES (28, 'Initiale Erstellung', '2020-04-06 00:26:35.495233', '2020-04-06 00:26:35.519631', '{"titelDeutsch":"Knapsack Problems","titelEnglisch":"Knapsack Problems","veranstaltungen":[{"titel":"Knapsack Problems","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Knapsack Problems“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Dieses Modul befasst sich mit verschiedenen Varianten des Rucksackproblems und stellt verschiedene Lösungsmethoden für diese Probleme vor.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die besprochenen Rucksackprobleme zu erläutern\n* die Ideen der vorgestellten Algorithmen zu kennen und\n* die behandelten Algorithmen auf konkrete Eingaben anzuwenden","literatur":"* H. Kellerer, U. Pferschy, D. Pisinger: Knapsack Problems, Springer, 2010.\n* B. Korte, J. Vygen: Kombinatorische Optimierung, Springer, 2008","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"Aktive Mitarbeit in den Übungen, Bestehen der Klausur zum Ende des Semesters","haeufigkeit":"Dieses Halb-Modul wird in unregelmäßigen Abständen angeboten.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski","gesamtLeistungspunkte":"5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":495232900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":495232900}}}', 28);
INSERT INTO public.antrag VALUES (29, 'Initiale Erstellung', '2020-04-06 00:26:35.531342', '2020-04-06 00:26:35.572332', '{"titelDeutsch":"Kryptokomplexität I","titelEnglisch":"Cryptocomplexity I","veranstaltungen":[{"titel":"Kryptokomplexität I","leistungspunkte":"10 LP ab PO 2013, alte PO’s 15 LP","veranstaltungsformen":[{"form":"Vorlesung „Kryptokomplexität I“","semesterWochenStunden":4},{"form":"Übung","semesterWochenStunden":2},{"form":"Seminar","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Einführung in die Kryptologie\n  * Aufgaben und Ziele der Kryptologie\n  * Einige klassische Kryptosysteme und ihre Kryptoanalyse\n    * Substitutions- und Permutationschiffren\n    * Affin Lineare Blockchiffren\n    * Block- und Stromchiffren\n  * Perfekte Geheimhaltung\n    * Satz von Shannon und Vernams One-Time Pad\n    * Entropie und Schlüsselmehrdeutigkeit\n  * RSA, Primzahltests und das Faktorisierungsproblem\n    * Das Public-Key Kryptosystem RSA\n    * Digitale Signaturen mit RSA\n    * Primzahltests und das Faktorisierungsproblem\n    * Sicherheit von RSA: Mögliche Angriffe und Gegenmaßnahmen\n* Einführung in die Komplexitätstheorie\n  * Grundlagen\n    * Komplexitätsmaße und -klassen\n    * Kompression und Beschleunigung\n    * Hierarchiesätze\n    * Eine untere Schranke\n  * Zwischen L und PSPACE\n    * Einfache Inklusionen\n    * Komplexitätsbeschränkte Many-one-Reduktionen\n    * Vollständige Probleme in NL\n    * NP-vollständige Probleme","lernergebnisse":"Ziel des Moduls Kryptokomplexität I ist die Vermittlung von Kenntnissen über die wichtigsten Kryptosysteme (also effiziente Algorithmen zur Verschlüsselung und legitimierten Entschlüsselung); andererseits wird die Sicherheit solcher Systeme behandelt, die häufig auf der Komplexität geeigneter Probleme beruht. Deshalb wird auch in die Grundlagen der Komplexitätstheorie eingeführt, insbesondere mit dem Ziel, Methoden zum Nachweis unterer Schranken bezüglich der Komplexitätsmaße Rechenzeit und Speicherplatz zu verstehen und anwenden zu können. Dies ergänzt auch die Veranstaltungen zur Algorithmik, in denen es vorrangig um den Nachweis oberer Schranken (also die Entwicklung möglichst effizienter Algorithmen) für Probleme geht. Am Ende der Veranstaltung sollten Studierende in der Lage sein, die erlernten Modellbildungen und Techniken auf neue Probleme, Kryptosysteme und Algorithmen anwenden können. So sollen sie etwa die Komplexität von Problemen, die Sicherheit von kryptographischen Verfahren und die Laufzeit und den Speicherplatzbedarf von Algorithmen einschätzen können. Besonderer Wert wird darauf gelegt, dass die Studierenden die enge Verflechtung dieser Gebiete verstehen.","literatur":"* Jörg Rothe: Komplexitätstheorie und Kryptologie. Eine Einführung in Kryptokomplexität, eXamen.Press, Springer-Verlag, 2008.\n* Jörg Rothe: Complexity Theory and Cryptology. An Introduction to Crypto-complexity, EATCS Texts in Theoretical Computer Science, Springer-Verlag, 2005.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* erfolgreiche Bearbeitung der Übungsaufgaben\n* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung","haeufigkeit":"Etwa alle zwei Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”","zusatzfelder":[{"titel":"Ergänzende Literatur","inhalt":"* Douglas R. Stinson: Cryptography: Theory and Practice, Chapman \u0026 Hall/CRC, 2006.\n* Johannes Buchmann: Einführung in die Kryptographie, Springer-Verlag, 2001.\n* Christos Papadimitriou: Computational Complexity, Addison-Wesley, 1995.\n* Gerd Wechsung: Vorlesungen zur Komplexitätstheorie, Teubner-Verlag, 2000."}]}],"modulbeauftragte":"Prof. Dr. Jörg Rothe","gesamtLeistungspunkte":"10 LP ab PO 2013, alte PO’s 15 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":530366600}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":530366600}}}', 29);
INSERT INTO public.antrag VALUES (30, 'Initiale Erstellung', '2020-04-06 00:26:35.589898', '2020-04-06 00:26:35.620661', '{"titelDeutsch":"Machine Learning","titelEnglisch":"Machine Learning","veranstaltungen":[{"titel":"Machine Learning","leistungspunkte":"10 LP ab PO 2013, alte PO’s 15 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Machine Learning“","semesterWochenStunden":4}],"beschreibung":{"inhalte":"Dieses Modul vermittelt grundlegendes Wissen zu folgenden Themen:\n\n* Probability, frequentist statistics, Bayesian statistics\n* Supervised learning, unsupervised learning\n* Generative vs discriminative models\n* Linear regression, linear discriminant analysis\n* Gaussian processes\n* Support vector machines\n* Kernel trick, kernel PCA\n* Graphical models\n* Neural networks","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,\n\n* die Grundlagen des Maschinellen Lernens zu beschreiben und anzuwenden\n* die mathematische Beschreibung dieser Grundlagen zu erklären und einfache Sachverhalte zu beweisen\n* die Grundlagen und ihre mathematischen Beschreibungen anzuwenden, um selbständig Datenanalyseprobleme zu bearbeiten","literatur":"Es wird nicht ein bestimmtes Lehrbuch verwendet, jedoch sind folgende Bücher hilfreich:\n\n* Murphy, Machine Learning: A Probabilistic Perspective\n* MacKay, Information Theory, Inference, and Learning Algorithms, Cambridge 2003\n* Barber, Bayesian Reasoning and Machine Learning, Cambridge 2012\n* Rasmussen/Williams, Gaussian Processes for Machine Learning, MIT 2006\n* Bishop, Pattern Recognition and Machine Learning, Springer 2007\n* Schölkopf/Smola, Learning with Kernels, MIT 2001\n* Jaynes, Probability Theory – the Logic of Science, Cambridge 2003","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik\n* Pflichtbereich im Master-Studiengang Artificial Intelligence and Data Science","voraussetzungenBestehen":"* Aktive und erfolgreiche Mitwirkung in den Übungen;\n* Prüfung zu Vorlesung und Übungen am Ende des Semesters","haeufigkeit":"I.d.R. jährlich.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”\n\nHilfreich ist erfolgreicher Abschluss der Mathematik Module:\n\n* \"Lineare Algebra\", \"Analysis\", \"Stochastik\" und \"Numerik\""}],"modulbeauftragte":"Prof. Dr. Stefan Harmeling","gesamtLeistungspunkte":"10 LP ab PO 2013, alte PO’s 15 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":589898100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":589898100}}}', 30);
INSERT INTO public.antrag VALUES (31, 'Initiale Erstellung', '2020-04-06 00:26:35.629954', '2020-04-06 00:26:35.654865', '{"titelDeutsch":"Algorithmen zur Entscheidungsfindung unplugged","titelEnglisch":"Decision-making Algorithms Unplugged","veranstaltungen":[{"titel":"Algorithmen zur Entscheidungsfindung unplugged","leistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","veranstaltungsformen":[{"form":"Vorlesung „Algorithmen zur Entscheidungsfindung unplugged“","semesterWochenStunden":4}],"beschreibung":{"inhalte":"Diese Veranstaltung beschäftigt sich mit verschiedenen Bereichen zur Entscheidungsfindung aus Sicht der Informatik mit einem speziellen Fokus auf „Informatik unplugged“. Ziel von Informatik unplugged ist es, fundamentale Konzepte der Informatik anhand von einzelnen Aktivitäten zu erlernen. Dabei haben alle diese Aktivitäten gemeinsam, dass keine Computer benötigt werden. In dieser Veranstaltung sollen die Studierenden zunächst dieses Gesamtkonzept kennenlernen und sich danach in Kleingruppen intensiv mit einem Thema aus dem Bereich der Entscheidungsfindung auseinandersetzen. Im Anschluss daran sollen die Teilnehmer selber unplugged Aktivitäten zu einem gewählten Thema entwickeln, und die zugrundeliegenden Konzepte den anderen Teilnehmern vorstellen. Die unplugged Aktivität soll dabei den Zugang zu einem neuen Themengebiet erleichtern. In Übungsaufgaben soll der erlernte Inhalt angewendet werden. Beispiele für Themengebiete sind Algorithmen zur Entscheidungsfindung in den Bereichen Hedonic Games, Matching oder Majority graphs.\nIn dieser Veranstaltung müssen Vorträge ausgearbeitet und gehalten werden, außerdem muss eine schriftliche Zusammenfassung des gewählten Themas erfolgen. Durch gegenseitige Begutachtungen sollen die Studierenden ihre Fähigkeiten im Bereich der kritischen und fairen Begutachtung erweitern.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,\n\n* das Konzept von Informatik unplugged zu erläutern.\n* Informatik unplugged Aktivitäten mit anderen Teilnehmern durchzuführen, und das dahintersteckende fundamentale Konzept anschaulich zu erklären.\n* neue Informatik unplugged Aktivitäten zu Algorithmen zur Entscheidungsfindung selbst zu entwickeln.\n* sich einen neuen Themenbereich selbstständig zu erarbeiten.\n* ein selbständig erarbeitetes Thema anschaulich zu präsentieren\n* erlernte Inhalte anzuwenden","literatur":"* Computer Science Unplugged. Tim Bell, Ian H. Witten, und Mike Fellows. Online verfügbar unter: [http://csunplugged.org](http://csunplugged.org)\n* Abenteuer Informatik: IT zum Anfassen – von Routenplaner bis Online Banking. Jens Gallenbacher, Spektrum Akademischer Verlag, 2012.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* Schriftliche Ausarbeitung einer neuen unplugged Aktivität\n* Vorstellen der neu erarbeiteten unplugged Aktivität\n* Vorstellen der theoretischen Grundlagen zu der erarbeiteten unplugged Aktivität\n* erfolgreiche Bearbeitung der wöchentlichen Übungsaufgaben\n* angemessene Begutachtung einer anderen schriftlichen Zusammenfassung\n* Bestehen der Prüfung am Ende der Veranstaltung über alle Themengebiete der Veranstaltung (i.d.R. Klausur, 90 Minuten)","haeufigkeit":"Dieses Modul findet in unregelmäßigen Abständen statt.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Jun.-Prof. Dr. Dorothea Baumeister","gesamtLeistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":628980300}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":629954400}}}', 31);
INSERT INTO public.antrag VALUES (32, 'Initiale Erstellung', '2020-04-06 00:26:35.664158', '2020-04-06 00:26:35.691023', '{"titelDeutsch":"Matching","titelEnglisch":"Matching","veranstaltungen":[{"titel":"Matching","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Matching“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Dieses Modul beschäftigt sich mit unterschiedlichen Arten von Matching bzw. Zuteilungsverfahren. Solche Verfahren können in unterschiedlichen Bereichen eingesetzt werden, Beispiele sind die Vergabe von Studienplätzen, die Verteilung von Assistenzärzten auf Krankenhäuser oder das Nierentransplantationsproblem. Inhalt der Veranstaltung sind verschiedene Verfahren mit ihren axiomatischen und algorithmischen Eigenschaften.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,\n\n* Zuteilungsverfahren in unterschiedlichen Situationen durchzuführen\n* Herausforderung von praktischen Zuteilungsverfahren zu identifizieren\n* neue Verfahren zur Zuteilung für spezielle Einsatzbereiche zu entwickeln und im Hinblick auf Ihre Eigenschaften zu untersuchen\n* bekannte Verfahren zur Zuteilung auf neue Einsatzbereiche zu übertragen\n* verschiedene Verfahren zur Zuteilung gegenüber zu stellen\n* Empfehlungen für bestimmte Einsatzbereiche der Zuteilung zu geben","literatur":"* The Stable Marriage Problem, Structure and Algorithms. Dan Gusfield and Robert W. Irving. MIT\nPress, 1989.\n* Algorithmics of Matching under Preferences, David F. Manlove. World Scientific Publishing Company,\n2013.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* erfolgreiche Bearbeitung der Übungsaufgaben\n* aktive und erfolgreiche Mitwirkung in den Übungen\n* bestehen der Prüfung am Ende der Veranstaltung (i.d.R. Klausur, 90 Minuten)","haeufigkeit":"Dieses Modul findet in unregelmäßigen Abständen statt.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Jun.-Prof. Dr. Dorothea Baumeister","gesamtLeistungspunkte":"5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":663182100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":663182100}}}', 32);
INSERT INTO public.antrag VALUES (33, 'Initiale Erstellung', '2020-04-06 00:26:35.700315', '2020-04-06 00:26:35.725691', '{"titelDeutsch":"Networks, Crowds, and Markets","titelEnglisch":"Networks, Crowds, and Markets","veranstaltungen":[{"titel":"Networks, Crowds, and Markets","leistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Networks, Crowds, and Markets“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Dieses Modul befasst sich mit folgenden theoretischen Aspekten von Netzwerken:\n\n* Grundlagen\n* Struktur von Netzwerken\n* Teilgraphen in Netzwerken\n* Zentralitätsmaße in Netzwerken\n* Analysemethoden für Netzwerke\n* Modellierung von Netzwerken","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die besprochenen Anwendungsbereiche von Netzwerken zu erläutern\n* die besprochenen Grundlagen von Netzwerken formal zu definieren\n* die behandelten Analysemethoden für Netzwerke zu verstehen und auf konkrete Eingaben anzuwenden","literatur":"* D. Easley, J. Kleinberg: Networks, Crowds, and Markets, Cambridge University Press, 2010.\n* E. Estrada: The Structure of Complex Networks: Theory and Applications, Oxford University Press, 2011.\n* D. Jungnickel: Graphs, Networks and Algorithms, Springer, 2013\n* S. Wassermann, K. Faust: Social Network Analysis: Methods and Applications, Cambridge University Press, 2009.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"Aktive Mitarbeit in den Übungen, Abgabe der Übungsaufgaben, Bestehen der Klausur zum Ende des Semesters","haeufigkeit":"Dieses Modul wird in unregelmäßigen Abständen angeboten.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski","gesamtLeistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":700315100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":700315100}}}', 33);
INSERT INTO public.antrag VALUES (34, 'Initiale Erstellung', '2020-04-06 00:26:35.73545', '2020-04-06 00:26:35.764727', '{"titelDeutsch":"Nichtkooperative Spieltheorie","titelEnglisch":"Noncooperative Game Theory","veranstaltungen":[{"titel":"Nichtkooperative Spieltheorie","leistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 L","veranstaltungsformen":[{"form":"Vorlesung „Nichtkooperative Spieltheorie“","semesterWochenStunden":2},{"form":"Übung","semesterWochenStunden":1}],"beschreibung":{"inhalte":"* Nichtkooperative Spiele: Gegeneinander spielen\n  * Grundlagen\n    * Normalform, dominante Strategien und Gleichgewichte\n    * Weitere Zwei-Personen-Spiele\n  * Nash-Gleichgewichte in gemischten Strategien\n    * Definition und Eigenschaften gemischter Nash-Gleichgewichte\n    * Existenz von Nash-Gleichgewichten in gemischten Strategien\n  * Schachmatt: Spielbäume in Spielen mit perfekter Information\n    * Sequenzielle Zwei-Personen-Spiele\n    * Gleichgewichte in Spielbäumen\n  * Full House: Spiele mit unvollkommener Information\n    * Das Ziegenproblem\n    * Analyse einer einfachen Poker-Variante\n  * Wie schwer ist es, ein Nash-Gleichgewicht zu finden?\n    * Nash-Gleichgewichte in Nullsummenspielen\n    * Nash-Gleichgewichte in allgemeinen Normalform-Spielen","lernergebnisse":"Ziel in diesem Modul ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem Gebiet der nichtkooperativen Spieltheorie zu vermitteln. Am Ende der Veranstaltung sollten Studierende wichtige Probleme und die zu ihrer Lösung entwickelten Algorithmen und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können. Insbesondere sollten sie in der Lage sein, „strategische Szenarien“ durch nichtkooperative Spiele zu beschreiben und Stabilitäts- und Gleichgewichtskonzepte in diesen Spielen formal zu charakterisieren. Ebenso sollten sie die Komplexität der für solche Spiele relevanten Entscheidungsprobleme (in einer geeigneten kompakten Darstellung) formal bestimmen und beschreiben können.","literatur":"* Jörg Rothe (ed.): Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.\n\nEine kürzere deutsche Version dieses Buches erschien als:\n\n* Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011.","verwendbarkeit":"Wahlpflichtbereich\n\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* erfolgreiche Bearbeitung der Übungsaufgaben\n* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung","haeufigkeit":"Etwa alle vier Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”","zusatzfelder":[{"titel":"Ergänzende Literatur","inhalt":"* Martin J. Osborne and Ariel Rubinstein: A Course in Game Theory, MIT Press, 1994.\n* Noam Nisan, Tim Roughgarden, Eva Tardos, and Vijay V. Vazirani (eds.): Algorithmic Game Theory, Cambridge University Press, 2008."}]}],"modulbeauftragte":"Prof. Dr. Jörg Rothe","gesamtLeistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 L","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":735450100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":735450100}}}', 34);
INSERT INTO public.antrag VALUES (35, 'Initiale Erstellung', '2020-04-06 00:26:35.773511', '2020-04-06 00:26:35.806227', '{"titelDeutsch":"Präferenzaggregation durch Wählen: Algorithmik und Komplexität","titelEnglisch":"Preferene Aggregation by Voting: Algorithmics and Complexity","veranstaltungen":[{"titel":"Präferenzaggregation durch Wählen: Algorithmik und Komplexität","leistungspunkte":"10 LP ab PO 2013, alte PO’s 15 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Seminar","semesterWochenStunden":2},{"form":"Vorlesung „Präferenzaggregation durch Wählen: Algorithmik und Komplexität“","semesterWochenStunden":4}],"beschreibung":{"inhalte":"* Grundlagen der Social-Choice-Theorie\n  * Wahlen\n  * Wahlsysteme\n  * Eigenschaften von Wahlsystemen\n  * Einige Wahl-Paradoxa und Unmöglichkeitssätze\n* Algorithmik und Komplexität von Wahlproblemen\n  * Gewinnerbestimmung\n  * Mögliche und notwendige Gewinner\n  * Manipulation\n  * Wahlkontrolle\n  * Bestechung","lernergebnisse":"Ziel in diesem Modul ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem jungen, sich rasant entwickelnden, interdisziplinären Gebiet Computational Social Choice zu vermitteln, welches derzeit in der Abteilung „Komplexitätstheorie und Kryptologie“ (Prof. Jörg Rothe und Jun.-Prof. Dorothea Baumeister) intensiv in der Forschung bearbeitet wird und in dem bevorzugt Themen für Bachelor- und Master-Arbeiten ausgegeben werden. Am Ende der Veranstaltung sollten Studierende die wichtigsten Wahlverfahren und ihre „social-choice“-theoretischen Eigenschaften sowie die damit im Zusammenhang stehenden Entscheidungsprobleme (Gewinnerbestimmung, Manipulation, Wahlkontrolle, Bestechung usw.) und die zu ihrer Lösung entwickelten Algorithmen und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können. Ebenso sollten sie die Komplexität dieser Probleme formal bestimmen und beschreiben können.","literatur":"* Jörg Rothe (ed.): Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.\n\nEine kürzere deutsche Version dieses Buches erschien als:\n\n* Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* erfolgreiche Bearbeitung der Übungsaufgaben\n* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung","haeufigkeit":"Etwa alle zwei Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”","zusatzfelder":[{"titel":"Ergänzende Literatur","inhalt":"* Piotr Faliszewski, Lane A. Hemaspaandra, Edith Hemaspaandra, and Jörg Rothe: A Richer Understanding of the Complexity of Election Systems, Chapter 14 in: „Fundamental Problems in Computing: Essays in Honor of Professor Daniel J. Rosenkrantz,” pp. 375-406, S. Ravi and S. Shukla (eds.), Springer, 2009.\n* Felix Brandt, Vincent Conitzer, Ulle Endriss, Jerome Lang, and Ariel Procaccia (eds.): Handbook of Computational Social Choice, Cambridge University Press, 2015.\n* Steven J. Brams and Peter C. Fishburn: Voting Procedures, Chapter 4 in: „Handbook of Social Choice and Welfare,” Kenneth J. Arrow, Amartya Sen, and Kotaro Suzumura (eds.), North-Holland, 2002."}]}],"modulbeauftragte":"Prof. Dr. Jörg Rothe","gesamtLeistungspunkte":"10 LP ab PO 2013, alte PO’s 15 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":772534300}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":772534300}}}', 35);
INSERT INTO public.antrag VALUES (36, 'Initiale Erstellung', '2020-04-06 00:26:35.815986', '2020-04-06 00:26:35.851121', '{"titelDeutsch":"Rechnernetze","titelEnglisch":"Computer Networks","veranstaltungen":[{"titel":"Rechnernetze","leistungspunkte":"10 LP ab PO 2013, alte PO’s 15 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Rechnernetze“","semesterWochenStunden":4},{"form":"Praktikum","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Das Modul „Rechnernetze” richtet sich an Studenten, die verstehen wollen, wie Rechnernetze aus technischer Sicht funktionieren und welche Entwicklungen in der Zukunft zu erwarten sind. Es werden einerseits die grundlegenden Fragestellungen des Gebietes untersucht und andererseits besprochen, wie diese Fragestellungen im Internet gelöst sind. Ziel des Moduls ist es, sowohl ein solides allgemeines Basiswissen im Bereich der Rechnernetze als auch praktisch einsetzbare Kenntnisse zu vermitteln. Damit die Lernziele eines Praktikumsversuchs erreicht werden, ist es erforderlich, dass sich die Studierenden inhaltlich vorbereiten. Um dies zu gewährleisten, werden Studierende nur dann zu einem Praktikumsversuch zugelassen, wenn sie vor Versuchsbeginn ein Antestat erfolgreich absolvieren.","lernergebnisse":"Studierende verstehen nach erfolgreichem Abschluss dieses Moduls die grundlegende Funktionsweise moderner Computernetzwerke. Sie verfügen über grundlegende praktische Fähigkeiten in der Netzwerkprogrammierung und der Administration von Computernetzwerken.","literatur":"Das primäre Lehrbuch zu dieser Veranstaltung ist:\n\n* James F. Kurose und Keith W. Ross: Computer Networking – A Top-Down Approach Featuring the Internet; 6th Edition; Pearson, 2012","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* aktive Mitarbeit in den Übungen und im Praktikum\n* schriftliche Prüfung (Klausur, i.d.R. 90 Minuten)","haeufigkeit":"Jedes Wintersemester.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”","zusatzfelder":[{"titel":"Themen des Praktikums:","inhalt":"* Netzwerkprogrammierung in Java\n* Implementierung eines minimalen Webservers\n* Aufsetzen eines komplexen Netzwerkes\n* Konfiguration und Erprobung von Firewalls"},{"titel":"Themen der Vorlesung und Übung","inhalt":"* Einleitung und Übersicht\n* Anwendungsschicht\n  * World Wide Web / HTTP\n  * File Transfer / FTP\n  * E-Mail / SMTP\n  * Domain Name System /DNS\n  * Peer-to-Peer Anwendungen (Guntella/KaZaA/Bittorrent)\n  * Socketprogrammierung mit UDP und TCP\n* Transportschicht\n  * Adressierung\n  * UDP\n  * Zuverlässige Datenübertragung\n  * Überlastkontrolle\n  * TCP\n* Netzwerkschicht\n  * Virtuelle Leitungen und Datagrammnetzwerke\n  * Funktionsweise und Aufbau von Routern\n  * Adressierung / DHCP\n  * Das Internetprotokoll / IP, ICMP\n  * Link State Routing, Distance Vector Routing\n  * RIP, OSPF, BGP\n* Sicherungsschicht\n  * Rahmenbildung\n  * Fehlererkennung und -korrektur\n  * Medienzugriff in Lokalen Netzen\n  * Adressierung / ARP\n  * Ethernet, Hubs, Switches\n  * PPP\n  * IP over ATM und MPLS\n* Multimediakommunikation\n  * Anwendungen\n  * Streaming\n  * Multimedia über Best-Effort Netzwerke\n  * Multimediaprotokolle / RTSP, RTP, SIP\n  * Differentiated Services\n  * Integrated Services\n* Netzwerksicherheit\n  * Grundlagen der Krytographie\n  * Nachrichtenintegrität\n  * Authentifizierung\n  * Absichern von E-Mail / PGP\n  * Absichern von TCP / SSL, TLS\n  * Absichern von IP / IPSec\n  * Firewalls und Intrusion Detection Systeme"}]}],"modulbeauftragte":"Jun.-Prof. Dr. Kalman Graffi, Prof. Dr. Martin Mauve","gesamtLeistungspunkte":"10 LP ab PO 2013, alte PO’s 15 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":815986300}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":815986300}}}', 36);
INSERT INTO public.antrag VALUES (37, 'Initiale Erstellung', '2020-04-06 00:26:35.860864', '2020-04-06 00:26:35.886238', '{"titelDeutsch":"Statistische Datenanalyse","titelEnglisch":"Statistical Data Analysis","veranstaltungen":[{"titel":"Statistische Datenanalyse","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Statistische Datenanalyse“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Das Modul baut auf einem Kurs und dem zugehörigen Buch (s. Literatur unten) von Prof. Gianluca Bontempi an der Université Libre de Bruxelles zu den statistischen Grundlagen des maschinellen Lernens auf.\n\nInhalte sind im Einzelnen:\n\n* Die Programmiersprache R für statistical Computing\n* beschreibende Statistik\n* Grundlagen der Wahrscheinlichkeitsrechnung\n* klassische parametrische Schätzung und Tests\n* Nicht-parametrische Schätzung und Tests\n* Statistisches Lernen\n* Lineare Ansätze\n* Nicht-lineare Ansätze\n* Dimensionalitätsreduktion","lernergebnisse":"Die Studierenden werden nach der Veranstaltung in der Lage sein:\n\n* grundlegende Konzepte der Datenanalyse zusammenzufassen;\n* selbst Auswertung mit R zu planen und durchzuführen\n* grafisch aussagekräftige Darstellungen von Daten zu erstellen.","literatur":"* Gianluca Bontempi: Handbook on \"Statistical foundations of machine learning\", Brüssel 2017","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen\n* erfolgreiches Bearbeiten der Übungsaufgaben (50%)\n* abschließende Prüfung (i.d.R. schriftlich)","haeufigkeit":"Jedes Studienjahr, in der Regel im Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Prof. Dr. Martin Lercher","gesamtLeistungspunkte":"5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":860864400}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":860864400}}}', 37);
INSERT INTO public.antrag VALUES (38, 'Initiale Erstellung', '2020-04-06 00:26:35.894046', '2020-04-06 00:26:35.921372', '{"titelDeutsch":"Überblick Künstliche Intelligenz","titelEnglisch":"Overview of Artificial Intelligence","veranstaltungen":[{"titel":"Überblick Künstliche Intelligenz","leistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","veranstaltungsformen":[{"form":"Übung / Vorbereitung","semesterWochenStunden":2},{"form":"Seminar „Überblick Künstliche Intelligenz“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Mögliche Inhalte des Seminars, die in Absprache mit den Teilnehmern behandelt werden können sind:\n\n* Grundlagen künstlicher Intelligenz\n* Rückblick / Ausblick künstlicher Intelligenz\n* Grenzen von KI\n* Algorithmen\n* Constraint Logic Programming und Constraint Handling Rules\n* Inductive / Abductive Logic Programming","lernergebnisse":"Nach erfolgreichem Abschluss des Moduls sollte der Student\n\n* ein grundlegendes Verständnis für Fragestellungen und Probleme aus dem Bereich der künstlichen Intelligenz haben,\n* Gängige Algorithmen und Techniken aus dem Bereich kennen,\n* Mit Prolog und Erweiterungen wie CLP und CHR umgehen können,\n* Techniken des “inductive” und “abductive logic programming” kennen und umsetzen können, und\n* Aufgaben der künstlichen Intelligenz in Prolog lösen können.","literatur":"* Bratko, “Prolog Programming for Artificial Intelligence”, Addison Wesley\n* Russel, Norvig, “Artificial Intelligence: A Modern Approach”, Prentice Hall","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* Aktive und erfolgreiche Mitwirkung im Seminar\n* Prüfung am Ende des Semesters","haeufigkeit":"I.d.R. jährlich","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”\n* Hilfreich ist erfolgreicher Abschluss des Moduls: \"Einführung in die logische Programmierung\""}],"modulbeauftragte":"Prof. Dr. Michael Leuschel","gesamtLeistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":894046000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":894046000}}}', 38);
INSERT INTO public.antrag VALUES (39, 'Initiale Erstellung', '2020-04-06 00:26:35.933083', '2020-04-06 00:26:35.958973', '{"titelDeutsch":"Verfahren zur kollektiven Entscheidungsfindung","titelEnglisch":"Methods for Collective Decision-Making","veranstaltungen":[{"titel":"Verfahren zur kollektiven Entscheidungsfindung","leistungspunkte":"10 LP ab PO 2013, alte PO’s 15 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Seminar","semesterWochenStunden":2},{"form":"Vorlesung „Verfahren zur kollektiven Entscheidungsfindung“","semesterWochenStunden":4}],"beschreibung":{"inhalte":"Dieses Modul beschäftigt sich mit verschiedenen Verfahren zur kollektiven Entscheidungsfindung. Mechanismen zur kollektiven Entscheidungsfindung werden in vielen Bereichen der künstlichen Intelligenz, zum Beispiel bei der Interaktion von autonomen Agenten benötigt. Inhalt der Veranstaltung sind verschiedene Verfahren mit ihren axiomatischen und algorithmischen Eigenschaften. Zu den Verfahren gehören unter anderem:\n\n* Judgment Aggregation\n* Wahlen\n* Argumentationsgraphen","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,\n\n* kollektive Entscheidungsfindung in unterschiedlichen Situationen durchzuführen\n* neue Verfahren zur kollektiven Entscheidungsfindung für spezielle Einsatzbereiche zu entwickeln und im Hinblick auf Ihre Eigenschaften zu untersuchen\n* bekannte Verfahren zur kollektiven Entscheidungsfindung auf neue Einsatzbereiche zu übertragen\n* verschiedene Verfahren zur kollektiven Entscheidungsfindung gegenüber zu stellen\n* Empfehlungen für bestimmte Einsatzbereiche der kollektiven Entscheidungsfindung geben","literatur":"* Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division. J. Rothe (ed.). Unter Vertrag bei Springer. Voraussichtliche Publikation: 2015.\n\nEine kürzere deutsche Version dieses Buches erschien unter dem Titel:\n\n* Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen. Jörg Rothe, Dorothea Baumeister, Claudia Lindner, Irene Rothe. Spektrum Akademischer Verlag, 2011.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* aktive und erfolgreiche Mitwirkung in den theoretischen und praktischen Übungen\n* Prüfung am Ende der Veranstaltung (i.d.R. Klausur, 90 Minuten)","haeufigkeit":"Dieses Modul findet in unregelmäßigen Abständen statt.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Jun.-Prof. Dr. Dorothea Baumeister","gesamtLeistungspunkte":"10 LP ab PO 2013, alte PO’s 15 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":932107300}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":932107300}}}', 39);
INSERT INTO public.antrag VALUES (40, 'Initiale Erstellung', '2020-04-06 00:26:35.968732', '2020-04-06 00:26:35.997077', '{"titelDeutsch":"Von NAND zu Tetris","titelEnglisch":"From NAND to Tetris","veranstaltungen":[{"titel":"Von NAND zu Tetris","leistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Projekt","semesterWochenStunden":2},{"form":"Vorlesung „Von NAND zu Tetris“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Diese Veranstaltung bietet eine Reise durch verschiedene Gebiete der Informatik um dabei ein Gesamtbild über die prinzipielle Funktionsweise von Computern vermitteln. Ausgehend von dem NAND-Gatter werden alle wichtigen Hardware-Komponenten eines Computers in einer Simulation nachgebaut, ALU, CPU, RAM, etc. Für die im Rahmen der Vorlesung entwickelte CPU und die dazugehörige Maschinensprache werden schrittweise eine Assemblersprache, eine virtuelle Maschine und eine Programmiersprache sowie der dazugehörige Compiler entwickelt. Mit all diesen Werkzeugen werden schließlich ein einfaches Betriebssystem und Anwendungsprogramme entwickelt.\n\nDie Vorlesung wird begleitet von Übungen. Die eigenständige praktische Anwendung des Gelernten soll im Fokus der Veranstaltung liegen. Die Studenten entwickeln in den Übungen die diversen in der Vorlesung vorgestellten Komponenten moderner Computer.","lernergebnisse":"Der Student soll einen Gesamtüberblick über Funktionsweise eines Computers bekommen und auf jeder Ebene (von der untersten Hardwareebene bis zur höchsten Softwareebene)\n\n* die Grundprinzipien erläutern und bewerten können\n* eigenständig neue Funktionalitäten auf dieser Eben entwickeln zu können.","literatur":"* Noam Nisan, Shimon Schocken \"The Elements of Computing Systems: Building a Modern Computer from First Principles\", MIT Press.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen\n* erfolgreiches Bearbeiten der Übungsaufgaben\n* abschließende Prüfung (i.d.R. schriftlich)","haeufigkeit":"Jährlich, i.d.R. im Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Prof. Dr. Michael Leuschel, Jens Bendisposto, John Witulski","gesamtLeistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":967756100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":35,"nano":967756100}}}', 40);
INSERT INTO public.antrag VALUES (41, 'Initiale Erstellung', '2020-04-06 00:26:36.002933', '2020-04-06 00:26:36.023428', '{"titelDeutsch":"Bachelor-Arbeit","titelEnglisch":"Bachelor Thesis","veranstaltungen":[{"titel":"Bachelor-Arbeit","leistungspunkte":"15 LP","beschreibung":{"inhalte":"Der Inhalt der Bachelor-Arbeit liegt im gewählten Schwerpunktfach. Die Bachelor-Arbeit muss in deutscher oder englischer Sprache verfasst und in einem mündlichen Vortrag präsentiert werden.","lernergebnisse":"Mit der schriftlichen Abschlussarbeit sollen die Studierenden nachweisen, dass sie in der Lage sind:\n\n* innerhalb einer vorgegebenen Frist (von 3 Monaten)\n* ein Thema selbstständig zu bearbeiten\n* und dieses angemessen darzustellen.","literatur":"","verwendbarkeit":"* Bachelor-Arbeit","voraussetzungenBestehen":"Erfolgreiche Bearbeitung des Themas und Darstellung in einer fristgerecht abgegebenen Ausarbeitung (Bachelor-Arbeit); Präsentation in einem mündlichen Vortrag mit Diskussion","haeufigkeit":"Bei Vorliegen der Voraussetzungen ist der Beginn der Abschlussarbeit jederzeit möglich, d.h. die Vergabe von Themen ist nicht an bestimmte Zeiten im Semester gebunden.","sprache":""},"voraussetzungenTeilnahme":"Für die Anmeldung zur Bachelor-Arbeit müssen mindestens 120 der im Rahmen des Bachelor-Studiums zu erwerbenden Leistungspunkte nachgewiesen werden. Das Thema der Bachelor-Arbeit wird aus dem Gebiet des gewählten Schwerpunktfachs vergeben. Dazu sollten üblicherweise alle Module im Schwerpunktfach erfolgreich abgeschlossen sein."}],"modulbeauftragte":"Dozenten der Informatik sowie der als Schwerpunktfach wählbaren mathematisch-naturwissenschaftlichen Fächer","gesamtLeistungspunkte":"15 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"BACHELORARBEIT","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":2932600}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":2932600}}}', 41);
INSERT INTO public.antrag VALUES (44, 'Initiale Erstellung', '2020-04-06 00:26:36.103492', '2020-04-06 00:26:36.121856', '{"titelDeutsch":"Algorithmische Geometrie","titelEnglisch":"Computational Geometry","veranstaltungen":[{"titel":"Algorithmische Geometrie","leistungspunkte":"5 LP für alle PO’s","veranstaltungsformen":[{"form":"* Vorlesung „Algorithmische Geometrie“, 2 SWS\n* Übung, 2 SWS\n* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere 4 SWS","semesterWochenStunden":0}],"beschreibung":{"inhalte":"Dieses Modul vermittelt grundlegende Kenntnisse zur Berechnung und Anwendung der folgenden Probleme und Methoden.\n\n* Konvexe Hülle\n* Distanzprobleme\n* Schnittprobleme\n* Voronoi Diagramme\n* Polygon Triangulierung\n* Delaunay Triangulierung\n* Plane-Sweep Algorithmen\n* Randomisierte inkrementelle Algorithmen","lernergebnisse":"Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein erweitertes Verständnis der theoretischen Grundlagen über den Entwurf von Algorithmen für Fragestellungen aus der algorithmischen Geometrie.","literatur":"* de Berg et al: Computational Geometry, Algorithms and applications. Springer-Verlag, Berlin, 2. rev. ed., 2000.\n* Preparata, Shamos: Computational geometry, an introduction. Springer-Verlag, New York, 1985.\n* Edelsbrunner: Algorithms in Combinatorial Geometry, EATCS Monographs in Computer Science 10. Springer¬Verlag, 1987.\n* Matousek: Lectures on discrete geometry, Graduate Texts in Mathematics, 212. Springer-Verlag, New York, 2002.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* aktive Mitarbeit in den Übungen\n* Abgabe der Hausaufgaben\n* schriftliche Klausur (i.d.R. 90 Minuten) oder mündliche Prüfung am Ende des Semesters","haeufigkeit":"Jedes zweite Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Prof. Dr. Egon Wanke","gesamtLeistungspunkte":"5 LP für alle PO’s","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":102512000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":102512000}}}', 44);
INSERT INTO public.antrag VALUES (45, 'Initiale Erstellung', '2020-04-06 00:26:36.128647', '2020-04-06 00:26:36.158901', '{"titelDeutsch":"Algorithmische Komplexitätstheorie","titelEnglisch":"Algorithmic Complexity Theory","veranstaltungen":[{"titel":"Algorithmische Komplexitätstheorie","leistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","veranstaltungsformen":[{"form":"* Vorlesung „Algorithmische Komplexitätstheorie“, 2 SWS\n* Übung, 2 SWS\n* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere 4 SWS","semesterWochenStunden":0}],"beschreibung":{"inhalte":"Dieses Modul vermittelt grundlegende Kenntnisse aus folgenden Bereichen.\n\n* Methoden des Algorithmenentwurfs (Teile und Beherrsche, Dynamische Programmierung, ...),\n* Einführung in die algorithmische Komplexität (Nichtdeterminismus, NP-Vollständigkeit, ...),\n* Schaltkreiskomplexität\n* Approximationsalgorithmen\n* Parameterisierte Algorithmen\n* Randomisierte Algorithmen\n* Einführung in Online-Algorithmen","lernergebnisse":"Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein erweitertes Verständnis der theoretischen Grundlagen über den Entwurf von Algorithmen. Sie können algorithmische Probleme spezifizieren und sie bzgl. ihrer algorithmischen Komplexität analysieren.","literatur":"* Christos H. Papadimitriou, Computational, Addison-Wesley, 1993\n* Richard Johnsonbaugh, Marcus Schäfer: Algorithms, Pearson Education, 2004\n* Jon Kleinberg, Eva Tardos: Algorithm Design, Addison Wesley, 2006","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"* aktive Mitarbeit in den Übungen\n* Abgabe der Hausaufgaben\n* schriftliche Klausur (i.d.R. 90 Minuten) oder mündliche Prüfung am Ende des Semesters","haeufigkeit":"Jedes Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Prof. Dr. Egon Wanke","gesamtLeistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":128647400}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":128647400}}}', 45);
INSERT INTO public.antrag VALUES (46, 'Initiale Erstellung', '2020-04-06 00:26:36.167685', '2020-04-06 00:26:36.196962', '{"titelDeutsch":"Angewandte Algorithmik","titelEnglisch":"Applied Algorithmics","veranstaltungen":[{"titel":"Angewandte Algorithmik","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Angewandte Algorithmik“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"\"In theory, there is no difference between theory and practice. In practice, there is.\"\n\nAlgorithmen bilden die Grundlage jedes Computerprogramms. Traditionell liegt der Fokus des Algorithmendesigns auf der Theorie effizienter Algorithmen und deren worst case-Analyse. In dieser Veranstaltung geht es jedoch um praktisch effiziente Algorithmen, oft auch für beweisbar schwere Probleme, mit dem Ziel, die Prinzipien der Optimalität nicht (vollständig) aufzugeben. Themengebiete sind:\n\n* Pattern Matching und Textindizes (von Suffix-Trees zur Burrows-Wheeler-Transformation)\n* Algorithmen für schwere Probleme: Branch-and-Bound, Ganzzahlige Lineare Programmierung, Approximationsalgorithmen\n* Algorithmen zum Clustern großer Datenmengen\n* Google\u0027s Pagerank-Algorithmus\n\nZudem wird ein ausgewähltes (fiktives) praktisches Problem (aus dem Bereich der Alchemie) im Rahmen einer Programmierchallenge in Gruppenarbeit gelöst.","lernergebnisse":"Nach der Veranstaltung werden die Studierenden in der Lage sein\n\n* verschiedene Techniken der Angewandten Algorithmen zu beherrschen und diese auf neue Probleme anzuwenden\n* Probleme praktisch effizient zu lösen und diese Lösungen zu implementieren","literatur":"* Teilweise Originalarbeiten","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik\n* Teil eines Master-Moduls im Master-Studiengang Biologie","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen\n* erfolgreiches Bearbeiten der Übungsaufgaben (50%)\n* abschließende Prüfung (i.d.R. schriftlich)","haeufigkeit":"Jedes Studienjahr, in der Regel im Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung“\n* „Rechnerarchitektur“\n\nMaster-Studierende müssen zusätzlich folgende Module erfolgreich abgeschlossen haben:\n\n* „Algorithmen und Datenstrukturen“\n* „Theoretische Informatik“"}],"modulbeauftragte":"Prof. Dr. Gunnar W. Klau","gesamtLeistungspunkte":"5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":167684900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":167684900}}}', 46);
INSERT INTO public.antrag VALUES (47, 'Initiale Erstellung', '2020-04-06 00:26:36.207697', '2020-04-06 00:26:36.238927', '{"titelDeutsch":"Approximative Algorithmen","titelEnglisch":"Approximate Algorithms","veranstaltungen":[{"titel":"Approximative Algorithmen","leistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Approximative Algorithmen“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Dieses Modul befasst sich mit den folgenden schweren Optimierungsproblemen, für die es vermutlich keine effizienten Algorithmen gibt, und stellt verschiedene Näherungslösungen für diese Probleme vor.\n\n* Metric Traveling Salesman\n* Job Scheduling\n* Knapsack\n* Bin Packing","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die besprochenen schweren Optimierungsprobleme zu erläutern und\n* die behandelten Approximationsalgorithmen auf konkrete Eingaben anzuwenden","literatur":"* K. Jansen, M. Margraf: Approximative Algorithmen und Nichtapproximierbarkeit, de Gruyter Verlag, 2008.\n* R. Wanka: Approximationsalgorithmen, Teubner Verlag, 2006.","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"Aktive Mitarbeit in den Übungen, Bestehen der Klausur zum Ende des Semesters","haeufigkeit":"Dieses Halb-Modul wird in unregelmäßigen Abständen angeboten.","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski","gesamtLeistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":206721700}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":206721700}}}', 47);
INSERT INTO public.antrag VALUES (48, 'Initiale Erstellung', '2020-04-06 00:26:36.247709', '2020-04-06 00:26:36.269182', '{"titelDeutsch":"Betriebssysteme","titelEnglisch":"Operating Systems","veranstaltungen":[{"titel":"Betriebssysteme","leistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","veranstaltungsformen":[{"form":"Übung/Seminar","semesterWochenStunden":2},{"form":"Vorlesung „Betriebssysteme“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Architekturformen: monolitisch, geschichtet, Mikrokern, Client/Server\n* Speicher: Segmentierung, Paging, Garbage Collection\n* Nebenläufigkeit: Schedulingstrategien, Prozesse, Threads, Interrupts\n* Synchronisierung: Semaphore, klassische Problemstellungen, Verklemmungen\n* Dateisysteme: FAT, UNIX, EXT, NTFS\n* Kommunikation: Signale, Pipes, Sockets\n* Sicherheit: HW-Schutz\n* Fallstudien, u.a. Linux, Microsoft Windows","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* Betriebssystembegriffe zu nennen und zu erläutern\n* Speicherverwaltungstechniken (physikalisch, virtuell, Segmentierung und Paging) auf gegebene Beispiele anzuwenden und zu bewerten.\n* Schedulingstrategien anzuwenden und zu bewerten.\n* Synchronisierungsprobleme in parallelen Threads zu erkennen und eigene Synchronisierungslösungen zu konzipieren\n* Interprozesskommunikation anzuwenden\n* grundlegende Betriebssystemkonzepte in modernen Desktop-Betriebssystemen in eigenen Worten erklären zu können","literatur":"* Andrew S. Tanenbaum: „Modern Operating Systems”, 4. Auflage, Prentice Hall, 2014","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete\n* Nebenfach im Bachelor-Studiengang Physik\n* Nebenfach im Bachelor-Studiengang Medizinische Physik","voraussetzungenBestehen":"Erfolgreiche Teilnahme an der Prüfung am Ende der Veranstaltung.","haeufigkeit":"Wird nicht mehr angeboten","sprache":""},"voraussetzungenTeilnahme":"Erfolgreicher Abschluss folgender Module:\n\n* „Programmierung”\n* „Rechnerarchitektur”"}],"modulbeauftragte":"Prof. Dr. Michael Schöttner","gesamtLeistungspunkte":"5 LP ab PO 2013, alte PO’s 7,5 LP","studiengang":"Bachelor-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_BA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":247709000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":247709000}}}', 48);
INSERT INTO public.antrag VALUES (49, 'Initiale Erstellung', '2020-04-06 00:26:36.275036', '2020-04-06 00:26:36.297483', '{"titelDeutsch":"Algebraische und Strukturelle Graphentheorie","titelEnglisch":"Algebraic and Structural Graph Theory","veranstaltungen":[{"titel":"Algebraische und Strukturelle Graphentheorie","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"* Vorlesung „Algebraische und Strukturelle Graphentheorie“, 2 SWS\n* Übungen, 2 SWS\n* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere 2 SWS","semesterWochenStunden":0}],"beschreibung":{"inhalte":"Dieses Modul vermittelt Kenntnisse aus folgenden Bereichen:\n\n* Eigenschaften von Adjazenzmatrizen\n* Graphhomomorphismen\n* Strukturelle Ähnlichkeit von Graphen\n* Normalformen von Graphen\n* Graphen über algebraischen Strukturen\n* Kombinatorische Grapheigenschaften","lernergebnisse":"Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend die Fähigkeit, Struktureigenschaften von Graphen und Graphklassen mittels kombinatorischer und algebraischer Methoden zu analysieren.","literatur":"Aktuelle Lehrbücher über Graphentheorie sowie Originalliteratur","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik\n* Teil eines Master-Moduls im Master-Studiengang Biologie","voraussetzungenBestehen":"schriftliche Prüfung (i.d.R. 90 Minuten)oder mündliche Prüfung (i.d.R. 30 Minuten) am Ende des Semesters","haeufigkeit":"Jedes Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Graphenalgorithmen I”\n* „Lineare Algebra I”"}]}],"modulbeauftragte":"Dr. Stefan Hoffmann","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":275035900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":275035900}}}', 49);
INSERT INTO public.antrag VALUES (50, 'Initiale Erstellung', '2020-04-06 00:26:36.306265', '2020-04-06 00:26:36.326358', '{"titelDeutsch":"Android-Programmierung","titelEnglisch":"Android Programming","veranstaltungen":[{"titel":"Android-Programmierung","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Vorlesung „Android-Programmierung“","semesterWochenStunden":2},{"form":"Seminar/Praktische Übung","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Java\n* Grundgerüst einer Android-Anwendung\n* Activities \u0026 Fragments\n* Grafik \u0026 Animation\n* Eingabeereignisse\n* Persistenz und Speicherverwaltung\n* Intents \u0026 Broadcast Receivers\n* Netzwerk\n* Native-C (Subkomponente?)\n* Erarbeitung eines Anwendungskonzeptes\n* Packages (.apk), Libraries (.aar)\n* In-App-Purchases","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* mit Hilfe von Java (und Native-C) Android-Anwendungen zu programmieren\n* Android Studio als Entwicklungsumgebung anzuwenden\n* Anwendungskonzepte zu erarbeiten und umzusetzen\n* grundlegende Netzwerkkommunikation zu programmieren\n* mit den gewonnenen Kenntnissen das Software-Projekt zu konzipieren und zu realisieren","literatur":"* Zigurd Mednieks et al., “Android Programmierung”, O\u0027Reilly, 2013\n* Arno Becker, Marcus Pant, “Android -Grundlagen und Programmierung”, dpunkt, 2010\n* Android Developer Homepage","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreiche Bearbeitung der Pflichtübungen\n* Erfolgreiche Entwicklung einer Android-Anwendung\n* Bestehen der Klausur","haeufigkeit":"Alle 2 Jahre","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Jun.-Prof. Dr. Kálmán Graffi und Mitarbeiter","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":306265300}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":306265300}}}', 50);
INSERT INTO public.antrag VALUES (108, 'Initiale Erstellung', '2020-04-06 00:26:38.058599', '2020-04-06 00:26:38.071286', '{"titelDeutsch":"Master-Seminar zu Analyse von Software-Systemen","titelEnglisch":"Master’s Seminar on Analysis of Software Systems","veranstaltungen":[{"titel":"Master-Seminar zu Analyse von Software-Systemen","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Analyse von Software-Systemen“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Methoden und Metriken zur Bewertung der Qualität von Software\n* Analyse und Bewertung von historischen Daten z.B. aus Versionskontrollsystemen\n* Analyse und Bewertung von technischen Schulden einer Software","lernergebnisse":"Studierende haben nach erfolgreichem Abschluss dieses Moduls Kenntnisse über gängige Methoden, Metriken und Werkzeuge zur Analyse von großen Softwaresystemen.","literatur":"Wird zu Beginn der Veranstaltung bekanntgegeben.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Aktive und erfolgreiche Mitwirkung am Seminar\n* Abschlusstest zum Ende der Vorlesungszeit","haeufigkeit":"I.d.R. jährlich","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Professionelle Softwareentwicklung (Programmierpraktikum 1)“ und „Softwareentwicklung im Team (Programmierpraktikum 2)“"}]}],"modulbeauftragte":"Dr. Jens Bendisposto","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":58599100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":58599100}}}', 108);
INSERT INTO public.antrag VALUES (109, 'Initiale Erstellung', '2020-04-06 00:26:38.076167', '2020-04-06 00:26:38.093733', '{"titelDeutsch":"Master-Seminar zu Informatik unplugged","titelEnglisch":"Master’s Seminar on Computer Science Unplugged","veranstaltungen":[{"titel":"Master-Seminar zu Informatik unplugged","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Informatik unplugged“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Dieses Modul beschäftigt sich mit verschiedenen Themen aus der Informatik unter dem Gesichtspunkt „Informatik unplugged“. Ziel von Informatik unplugged ist es, fundamentale Konzepte der Informatik, anhand von einzelnen Aktivitäten zu erlernen. Dabei haben alle diese Aktivitäten gemeinsam, dass keine Computer benötigt werden. In diesem Seminar sollen die Studierenden zunächst dieses Gesamtkonzept kennenlernen und sich danach in Kleingruppen intensiv mit bestimmten Themen auseinandersetzen. Im Anschluss daran, sollen die Teilnehmer selber unplugged Aktivitäten zu unterschiedlichen Bereichen der Informatik entwickeln. In diesem Seminar müssen mehrere Vorträge ausgearbeitet und gehalten werden, außerdem muss eine schriftliche Ausarbeitung erfolgen, und die Studierenden sollen ihre Fähigkeiten im Bereich der kritischen und fairen Begutachtung erweitern.\n\nDieses Seminar ist kombinierbar mit den Modulen:\n\n* Judgment Aggregation\n* Mathematische Hintergründe der Wahlmanipulation und mit den Modulen (von Prof. Dr. Jörg Rothe):\n* Algorithmische Spieltheorie\n* Algorithmische Eigenschaften von Wahlsystemen II\n* Kooperative Spieltheorie\n* Cake-cutting Algorithms\n* Kryptokomplexität II","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,\n\n* das Konzept von Informatik unplugged zu erläutern.\n* Informatik unplugged Aktivitäten mit anderen Teilnehmern durchführen, und das dahintersteckende fundamentale Konzept anschaulich erklären.\n* neue Informatik unplugged Aktivitäten zu ganz unterschiedlichen Bereichen der Informatik selbst zu entwickeln.","literatur":"* Computer Science Unplugged. Tim Bell, Ian H. Witten und Mike Fellows. Online verfügbar unter: [http://csunplugged.org](http://csunplugged.org)\n* Abenteuer Informatik: IT zum Anfassen – von Routenplaner bis online Banking. Jens Gallenbacher, Spektrum Akademischer Verlag, 2012","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* schriftliche Ausarbeitung einer neuen unplugged Aktivität\n* Vorstellen einer vorhandenen und der neu erarbeiteten unplugged Aktivität\n* Begutachtung einer anderen schriftlichen Ausarbeitung","haeufigkeit":"Dieses Modul findet in unregelmäßigen Abständen statt.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Jun.-Prof. Dr. Dorothea Baumeister","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":76167200}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":76167200}}}', 109);
INSERT INTO public.antrag VALUES (110, 'Initiale Erstellung', '2020-04-06 00:26:38.102517', '2020-04-06 00:26:38.125817', '{"titelDeutsch":"Master-Seminar zu Kombinatorische Optimierung in der Bioinformatik","titelEnglisch":"Master’s Seminar on Combinatorial Optimization in Bioinformatics","veranstaltungen":[{"titel":"Master-Seminar zu Kombinatorische Optimierung in der Bioinformatik","leistungspunkte":"","veranstaltungsformen":[{"form":"Seminar „Kombinatorische Optimierung in der Bioinformatik","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Viele bioinformatische Probleme lassen sich als kombinatorische Optimierungsprobleme formulieren. Dieses Modul vermittelt fortgeschrittene Kenntnisse zum Erkennen, Formulieren und Lösen solcher Probleme. Anhand einer Auswahl aus den folgenden aktuellen bioinformatischen Themengebiete werden wichtige Techniken wie Dynamische Programmierung, Graphenalgorithmen, Lineare und Ganzzahlige Lineare Programmierung, Lagrange-Relaxierung und Parameterisierte Algorithmen eingeführt oder wiederholt und vertieft und Lösungsansätze entwickelt.\n\n* Genomik: De Novo-Genomassemblierung: fragment assembly; Haplotype-Phasing; Finden von struktureller Variation\n* Strukturbiologie: RNA-Sekundärstruktur: Vorhersage, Vergleich; Proteinstruktur: Vorhersage, protein threading, Seitenkettenplatzierung, Vergleich\n* Transkriptomik: Transkript-Assembly\n* Proteomik: De Novo-Peptidsequenzierung; Quantifizierung von Polymeren\n* Phylogenetik: Perfekte Phylogenie, Vergleich von Bäumen\n* Evolution: Finden von Gen-Clustern\n* Netzwerkbiologie: Dichte Teilgraphen (Proteinkomplexe); Netzwerkmodule; Netzwerkalignment; Rekonstruktion Boolescher Signalwege\n* Krebsgenomik: Finden von driver mutations","lernergebnisse":"Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein breites und vertieftes Verständnis im Bereich „Algorithmische Bioinformatik\" und können neue Probleme einordnen und mit modernen Optimierungsmethoden lösen.","literatur":"Originalliteratur.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Schriftliche Ausarbeitung zum gewählten Thema\n* Begutachtung von anderen Ausarbeitungen\n* Präsentation des eigenen Themas\n* Aktive Teilnahme an Diskussionen","haeufigkeit":"Unregelmäßig","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"„Algorithmen in der Bioinformatik“."}]}],"modulbeauftragte":"Prof. Dr. Gunnar W. Klau","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":102516700}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":102516700}}}', 110);
INSERT INTO public.antrag VALUES (111, 'Initiale Erstellung', '2020-04-06 00:26:38.131673', '2020-04-06 00:26:38.146311', '{"titelDeutsch":"Master-Seminar zu Machine Learning","titelEnglisch":"Master’s Seminar on Machine Learning","veranstaltungen":[{"titel":"Master-Seminar zu Machine Learning","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Machine Learning“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Machine Learning hat als Oberbegriff für Methoden zur Erkennung von Mustern und Gesetzmäßigkeiten in Daten und der Erzeugung daraus abgeleiteter Entscheidungen und Vorhersagen eine enorme Bedeutung in vielen Fachdisziplinen und Branchen erlangt. Insbesondere die stetig wachsende Menge an digitalen Daten in Unternehmen, Wissenschaft und Internet hat einen massiven Bedarf an Experten auf diesem Gebiet geführt. Da die Entwicklung neuer Methoden in diesem Bereich sehr schnell verläuft, ist eine fortlaufende Auseinandersetzung mit den neuesten Erkenntnissen für künftige Experten unerlässlich. Ziel der Veranstaltung ist es, das Grundwissen aus der Vorlesung Machine Learning durch ein intensives Studium wichtiger wissenschaftlicher Veröffentlichungen zu vertiefen, und die Teilnehmer auf die selbständige Auseinandersetzung mit neuen wissenschaftlichen Entwicklungen in diesem Feld vorzubereiten. Um dieses Lernziel zu erreichen, wird den Teilnehmern wöchentlich eine wissenschaftliche Veröffentlichung in englischer Sprache genannt. Die Teilnehmer arbeiten diese Veröffentlichung selbständig durch, so dass sie in der Lage sind, deren Inhalt vor allen anderen Teilnehmern an der Tafel zu präsentieren. Jede Woche findet eine Diskussionsveranstaltung statt, bei der ausgewählte Teilnehmer die Veröffentlichung vorstellen. Anschließend diskutieren alle Teilnehmer die Veröffentlichung.","lernergebnisse":"Studierende haben nach erfolgreichem Abschluss dieses Moduls ein vertieftes Verständnis aktueller Methoden und typischer Anwendungen im Bereich des Machine Learning. Sie können wissenschaftliche Veröffentlichungen systematisch aufarbeiten, deren Inhalte prägnant zusammenfassen und kritisch bewerten.","literatur":"Zu dieser Veranstaltung gibt es kein Lehrbuch.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Schriftliche Ausarbeitung zum gewählten Thema\n* Begutachtung von anderen Ausarbeitungen\n* Präsentation des eigenen Themas\n* Aktive Teilnahme an Diskussionen","haeufigkeit":"Unregelmäßig","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”\n\nHilfreich ist erfolgreicher Abschluss des Moduls \"Lineare Algebra\"","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"„Machine Learning“, „Computer Vision“"}]}],"modulbeauftragte":"Prof. Dr. Stefan Harmeling","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":131672500}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":131672500}}}', 111);
INSERT INTO public.antrag VALUES (51, 'Initiale Erstellung', '2020-04-06 00:26:36.333134', '2020-04-06 00:26:36.351592', '{"titelDeutsch":"Angewandte Bioinformatik","titelEnglisch":"Applied Bioinformatics","veranstaltungen":[{"titel":"Angewandte Bioinformatik","leistungspunkte":"5LP ab PO 2015, alte PO 7,5LP","veranstaltungsformen":[{"form":"Praktikum","semesterWochenStunden":4},{"form":"Vorlesung „Angewandte Bioinformatik“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Python mit Fokus auf Anwendungen in bioinformatischer “Data Science”\n* Workflowmanagement: Snakemake\n* Analyse von High-Throughput-Sequencing Daten\n* Genome Assembly\n* Read Mapping\n* Analyse biologischer Netzwerke\n* Analyse biologischer Netzwerke\n* Berechnung von Stammbäumen\n* Identifizierung von Genen, die Zeichen natürlicher Auslese zeigen (dN/dS)\n* Modellierung der Evolution von DANN-Sequenzen","lernergebnisse":"Die Studierenden verstehen die Grundlagen der vergleichenden Genomik und sind in der Lage, eigenständig Analysen von DNA-Sequenzdaten durchzuführen. Die Studierenden verstehen zugrundeliegende Konzepte fortgeschrittener bioinformatischer Analyse-Pipelines und können diese anwenden. Sie sind in der Lage, ei-gene Schritte dieser Pipelines zu implementieren wie zum Beispiel einen eigenen, einfachen Assembler. Sie verstehen die Herausforderungen der Anwendungen und die Grenzen der bestehenden Ansätze.","literatur":"Wird im Rahmen der Vorlesung vorgestellt","verwendbarkeit":"* Wahlpflichtbereich\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete","voraussetzungenBestehen":"* Regelmäßige und aktive Teilnahme am Praktikum\n* Rechtzeitige Abgabe von erstellten Programmen / Protokollen, die den Anforderungen wissenschaftlicher Arbeit entsprechen\n* Bestehen der Abschlussprüfung","haeufigkeit":"Jährlich im Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Gunnar W. Klau, Prof. Dr. Martin Lercher","gesamtLeistungspunkte":"5LP ab PO 2015, alte PO 7,5LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":333134000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":333134000}}}', 51);
INSERT INTO public.antrag VALUES (52, 'Initiale Erstellung', '2020-04-06 00:26:36.360882', '2020-04-06 00:26:36.388298', '{"titelDeutsch":"Approximationsalgorithmen","titelEnglisch":"Approximation Algorithms","veranstaltungen":[{"titel":"Approximationsalgorithmen","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Approximationsalgorithmen“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Dieses Modul befasst sich mit den folgenden schweren Optimierungsproblemen, für die es vermutlich keine effizienten Algorithmen gibt, und stellt verschiedene Ansätze zum Finden von Näherungslösungen für diese Probleme vor.\n\n* Grundlagen\n* Metric Traveling Salesman\n* Job Scheduling\n* Knapsack\n* Bin Packing\n* Steiner Tree\n* Weighted Vertex Cover","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die besprochenen schweren Optimierungsprobleme zu erläutern und formal zu definieren\n* die behandelten Approximationsalgorithmen zu verstehen und auf konkrete Eingaben anzuwenden\n* die Optimierungsprobleme bekannten Komplexitätsklassen zuzuordnen\n* Beweise für die Approximationsgüte von Approximationsalgorithmen zu durchschauen","literatur":"* G. Ausiello, P. Crescenzi, G. Gambosi, et al.: Complexity and Approximation: Combinatorial Optimiza-tion Problems and Their Approximability Properties, Springer Verlag, 1999.\n* K. Jansen, M. Margraf: Approximative Algorithmen und Nichtapproximierbarkeit, de Gruyter Verlag, 2008.\n* V. Vazirani: Approximation Algorithms, Springer Verlag, 2003.\n* R. Wanka: Approximationsalgorithmen, Teubner Verlag, 2006.","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"Aktive Mitarbeit in den Übungen, Abgabe der Übungsaufgaben, Bestehen der Klausur zum Ende des Se-mesters","haeufigkeit":"Dieses Modul wird in unregelmäßigen Abständen angeboten.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":360882000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":360882000}}}', 52);
INSERT INTO public.antrag VALUES (53, 'Initiale Erstellung', '2020-04-06 00:26:36.396104', '2020-04-06 00:26:36.413715', '{"titelDeutsch":"Betriebssystem-Entwicklung","titelEnglisch":"Operating System Development","veranstaltungen":[{"titel":"Betriebssystem-Entwicklung","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Betriebssystementwicklung“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Die Lehrveranstaltung vermittelt grundlegende Konzepte, die für den Bau eines Betriebssystems erforderlich sind. In der vorlesungsbegleitenden Übung werden diese Kenntnisse praktisch angewendet, indem ein einfa-ches PC-Betriebssystem von Grund auf entwickelt wird. Hierzu sind fundierte Kenntnisse über Aufbau und Funktionsweise der PC-Hardware erforderlich, die ebenfalls in der Lehrveranstaltung vermittelt werden. Angesprochen werden zum Beispiel das Schutzkonzept der IA-32 Architektur, Speicherverwaltung, Interrupt-Verarbeitung und Multi-Threading mit Synchronisierung.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die Programmiersprache C++ anzuwenden\n* grundlegende Betriebssystemfunktionen selbst zu entwickeln\n* die Abläufe von Scheduler, Threads, Interrupts und Synchronisierung zu implementieren\n\nJeder(e) Teilnehmer(in) entwickelt (stufenweise, mit Vorgaben) sein/ihr eigenes Betriebssystem.","literatur":"* H. P. Messmer und K. Dembowski, PC-Hardwarebuch, Addison-Wesley 2006\n* Intel Corporation, Intel Architecture Software Developer\u0027s Manual.","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreiche Bearbeitung der Übungenund Abgabe eines nativ lauffähigen Betriebssystems\n* Abschließende Prüfung am Ende des Semesters","haeufigkeit":"Circa alle zwei Jahre","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Michael Schöttner","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":396104400}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":396104400}}}', 53);
INSERT INTO public.antrag VALUES (54, 'Initiale Erstellung', '2020-04-06 00:26:36.422841', '2020-04-06 00:26:36.443439', '{"titelDeutsch":"Betriebssysteme Vertiefung","titelEnglisch":"Advanced Operating Systems","veranstaltungen":[{"titel":"Betriebssysteme Vertiefung","leistungspunkte":"10LP","veranstaltungsformen":[{"form":"Seminar „Betriebssysteme Vertiefung“","semesterWochenStunden":2},{"form":"Praktische Übungen","semesterWochenStunden":6}],"beschreibung":{"inhalte":"Dieses Modul baut auf dem eigenen Betriebssystem HHUos auf, welches im Modul „Betriebssystem-Ent-wicklung“ entwickelt wird. HHUos ist ein natives Betriebssystem für die IA32-Architektur. Die Studierenden entwickeln eine oder mehrere fortführende Komponenten für HHUos in C++/C/Assembler. Diese Komponen-ten sollen am Ende in HHUos integriert und dokumentiert werden. Im Rahmen des wöchentlichen Seminars werden Konzepte und Entwicklungen diskutiert, sowohl aus der Literatur, als auch eigene Ideen.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* Betriebssystem-Konzepte in eigenen Worten zu erklären\n* die Programmiersprache C++/C/Assembler für IA32(e)anzuwenden\n* fortführende Betriebssystemfunktionen und Hardware-Treiber selbst zu entwickeln","literatur":"* H. P. Messmer und K. Dembowski, PC-Hardwarebuch, Addison-Wesley 2006\n* Intel Corporation, Intel Architecture Software Developer\u0027s Manual\n* Weitere Literatur wird in der Veranstaltung bekannt gegeben","verwendbarkeit":"* WahlpflichtbereichPraktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreiche Entwicklung nativer Betriebssystem-Komponenten\n* Aktive und regelmäßige Teilnahme am wöchentlichen Seminar\n* Abschließende mündliche Prüfung am Ende des Semesters","haeufigkeit":"Circa alle zwei Jahre","sprache":""},"voraussetzungenTeilnahme":"Nur für Master-Studierende:\n\n* „Betriebssystem-Entwicklung“"}],"modulbeauftragte":"Prof. Dr. Michael Schöttner","gesamtLeistungspunkte":"10LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":422840700}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":422840700}}}', 54);
INSERT INTO public.antrag VALUES (55, 'Initiale Erstellung', '2020-04-06 00:26:36.452781', '2020-04-06 00:26:36.473231', '{"titelDeutsch":"Big Data Techniques, Technologies and Trends","titelEnglisch":"Big Data Techniques, Technologies and Trends","veranstaltungen":[{"titel":"Big Data Techniques, Technologies and Trends","leistungspunkte":"5 LP for all PO\u0027s","veranstaltungsformen":[{"form":"Hands-on exercises","semesterWochenStunden":2},{"form":"Lecture „Big Data Techniques, Technologies and Trends“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Course description: Big Data is one of the main buzz words nowadays, being a primary focus both for aca-demic research and for industry. Big Data has emerged as a revolution driven by the continuous increasing volumes of data that are being collected at increasing velocities from various source: social networks, IoT, scientific simulations, finance, weather forecasting, etc. Tackling such challenges, commonly referred to as the V’s of Big Data, has lead to the development of a plethora of technologies and concepts. Batch and stream processing are the main classes of dealing with the data, which can be either offline or in real time. Starting from these two categories, different programming models such as MapReduce or reactive program-ming have beenrecently proposed. Additionally multiple technologies have been, and are developed to facili-tate the processing and the data management of Big Data scenarios: HDFS, MapReduce, Spark, Storm, -Flink, Kafka, HBase, Hive, etc. All these form today the Hadoop ecosystem. This course aims to give an in-troduction to technologies and concepts that build the Hadoop ecosystem, both as lecture courses and prac-tical sessions. From the point of view of the lecture courses the focus lays with giving the theoretical back-grounds of the concepts and mechanisms that enable Big Data processing. The course will present the dif-ferent programming models, strategies to deal with large data sets or with data sets on the fly (e.g., MapRe-duce and MapReduce pipelines, Stream topologies, Windows, SQL and Hive Queries and interactive que-ries). From the point of view of the practical sessions the objective is to make the students familiar with the main Big Data processing tools used today in industry such as MapReduce, HDFS, Spark, Flink, HBase, Kafka. At the end of the course the students will have a good understanding of feasible approaches to ad-dress various Big Data scenarios as well as hands-on experience with some of the most commonly used Ha-doop tools.\n\nCourse Topics to be addressed:\n\n* Overview of Big Data: what it is, why it has emerged and future trends\n* Data models and large scale infrastructures (cluster, grid, cloud, HPC)\n* Batch processing\n  * Distributed storage systems concepts: GFC, HDFS and Cloud Public Storage (Azure Blobs and AWS S3)\n  * NoSQL storage and distributed message queues\n  * Google MapReduce programming model and Hadoop MapReduce\n  * High level semantics processing tools for offline data: Spark, Hive, Pig, Flink\n* Stream processing:\n  * Stream overview: what it is and what are the main difference with respect to batch processing,\n  * Stream concepts for data processing: operators, windows, sinks, ETLs\n* Project topics\n\nEvaluation:\n\n* Project: A topic will be choosen from multiple available ones (sentiment analysis, twitter trends analy-sis, internet/social media search, ...)\n* Solution: A software solution will be design, built and delivered as the outcome of the project.\n* Technology: The solution will be built using multiple advanced technologies covered in the course.\n* Evaluation: The solutiondesign will be presented together with a demo to show the specific use case.","lernergebnisse":"The result after complition of this course is that the students will:\n\n* Have an overview of the principles of Big Data analytics\n* Have an understanding ofthe data analytics ecosystem\n* Have knowledge about the Big Data technologies most used in industry and research\n* Have practical experience with Big Data tools from the Hadoop ecosystem, which will give competitive advantage for getting jobs in the domain\n* Have a reference project in the area of Big Data that they can showcase in the future to prove their practical experience for industry","literatur":"Literature will be given during the lecture","verwendbarkeit":"* Compulsory module in the area of practical and technical computer science\n* As focus module\n* Individual complementary module\n* Application module for the complementary area in the Master studiesmathematics","voraussetzungenBestehen":"* Successfull participation in hands-on exercises\n* Submission of a final software project (base for grade)","haeufigkeit":"No longer avaible.","sprache":""},"voraussetzungenTeilnahme":"Bachelor students must have been passedthe following modules:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Dr. Radu Tudoran (Huawei, Munich)","gesamtLeistungspunkte":"5 LP for all PO\u0027s","studiengang":"Master of Computer Science","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":452781000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":452781000}}}', 55);
INSERT INTO public.antrag VALUES (56, 'Initiale Erstellung', '2020-04-06 00:26:36.483966', '2020-04-06 00:26:36.505949', '{"titelDeutsch":"Blockchain","titelEnglisch":"Blockchain","veranstaltungen":[{"titel":"Blockchain","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Seminar „Blockchain“","semesterWochenStunden":2},{"form":"Eigenarbeit","semesterWochenStunden":0}],"beschreibung":{"inhalte":"Mit einer Blockchain kann man ein dezentrales Buchführungssystem aufsetzen. Die Blockchain Technologie besitzt viele verschiedene praktische Anwendungen in sicherheitskritischen Systemen, die bekannteste ist wahrscheinlich die Kryptowährung Bitcoin. In diesem Modul werden folgende Inhalte abgedeckt:\n\n* Grundlagen der Blockchain Technologie\n* Formale Modellierung der Blockchain Technologie\n* Praktische Anwendungen der Blockchain (Fintech, Energiemarkt, Verwaltungsprozesse, Gesundheits-wesen, ...)\n* Kryptowährungen (Bitcoin, Ethereum, iota, ...)\n* Smart Contracts\n* Praktische Experimente, prototypische Umsetzung einer eigenen Blockchain\n* Risiken","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* Das Funktionsprinzip einer Blockchain verstandenzu haben\n* Die Einsatzgebiete und Grenzen der Blockchain Technolgie einschätzen können\n* Eigene Blockchain Anwendungen prototypisch umsetzen können","literatur":"Relevante Publikationen werden in der Vorlesung bekannt gegeben","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive und erfolgreiche Mitwirkung in dem Seminar\n* eigener Seminarvortrag\n* erfolgreiche Umsetzung einer praktischen Aufgabe\n* schriftliche Prüfung (Klausur, i.d.R. 90 Minuten)","haeufigkeit":"Jedes Sommersemester (falls erfolgreich)","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”\n\n* Platzvergabe nach Studienleistungen (Anzahl an STUPS-Scheinen)"}],"modulbeauftragte":"Prof. Dr. Michael Leuschel","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":483966100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":483966100}}}', 56);
INSERT INTO public.antrag VALUES (57, 'Initiale Erstellung', '2020-04-06 00:26:36.511805', '2020-04-06 00:26:36.532299', '{"titelDeutsch":"Algorithmen für Ad-hoc-und Sensornetzwerke","titelEnglisch":"Algorithms for Ad-hoc and Sensornetworks","veranstaltungen":[{"titel":"Algorithmen für Ad-hoc-und Sensornetzwerke","leistungspunkte":"10 LP ab PO 2015, alte PO 15 LP","veranstaltungsformen":[{"form":"* Vorlesung „Algorithmen für Ad-hoc- und Sensornetzwerke“, 4 SWS\n* Übung, 2 SWS\n* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere 4 SWS","semesterWochenStunden":0}],"beschreibung":{"inhalte":"Dieses Modul vermittelt grundlegende Kenntnisse aus folgenden Bereichen.\n\n* Verteilte Algorithmen\n* Leader Election\n* Geographisches Routing\n* Topologiekontrolle\n* Standortbezogene Dienste\n* Standortbestimmung\n* Greedy-Einbettungen\n* Beacon-Routing\n* Interval-Routing\n* Hop-Netzwerke\n* Network Coding\n* Dominierende Mengen\n* Maximale unabhängige Mengen","lernergebnisse":"Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein breites und vertieftes Verständnis im Bereich „Algorithmen für Ad-hoc-und Sensornetzwerke“.","literatur":"Verschiedene aktuelle Lehrbücher über Ad-hoc-und Sensornetzwerke sowie Originalliteratur","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Mitarbeit in den Übungen\n* Abgabe der Hausaufgaben\n* 10-minütiger Lehrvortrag über ein Thema der Vorlesung\n* schriftliche Klausur (i.d.R. 90 Minuten) oder mündliche Prüfung am Ende des Semesters","haeufigkeit":"Jedes zweite Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”\n* „Algorithmische Komplexitätstheorie“\n* „Graphenalgorithmen I“"}]}],"modulbeauftragte":"Prof. Dr. Egon Wanke","gesamtLeistungspunkte":"10 LP ab PO 2015, alte PO 15 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":511804900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":511804900}}}', 57);
INSERT INTO public.antrag VALUES (58, 'Initiale Erstellung', '2020-04-06 00:26:36.53913', '2020-04-06 00:26:36.561111', '{"titelDeutsch":"Algorithmen für planare Graphen","titelEnglisch":"Algorithms for Planar Graphs","veranstaltungen":[{"titel":"Algorithmen für planare Graphen","leistungspunkte":"10 LP ab PO 2015, alte PO 15 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Seminar","semesterWochenStunden":2},{"form":"Vorlesung „Algorithmen für planare Graphen“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Dieses Modul vermittelt grundlegende Kenntnisse aus folgenden Bereichen.\n\n* Grundlagen zu planaren Graphen\n* Planaritätstests\n* Zeichnen von planaren Graphen\n* Knoten-und Kantenfärbungen für planare Graphen\n* Flüsse in planaren Graphen","lernergebnisse":"Studierende, die das Modul erfolgreich absolviert haben, sollen anschließend ein breites und vertieftes Ver-ständnis im Bereich „Algorithmen für planare Graphen“ besitzen. Weiterhin sollen die Studierenden nach Ab-solvierung der Lehrveranstaltungen in der Lage sein, einen guten Vortrag vorzubereiten und zu halten und eine gute schriftliche Ausarbeitung zu dem Vortragsthema anzufertigen.","literatur":"* T. Nishizeki, N. Chiba: Planar Graphs: Theory and Algorithms, Dover Pubn Inc, 2008.\n* T. Nishizeki, Md. S. Rahman: Planar Graph Drawing, World Scientific Publishing, 2004.\n* R. Diestel: Graph Theory, Springer, 2010.\n* G. Chartrand, L. Lesniak, P. Zhang: Graphs \u0026 Digraphs, CRC Press, 2010.\n* R. Tamassia (Editor): Handbook of Graph Visualization, CRC Press, 2014.","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreiche Bearbeitung von Übungsaufgaben\n* Aktive Mitarbeit im Seminar\n* Schriftliche Ausarbeitung eines Seminarthemas\n* Vortrag eines Seminarthemas\n* Bestehen der Klausur","haeufigkeit":"Dieses Modul wird in unregelmäßigen Abständen angeboten.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski","gesamtLeistungspunkte":"10 LP ab PO 2015, alte PO 15 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":539130100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":539130100}}}', 58);
INSERT INTO public.antrag VALUES (59, 'Initiale Erstellung', '2020-04-06 00:26:36.567941', '2020-04-06 00:26:36.58992', '{"titelDeutsch":"Algorithmen für schwere Probleme","titelEnglisch":"Algorithmics for Hard Problems","veranstaltungen":[{"titel":"Algorithmen für schwere Probleme","leistungspunkte":"5LP ab PO 2015, alte PO 7,5LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Algorithmen für schwere Probleme“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Dieses Modul befasst sich mit schweren Problemen, für die es vermutlich keine effizienten Algorithmen gibt, und stellt unter anderem folgende Lösungsansätze für solche Probleme vor.\n\n* Pseudopolynomielle Algorithmen\n* Algorithmen auf speziellen Graphen\n* Parametrisierte Algorithmen\n  * Standardparameter\n  * Parametrisierung in der Baumweite\n  * Parametrisierung in der Cliquenweite\n* Exakte Exponentialzeit Algorithmen","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die besprochenen schweren Probleme zu erläutern und formal zu definieren\n* die behandelten Algorithmen für schwere Probleme zu verstehen und auf konkrete Eingaben anzuwenden\n* eine Parametrisierte Laufzeitanalyse von Algorithmen durchzuführen\n* die betrachteten Baumstrukturen für gegebene Instanzen zu konstruieren","literatur":"* F. Gurski, I. Rothe, J. Rothe, E. Wanke, Exakte Algorithmen für schwere Graphenprobleme, Springer Verlag, 2010\n* F.V. Fomin, D. Kratsch: Exact Exponential Algorithms, Springer Verlag, 2010.\n* J. Hromkovic: Algorithmics for Hard Problems, Springer Verlag, 2003.","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"Aktive Mitarbeit in den Übungen, Abgabe der Übungsaufgaben, Bestehen der Klausur zum Ende des Se-mesters","haeufigkeit":"Dieses Modul wird in unregelmäßigen Abständen angeboten.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski","gesamtLeistungspunkte":"5LP ab PO 2015, alte PO 7,5LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":567940900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":567940900}}}', 59);
INSERT INTO public.antrag VALUES (60, 'Initiale Erstellung', '2020-04-06 00:26:36.597727', '2020-04-06 00:26:36.620683', '{"titelDeutsch":"Algorithmen in der Bioinformatik II","titelEnglisch":"Algorithms in Bioinformatics II","veranstaltungen":[{"titel":"Algorithmen in der Bioinformatik II","leistungspunkte":"5LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Algorithmen in der Bioinformatik II“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Die Veranstaltung behandelt erweiterte Konzepte der algorithmischen Bioinformatik und konzentriert sich insbesondere auf Gebiete, die in der Arbeitsgruppe Algorithmische Bioinformatik eine besondere Rolle spie-len. Dies sind Themen aus den Bereichen\n\n* Genominformatik\n  * Datenstrukturen für Read-Mapping: Suffix-Bäume (Linearzeit), Suffix-Arrays (mit LCP-Arrays), Burrows-Wheeler-Transformation\n  * Haplotype Phasing\n  * Algorithmen für Genomgraphen\n* Netzwerkbiologie\n  * Biologische Netzwerke.\n  * Netzwerkmodule: Clustering, aktive Module, Netzwerkalignment\n  * Logische Modellierung und Verifikation\n* Verschiedenes\n  * Analyse von drug/perturbation screens\n  * Modellierung mit molekularen Graphen","lernergebnisse":"Nach der Veranstaltung werden die Studierenden in der Lage sein\n\n* erweiterte algorithmische Konzepte der Bioinformatik aus der Genominformatik, der Netzwerkbiologie und anderen Gebieten zu beherrschen und deren theoretische Grundlagen zu verstehen;\n* praktische Probleme aus diesen Bereichen durch Anwendung dieser Konzepte und eigene Implementierungen zu lösen","literatur":"* ausgewählte Einzelarbeiten; diese werden im Kurs bereitgestellt","verwendbarkeit":"* Wahlpflichtbereich Praktisch/Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik\n* Teileines Master-Moduls im Master-Studiengang Biologie","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen\n* erfolgreiches Bearbeiten der Übungsaufgaben(50%)\n* abschließende Prüfung (i.d.R. schriftlich)","haeufigkeit":"Jedes Studienjahr, in der Regel im Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”\n* „Algorithmen in der Bioinformatik“"}],"modulbeauftragte":"Prof. Dr. Gunnar W. Klau","gesamtLeistungspunkte":"5LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":597727400}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":597727400}}}', 60);
INSERT INTO public.antrag VALUES (61, 'Initiale Erstellung', '2020-04-06 00:26:36.625095', '2020-04-06 00:26:36.644146', '{"titelDeutsch":"Algorithmen in der Cheminformatik","titelEnglisch":"Algorithms in Cheminformatics","veranstaltungen":[{"titel":"Algorithmen in der Cheminformatik","leistungspunkte":"5LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Algorithmen in der Cheminformatik“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Chemische \u0026 algorithmische Grundlagen\n* Algorithmen auf molekularen Graphen\n* Molekulare Deskriptoren\n* Algorithmische Massenspektrometrie\n* Monte-Carlo Simulationen\n* Molekulardynamik","lernergebnisse":"Nach der Veranstaltung werden die Studierenden ein vertieftes Verständnis ausgesuchter grundlegender Techniken der Informatik und Mathematik besitzen und in der Lage sein\n\n* klassische Algorithmen und spezielle cheminformatische Algorithmen auf (bio-)chemische Probleme anzuwenden;\n* gelernte Algorithmen exemplarisch in der Programmiersprache Python umzusetzen;\n* cheminformatische Software-Libraries anzuwenden;\n* cheminformatische Probleme mit den vorgestellten Algorithmen selbständig lösen zu können.","literatur":"* Leach \u0026 Gillet: An Introduction to Chemoinformatics, Springer, 2007\n* Leach: Molecular Modeling. Principles and Applications, Prentice Hall, 2nd ed., 2001\n* Jensen: Introduction to Computational Chemistry,Wiley, 2007","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung im Master-Studiengang Informatik\n* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete","voraussetzungenBestehen":"* aktiveTeilnahme an den Übungen\n* erfolgreiches Bearbeiten der Übungsaufgaben\n* abschließende Prüfung (i.d.R. schriftlich)","haeufigkeit":"Dieses Modul wird in unregelmäßigen Abständen angeboten.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Algorithmen in der Bioinformatik“"}]}],"modulbeauftragte":"Prof. Dr. Gunnar W. Klau","gesamtLeistungspunkte":"5LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":625095000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":625095000}}}', 61);
INSERT INTO public.antrag VALUES (62, 'Initiale Erstellung', '2020-04-06 00:26:36.652931', '2020-04-06 00:26:36.677459', '{"titelDeutsch":"Algorithmische Spieltheorie","titelEnglisch":"Algorithmic Game Theory","veranstaltungen":[{"titel":"Algorithmische Spieltheorie","leistungspunkte":"10 LP ab PO 2015, alte PO 15 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Algorithmische Spieltheorie\"","semesterWochenStunden":4}],"beschreibung":{"inhalte":"* Nichtkooperative Spiele: Gegeneinander spielen\n  * Grundlagen\n    * Normalform, dominante Strategien und Gleichgewichte\n    * Weitere Zwei-Personen-Spiele\n  * Nash-Gleichgewichte in gemischten Strategien\n    * Definition und Eigenschaften gemischter Nash-Gleichgewichte\n    * Existenz von Nash-Gleichgewichten in gemischten Strategien\n  * Schachmatt: Spielbäume in Spielen mit perfekter Information\n    * Sequenzielle Zwei-Personen-Spiele\n    * Gleichgewichte in Spielbäumen\n  * Full House: Spiele mit unvollkommener Information\n    * Das Ziegenproblem\n    * Analyse einer einfachen Poker-Variante\n  * Wie schwer ist es, ein Nash-Gleichgewicht zu finden?\n    * Nash-Gleichgewichte in Nullsummenspielen\n    * Nash-Gleichgewichte in allgemeinen Normalform-Spielen\n* Kooperative Spiele: Miteinander spielen\n  * Grundlagen\n    * Kooperative Spiele mit übertragbarem Gewinn\n    * Superadditive Spiele\n    * Stabilitätskonzepte für kooperative Spiele\n  * Einfache Spiele\n    * Der Kern einfacher Spiele\n    * Darstellungen einfacher Spiele\n    * Gewichtete Wahlspiele\n    * Dimensionalität\n    * Machtindizes\n    * Der Shapley-Shubik-Indexund der Shapley-Wert\n    * Die Banzhaf-Indizes\n  * Komplexität von Problemen für kompakt darstellbare Spiele\n    * Spiele auf Graphen\n    * Gewichtete Wahlspiele\n    * Hedonische Spiele","lernergebnisse":"Ziel in diesem Modul ist es, den Studierenden Einblicke in einige derwichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem Gebiet der algorithmischen Spieltheorie zu vermitteln, welches derzeit in der Abteilung „Komplexitätstheorie und Kryptologie“ (Prof. Jörg Rothe und Jun.-Prof. Dorothea Baumeister) intensiv in der Forschung bearbeitet wird und in dem bevorzugt Themen für Bachelor-und Master-Arbeiten ausgegeben werden.  Am Ende der Veranstaltung sollten Studierende wichtige Probleme und die zu ihrer Lösung entwickelten Algorithmen und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können.  Insbesondere sollten sie in der Lage sein, „strategische Szenarien“ durch kooperative bzw. nichtkooperative Spiele zu beschreiben und Stabilitäts-und Gleichgewichtskonzepte in diesen Spielen formal zu charakterisieren. Ebenso sollten sie die Komplexität der für solche Spiele relevanten Entscheidungsprobleme (in einer geeigneten kompakten Darstellung) formal bestimmen und beschreiben können.","literatur":"* Jörg Rothe (ed.):Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.\n\nEine kürzere deutsche Version dieses Buches erschien als:\n\n* Jörg Rothe,Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011.","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik\n* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science","voraussetzungenBestehen":"* erfolgreiche Bearbeitung der Übungsaufgaben\n* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung","haeufigkeit":"Etwa alle zwei Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Ergänzende Literatur","inhalt":"* Bezalel Peleg and Peter Sudhölter: Introduction to the Theory of Cooperative Games, Kluwer Academic Publishers, 2003.\n* Martin J. Osborne and Ariel Rubinstein: A Course in Game Theory, MIT Press, 1994.\n* Georgios Chalkiadakis, Edith Elkind, and Michael Wooldridge: Computational Aspects of Cooperative Game Theory, Morgan and Claypool Publishers, 2011.\n* Noam Nisan, Tim Roughgarden, Eva Tardos, and Vijay V. Vazirani (eds.): Algorithmic Game Theory, Cambridge University Press, 2008."}]}],"modulbeauftragte":"Prof. Dr. Jörg Rothe","gesamtLeistungspunkte":"10 LP ab PO 2015, alte PO 15 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":652931200}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":652931200}}}', 62);
INSERT INTO public.antrag VALUES (63, 'Initiale Erstellung', '2020-04-06 00:26:36.687217', '2020-04-06 00:26:36.703808', '{"titelDeutsch":"Algorithms for Sequence Analysis","titelEnglisch":"Algorithms for Sequence Analysis","veranstaltungen":[{"titel":"Algorithms for Sequence Analysis","leistungspunkte":"10LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Algorithms for Sequence Analysis“ (English)","semesterWochenStunden":4}],"beschreibung":{"inhalte":"Sequence information is ubiquitous in many application domains –and collections strings are one important data type in modern Data Dcience. DNA sequencing data are one example that motivates this lecture, but the focus of this course is on algorithms and concepts that are not specific to bioinformatics. This lecture ad-dresses classic as well as recent advanced algorithms for the analysis of large sequence databases. Topics include: full text search without index; approximate pattern matching; index structures such as suffix trees and enhanced suffix arrays, Burrows-Wheeler transform and the FM index; De Bruijn graphs; data compres-sion; multiple sequence alignment; Positional Burrows-Wheeler Transform; and Locality Sensitive Hashing.","lernergebnisse":"This course enables students to understand advanced algorithmic concepts in sequence analysis and to ap-ply them in practice. In particular, this course will provide the algorithmic foundation to develop modern tools to process DNA sequencing data. However, the focus is on general algorithmic concepts and hence the scope of applications is not limited to biological sequence analysis.","literatur":"We provide the lecture slides as well as lecture notes that cover most of the course material. Additionally, these books serve as additional reading material:\n\n* Ohlebusch -Bioinformatics Algorithms\n* Navarro and Raffinot -Flexible Pattern Matching in Strings\n* Mäkinen, Belazzougui, Cunial, Tomescu -Genome-Scale Algorithm Design\n* Gusfield -Algorithms on Strings, Trees, and Sequences","verwendbarkeit":"* WWahlpflichtbereich Praktisch/Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik\n* Teil eines Master-Moduls im Master-Studiengang Biologie/ Quantitative Biologie\n* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science","voraussetzungenBestehen":"* The weekly exercise sheets come with programming tasks and theory tasks. To be eligible to take the exam, students have to earn 50% of programming tasks and 50% of theory tasks.\n* Exams are usually oral.","haeufigkeit":"Yearly, usually each Summer Term.","sprache":"Englisch"},"voraussetzungenTeilnahme":"We assume knowledge corresponding to the BSc-level lectures Programming („Programmierung”), Com-puter Architecture(„Rechnerarchitektur“), Algorithms and Data Structures („Algorithmen und Daten-strukturen”) and Theoretical Computer Science („Theoretische Informatik”)."}],"modulbeauftragte":"Prof. Dr. Tobias Marschal","gesamtLeistungspunkte":"10LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":686241800}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":686241800}}}', 63);
INSERT INTO public.antrag VALUES (64, 'Initiale Erstellung', '2020-04-06 00:26:36.711616', '2020-04-06 00:26:36.736019', '{"titelDeutsch":"Algorithmische Eigenschaften von Wahlsystemen II","titelEnglisch":"Algorithmic Properties of Voting Systems II","veranstaltungen":[{"titel":"Algorithmische Eigenschaften von Wahlsystemen II","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":1},{"form":"Vorlesung „Algorithmische Eigenschaften von Wahlsystemen II“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Grundlagen der Social-Choice-Theorie\n  * Wiederholung: Wahlen und Wahlsysteme\n  * Wiederholung: Eigenschaften von Wahlsystemen und einige Wahl-Paradoxa und Unmöglichkeitssätze\n* Algorithmik und Komplexität von Wahlproblemen\n  * Wiederholung: Gewinnerbestimmung, mögliche und notwendige Gewinner und Manipulation\n  * Wahlkontrolle\n  * Bestechung","lernergebnisse":"Ziel in diesem Modul ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem jungen, sich rasant entwickelnden, interdisziplinären Gebiet Computational Social Choicezu vermitteln, welches derzeit in der Abteilung „Komplexitätstheorie und Kryptologie“ (Prof. Jörg Rothe und Jun.-Prof. Dorothea Baumeister) intensiv in der Forschung bearbeitet wird und in dem bevorzugt Themen für Bachelor-und Master-Arbeiten ausgegeben werden. Am Ende der Veranstaltung sollten Studierende die wichtigsten Wahlverfahren und ihre „social-choice“-theoretischen Eigenschaften sowie die damit im Zusammenhang stehenden Entscheidungsprobleme (Wahlkontrolle, Bestechung usw.) und die zu ihrer Lösung entwickelten Algorithmen und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können. Ebenso sollten sie die Komplexität dieser Probleme formal bestimmen und beschreiben können.","literatur":"* Jörg Rothe (ed.):Economics and Computation: AnIntroduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.\n\nEine kürzere deutsche Version dieses Buches erschien als:\n\n*Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011.","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* erfolgreiche Bearbeitung der Übungsaufgaben\n* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung","haeufigkeit":"Etwa alle vier Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Ergänzende Literatur","inhalt":"* Piotr Faliszewski, Lane A. Hemaspaandra, Edith Hemaspaandra, and Jörg Rothe: A Richer Understanding of the Complexity of Election Systems, Chapter 14 in: „Fundamental Problems in Computing: Essays in Honor of Professor Daniel J. Rosenkrantz,” pp. 375-406, S. Ravi and S. Shukla (eds.), Springer, 2009.\n* Piotr Faliszewskiund Jörg Rothe: Control and Bribery in Voting, Chapter 7 in: „Handbook of Computational Social Choice,” Felix Brandt, Vincent Conitzer, Ulle Endriss, Jerome Lang, and Ariel Procaccia (eds.), Cambridge University Press, 2015.\n* Steven J. Brams and Peter C. Fishburn: Voting Procedures, Chapter 4 in: „Handbook of Social Choice and Welfare,” Kenneth J. Arrow, Amartya Sen, and Kotaro Suzumura (eds.), North-Holland, 2002."}]}],"modulbeauftragte":"Prof. Dr. Jörg Rothe","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":710640000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":710640000}}}', 64);
INSERT INTO public.antrag VALUES (65, 'Initiale Erstellung', '2020-04-06 00:26:36.743827', '2020-04-06 00:26:36.766788', '{"titelDeutsch":"Cake-cutting Algorithms","titelEnglisch":"Cake-cutting Algorithms","veranstaltungen":[{"titel":"Cake-cutting Algorithms","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Vorlesung „Cake-cutting Algorithms“","semesterWochenStunden":2},{"form":"Übung","semesterWochenStunden":1}],"beschreibung":{"inhalte":"* Grundlagen\n* Bewertungskriterien\n    * Fairness\n    * Effizienz\n    * Manipulation\n    * Laufzeit\n* Cake-cutting-Protokolle\n    * Zwei neidfreie Protokolle für zwei Spieler\n    * Proportionale Protokolle für beliebig viele Spieler\n    * Überproportionale Protokolle für beliebig viele Spieler\n    * Eine Hochzeitsfeier im Königshaus: Aufteilung in ungleiche Anteile\n    * Neidfreie Protokolle für drei und vier Spieler\n    * Versalzene Sahnetorte: Dirty-Work-Protokolle\n    * Gekrümel vermeiden: Minimierung der Schnittanzahl\n    * Der Grad der garantierten Neidfreiheit\n    * Übersicht über einige Cake-cutting-Protokolle","lernergebnisse":"Ziel in diesem Modul ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem Gebiet Fair Division zu vermitteln, welches derzeit in der Abteilung „Komplexitätstheorie und Kryptologie“ (Prof. Jörg Rothe und Jun.-Prof. Dorothea Baumeister) intensiv in der Forschung bearbeitet wird und in dem bevorzugt Themen für Bachelor- und Master-Arbeiten ausgegeben werden. Am Ende der Veranstaltung sollten Studierende die wichtigsten Eigenschaften von gerechten Aufteilungsverfahren für eine teilbare Ressource (Proportionalität, Neidfreiheit usw.) kennen und die dafür entwickelten Protokolle und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können. Insbesondere sollten sie in der Lage sein, über die Eigenschaften von Verfahren zur gerechten Aufteilung formal zu argumentieren und selbstständig solche Verfahren zu entwerfen und zu bewerten.","literatur":"* Jörg Rothe (ed.): Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.\n\nEine kürzere deutsche Version dieses Buches erschien als:\n\n* Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011.","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* erfolgreiche Bearbeitung der Übungsaufgaben\n* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung","haeufigkeit":"Etwa alle zwei Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Ergänzende Literatur:","inhalt":"* Jack Robertson and William Webb: Cake-Cutting Algorithms: Be Fair if You Can, A K Peters, 1998.\n* Steven J. Brams and Alan D. Taylor: Fair Division: From Cake-Cutting to Dispute Resolution, Cambridge University Press, 1996."}]}],"modulbeauftragte":"Prof. Dr. Jörg Rothe","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":742850800}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":742850800}}}', 65);
INSERT INTO public.antrag VALUES (66, 'Initiale Erstellung', '2020-04-06 00:26:36.773618', '2020-04-06 00:26:36.792158', '{"titelDeutsch":"Einführung in die Geoinformatik","titelEnglisch":"Introduction to Geoinformatics","veranstaltungen":[{"titel":"Einführung in die Geoinformatik","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Vorlesung „Geoinformatik“","semesterWochenStunden":2},{"form":"Übung (im Block)","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Erfassung und Aufbereitung von Geodaten\n* Datenstrukturen (Raster, Vektor usw.)\n* Grundlagen der Bildverarbeitung\n* Koordinatensysteme und –transformationen\n* Georeferenzierung\n* Räumliche Analysen\n* Datenverschneidung\n* Räumliche Interpolationsverfahren, Geländemodelle","lernergebnisse":"Die Geoinformatik befasst sich im weitesten Sinn mit der Erfassung, Aufbereitung, Analyse und Präsentation von räumlichen Daten. Der Raumbezug erfolgt dabei über Weltkoordinaten und kann beispielsweise per GPS hergestellt werden. Nach erfolgreichem Abschluss der Lehrveranstaltung sollen die Studierenden\n\n* die wichtigsten Koordinatensysteme und Kartennetzentwürfe inklusive der mathematischen Hintergründe verstanden haben,\n* die gebräuchlichen Datenstrukturen (Raster, Vektor, Attribute) mit ihren Anwendungsfällen und Vor- und Nachteilen kennen und erläutern können,\n* das Georeferenzieren und Verschneiden von Vektor- und Rasterdaten beherrschen sowie\n* grundlegende Verfahren der räumlichen Analyse anwenden können.","literatur":"* Norbert Bartelme: Geoinformatik. Modelle, Strukturen, Funktionen. Springer.\n* Ralf Bill: Grundlagen der Geo-Informationssysteme. Wichmann.\n* Norbert de Lange: Geoinformatik in Theorie und Praxis. Springer.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"Regelmäßige Teilnahme an den Übungen, Bearbeitung der Aufgaben, schriftliche Prüfung (Klausur, 90 Minuten).","haeufigkeit":"Wird nicht mehr angeboten","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"PD Dr. Dr.-Ing. Wilfried Linder","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":772639400}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":773617700}}}', 66);
INSERT INTO public.antrag VALUES (67, 'Initiale Erstellung', '2020-04-06 00:26:36.800941', '2020-04-06 00:26:36.817534', '{"titelDeutsch":"Einführung in die statistische Analyse mittels Computersimulationen","titelEnglisch":"Introduction to Statistical Analysis through Computer Simulations","veranstaltungen":[{"titel":"Einführung in die statistische Analyse mittels Computersimulationen","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Theoretische und Praktische Übungen","semesterWochenStunden":2},{"form":"Vorlesung „Einführung in die statistische Analyse mittels Computersimulationen“ (auf Englisch)","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Einführung in Bayesianisches Denken\n\n* Wahrscheinlichkeit und Einführung in Computersimulationen\n* Einführung in Bootstrap\n* Einführung in Bayesianische Modelle\n* Einführung in multivariate Wahrscheinlichkeitsverteilungen und multiple Parameter Modelle\n\nMonte Carlo Simulationsmethoden\n\n* Monte Carlo Methode zur Berechnung von Integralen\n* Rejection Sampling\n* Importance Sampling\n* Sampling Importance Re-sampling\n\nMarkov Ketten Monte Carlo Methoden\n\n* Einführung in Markov Ketten\n* Metropolis-Hastings Algorithmus\n* Gerichtete azyklische Graphen\n* Gibbs-sampling\n* MCMC output analysis\n\nStatistische Modellierung\n\n* Regression modelling\n* Analysis of multiple contingency tables\n* Einführung in hierarchische Modelle","lernergebnisse":"Die Studierenden werden am Ende des Kurses in der Lage sein,\n\n* die Programmiersprache R sowie die Software OpenBUGS in Zusammenhang mit Bayesianischem Denken zu nutzen\n* die Rolle von Computersimulationen und Bayesianischen Methoden für reale Modellierung zu erkennen\n* verschiedene Simulationsmethoden zu klassifizieren","literatur":"* Andrew Gelman, John B. Carlin, Hal S. Stern: Bayesian Data Analysis. Chapman \u0026 Hall, 2004","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik\n* Teil eines Master-Moduls im Master-Studiengang Biologie","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen\n* erfolgreiches Bearbeiten der Übungsaufgaben\n* abschließende Prüfung (i.d.R. schriftlich)","haeufigkeit":"Jedes Studienjahr, in der Regel im Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Martin Lercher, Dr. Pablo Verde","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":799964900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":799964900}}}', 67);
INSERT INTO public.antrag VALUES (68, 'Initiale Erstellung', '2020-04-06 00:26:36.824364', '2020-04-06 00:26:36.839003', '{"titelDeutsch":"Entwurfs- und Analysetechniken für Algorithmen","titelEnglisch":"Design Principles and Analytic Methods for Algorithms","veranstaltungen":[{"titel":"Entwurfs- und Analysetechniken für Algorithmen","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"* Vorlesung „Entwurfs- und Analysetechniken für Algorithmen“, 2 SWS\n* Übungen, 2 SWS\n* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere, 2 SWS","semesterWochenStunden":0}],"beschreibung":{"inhalte":"Dieses Modul vertieft Kenntnisse aus folgenden Bereichen:\n\n* Gierige Algorithmen\n* Dynamische Programmierung\n* Scanline\n* Backtracking\n* Korrektheitsbeweise\n* (amortisierte) Aufwandsabschätzungen","lernergebnisse":"Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein vertieftes Verständnis in der systematischen Entwicklung und Analyse von Algorithmen zur Lösung von Entscheidungs- und Optimierungsproblemen.","literatur":"Aktuelle Lehrbücher über Algorithmik sowie Originalliteratur","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik\n* Teil eines Master-Moduls im Master-Studiengang Biologie","voraussetzungenBestehen":"schriftliche Prüfung (i.d.R. 90 Minuten) am Ende des Semesters","haeufigkeit":"Jedes Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}]}],"modulbeauftragte":"Dr. Stefan Hoffmann","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":824363500}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":824363500}}}', 68);
INSERT INTO public.antrag VALUES (69, 'Initiale Erstellung', '2020-04-06 00:26:36.845835', '2020-04-06 00:26:36.870743', '{"titelDeutsch":"Funktionale Programmierung","titelEnglisch":"Functional Programming","veranstaltungen":[{"titel":"Funktionale Programmierung","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Praktische Übung","semesterWochenStunden":2},{"form":"Vorlesung „Funktionale Programmierung“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Funktionale Programmierung hat in den letzten Jahren deutlich an Fahrt aufgenommen. Sprachen wie Haskell, Scala, Clojure, OCaml und F# gewinnen immer mehr an Bedeutung und auch Java hat in Version 8 mit Closures endlich Syntax für anonyme Funktionen bekommen.\n\nAusgehend von den Problemen, mit denen wir in objektorientierten Sprachen permanent konfrontiert sind, wollen wir in dem Kurs neue Ansätze erarbeiten, um so ein umfassenderes Verständnis von Programmierung zu erhalten. Wir werden uns damit befassen, wie wir Programme in funktionalen Sprachen strukturieren und unbeabsichtigte Komplexität loswerden können. Außerdem werden wir uns mit internen domänenspezifischen Sprachen beschäftigen. Die Sprache, die wir in dem Kurs verwenden werden ist Clojure, ein modernes Lisp, das auf der JVM läuft und viele aus softwaretechnischer Sicht interessante Konzepte umsetzt. Wir werden uns ebenfalls mit statischer Typisierung in der Programmiersprache Haskell und nebenläufiger Programmierung in Erlang befassen.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die Prinzipien der funktionalen Programmierung bezeichnen können und klassischen, imperativen Programmiersprachen gegenüberstellen können\n* bewerten für welche Einsatzbereiche die funktionale Programmierung vorteilhaft ist\n* eigenständig funktionale Programme erstellen und testen können","literatur":"* Abelson, Sussman: Structure and Interpretation of Computer Programs\n* Moseley, Marks: Out of the tarpit\n* Fogus, Houser: The Joy of Clojure\n* Emerick, Carper, Grand: Programming Clojure\n* Rathore: Clojure in Action\n* Higginbotham: Clojure for the Brave and True","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen\n* erfolgreiches Bearbeiten der Übungsaufgaben\n* abschließende Prüfung (i.d.R. schriftlich)","haeufigkeit":"Jährlich, i.d.R. im Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Michael Leuschel, Jens Bendisposto","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":845834500}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":845834500}}}', 69);
INSERT INTO public.antrag VALUES (70, 'Initiale Erstellung', '2020-04-06 00:26:36.876131', '2020-04-06 00:26:36.896158', '{"titelDeutsch":"Fuzzy-Clusteranalyse","titelEnglisch":"Fuzzy Cluster Analysis","veranstaltungen":[{"titel":"Fuzzy-Clusteranalyse","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Übung/Seminar","semesterWochenStunden":2},{"form":"Vorlesung „Fuzzy-Clusteranalyse“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Fuzzy und possibilistische fuzzy Clusteringverfahren\n* Bestimmung der Clusteranzahl\n* Vergleich von Clusteringergebnissen\n* Fuzzy Clustering von unvollständigen Daten\n* Fuzzy Clustering hochdimensionaler Daten","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* Nutzen von Konzepten der Fuzzy Logik für das Clustering zu erkennen\n* die wichtigsten Verfahren, Herausforderungen und aktuellen Entwicklungen im Bereich Fuzzy-Clusteranalyse zu erläutern\n* mit verschiedenen Anwendungsgebieten der Fuzzy Clustering Methoden vertraut zu werden und die entsprechenden Methoden selbstständig anzuwenden","literatur":"* F. Höppner, F. Klawonn, R. Kruse: Fuzzy-Clusteranalyse: Verfahren für die Bilderkennung, Klassifikation und Datenanalyse, Vieweg, Braunschweig/Wiesbaden, 1997\n* R. Kruse, C. Borgelt, C. Braune, F. Klawonn, C. Moewes, M.\n* Steinbrecher: Computational Intelligence: Eine methodische Einführung in Künstliche Neuronale Netze, Evolutionäre Algorithmen, Fuzzy-Systeme und Bayes-Netze, Springer Vieweg, Wiesbaden, 2015\n\nsowie ggfs. weiterführende Literatur (wird in der Veranstaltung bekanntgegeben)","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen bzw. dem Seminar\n* erfolgreiches Bearbeiten der Übungsaufgaben bzw. Anfertigen einer angemessenen Seminarausarbeitung und Halten eines Vortrags\n* abschließende Prüfung (i.d.R. mündlich)","haeufigkeit":"unregelmäßig, ggf. im Wechsel mit den Modulen/Veranstaltungen von Prof. Dr. Stefan Conrad.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Dr. Ludmila Himmelspach","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":876130500}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":876130500}}}', 70);
INSERT INTO public.antrag VALUES (71, 'Initiale Erstellung', '2020-04-06 00:26:36.902991', '2020-04-06 00:26:36.920088', '{"titelDeutsch":"Fuzzy Systeme","titelEnglisch":"Fuzzy Systems","veranstaltungen":[{"titel":"Fuzzy Systeme","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Vorlesung „Fuzzy Systeme“","semesterWochenStunden":2},{"form":"Übung/Seminar","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Eigenschaften und Operationen auf fuzzy Mengen\n* Fuzzy Relationen\n* Zugehörigkeitsfunktionen, Fuzzifizierung und Defuzzifizierung\n* Fuzzy Logik und approximatives Schließen\n* Fuzzy Regelsysteme\n* Fuzzy Methoden in Pattern Recognition","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* theoretischen Grundlagen der fuzzy Mengen Theorie zu erklären\n* Nutzen von Konzepten der fuzzy Logik in intelligenten Systemen zu erkennen\n* mit verschiedenen Anwendungsgebieten der fuzzy Methoden vertraut zu werden und die entsprechenden Methoden selbstständig anzuwenden","literatur":"* R. Kruse, C. Borgelt, C. Braune, F. Klawonn, C. Moewes, M. Steinbrecher: Computational Intelligence: Eine methodische Einführung in Künstliche Neuronale Netze, Evolutionäre Algorithmen, Fuzzy-Systeme und Bayes-Netze, Springer Vieweg, Wiesbaden, 2015\n* Timothy J. Ross: Fuzzy Logic with Engineering Applications, John Wiley \u0026 Sons Ltd, Chichester, 2004\n\nsowie ggfs. weiterführende Literatur (wird in der Veranstaltung bekanntgegeben)","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen bzw. dem Seminar\n* erfolgreiches Bearbeiten der Übungsaufgaben bzw. Anfertigen einer angemessenen Seminarausarbeitung und Halten eines Vortrags\n* abschließende Prüfung (i.d.R. mündlich)","haeufigkeit":"unregelmäßig, ggf. im Wechsel mit den Modulen/Veranstaltungen von Prof. Dr. Stefan Conrad.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Dr. Ludmila Himmelspach","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":902990700}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":902990700}}}', 71);
INSERT INTO public.antrag VALUES (72, 'Initiale Erstellung', '2020-04-06 00:26:36.930823', '2020-04-06 00:26:36.946438', '{"titelDeutsch":"Gerechte Aufteilungsverfahren","titelEnglisch":"Fair Division","veranstaltungen":[{"titel":"Gerechte Aufteilungsverfahren","leistungspunkte":"10 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Gerechte Aufteilungsverfahren“","semesterWochenStunden":4}],"beschreibung":{"inhalte":"* Cake-Cutting: Gerechte Aufteilung teilbarer Güter\n    * Grundlagen\n    * Bewertungskriterien\n\n* Cake-cutting-Protokolle\n    * Gerechte Aufteilung unteilbarer Güter\n    * Definition und Klassifikation von Allokationsproblemen Präferenzerhebung und kompakte Darstellung\n    * Kriterien für Allokationen\n    * Berechnung von Allokationen: Zentralisierte Mechanismen Dezentralisierte Allokationsprotokolle","lernergebnisse":"Ziel in diesem Modul ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem Gebiet der gerechten Aufteilungsverfahren zu vermitteln, welches derzeit in den Abteilungen „Komplexitätstheorie und Kryptologie“ und „Computational Social Choice“ (Prof. Jörg Rothe und Jun.-Prof. Dorothea Baumeister) intensiv in der Forschung bearbeitet wird und in denen bevorzugt Themen für Bachelor- und Master-Arbeiten ausgegeben werden. Am Ende der Veranstaltung sollten Studierende wichtige Probleme und die zu ihrer Lösung entwickelten Verfahren und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können. Insbesondere sollten sie in der Lage sein, verschiedene Fairness-Begriffe zu beschreiben und Aufteilungsprotokolle zu entwerfen und zu bewerten, die Fairness eines gegebenen Typs garantieren. Ebenso sollten sie die Komplexität der für solche Spiele relevanten Entscheidungsprobleme (in einer geeigneten kompakten Darstellung) formal bestimmen und beschreiben können.","literatur":"* Jörg Rothe (ed.): Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.\n\nEine kürzere deutsche Version dieses Buches erschien als:\n\n* Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011.","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* erfolgreiche Bearbeitung der Übungsaufgaben\n* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung","haeufigkeit":"Etwa alle zwei Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Ergänzende Literatur:","inhalt":"* Jack Robertson und William Webb: Cake-Cutting Algorithms: Be Fair if You Can, A K Peters, 1998.\n* Steven J. Brams und Alan D. Taylor: Fair Division: From Cake-Cutting to Dispute Resolution, Cambridge University Press, 1996."}]}],"modulbeauftragte":"Prof. Dr. Jörg Rothe","gesamtLeistungspunkte":"10 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":929847600}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":929847600}}}', 72);
INSERT INTO public.antrag VALUES (73, 'Initiale Erstellung', '2020-04-06 00:26:36.956443', '2020-04-06 00:26:36.973034', '{"titelDeutsch":"Graphenalgorithmen II","titelEnglisch":"Algorithms for Graphs II","veranstaltungen":[{"titel":"Graphenalgorithmen II","leistungspunkte":"10 LP ab PO 2015, alte PO 15 LP","veranstaltungsformen":[{"form":"* Vorlesung „Graphenalgorithmen II“, 4 SWS\n* Übung, 2 SWS\n* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere 4 SWS","semesterWochenStunden":0}],"beschreibung":{"inhalte":"* Planare Graphen (Erkennung, Dualität, Färbungsprobleme, ...)\n* Chordale Graphen (lexikographische Breitensuche, perfekte Eliminationsordnung, ...)\n* Baumweite beschränkte Graphen\n* Cliquenweite, Rangweite, NLC-Weite\n* Baumautomaten\n* Fixed Parameter Tractability\n* Minorensatz\n* Extremale Graphentheory","lernergebnisse":"Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein breites und vertieftes Verständnis im Bereich „Graphenalgorithmen“.","literatur":"Verschiedene aktuelle Lehrbücher über Ad-hoc- und Sensornetzwerke sowie Originalliteratur","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Mitarbeit in den Übungen\n* Abgabe der Hausaufgaben\n* 10-minütiger Lehrvortrag über ein Thema der Vorlesung\n* schriftliche Klausur (i.d.R. 90 Minuten) oder mündliche Prüfung am Ende des Semesters","haeufigkeit":"Jedes zweite Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”\n* „Algorithmische Komplexitätstheorie“\n* „Graphenalgorithmen I“"}]}],"modulbeauftragte":"Prof. Dr. Egon Wanke","gesamtLeistungspunkte":"10 LP ab PO 2015, alte PO 15 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":955478300}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":955478300}}}', 73);
INSERT INTO public.antrag VALUES (74, 'Initiale Erstellung', '2020-04-06 00:26:36.98572', '2020-04-06 00:26:37.025734', '{"titelDeutsch":"Causality","titelEnglisch":"Causality","veranstaltungen":[{"titel":"Causality","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Causality“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Dieses Modul vermittelt grundlegendes Wissen zu folgenden Themen:\n\n* Directed acyclic graphs, causal graphs\n* Conditional independence\n* PC algorithm\n* Structural equation models\n* Additive noise models\n* Interventions\n* Counterfactuals\n* Markov equivalence\n* Faithfulness\n* Distinguishing cause and effect","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,\n\n* die Grundlagen der kausalen Inferenz zu beschreiben und anzuwenden\n* die mathematische Beschreibung dieser Grundlagen und verschiedene Algorithmen zu erklären und Sachverhalte darüber zu beweisen\n* die Grundlagen und verschiedene Algorithmen anzuwenden, um selbstständig Problemstellungen der kausalen Inferenz zu bearbeiten.","literatur":"Es wird nicht ein bestimmtes Lehrbuch verwendet, jedoch sind folgende Bücher hilfreich:\n\n* Spirtes/Glymour/Scheines, Causation, Prediction, and Search, MIT 2000\n* Pearl: Causality, Cambridge 2000","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik\n* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science","voraussetzungenBestehen":"* Aktive und erfolgreiche Mitwirkung in den Übungen;\n* Prüfung zu Vorlesung und Übungen am Ende des Semesters","haeufigkeit":"I.d.R. jährlich.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Stefan Harmeling","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":984744200}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":36,"nano":984744200}}}', 74);
INSERT INTO public.antrag VALUES (75, 'Initiale Erstellung', '2020-04-06 00:26:37.036469', '2020-04-06 00:26:37.06723', '{"titelDeutsch":"Computational Systems Biology","titelEnglisch":"Computational Systems Biology","veranstaltungen":[{"titel":"Computational Systems Biology","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Praktikum und Übung (in englischer Sprache)","semesterWochenStunden":2},{"form":"Vorlesung „Computational Systems Biology“ (in englischer Sprache)","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Simple models of population dynamics\n    * Exponential and logistic growth\n    * Two-species model: Antibiotic resistance\n    * Populations in fluctuating environments: Endosymbiotic theory\n* Control of protein expression\n    * Transcription and statistics of protein binding to DNA\n    * Statistical analysis of transcription regulation by proteins\n    * Modeling gene-regulatory circuits with differential equations\n* Information content of DNA sequences\n    * Information and sequence logo\n    * Calculating binding energy from sequence\n    * Recognizing DNA sequences in the context of the whole genome\n* Modeling cellular tradeoffs in bacterial growth\n    * Chemical kinetics, Michaelis-Menten mechanism\n    * Interdependence of cell growth and protein production\n    * Optimization of the bacterial growth rate","lernergebnisse":"After successfully completing the course students will be able to\n\n* model the growth/decay of bacterial populations with ordinary differential equations;\n* reason about fundamental biological processes, such as protein-DNA binding, gene expression, and metabolic transformations in terms of the relevant spatial, temporal and energetic scales;\n* formulate simple physical/mathematical models of genetic and metabolic networks in terms of ordinary differential equations;\n* numerically simulate and analyze these models using Python;\n* relate the outcomes of these analyses to experimental measurements by generating meaningful scientific plots.","literatur":"In addition to the original research literature that will be given in the lectures, some chapters of the following textbooks will be covered in detail:\n\n* Rob Phillips, Jane Kondev, Julie Theriot, Hernan G. Garcia: Physical Biology of the Cell, Garland Science, 2nd edition, 2016.\n* Brian P. Ingalls: Mathematical Modeling in Systems Biology - An Introduction, MIT Press, 2013.\n* David S. Goodsell: The Machinery of Life, 2nd ed., Springer Science+Business Media, 2009.\n* Nick Lane: Power, Sex, Suicide, Oxford University Press, 2006.\n* Gerhart Kirschner: The Plausibility of Life, Yale University Press, 2005.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Regelmäßige und aktive Teilnahme am Praktikum\n* Regelmäßige Abgabe der Lösungen zu Übungsaufgaben\n* Erfolgreiche Bearbeitung von zwei gesonderten Aufgabenzetteln (Hausarbeiten)\n* Bestehen der Abschlussprüfung","haeufigkeit":"Jährlich im Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Dr. Deniz Sezer","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":36469000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":36469000}}}', 75);
INSERT INTO public.antrag VALUES (76, 'Initiale Erstellung', '2020-04-06 00:26:37.077039', '2020-04-06 00:26:37.100968', '{"titelDeutsch":"Computer Vision","titelEnglisch":"Computer Vision","veranstaltungen":[{"titel":"Computer Vision","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Computer Vision“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Dieses Modul vermittelt grundlegendes Wissen zu folgenden Themen:\n\n* Image formation\n* Image processing\n* Matting, segmentation\n* Local features, e.g. SIFT\n* Computational photography\n* Face detection","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,\n\n* die Grundlagen der Computer Vision zu beschreiben und anzuwenden\n* die mathematische Beschreibung dieser Grundlagen und verschiedene Algorithmen zu erklären\n* die Grundlagen und verschiedene Algorithmen anzuwenden, um selbstständig Problemstellungen der Computer Vision zu bearbeiten.","literatur":"* Szeliski, Computer vision, Springer 2010","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Aktive und erfolgreiche Mitwirkung in den Übungen;\n* Prüfung zu Vorlesung und Übungen am Ende des Semesters","haeufigkeit":"I.d.R. jährlich.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Stefan Harmeling","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":76061400}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":76061400}}}', 76);
INSERT INTO public.antrag VALUES (77, 'Initiale Erstellung', '2020-04-06 00:26:37.108775', '2020-04-06 00:26:37.12927', '{"titelDeutsch":"Data \u0026 KnowledgeEngineering (DKE)","titelEnglisch":"Data \u0026 KnowledgeEngineering (DKE)","veranstaltungen":[{"titel":"Data \u0026 KnowledgeEngineering (DKE)","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Vorlesung „Data \u0026 Knowledge Engineering“ (englischsprachig)","semesterWochenStunden":2},{"form":"Übung (englischsprachig)","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Understanding and interpreting heterogeneous data, in particular in distributed settings such as the Web, remains a challenging task. State-of-the-art Web applications such as Web search engines rely on a combination of approaches for making sense of data, involving both explicit knowledge, for instance, through knowledge graphs such as Wikidata or the Google knowledge graph and semi-structured Web markup, as well as statistical and machine-learning based approaches.\nThis course provides an introduction to data and knowledge engineering methods and principles, with a particular focus on the Web. This includes methods related to knowledge graphs and formal data \u0026 knowledge representation (RDF, OWL, Description Logics), data integration and linking, information extraction, Web data sharing practices (Linked Data, Semantic Web and affiliated W3C standards such as RDF, RDFa, Microdata), as well as emerging approaches in the context of distributional semantics, such as word and entity embeddings. Attention will also be paid to applications of taught techniques to facilitate data sharing and reuse on the Web.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* Anwendung von W3C Standards (RDF, SPARQL) für Nutzung und Extraktion von Wissensgraphen, Linked Data und strukturierten Daten im Web\n* Grundlegendes Verständnis von Informations- und Wissensextraktionsmethoden\n* Erstellung formaler Wissensrepräsentationen und -basen mithilfe von Description Logics und Regeln\n* Verständnis und Nutzung von strukturiertem Web Markup (RDFa, Microdata, schema.org)","literatur":"* “Artificial Intelligence: A Modern Approach” by Stuart Russell and Peter Norvig (2nd edition, Prentice- Hall, 2003)\n* “A Semantic Web Primer” by Grigoris Antoniou and Frank van Harmelen (MIT Press, 2004)\n* “Foundations of Semantic Web Technologies”, P. Hitzler, M. Krötzsch, S. Rudolph:, CRC Press, 2009.\n* “Linked Data – Evolving the Web into a Global Data Space”, T. Heath, Ch. Bizer, Morgan \u0026 Claypool, 2011.\n* Doing Data Science – Straight Talk from the Frontline, Cathy O’Neil, Rachel Schutt, O’Reilly Media","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik\n* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen bzw. dem Seminar\n* erfolgreiches Bearbeiten der Übungsaufgaben\n* abschließende Prüfung (i.d.R. schriftlich)","haeufigkeit":"Unregelmäßig","sprache":"Englisch"},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Stefan Dietze","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":108774800}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":108774800}}}', 77);
INSERT INTO public.antrag VALUES (78, 'Initiale Erstellung', '2020-04-06 00:26:37.138053', '2020-04-06 00:26:37.158083', '{"titelDeutsch":"Data Warehouses","titelEnglisch":"Data Warehouses","veranstaltungen":[{"titel":"Data Warehouses","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Theoretische und Praktische Übungen","semesterWochenStunden":2},{"form":"Vorlesung „Data Warehouses“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Anwendungsbereiche\n* Data Warehouse–Architektur\n* Multidimensionales Datenmodell, Entwurf von Data Warehouses (MOLAP vs. ROLAP; Star- oder Snowflake-Schema)\n* Anfragebearbeitung und -optimierung\n* Materialisierung von Aggregationssichten\n* multidimensionale Index- und Speicherstrukturen\n* Extraktion, Transformation, Laden; Data Cleaning\n* OLAP und Data Mining","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die Architektur eines Data Warehouse-Systems und ihre Komponenten zu erläutern\n* relationale Data Warehouses zu entwerfen\n* für ein zu entwickelndes Data Warehouse zu entscheiden, welche Indexstrukturen genutzt werden können\n* zu entscheiden, welche Sichten materialisiert werden sollten","literatur":"* W. Lehner: Datenbanktechnologie für Data-Warehouse-Systeme. dpunkt-verlag, 2003.\n* H. Bauer, A. Günzel (Hrsg.): Data Warehouse Systeme. 4. Aufl.; dpunkt-verlag, 2013","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen\n* erfolgreiches Bearbeiten der Übungsaufgaben\n* abschließende Prüfung (i.d.R. mündlich)","haeufigkeit":"Siehe unten","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"„Datenbanksysteme“"},{"titel":"Häufigkeit","inhalt":"Wird unregelmäßig im Wechsel mit den Modulen/Veranstaltungen „Knowledge Discovery in Databases“, „Multimedia-Datenbanksysteme“, „Knowledge Discovery in Databases – Ausgewählte Kapitel“, „Transaktionsverwaltung“ und „Information Retrieval und Natural Language Processing” angeboten, so dass jedes Semester mindestens eine dieser Veranstaltungen angeboten wird."}]}],"modulbeauftragte":"Prof. Dr. Stefan Conrad","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":137076700}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":137076700}}}', 78);
INSERT INTO public.antrag VALUES (79, 'Initiale Erstellung', '2020-04-06 00:26:37.163696', '2020-04-06 00:26:37.185166', '{"titelDeutsch":"Deep Learning (vormals Machine Learning – Deep Learning)","titelEnglisch":"Deep Learning (formerly Machine Learning – Deep Learning)","veranstaltungen":[{"titel":"Deep Learning (vormals Machine Learning – Deep Learning)","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Deep Learning“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Dieses Modul behandelt das Deep Learning, welches einen Teilbereich des Machine Learnings darstellt. Dabei haben neben der Theorie auch die Praxis einen besonderen Stellenwert. U.a. werden voraussichtlich folgende Themen behandelt:\n\n* Machine learning \u0026 neural networks\n* Challenges of deep neural networks\n* Deep belief networks\n* Convolutional networks\n* Auto-Encoders\n* Training \u0026 Optimization techniques (dropout technique, batch normalization, distributed training, Hyper-parameter search)\n* Anwendungen von Deep Learning in\n    * Computer Vision,\n    * Speech Recognition,\n    * Language Modeling","lernergebnisse":"Ziel dieser Lehrveranstaltung ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Herausforderungen und aktuellen Entwicklungen im Bereich maschinelles Lernen zu vermitteln. Am Ende der Veranstaltung sollten Studierende komplexe Lernprobleme und die zu ihrer Lösung entwickelten Deep Learning Algorithmen nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können.","literatur":"TBD","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik\n* Pflichtbereich im Master-Studiengang Artificial Intelligence and Data Science","voraussetzungenBestehen":"* Aktive Teilnahme an den Übungen\n* Erfolgreiches Bearbeiten der Übungsaufgaben\n* Abschließende Prüfung (i.d.R. mündlich)","haeufigkeit":"Unregelmäßig","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”\n\nHilfreich ist erfolgreicher Abschluss der Mathematik Module:\n\"Lineare Algebra\", \"Analysis\", \"Stochastik\", \"Numerik\" und „Knowledge Discovery in Databases“","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"„Machine Learning“ „Computer Vision“"}]}],"modulbeauftragte":"Prof. Dr. Stefan Harmeling","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":163695900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":163695900}}}', 79);
INSERT INTO public.antrag VALUES (80, 'Initiale Erstellung', '2020-04-06 00:26:37.191998', '2020-04-06 00:26:37.21105', '{"titelDeutsch":"Dynamische Programmiersprachen","titelEnglisch":"Dynamic Programming Languages","veranstaltungen":[{"titel":"Dynamische Programmiersprachen","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Dynamische Programmiersprachen“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Diese Vorlesung vermittelt typische Konzepte und Eigenschaften dynamischer Programmiersprachen, z.B. Typisierung und Duck-Typing, Metaprogrammierung u.a. Darüber hinaus wird behandelt wie ein Interpreter für eine dynamische Programmiersprache implementiert wird, um die zuvor behandelten Konzepte zu unterstützen.\nIn den praktischen Übungen sollen die Studierenden diverse Probleme mit Hilfe der Eigenschaften einer dynamischen Programmiersprache lösen, um ein tieferes Verständnis dieser Konzepte zu erlangen. In der zweiten Semesterhälfte besteht die Aufgabenstellung in der Übung darin, selbständig einen Interpreter für eine vorgegebene dynamische Programmiersprache zu schreiben.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die Prinzipien der dynamischen Programmierung bezeichnen können und klassischen, imperativen Programmiersprachen gegenüberstellen können\n* bewerten für welche Einsatzbereiche die dynamische Programmierung vorteilhaft ist\n* eigenständig funktionale Programme erstellen und testen können\n* selbständig einen Interpreter für eine vorgegebene dynamische Programmiersprache zu schreiben","literatur":"","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreiche Bearbeitung der Pflichtübungen\n* Erfolgreiche Entwicklung eines eigenen Interpreters\n* Bestehen der Klausur","haeufigkeit":"Jährlich, in der Regel jedes Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"Grundlagen des Compilerbaus (zum Beispiel aus dem Modul \"Compilerbau\", ehemals \"Softwaretechnik und Programmiersprachen\")."}]}],"modulbeauftragte":"Prof. Dr. Michael Leuschel","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":191021700}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":191021700}}}', 80);
INSERT INTO public.antrag VALUES (81, 'Initiale Erstellung', '2020-04-06 00:26:37.221341', '2020-04-06 00:26:37.243771', '{"titelDeutsch":"Effiziente Algorithmen","titelEnglisch":"Efficient Algorithms","veranstaltungen":[{"titel":"Effiziente Algorithmen","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Effiziente Algorithmen“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"In diesem Modul werden Algorithmen für effizient lösbare Probleme betrachtet. Anhand fundamentaler Verfahren werden die Prinzipien des Entwurfs und der Analyse von Algorithmen erklärt. Hierzu werden folgende Themen betrachtet.\n\n* Algorithmenentwurfstechniken\n* Algebraische und Zahlentheoretische Probleme\n* Sortiernetze\n* Sortieren auf Prozessorfeldern\n* Lineare Programmierung","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die besprochenen Probleme zu erläutern und formal zu definieren\n* die behandelten Algorithmen zu verstehen und auf konkrete Eingaben anzuwenden\n* die erlernten Methoden für den Entwurf und die Analyse von effizienten Algorithmen anzuwenden\n* für vorgegebene Probleme eigenständig Vergleichernetze zu konstruieren\n* zu Optimierungsproblemen eine Formulierung als Lineares Programm zu konzipieren","literatur":"* N. Blum: Algorithmen und Datenstrukturen, Oldenbourg Verlag, 2004.\n* T.H. Cormen, C.E. Leiserson, R.L. Rivest et al.: Algorithmen - Eine Einführung, Oldenbourg Verlag, 2007.\n* V. Heun: Grundlegende Algorithmen, Teubner Verlag, 2003.\n* H.-W. Lang: Algorithmen, Oldenbourg Verlag, 2006.\n* U. Schöning: Algorithmik, Spektrum Akademischer Verlag, 2001.","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"Aktive Mitarbeit in den Übungen, Abgabe der Übungsaufgaben, Bestehen der Klausur zum Ende des Semesters","haeufigkeit":"Dieses Modul wird in unregelmäßigen Abständen angeboten.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":221318700}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":221340500}}}', 81);
INSERT INTO public.antrag VALUES (82, 'Initiale Erstellung', '2020-04-06 00:26:37.253528', '2020-04-06 00:26:37.271101', '{"titelDeutsch":"Introduction to Linear Optimization (vormals Grundlagen der Linearen Optimierung)","titelEnglisch":"Introduction to Linear Optimization","veranstaltungen":[{"titel":"Introduction to Linear Optimization (vormals Grundlagen der Linearen Optimierung)","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Vorlesung „Grundlagen der Linearen Optimierung“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Grundlagen der Linearen Programmierung\n* Geometrische Interpretation und Dualität\n* Simplex-Methode\n* Ganzzahlige Lineare Programmierung\n* Schnittebenenverfahren\n* Branch-and-Bound\n* Lagrange-Relaxierung\n* Netzwerkflüsse: Theorie und Algorithmen\n* Ausgewählte Anwendungen in der Bioinformatik. Z.b.: RNA-Strukturvorhersage, Strukturelles Proteinalignment, Peptide Sequencing, Seitenkettenplazierung, Vergleich phylogenetischer Bäume, Fragment Assembly, Haplotype Assembly, Netzwerkanalyse, Netzwerkmodule, Netzwerkalignment\n* Großes Programmierprojekt: für eine ausgewählte Fragestellung wird eine Lösung aufgrund der gelernten Konzepte entwickelt und implementiert.","lernergebnisse":"Nach der Veranstaltung werden die Studierenden in der Lage sein\n\n* die Grundlagen der Linearen und Ganzzahligen Optimierung zu beherrschen;\n* praktische Probleme mit Hilfe der Linearen (ganzz.) Modellierung zu beschreiben;\n* Algorithmen zu entwerfen, die diese Modelle lösen","literatur":"* Dimitris Bertsimas and John N. Tsitsiklis: Introduction to Linear Optimization. 1997.\n* Laurence Wolsey: Integer Programming. 1998.","verwendbarkeit":"* Wahlpflichtbereich Praktisch/Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik\n* Teil eines Master-Moduls im Master-Studiengang Biologie\n* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen\n* erfolgreiches Bearbeiten der Übungsaufgaben\n* abschließende Prüfung (i.d.R. schriftlich)","haeufigkeit":"Unregelmäßig","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Gunnar W. Klau","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":253528000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":253528000}}}', 82);
INSERT INTO public.antrag VALUES (83, 'Initiale Erstellung', '2020-04-06 00:26:37.28086', '2020-04-06 00:26:37.303307', '{"titelDeutsch":"Master-Seminar Information Theory, Inference, and Learning Algorithms","titelEnglisch":"Master’s Seminar Information Theory, Inference, and Learning Algorithms","veranstaltungen":[{"titel":"Master-Seminar Information Theory, Inference, and Learning Algorithms","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Information Theory, Inference, and Learning Algorithms“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Im Seminar sollen die Inhalte der Vorlesung \"Machine Learning\" weiter vertieft und erweitert werden, z.B. durch Vorstellung einzelner Kapitel aus dem Buch \"Information Theory, Inference, and Learning Algorithms\" von David MacKay, oder auch anderer Bücher und wissenschaftlichen Veröffentlichungen zum Thema. Jede Woche werden ein oder zwei Themen durch die Teilnehmenden in Form eines Vortrages vorgestellt und diskutiert. Dabei geht es zum einen um die Inhalte, zum anderen darum, wie man einen guten wissenschaftlichen Vortrag hält. Zusätzlich erstellen die Teilnehmenden eine kurze schriftliche Ausarbeitung Ihres Vortrages.","lernergebnisse":"Studierende haben nach erfolgreichem Abschluss dieses Moduls ein vertieftes Verständnis verschiedenster Methoden und Techniken aus den Bereichen Information Theory, Inference, and Learning Algorithmen. Sie verbessern Ihre Fähigkeit einen Vortrag über ein Thema aus diesem Bereich zu halten und bekommen ein besseres Verständnis für die im Seminar behandelten Themen.","literatur":"* u.a. David J.C.MacKay, \"Information Theory, Inference, and Learning Algorithms\", Cambridge, PDF freely available on the author\u0027s website","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Schriftliche Ausarbeitung zum gewählten Thema\n* Begutachtung von anderen Ausarbeitungen\n* Präsentation des eigenen Themas\n* Aktive Teilnahme an Diskussionen","haeufigkeit":"unregelmäßog","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Machine Learning“, „Lineare Algebra“, „Analysis“, Stochastik“, „Numerik“"}]}],"modulbeauftragte":"Prof. Dr. Stefan Harmeling","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":280860200}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":280860200}}}', 83);
INSERT INTO public.antrag VALUES (84, 'Initiale Erstellung', '2020-04-06 00:26:37.311114', '2020-04-06 00:26:37.336488', '{"titelDeutsch":"Master-Seminar über Algorithmen für graphentheoretische Konzepte in der Informatik","titelEnglisch":"Master’s Seminar on Algorithms for Graph Theoretical Concepts in Computer Science","veranstaltungen":[{"titel":"Master-Seminar über Algorithmen für graphentheoretische Konzepte in der Informatik","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Algorithmen für graphentheoretische Konzepte in der Informatik“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"In diesem Seminar werden speziell ausgewählte Themen aus dem Bereich „Algorithmen für graphentheoretische Konzepte in der Informatik“ behandelt. Die Auswahl variiert von Veranstaltung zu Veranstaltung und orientiert sich an den aktuellen Forschungsthemen der Arbeitsgruppe.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* selbst Einblicke in einige der wichtigsten Themen, Resultate und Methoden aus dem Gebiet der Algorithmen für Graphen zu erarbeiten,\n* einen guten Vortrag vorzubereiten und zu halten,\n* die Vorträge der anderen Studierenden kritisch zu diskutieren und\n* eine gute schriftliche Ausarbeitung zu dem Vortragsthema anzufertigen.","literatur":"* Ausgewählte Themen aus dem Bereich „Algorithmen für graphentheoretische Konzepte in der Informatik“.","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Aktive Mitarbeit in den Seminaren und Übungen\n* schriftliche Ausarbeitung zu einem Thema des Seminars\n* Vortrag des Themas","haeufigkeit":"Dieses Modul wird in unregelmäßigen Abständen angeboten.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”\n* „Graphenalgorithmen I“","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Graphenalgorithmen II“"}]}],"modulbeauftragte":"Prof. Dr. Egon Wanke","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":311113700}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":311113700}}}', 84);
INSERT INTO public.antrag VALUES (85, 'Initiale Erstellung', '2020-04-06 00:26:37.34332', '2020-04-06 00:26:37.363815', '{"titelDeutsch":"Master-Seminar über Algorithmen für perfekte Graphen","titelEnglisch":"Master’s Seminar on Algorithms for Perfect Graphs","veranstaltungen":[{"titel":"Master-Seminar über Algorithmen für perfekte Graphen","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Algorithmen für perfekte Graphen“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Perfekte Graphen sind eine der am besten untersuchten Graphenklassen. Zahlreiche Probleme lassen sich auf perfekten Graphen einfacher oder schneller lösen als auf allgemeinen Graphen. In diesem Seminar sollen verschiedene Typen perfekter Graphen, z.B. Bäume, bipartite Graphen, Intervallgraphen, Vergleichbarkeitsgraphen, Thresholdgraphen und Chordale Graphen vorgestellt und einige klassische Probleme auf diesen betrachtet werden.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* selbst Einblicke in einige der wichtigsten Themen, Resultate und Methoden aus dem Gebiet der perfekten Graphen zu erarbeiten,\n* einen guten Vortrag vorzubereiten und zu halten,\n* die Vorträge der anderen Studierenden hören und kritisch zu diskutieren und\n* eine gute schriftliche Ausarbeitung zu dem Vortragsthema anzufertigen.","literatur":"* M. Golumbic, Algorithmic Graph Theory and Perfect Graphs, Elsevier, 2004.\n* F. Gurski, I. Rothe, J. Rothe, E. Wanke, Exakte Algorithmen für schwere Graphenprobleme, Springer Verlag, 2010.\n* J.L. Ramirez-Alfonsin, Bruce A. Reed (Editors), Perfect Graphs, Wiley, 2010.","verwendbarkeit":"* WahlpflichtbereichTheoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Aktive Mitarbeit in den Seminaren und Übungen\n* schriftliche Ausarbeitung zu einem Thema des Seminars\n* Vortrag des Themas\n* Bestehen der Klausur zum Ende des Semesters","haeufigkeit":"Dieses Modul wird in unregelmäßigen Abständen angeboten.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Algorithmen für planare Graphen“ oder\n* „Algorithmen für schwere Probleme“"}]}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":343319500}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":343319500}}}', 85);
INSERT INTO public.antrag VALUES (86, 'Initiale Erstellung', '2020-04-06 00:26:37.372599', '2020-04-06 00:26:37.393092', '{"titelDeutsch":"Master-Seminar über Anwendungen von gerichteten Netzwerkstrukturen","titelEnglisch":"Master’s Seminar on Applications for Structures of Directed Networks","veranstaltungen":[{"titel":"Master-Seminar über Anwendungen von gerichteten Netzwerkstrukturen","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Anwendungen von gerichteten Netzwerkstrukturen“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Gerichtete Netzwerkstrukturen kommen in vielen verschiedenen Gebieten vor, wie zum Beispiel in der Genetik, in sozialen Netzwerken, bei Finanztransaktionen oder bei der Planung einer Infrastruktur. Oft müssen in diesen Teilgebieten Probleme auf oder mit Hilfe von gerichteten Netzwerken gelöst werden. In diesem Seminar soll eine weite Übersicht über mögliche Anwendungsgebiete von gerichteten Netzwerken gegeben werden. Dies soll durch die Vorstellung möglichst aktueller Beispiele aus der Forschung in verschiedenen Gebieten geschehen. Dabei soll besonders Wert auf die verschiedenen Strukturen der gerichtete Graphen bzw. Netzwerke gelegt werden, wobei darauf geachtet werden soll, welche Strukturen oder Klassen von gerichteten Graphen in den Algorithmen zur Lösung des Problems ausgenutzt wurden. Die Studierenden sollen weiter überlegen, welche Probleme in den jeweiligen Teilgebieten noch offen sind und Ideen für Lösungsansätze suchen.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,\n\n* selbst Einblicke in einige aktuelle Forschungsergebnisse und Resultate aus dem Gebiet der Anwendung von gerichteten Netzwerken zu erarbeiten,\n* Theorie im Kontext zu erklären,* einen guten Vortrag vorzubereiten und zu halten,\n* Vorträge anderer Studierender kritisch zu diskutieren,\n* eine gute schriftliche Ausarbeitung zu dem Vortragsthema anzufertigen,\n* eine gute Ausarbeitung und Präsentation mit Latex zu erstellen.","literatur":"Aktuelle Forschungsarbeiten","verwendbarkeit":"* WahlpflichtbereichTheoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Aktive Mitarbeit in den Seminaren und Übungen\n* schriftliche Ausarbeitung zu einem Thema des Seminars\n* Vortrag des Themas\n* Bestehen der Klausur zum Ende des Semesters","haeufigkeit":"Dieses Modul wird in unregelmäßigen Abständen angeboten.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Algorithmen für schwere Probleme“ oder\n* „Approximationsalgorithmen“oder\n* „Master-Seminar über Algorithmen für perfekte Graphen“"}]}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":371621800}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":371621800}}}', 86);
INSERT INTO public.antrag VALUES (87, 'Initiale Erstellung', '2020-04-06 00:26:37.399923', '2020-04-06 00:26:37.420927', '{"titelDeutsch":"Master-Seminar über Graphparameter für gerichtete Graphen","titelEnglisch":"Master’s Seminar on Graph Parameters for Directed Graphs","veranstaltungen":[{"titel":"Master-Seminar über Graphparameter für gerichtete Graphen","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Graphparameter für gerichtete Graphen“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"In diesem Seminar beschäftigen wir uns mit der Analyse von Graphparametern für gerichtete Graphen. Hierzu betrachten wir gerichtete Formen der Cliquenweite, NLC-Weite und Rangweite sowie verschiedene Ansätze für eine gerichtete Form der Baumweite. Es sollen Beziehungen zwischen diesen Parametern und die Weite spezieller Graphklassen bzgl. dieser Parameter vorgestellt werden.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* selbst Einblicke in einige der wichtigsten Themen, Resultate und Methoden aus dem Gebiet der Graphparameter für gerichtete Graphen zu erarbeiten,\n* einen guten Vortrag vorzubereiten und zu halten,\n* die Vorträge der anderen Studierenden hören und kritisch zu diskutieren und\n* eine gute schriftliche Ausarbeitung/Vortragsfolien zu dem Vortragsthema anzufertigen.","literatur":"* J. Bang-Jensen, G. Gutin, Digraphs: Theory, Algorithms and Applications, Springer, 2009.\n* A. Brandstädt, V.B. Le, J.P. Spinrad, Graph Classes: A Survey, SIAM Monographs on Discrete Mathematics and Applications. SIAM, 1999.\n* M.C. Golumbic. Algorithmic Graph Theory and Perfect Graphs. Academic Press, 1980.\n* N.V.R. Mahadev and U.N. Peled. Threshold Graphs and Related Topics. Annals of Discrete Math. 56. Elsevier, North-Holland, 1995.\n* aktuelle Forschungsarbeiten","verwendbarkeit":"* WahlpflichtbereichTheoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Aktive Mitarbeit in den Seminaren und Übungen\n* schriftliche Ausarbeitung/Vortragsfolien zu einem Thema des Seminars\n* Vortrag des Themas\n* Bestehen der Prüfungzum Ende des Semesters","haeufigkeit":"Dieses Modul wird in unregelmäßigen Abständen angeboten.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik\"","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Algorithmen für schwere Probleme\""}]}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":399922900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":399922900}}}', 87);
INSERT INTO public.antrag VALUES (88, 'Initiale Erstellung', '2020-04-06 00:26:37.429712', '2020-04-06 00:26:37.460983', '{"titelDeutsch":"Master-Seminar über Kollektive Entscheidungsfindung","titelEnglisch":"Master’s Seminar on Collective Decision Making","veranstaltungen":[{"titel":"Master-Seminar über Kollektive Entscheidungsfindung","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Collective Decision Making\"","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Präferenzaggregation durch Wählen: Algorithmik und Komplexität\n* Algorithmische Spieltheorie\n* Gerechte Aufteilungsverfahren: Algorithmik und Komplexität","lernergebnisse":"Ziel in diesem Modul ist es, dass sich die Studierenden selbst Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem Gebiet *Collective Decision Making* erarbeiten, über ein spezielles Thema aus der Originalliteratur einen Vortrag im Seminar halten und die Vorträge der anderen Studierenden hören und kritisch diskutieren. Weiter gehört eine schriftliche Ausarbeitung zu jedem Vortrag und es findet eine gegenseitige Beurteilung der schriftlichen Ausarbeitungen der Studierenden untereinander statt, wobei die Anonymität sowohl des Autors bzw. der Autorin als auch die des Gutachters bzw. der Gutachterin gewahrt bleibt („double-blind peer-reviewing“). Zu den in diesem Seminar erworbenen Kompetenzen gehört also sowohl die Fähigkeit, einen guten Vortrag vorzubereiten und zu halten, als auch die Fähigkeit der kritischen und fairen Begutachtung.\n\n*Dieses Seminar ist kombinierbar mit dem Modul*\n\n* Algorithmische Spieltheorie\n\n*und mit den folgenden Modulen*:\n\n* Algorithmische Eigenschaften von Wahlsystemen II\n* Kooperative Spieltheorie\n* Cake-cutting Algorithms","literatur":"Unter anderem Originalarbeiten, die in den folgenden Büchern zitiert werden:\n\n* Jörg Rothe (ed.): Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.\n\nEine kürzere deutsche Version dieses Buches erschien als:\n\n* Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011","verwendbarkeit":"* WahlpflichtbereichTheoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* schriftliche Ausarbeitung zum zugeteilten Thema\n* Halten eines Vortrags\n* Begutachtung einer anderen schriftlichen Ausarbeitung","haeufigkeit":"Etwa alle ein bis zwei Jahre, jeweils in Kombination mit den o.g. WP/SP-Modulen von Prof. Rothe.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Ergänzende Literatur","inhalt":"Unter anderem Originalarbeiten, die in den folgenden Büchern zitiert werden:\n\n* Piotr Faliszewski, Lane A. Hemaspaandra, Edith Hemaspaandra, and Jörg Rothe: A Richer Understanding of the Complexity of Election Systems, Chapter 14 in: „Fundamental Problems in Computing: Essays in Honor of Professor Daniel J. Rosenkrantz,” pp. 375-406, S. Ravi and S. Shukla (eds.), Springer, 2009.\n* Felix Brandt, Vincent Conitzer, Ulle Endriss, Jerome Lang, and Ariel Procaccia (eds.): Handbook of Computational Social Choice, Cambridge University Press, 2015.\n* Steven J. Brams and Peter C. Fishburn: Voting Procedures, Chapter 4 in: „Handbook of Social Choice and Welfare,” Kenneth J. Arrow, Amartya Sen, and Kotaro Suzumura (eds.), North-Holland, 2002.\n* Bezalel Peleg and Peter Sudhölter: Introduction to the Theory of Cooperative Games, Kluwer Academic Publishers, 2003.\n* Georgios Chalkiadakis, Edith Elkind, and Michael Wooldridge: Computational Aspects of Cooperative Game Theory, Morgan and Claypool Publishers, 2011.\n* Noam Nisan, Tim Roughgarden, Eva Tardos, and Vijay V. Vazirani (eds.): Algorithmic Game Theory, Cambridge University Press, 2008.\n* Jack Robertson and William Webb: Cake-Cutting Algorithms: Be Fair if You Can, A K Peters, 1998.\n* Steven J. Brams and Alan D. Taylor: Fair Division: From Cake-Cutting to Dispute Resolution, Cambridge University Press, 1996."}]}],"modulbeauftragte":"Prof. Dr. Jörg Rothe","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":429711500}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":429711500}}}', 88);
INSERT INTO public.antrag VALUES (89, 'Initiale Erstellung', '2020-04-06 00:26:37.472227', '2020-04-06 00:26:37.527894', '{"titelDeutsch":"Master-Seminar über Modellierung biologischer Zellen","titelEnglisch":"Master’s Seminar on Modelling Biological Cells","veranstaltungen":[{"titel":"Master-Seminar über Modellierung biologischer Zellen","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar, „Modeling biological cells“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Balancierte Wachstumsmodelle für Bakterien\n* Resource-Balance-Analyse\n* ME-Modelle (Metabolismus und Genexpression)\n* Phänomenologische Wachstumsmodelle\n* Kinetische Stoffwechselmodelle","lernergebnisse":"Ziel in diesem Modul ist es, dass sich die Studierenden selbst Einblicke in einige der wichtigsten Themen, Resultate und Methoden aus der Modellierung biologischer Prozesse mit Hilfe von Computern erarbeiten, über ein spezielles Thema aus der Originalliteratur einen Vortrag im Seminar halten und die Vorträge der anderen Studierenden hören und kritisch diskutieren. Weiter gehört eine schriftliche Ausarbeitung zu jedem Vortrag und es findet eine gegenseitige Beurteilung der schriftlichen Ausarbeitungen der Studierenden untereinander statt, wobei die Anonymität sowohl des Autors bzw. der Autorin als auch die des Gutachters bzw. der Gutachterin gewahrt bleibt („double-blind peer-reviewing“). Zu den in diesem Seminar erworbenen Kompetenzen gehören also sowohl die Fähigkeit, einen guten Vortrag vorzubereiten und zu halten, als auch die Fähigkeit der kritischen und fairen Begutachtung.","literatur":"Originalarbeiten","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Schriftliche Ausarbeitung zum zugeteilten Thema\n* Halten eines Vortrags\n* Begutachtung von zwei anderen schriftlichen Ausarbeitungen","haeufigkeit":"Jährlich im Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik\""}],"modulbeauftragte":"Prof. Dr. Martin Lercher","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":472226900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":472226900}}}', 89);
INSERT INTO public.antrag VALUES (90, 'Initiale Erstellung', '2020-04-06 00:26:37.537652', '2020-04-06 00:26:37.557681', '{"titelDeutsch":"Master-Seminar über NP-Schwere Probleme","titelEnglisch":"Master’s Seminar on NP-hard problems","veranstaltungen":[{"titel":"Master-Seminar über NP-Schwere Probleme","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar„NP-Schwere Probleme“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Die Härte mancher Probleme gibt Anlass dazu, kreative Methoden zu finden um sich der Lösung eines Problems zu nähern. Man kann beispielsweise Teilprobleme lösen oder das Problem auf eingeschränkte Klassen untersuchen, um Approximationsalgorithmen bzw. parametrisierte Algorithmen zu finden oder das Problem unter einer bestimmten Einschränkung effizient zu lösen. In diesem Modul werden verschiedene dieser Methoden untersucht. Ziel dieses Moduls ist es, den Studierenden Einblicke in einige wichtige oder aktuelle Forschungsthemen, Resultate und Methoden aus dem Gebiet der NP-schweren Probleme zu geben. Am Ende der Veranstaltung sollen die Studierenden einen Überblick über die vorgestellten Probleme und Resultate sowie ein ausgeprägtes Verständnis über einige ausgewählte Themen haben. Insbesondere sollen Studierende in der Lage sein, ihr Thema anderen Studierenden leicht zugänglich zu machen, sich eigene Beispiele und Aufgaben auszudenken und deren Lösung verständlich zu erklären.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,\n\n* selbst Einblicke in einige aktuelle Forschungsergebnisse zu verarbeiten und Resultate aus Forschungsergebnissen zu verstehen und präsentieren\n* die besprochenen schweren Probleme zu erläutern und formal zu definieren\n* die behandelten Algorithmen und Methoden zu verstehen und auf konkrete Eingaben anzuwenden\n* Laufzeitanalysen der Algorithmen durchzuführen\n* Selbst Aufgaben zu stellen und anderen Studierenden hinreichend gute Materialien zu erstellen, um diese Aufgaben zu lösen","literatur":"Aktuelle Forschungsarbeiten","verwendbarkeit":"* WahlpflichtbereichTheoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Aktive Mitarbeit in den Seminaren\n* schriftliche Ausarbeitung und Aufgaben erstellen zu einem Thema des Seminars\n* Vortrag des Themas\n* Bestehen der Prüfung zum Ende des Semesters","haeufigkeit":"Unregelmäßig","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* \"Algorithmen für schwere Probleme\" oder\n* \"Approximationsalgorithmen\" oder\n* \"Seminar für Perfekte Graphen\" oder\n* \"Master-Seminar über Anwendungen von gerichteten Netzwerkstrukturen\""}]}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":537652100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":537652100}}}', 90);
INSERT INTO public.antrag VALUES (91, 'Initiale Erstellung', '2020-04-06 00:26:37.573351', '2020-04-06 00:26:37.601202', '{"titelDeutsch":"Judgment Aggregation","titelEnglisch":"Judgment Aggregation","veranstaltungen":[{"titel":"Judgment Aggregation","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Vorlesung „Judgment Aggregation“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Dieses Modul vermittelt grundlegende Kenntnisse im Bereich der Aggregation von individuellen Urteilen über möglicherweise logisch miteinander verknüpfte Aussagen. Es werden die folgenden Themen behandelt:\n\n* Grundlagen, Einführung in die Social Choice Theorie\n* Judgment Aggregation Prozeduren\n  * Grundbegriffe\n  * Eigenschaften von Urteilsmengen\n  * Mehrheitsregel, Voraussetzungs/Folgerungsbasierte Mehrheitsregel, Voraussetzungsbasierte Quotenregeln, Quotenregel, Sequential Majority Priority Regel, Distanzbasierte Prozeduren\n* Eigenschaften von Judgment Aggregation Prozeduren\n* Unmöglichkeitstheorem von List und Pettit\n* Charakterisierung von Quotenregeln\n* Agendacharakterisierungen und Agendasicherheit, Möglichkeitsresultate\n* Berechnungskomplexität in der gemeinsamen Urteilsfindung\n  * Grundlagen Komplexitätstheorie\n  * Bestimmung der gemeinsamen Urteilsmenge\n  * Manipulation\n  * Bestechung\n  * Kontrolle\n  * Safety of the Agenda","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,\n\n* die Aggregation von individuellen Urteilen an praktischen Beispiel durchzuführen\n* spezifische Probleme im Bereiche der gemeinsamen Urteilsfindung zu identifizieren\n* neue Prozeduren zur gemeinsamen Urteilsfindung zu entwickeln und im Hinblick auf Ihre Eigenschaften zu untersuchen\n* Empfehlung für bestimmte Einsatzbereiche der gemeinsamen Urteilsfindung geben","literatur":"* Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division. J. Rothe (ed.). Unter Vertrag bei Springer. Voraussichtliche Publikation: 2015.\n\nEine kürzere deutsche Version dieses Buches erschien unter dem Titel:\n\n* Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen. Jörg Rothe, Dorothea Baumeister, Claudia Lindner, Irene Rothe. Spektrum Akademischer Verlag, 2011.","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive und erfolgreiche Mitwirkung in den theoretischen und praktischen Übungen\n* Prüfung am Ende der Veranstaltung (i.d.R. Klausur, 90 Minuten)","haeufigkeit":"Dieses Modul findet in unregelmäßigen Abständen statt.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Ergänzende Literatur","inhalt":"* C. List. The Theory of Judgment Aggregation: An Introductory Review. Synthese, 187(1):179-207, 2012.\n* C. List and C. Puppe. Judgment Aggregation: A Survey. In P. Anand, P. Pattanaik and C. Puppe (eds.), Handbook of Rational and Social Choice, Oxford University Press, 2009.\n* D. Grossi and G. Pigozzi. Introduction to Judgment Aggregation. In N. Bezhanishviliand V. Goranko (eds.), Lectures on Logic and Computation, Springer-Verlag, 2012"}]}],"modulbeauftragte":"Jun.-Prof. Dr. Dorothea Baumeister","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":573351400}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":573351400}}}', 91);
INSERT INTO public.antrag VALUES (92, 'Initiale Erstellung', '2020-04-06 00:26:37.609516', '2020-04-06 00:26:37.635866', '{"titelDeutsch":"Knowledge Discovery in Databases","titelEnglisch":"Knowledge Discovery in Databases","veranstaltungen":[{"titel":"Knowledge Discovery in Databases","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Vorlesung „Knowledge Discovery in Databases“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Grundlagen der Statistik\n* Clustering (partitionierten, dichtebasiert, hierarchisch, ...)\n* Klassifikation (Entscheidungsbaum, Support-Vektor-Maschine, ...)\n* Assoziationsregeln (Frequent-Itemsets, ...)\n* Weitere Mining-Verfahren und -Anwendungen","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die verschiedenen Methoden des Knowledge Discovery zu erläutern\n* die Methoden vergleichend zu bewerten\n* zu entscheiden, welche Methode in welcher Situation sinnvoll eingesetzt werden kann","literatur":"* Ester M., Sander J.: Knowledge Discovery in Databases: Techniken und Anwendungen, Springer Verlag, 2000.\n* Dunham, M.H.: Data Mining – Introductory and Advanced Topics, Prentice Hall, 2003.\n* Tan, P.-N., Steinbach, M., Kumar, V.: Introduction to Data Mining, Addison Wesley, 2006.\n* Han J., Kamber M.: Data Mining: Concepts and Techniques, Morgan Kaufmann Publishers, August 2000.\n* Berthold M., Hand D. J. (eds.): Intelligent Data Analysis: An Introduction. Springer Verlag, Heidelberg, 1999","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen bzw. dem Seminar\n* erfolgreiches Bearbeiten der Übungsaufgaben\n* abschließende Prüfung (i.d.R. mündlich)","haeufigkeit":"Wird unregelmäßig im Wechsel mit den Modulen/Veranstaltungen „Data Warehouses“, „Multimedia-Datenbanksysteme“, „Knowledge Discovery in Databases – Ausgewählte Kapitel“, „Transaktionsverwaltung“ und „Information Retrieval und Natural Language Processing” angeboten, so dass jedes Semester mindestens eine dieser Veranstaltungen angeboten wird.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Stefan Conrad","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":609516400}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":609516400}}}', 92);
INSERT INTO public.antrag VALUES (93, 'Initiale Erstellung', '2020-04-06 00:26:37.643726', '2020-04-06 00:26:37.673003', '{"titelDeutsch":"Knowledge Discovery in Databases - Ausgewählte Themen","titelEnglisch":"Knowledge Discovery in Databases - Selected Topics","veranstaltungen":[{"titel":"Knowledge Discovery in Databases - Ausgewählte Themen","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Vorlesung „Knowledge Discovery in Databases – Ausgewählte Themen“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Es werden zu dem Modul „Knowledge Discovery in Databases“ weiterführende Verfahren behandelt, wobei aktuelle Entwicklungen berücksichtigt werden sollen. Mögliche Themenschwerpunkte sind z.B.\n\n* Temporal Association Rule Mining\n* Zeitreihenanalyse und -vorhersage\n* Erweiterungen des Clustering z.B. für fehlende Werte\n* Outlier Detection","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* spezielle Verfahren in den behandelten Themengebieten zu bewerten und kritisch zu vergleichen\n* anhand der Charakteristik des zu lösenden Problems geeignete Verfahren auszuwählen und, wenn\nerforderlich, zu kombinieren","literatur":"* Ester M., Sander J.: Knowledge Discovery in Databases: Techniken und Anwendungen, Springer Verlag, 2000.\n* Dunham, M.H.: Data Mining – Introductory and Advanced Topics, Prentice Hall, 2003.\n* Tan, P.-N., Steinbach, M., Kumar, V.: Introduction to Data Mining, Addison Wesley, 2006.\n* Han J., Kamber M.: Data Mining: Concepts and Techniques, Morgan Kaufmann Publishers, August 2000.\n* Berthold M., Hand D. J. (eds.): Intelligent Data Analysis: An Introduction. Springer Verlag, Heidelberg, 1999.\n\nsowie weiterführende Literatur in Abhängigkeit von den behandelten Themen (wird in der Veranstaltung bekanntgegeben)","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen bzw. dem Seminar\n* erfolgreiches Bearbeiten der Übungsaufgaben bzw. Anfertigen einer angemessenen Seminarausarbeitung und Halten eines Vortrags\n* abschließende Prüfung (i.d.R. mündlich)","haeufigkeit":"Siehe unten","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Häufigkeit","inhalt":"Wird unregelmäßig im Wechsel mit den Modulen/Veranstaltungen „Data Warehouses“, „Multimedia-Datenbanksysteme“, „Knowledge Discovery in Databases“, „Transaktionsverwaltung“ und „Information Retrieval und Natural Language Processing” angeboten, so dass jedes Semester mindestens eine dieser Veranstaltungen angeboten wird."}]}],"modulbeauftragte":"Prof. Dr. Stefan Conrad","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":643725700}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":643725700}}}', 93);
INSERT INTO public.antrag VALUES (94, 'Initiale Erstellung', '2020-04-06 00:26:37.681787', '2020-04-06 00:26:37.701308', '{"titelDeutsch":"Kooperative Spieltheorie","titelEnglisch":"Cooperative Game Theory","veranstaltungen":[{"titel":"Kooperative Spieltheorie","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Vorlesung „Kooperative Spieltheorie\"","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Kooperative Spiele: Miteinander spielen\n  * Grundlagen\n    * Kooperative Spiele mit übertragbarem Gewinn\n    * Superadditive Spiele\n    * Stabilitätskonzepte für kooperative Spiele\n  * Einfache Spiele\n    * Der Kern einfacher Spiele\n    * Darstellungen einfacher Spiele\n    * Gewichtete Wahlspiele\n    * Dimensionalität\n    * Machtindizes\n    * Der Shapley-Shubik-Index und der Shapley-Wert\n    * Die Banzhaf-Indizes\n  * Komplexität von Problemen für kompakt darstellbare Spiele\n    * Spiele auf Graphen\n    * Gewichtete Wahlspiele\n    * Hedonische Spiele","lernergebnisse":"Ziel in diesem Modul ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem Gebiet der kooperativen Spieltheorie zu vermitteln, welches derzeit in der Abteilung „Komplexitätstheorie und Kryptologie“ (Prof. Jörg Rothe und Jun.-Prof. Dorothea Baumeister) intensiv in der Forschung bearbeitet wird und in dem bevorzugt Themen für Bachelor- und Master-Arbeiten ausgegeben werden. Am Ende der Veranstaltung sollten Studierende wichtige Probleme und die zu ihrer Lösung entwickelten Algorithmen und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können. Insbesondere sollten sie in der Lage sein, „strategische Szenarien“ durch kooperative Spiele zu beschreiben und Stabilitätskonzepte in diesen Spielen formal zu charakterisieren. Ebenso sollten sie die Komplexität der für solche Spiele relevanten Entscheidungsprobleme (in einer geeigneten kompakten Darstellung) formal bestimmen und beschreiben können.","literatur":"* Jörg Rothe (ed.):Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.\n\nEine kürzere deutsche Version dieses Buches erschien als:\n\n* Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011.","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* erfolgreiche Bearbeitung der Übungsaufgaben\n* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung","haeufigkeit":"Etwa alle vier Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Ergänzende Literatur","inhalt":"* Bezalel Peleg and Peter Sudhölter: Introduction to the Theory of Cooperative Games, Kluwer Academic Publishers, 2003.\n* Georgios Chalkiadakis, Edith Elkind, and Michael Wooldridge: Computational Aspects of Cooperative Game Theory, Morgan and Claypool Publishers, 2011.\n* Noam Nisan, Tim Roughgarden, Eva Tardos, and Vijay V. Vazirani (eds.): Algorithmic Game Theory, Cambridge University Press, 2008."}]}],"modulbeauftragte":"Prof. Dr. Jörg Rothe","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":680815100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":680815100}}}', 94);
INSERT INTO public.antrag VALUES (95, 'Initiale Erstellung', '2020-04-06 00:26:37.709112', '2020-04-06 00:26:37.727417', '{"titelDeutsch":"Kryptokomplexität II","titelEnglisch":"Cryptocomplexity II","veranstaltungen":[{"titel":"Kryptokomplexität II","leistungspunkte":"10LP ab PO 2015, alte PO 15LP","veranstaltungsformen":[{"form":"Vorlesung „Kryptokomplexität I\"","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Vertiefung der Kryptologie\n  * Wiederholung: Aufgaben und Ziele der Kryptologie, einige mathematische Grundlagen und RSA\n  * Diffie-Hellman und das Problem des diskreten Logarithmus\n    * Das Schlüsseltauschprotokoll von Diffie und Hellman\n    * Diskrete Logarithmen und das Diffie-Hellman-Problem\n  * Die Protokolle von ElGamal\n    * Das Public-Key-Kryptosystem und Digitale Signaturen von ElGamal\n    * Sicherheit der Protokolle von ElGamal\n  * Rabins Public-Key Kryptosystem\n    * Rabins Kryptosystem\n    * Sicherheit von Rabins System\n  * Arthur-Merlin-Spiele und Zero-Knowledge\n  * Weitere Protokolle\n* Vertiefung der Komplexitätstheorie\n  * Wiederholung: Aufgaben und Ziele der Komplexitätstheorie\n  * Randomisierte Algorithmen und Komplexitätsklassen\n    * PP, RP und ZPP: Monte-Carlo-und Las-Vegas-Algorithmen\n    * Quantoren und BPP\n    * Graphisomorphie und die Arthur-Merlin-Hierarchie\n  * Die Boolesche Hierarchie\n    * Probleme in DP\n    * Struktur und Eigenschaften der Booleschen Hierarchie über NP\n    * Exakte Graphfärbbarkeit\n  * Die Polynomialzeit-Hierarchie\n    * Orakel-Turingmaschinen\n    * Struktur und Eigenschaften der Polynomialzeit-Hierarchie\n    * Vollständige Probleme in den Stufen der Polynomialzeit-Hierarchie\n    * Die Boolesche Hierarchie kollabiert die Polynomialzeit-Hierarchie","lernergebnisse":"Ziel des Moduls Kryptokomplexität II ist die vertiefte Vermittlung von Kenntnissen über die wichtigsten asymmetrischen Kryptosysteme (also effiziente Algorithmen zur Verschlüsselung und legitimierten Entschlüsselung); andererseits wird die Sicherheit solcher Systeme behandelt, die häufig auf der Komplexität geeigneter Probleme beruht. Deshalb werden auch anspruchsvolle Themen der Komplexitätstheorie behandelt, insbesondere mit dem Ziel, Methoden zum Nachweis der genauen Komplexität wichtiger Probleme –z.B. durch ihre Klassifizierung als „vollständige“ Probleme in bestimmten Komplexitätshierarchien –zu verstehen und anwenden zu können. Dies ergänzt auch die Veranstaltungen zur Algorithmik, in denen es vorrangig um den Nachweis oberer Schranken (also die Entwicklung möglichst effizienter Algorithmen) für Probleme geht. Am Ende der Veranstaltung sollten Studierende in der Lage sein, die erlernten Modellbildungen und Techniken auf neue Probleme, Kryptosysteme und Algorithmen anwenden können. So sollen sie etwa die Komplexität von Problemen, die Sicherheit von kryptographischen Verfahren und die Laufzeit und den Speicherplatzbedarf von Algorithmen einschätzen können und in der Lage sein, strukturelle Eigenschaften von Komplexitätshierarchien zu erkennen und zu bewerten. Besonderer Wert wird darauf gelegt, dass die Studierenden die enge Verflechtung dieser Gebiete verstehen","literatur":"* Jörg Rothe: Komplexitätstheorie und Kryptologie. Eine Einführung in Kryptokomplexität, eXamen.Press, Springer-Verlag, 2008.\n* Jörg Rothe: Complexity Theory andCryptology. An Introduction to Crypto-complexity, EATCS Texts in Theoretical Computer Science, Springer-Verlag, 2005","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* erfolgreiche Bearbeitung der Übungsaufgaben\n* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung","haeufigkeit":"Etwa alle zwei Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Ergänzende Literatur","inhalt":"* Douglas R. Stinson: Cryptography: Theory and Practice, Chapman \u0026 Hall/CRC, 2006.\n* Johannes Buchmann: Einführung in die Kryptographie, Springer-Verlag, 2001.\n* Christos Papadimitriou: Computational Complexity, Addison-Wesley, 1995.\n* Gerd Wechsung: Vorlesungen zur Komplexitätstheorie, Teubner-Verlag, 2000."}]}],"modulbeauftragte":"Prof. Dr. Jörg Rothe","gesamtLeistungspunkte":"10LP ab PO 2015, alte PO 15LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":708136900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":708136900}}}', 95);
INSERT INTO public.antrag VALUES (96, 'Initiale Erstellung', '2020-04-06 00:26:37.734248', '2020-04-06 00:26:37.754743', '{"titelDeutsch":"Master-Seminar Advances in Data Science","titelEnglisch":"Master’s Seminar Advances in Data Science","veranstaltungen":[{"titel":"Master-Seminar Advances in Data Science","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Advances in Data Science“ (englischsprachig)","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Learning from data in order to gain useful insights is an important task, generally covered under the data science umbrella. This involves a wide variety of fields such as statistics, artificial intelligence, effective visualization, as well as efficient (big) data engineering, processing and storage, where efficiency and scalability often play crucial roles inorder to cater for the quantity and heterogeneity of data.\nThe goal of this seminar is to deepen the understanding about data science \u0026 engineering techniques through studying and critically evaluating state-of-the-art literature in the field. Participants will be introduced to the critical assessment and discussion of recent scientific developments, thereby learning about emerging technologies as well as gaining the ability to evaluate and discuss focused scientific works. Participants will be given recent literature covering relevant data science areas. Each participant will review independently 1-2 publications and present and discuss its content and contribution, which are then presented and discussed with the entire student participants.","lernergebnisse":"Studierende haben nach erfolgreichem Abschluss dieses Moduls ein vertieftes Verständnis aktueller Methoden und typischer Anwendungen im Bereich Data Science. Teilnehmer können wissenschaftliche Veröffentlichungen systematisch aufarbeiten, und deren Inhalte strukturiert zusammenfassen und kritisch bewerten.","literatur":"Zu dieser Veranstaltung gibt es kein Lehrbuch. Einige relevante Grundlagen finden sich in:\n\n* R for Data Science (by Garrett Grolemund and Hadley Wickham) O’Reilly Media\n* Statistics in a Nutshell, 2nd Edition, A Desktop Quick Reference, Sarah Boslaugh, O’Reilly Media\n* Doing Data Science –Straight Talk from the Frontline, Cathy O’Neil, Rachel Schutt, O’Reilly Media\n* Data Analytics with Hadoop, Benjamin Bengfort \u0026 Jenny Kim, O‘Reilly Media\n* Deep Learning by Ian Goodfellow and Yoshua Bengio and Aaron Courville [www.deeplearningbook.org](www.deeplearningbook.org)","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik\n* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science","voraussetzungenBestehen":"* Schriftliche Ausarbeitung zum gewählten Thema\n* Begutachtung von anderen Ausarbeitungen\n* Präsentation des eigenen Themas\n* Aktive Teilnahme an Diskussionen","haeufigkeit":"unregelmäßig","sprache":"Englisch"},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Stefan Dietze","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":734248200}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":734248200}}}', 96);
INSERT INTO public.antrag VALUES (97, 'Initiale Erstellung', '2020-04-06 00:26:37.761575', '2020-04-06 00:26:37.777002', '{"titelDeutsch":"Master-Seminar Big-Data-Systeme und Cloud-Computing","titelEnglisch":"Master’s Seminar on Big-Data Systems and Cloud Computing","veranstaltungen":[{"titel":"Master-Seminar Big-Data-Systeme und Cloud-Computing","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Big-Data-Systeme und Cloud-Computing“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"In vielen Bereichen der Forschung und der Industrie müssen immer größere Datenmengen (Schlagwort Big-Data) gespeichert und verarbeitet werden. Hierzu sind verteilte und parallele Systeme notwendig sowie große Infrastrukturen. Big-Data-Systeme bieten zahlreiche Plattformen für die verteilte und parallele Datenverarbeitung. Cloud-Computing bietet hierfür eine ideale Grundlage mit verschiedenen Frameworks, Diensten und Speichersystemen sowie einer nutzungsabhängigen Bezahlung, kombiniert mit einer elastischen Skalierung von Ressourcen.\n\nDieses Seminar behandelt u.a. aktuelle Forschungs-Themen aus den folgenden Bereichen:\n\n* Cloud-Computing\u0026 Big-Data\n* Batch-und Stream-Processing\n* Verteilte Graph-Verarbeitung\n* Cloud Storage-Systeme\n* Kommunikationsdienste und\n* Koordinierungsdienste\n* ...","lernergebnisse":"Studierende haben nach erfolgreichem Abschluss dieses Moduls ein vertieftes Verständnis von aktuellen Hard- und Software-Techniken im Themenumfeld Big-Data und Cloud-Computing. Sie können wissenschaftliche Veröffentlichungen systematisch aufarbeiten, deren Inhalte prägnant zusammenfassen, kritisch bewerten und präsentieren.","literatur":"Aktuelle wissenschaftliche Publikationen zu den oben genannten Themen.","verwendbarkeit":"* WahlpflichtbereichPraktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreiche Teilnahme am Seminar\n* Abschließende Prüfung am Ende des Semesters","haeufigkeit":"I.d.R. jährlich","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Verteilte Systeme“."}]}],"modulbeauftragte":"Prof. Dr. Michael Schöttner","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":761575100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":761575100}}}', 97);
INSERT INTO public.antrag VALUES (98, 'Initiale Erstellung', '2020-04-06 00:26:37.787942', '2020-04-06 00:26:37.808429', '{"titelDeutsch":"Master-Seminar Datenbanken und Informationssysteme","titelEnglisch":"Master’s Seminar Databases and Information Systems","veranstaltungen":[{"titel":"Master-Seminar Datenbanken und Informationssysteme","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Datenbanken und Informationssysteme“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Im Seminar werden grundlegende und aktuelle Forschungsarbeiten aus den Gebieten \"Information Retrieval\", \"Natural Language Processing\", \"Knowledge Discovery in Databases\" und \"Machine Learning\" behandelt, die auf den in den entsprechenden Vorlesungen präsentierten Verfahren aufbauen, diese weiterentwickeln oder neue Verfahren einführen.","lernergebnisse":"Studierende haben nach dem erfolgreichen Abschluss dieses Moduls ein vertieftes Verständnis aktueller Methoden und typischer Anwendungen in den oben genannten Bereichen. Teilnehmer können wissenschaftliche Veröffentlichungen systematisch aufarbeiten, und deren Inhalte strukturiert zusammenfassen, präsentieren und kritisch bewerten.","literatur":"Wird zu Beginn der Lehrveranstaltung bekanntgegeben.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Schriftliche Ausarbeitung zum gewählten Thema\n* Präsentation des eigenen Themas\n* Aktive Teilnahme an Diskussionen","haeufigkeit":"unregelmäßig","sprache":"Deutsch oder Englisch (wird jeweils angekündigt)"},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Stefan Conrad","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":787428700}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":787428700}}}', 98);
INSERT INTO public.antrag VALUES (99, 'Initiale Erstellung', '2020-04-06 00:26:37.815262', '2020-04-06 00:26:37.840635', '{"titelDeutsch":"Master-Seminar über weitebeschränkte gerichtete Graphklassen","titelEnglisch":"Master’s Seminar on Bounded Width Directed Graph Classes","veranstaltungen":[{"titel":"Master-Seminar über weitebeschränkte gerichtete Graphklassen","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Weitebeschränkte gerichtete Graphklassen“","semesterWochenStunden":2},{"form":"Übungen","semesterWochenStunden":2}],"beschreibung":{"inhalte":"In diesem Seminar untersuchen wir spezielle gerichtete Graphklassen darauf, ob sie weitebeschränkt bezüglich spezieller Parameter sind. Hierzu betrachten wir unter anderem gerichtete Formen von Bäumen, Wäldern, Kaktusgraphen, Halin Graphen, planaren Graphen, perfekte Graphen, bipartiten Graphen, Co-Graphen, Split-Graphen Schwellwertgraphen bezüglich ihrer Wegweite, Baumweite, Cliquenweite, NLC-Weite und weiteren gerichteten Parametern.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* einen Überblick über einige der wichtigsten Themen und Resultate aus dem Gebiet der Graphparameter für gerichtete Graphen zu geben,\n* eigene Ergebnisse für einfache Problemstellungen aus diesem Bereich erarbeiten,\n* einen guten Vortrag vorzubereiten und zu halten,\n* die Vorträge der anderen Studierenden zu hören und kritisch zu diskutieren und\n* eine gute schriftliche Ausarbeitung/Vortragsfolien zu dem Vortragsthema anzufertigen.","literatur":"* J. Bang-Jensen, G. Gutin, Digraphs: Theory, Algorithms and Applications, Springer, 2009.\n* J. Bang-Jensen, G. Gutin, Classes of Directed Graphs, Springer, 2018.\n* A. Brandstädt, V.B. Le, J.P. Spinrad, Graph Classes: A Survey, SIAM Monographs on Discrete Mathematics and Applications. SIAM, 1999.\n* M.C. Golumbic. Algorithmic Graph Theory and Perfect Graphs. Academic Press, 1980.\n* aktuelle Forschungsarbeiten","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Aktive Mitarbeit in den Seminaren und Übungen\n* schriftliche Ausarbeitung/Vortragsfolien zu einem Thema des Seminars\n* Vortrag des Themas\n* Bestehen der Prüfung zum Ende des Semesters","haeufigkeit":"Unregelmäßig","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* Vorlesung „Algorithmen für schwere Probleme”"}]}],"modulbeauftragte":"Priv.-Doz. Dr. Frank Gurski","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":815262400}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":815262400}}}', 99);
INSERT INTO public.antrag VALUES (100, 'Initiale Erstellung', '2020-04-06 00:26:37.850394', '2020-04-06 00:26:37.87284', '{"titelDeutsch":"Methods of Artificial Intelligence in Life Sciences","titelEnglisch":"Methods of Artificial Intelligence in Life Sciences","veranstaltungen":[{"titel":"Methods of Artificial Intelligence in Life Sciences","leistungspunkte":"10 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":8},{"form":"Vorlesung „Methods of Artificial Intelligence in Life Sciences“","semesterWochenStunden":4}],"beschreibung":{"inhalte":"Lectures and Practical Work: We start with an introduction to convolutional Neural Networks and show how to apply them in the search for overrepresented motifs in DNA. We introduce the necessary data preprocessing steps and illustrate how motif information can be extracted out of the learned weights. We then introduce deep generative models, in particular Variational Autoencoders and autoregessive Models in combination with important deep learning concepts, such as Attention. We introduce the problem of RNA folding and the basics of the biophysical and biochemical mechanisms involved. We use a variant of Monte Carlo Tree Search to efficiently sample the space of possible folding structures and introduce various scoring functions that serve as reward signal. We show that the problem of RNA/Protein folding is tightly related to reinforcement learning. We introduce the concept of self-supervised learning and how it can be applied to detect anomalies in time series data that have been recorded by wearables for high risk patients.","lernergebnisse":"Students know how to implement machine learning algorithms in Pytorch and to run it on HPC. They understand the concepts of Deep Learning and are familiar with common Neural Network architectures, such as Convolutional Neural Networks, Autoregressive Models, and Transformer Networks. They are familiar with the predominant sampling methods, such as Important Sampling, MCMC, and Monte Carlo Tree search. They understand the basics of the protein biosynthesis and the problem of predicting 3d RNA/Protein Structure from DNA sequence. They understand the concept of multiple sequence alignments, their relation to Evolutionary Biology, and how it can be used to increase prediction of 3d folding structure of Biomolecules.","literatur":"TBD","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science","voraussetzungenBestehen":"* Regular and active participation in the exercises\n* Passing the examination\n* Written examination","haeufigkeit":"Each summer term","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Markus Kollmann","gesamtLeistungspunkte":"10 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":850393700}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":850393700}}}', 100);
INSERT INTO public.antrag VALUES (101, 'Initiale Erstellung', '2020-04-06 00:26:37.880651', '2020-04-06 00:26:37.903605', '{"titelDeutsch":"Mobilkommunikation","titelEnglisch":"Mobile Communications","veranstaltungen":[{"titel":"Mobilkommunikation","leistungspunkte":"5LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Mobilkommunikation”","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Das Modul richtet sich an Studenten, die bereits elementare Kenntnisse im Bereich Rechnernetze besitzen und die technischen Grundlagen von mobilen Netzen verstehen wollen. Ziel des Moduls ist das Erlernen allgemeiner Grundkenntnisse, das Verständnis von praxisrelevanten Systemen und das Erwerben praktischer Fertigkeiten.\n\n* Grundlagen der Mobilkommunikation (Geschichte, Frequenzen und Regulierungen, Signale, Antennen, Signalausbreitung)\n* Medienzugriff (Space-, Frequency-, Time-, Code Division Multiple Access)\n* Drahtlose Lokale Netze (IEEE 802.11, Bluetooth)\n* Mobilkommunikationssysteme (GSM, GPRS, UMTS, LTE)\n* Ad-Hoc Netzwerke (Anwendungen, Wegewahl, DSR, AODV, LSR)","lernergebnisse":"Studierende verstehen nach erfolgreichem Abschluss dieses Moduls die grundlegende Funktionsweise von Mobilfunksystemen und mobilen Netzwerken. Sie verstehen die physikalischen Effekte der Funkübertragung, die Herausforderungen und Lösungen für den Mehrfachzugriff sowie die konkreten Protokolle und Standards für die Mobilkommunikation, nämlich IEEE 802.11, 2G-5G und weitere.","literatur":"* Jochen Schiller: Mobilkommunikation, 2. Auflage, Addison-Wesley/Pearson Studium, 2003.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Mitarbeit in Vorlesung\n* erfolgreiche Teilnahme an der praktischen Übung\n* mündliche Prüfung","haeufigkeit":"unregelmäßig","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"Modul „Rechnernetze”"}]}],"modulbeauftragte":"Prof. Dr. Martin Mauve, Jun.-Prof. Dr.-Ing. Kalman Graffi","gesamtLeistungspunkte":"5LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":880651300}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":880651300}}}', 101);
INSERT INTO public.antrag VALUES (102, 'Initiale Erstellung', '2020-04-06 00:26:37.90946', '2020-04-06 00:26:37.935227', '{"titelDeutsch":"Model Checking","titelEnglisch":"Model Checking","veranstaltungen":[{"titel":"Model Checking","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung (nach Vereinbarung)","semesterWochenStunden":2},{"form":"Vorlesung/Seminar „Model Checking“","semesterWochenStunden":2},{"form":"Eigenarbeit","semesterWochenStunden":0}],"beschreibung":{"inhalte":"Dieses Modul befasst sich mit der vollautomatischen Verifikation von Hardware und Software mit Hilfe von Model Checking Algorithmen und Werkzeugen.\n\n* Model Checking Algorithmen zur Verifikation von temporalen (Safety, Liveness und Fairness) und regulären Eigenschaften\n* Kenntnisse und Anwendung von temporalen Logiken (z.B. LTL, CTL, CTL*, ...)\n* Verwendung von Model Checking Werkzeugen (z.B. SMV, Spin, ProB, ...)\n* Grundlagen fortgeschrittener Methoden (z.B. Binary Decision Diagrams, Partial Order Reduction, Symmetrie, ...)","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* verschiedene Verfahren zur Programmverifikation zu präsentieren, anzuwenden und miteinander zu vergleichen\n* einfache Spezifikationen zu erstellen und automatisiert mit Werkzeugen zu prüfen\n* temporale und reguläre Eigenschaften in geeigneten Formalismen zu formulieren\n* einen eigenen Model Checker zu implementieren","literatur":"* Christel Baier und Joost-Pieter Katoen: Principles of Model Checking. MIT Press, 2008.\n* M. Clarke, O. Grumberg, D.A. Peled: Model Checking, MIT Press.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"mündliche (20-30 Min.) oder schriftliche (Klausur, 90 Minuten) Prüfung","haeufigkeit":"Normalerweise jedes Jahr im Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"Grundlagen in mathematischer Logik (zum Beispiel aus dem Modul „Sicherheitskritische Systeme”)"}]}],"modulbeauftragte":"Prof. Dr. Michael Leuschel","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":909460300}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":909460300}}}', 102);
INSERT INTO public.antrag VALUES (103, 'Initiale Erstellung', '2020-04-06 00:26:37.941084', '2020-04-06 00:26:37.959625', '{"titelDeutsch":"Modellierung metabolischer Netzwerke","titelEnglisch":"Modelling Metabolic Networks","veranstaltungen":[{"titel":"Modellierung metabolischer Netzwerke","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Modellierung metabolischer Netzwerke“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Einführung in die statistische Programmiersprache R\n* Grundlegende Elemente der Linearen Algebra für die Bioinformatik\n* Grundeigenschaften und Rekonstruktion der stöchiometrischen Matrix\n* Topologie und fundamentale Unterräume der stöchiometrischen Matrix\n* Extreme Pathways \u0026 Elementarmoden\n* Eigenschaften des Lösungsraums\n* Flux-Balance Analyse\n* Flux-Variability, Flux-Coupling\n* Modelierung von Knock-out Mutanten\n* Berücksichtigung weiterer biologischer Beschränkungen","lernergebnisse":"Die Studierenden können nach Abschluss dieser Vorlesung;\n\n* wichtige Methoden der constraint-based Modellierung von metabolischen Netzwerken zusammenfassen und anwenden;\n* biologische Systeme anhand möglicher biochemischer Reaktionen beschreiben;\n* lineare Optimierungsprobleme mit Hilfe der Programmiersprache R formulieren und lösen;\n* Stoffwechselmodule im Zusammenhang betrachten und deren Verhalten unter verschiedenen Bedingungen simulieren.","literatur":"* Bernhard Ø. Palsson: Systems Biology: Properties of Reconstructed Networks. Cambridge University Press, 2006.\n* Uwe Ligges: Programmieren mit R. Springer Verlag, 2007\n* Günther Gramlich: Lineare Algebra. Eine Einführung für Ingenieure. Fachbuchverlag Leipzig, 2003","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen\n* erfolgreiches Bearbeiten der Übungsaufgaben (50%)\n* abschließende Prüfung (i.d.R. schriftlich)","haeufigkeit":"Jedes Studienjahr, in der Regel im Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Martin Lercher","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":941084100}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":941084100}}}', 103);
INSERT INTO public.antrag VALUES (104, 'Initiale Erstellung', '2020-04-06 00:26:37.964504', '2020-04-06 00:26:37.979144', '{"titelDeutsch":"Multimedia-Datenbanksysteme","titelEnglisch":"Multimedia-Databasesystems","veranstaltungen":[{"titel":"Multimedia-Datenbanksysteme","leistungspunkte":"","veranstaltungsformen":[{"form":"Übung/Seminar","semesterWochenStunden":2},{"form":"Vorlesung „Multimedia-Datenbanksysteme“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Information Retrieval\n* Multimedia Information Retrieval\n* Feature-Transformationsverfahren\n* Distanzfunktionen\n* Effiziente Algorithmen und Datenstrukturen","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die grundlegenden Fragestellungen des Multimedia Information Retrieval verstehen\n* geeignete Distanzfunktionen auszuwählen bzw. zu entwerfen\n* ein eigenes Multimedia-Datenbanksystem prinzipiell zu konzipieren","literatur":"* Ingo Schmitt: Ähnlichkeitssuche in Multimedia-Datenbanken, Oldenbourg-Verlag München, 2005.\n* K. Meyer-Wegener: Multimedia-Datenbanken – Einsatz von Datenbanktechnik in Multimedia-Systemen (2. Auflage), Teubner, Stuttgart, 2003.\n* B. Prabhakaran: Multimedia Database Management Systems, Kluwer Academic Publishers, Massachusetts, 1997.\n* R. Veltkamp, H. Burkhardt, H.-P. Kriegel (Hrsg.): State-of-the-Art in Content-Based Image and Video Retrieval, Kluwer Academic Publishers, 2001.\n* R. Bäza-Yates, B. Ribeiro-Neto: Modern Information Retrieval, Pearson / Addison Wesley, 1999.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen bzw. dem Seminar\n* erfolgreiches Bearbeiten der Übungsaufgaben bzw. Anfertigen einer angemessenen Seminarausarbeitung und Halten eines Vortrags\n* abschließende Prüfung (i.d.R. mündlich)","haeufigkeit":"* unregelmäßig\n* wird im Wechsel mit den Modulen/Veranstaltungen „Data Warehouses“, „Knowledge Discovery in Databases“, „Knowledge Discovery in Databases“, „Transaktionsverwaltung“ und „Information Retrieval und Natural Language Processing” angeboten, so dass jedes Semester mindestens eine dieser Veranstaltungen angeboten wird.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"„Datenbanksysteme“"}]}],"modulbeauftragte":"Prof. Dr. Stefan Conrad","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":964504300}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":964504300}}}', 104);
INSERT INTO public.antrag VALUES (105, 'Initiale Erstellung', '2020-04-06 00:26:37.98835', '2020-04-06 00:26:38.0059', '{"titelDeutsch":"Natural Language Processing (vorm. Information Retrieval und Natural Language Processing)","titelEnglisch":"Natural Language Processing (formerly Information Retrieval and Natural Language Processing)","veranstaltungen":[{"titel":"Natural Language Processing (vorm. Information Retrieval und Natural Language Processing)","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung/Seminar","semesterWochenStunden":2},{"form":"Vorlesung „Information Retrieval und Natural Language Processing“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Evaluation von IR- bzw. NLP-Systemen\n* Grundlegende NLP-Werkzeuge\n* Grundlegende Formale Modelle\n* Retrieval Modelle\n* Das Vektorraummodell\n* Fortgeschrittene NLP-Werkzeuge\n* Anwendungsgebiete","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die grundlegenden Information Retrieval-Modelle zu erläutern\n* NLP-Techniken zu verstehen und ihre Einsatzmöglichkeiten zu bewerten\n* Information Retrieval- und NLP-Systeme zu konzipieren","literatur":"* A. Henrich: Information Retrieval 1 (Grundlagen, Modelle und Anwendungen), eBook (Creative Commons), http://www.uni-bamberg.de/?id\u003d23516, 2008\n* R. Baeza-Yates, B. Ribeiro-Neto: Modern Information Retrieval, Addison-Wesley, Boston, 1999\n* C. Manning, H. Schütze: Foundations of Statistical Natural Language Processing, MIT Press, Cambridge, 1999\n\nsowie ggfs. weiterführende Literatur (wird in der Veranstaltung bekanntgegeben)","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik\n* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen bzw. dem Seminar\n* erfolgreiches Bearbeiten der Übungsaufgaben bzw. Anfertigen einer angemessenen Seminarausarbeitung und Halten eines Vortrags\n* abschließende Prüfung (i.d.R. mündlich)","haeufigkeit":"* unregelmäßig\n* wird im Wechsel mit den Modulen/Veranstaltungen „Knowledge Discovery in Databases“, „Multimedia-Datenbanksysteme“, „Knowledge Discovery in Databases – Ausgewählte Kapitel“, „Transaktionsverwaltung“ und „Data Warehouses” angeboten, so dass jedes Semester mindestens eine dieser Veranstaltungen angeboten wird.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Stefan Conrad","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":988349500}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":37,"nano":988349500}}}', 105);
INSERT INTO public.antrag VALUES (106, 'Initiale Erstellung', '2020-04-06 00:26:38.01078', '2020-04-06 00:26:38.029322', '{"titelDeutsch":"Netzwerksicherheit","titelEnglisch":"Security in Networked Systems","veranstaltungen":[{"titel":"Netzwerksicherheit","leistungspunkte":"10 LP ab PO 2015, alte PO 15 LP","veranstaltungsformen":[{"form":"Praktische Übung","semesterWochenStunden":2},{"form":"Vorlesung „Netzwerksicherheit“","semesterWochenStunden":4},{"form":"Übungen","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Moderne Computersysteme sind einer Vielzahl von Angriffen ausgesetzt. Ziel der Vorlesung ist es ein fundamentales Verständnis dafür zu entwickeln, wie man sich vor diesen Angriffen schützen kann. Hierzu werden sowohl die theoretischen Grundlagen diskutiert als auch konkrete Angriffe und Abwehrstrategien praktisch erprobt.\n\nInsbesondere werden die folgenden Themen behandelt:\n\n* Sicherheitslücken und Exploits (Buffer Overflows und Stack Smashing, Shellcode, ...)\n* Malware (Viren, Würmer, Trojaner, Botnetze, ...)\n* Absichern von Netzwerken (Architektuen, DMZ, Firewalls, IDS, VPN, Denial of Service, ...)\n* Sicherheitsprotokolle (PKI, Web of Trust, SSL/TLS, PGP, DNSSec) und Zufallszahlen\n* Anonymität im Netz (TOR, ...)\n* Passwortspeicherung und Single Sign-on\n* Virtualisierung\n* Ausfallsicherheit (RAID, UPS)\n* Web- und Anwendungssicherheit (CSRF, XSS, SQL Injection, MAC Length Extension, Schwachstel- lenscanner, ...)\n* Vermeiden von Spam\n* Digitale Währungen (Bitcoin)","lernergebnisse":"Studierende verstehen nach erfolgreichem Abschluss dieses Moduls, wie aktuelle Angriffe in Computernetzwerken funktionieren, welche grundsätzlichen Schwachstellen häufig ausgenutzt werden und welche Gegenmaßnahmen gegen welche Angriffsarten schützen können. Studenten werden mit dem Abschluss des Moduls Konzepte für die Absicherung von Netzwerken entwickeln und ein einfaches, abgesichertes Netzwerk aufsetzen können.","literatur":"Zu dieser Veranstaltung gibt es kein Lehrbuch.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Mitarbeit in Vorlesung\n* erfolgreiche Teilnahme an der praktischen Übung\n* mündliche Prüfung","haeufigkeit":"Jedes Sommersemester.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Rechnernetze“"}]}],"modulbeauftragte":"Prof. Dr. Martin Mauve","gesamtLeistungspunkte":"10 LP ab PO 2015, alte PO 15 LP","studiengang":"Master-StudiengangInformatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":10780000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":10780000}}}', 106);
INSERT INTO public.antrag VALUES (107, 'Initiale Erstellung', '2020-04-06 00:26:38.036154', '2020-04-06 00:26:38.054696', '{"titelDeutsch":"Master-Seminar zu aktuellen Themen der theoretischen und computergestützten Biologie","titelEnglisch":"Master’s Seminar on Current Topics in Theoretical and Computational Biology","veranstaltungen":[{"titel":"Master-Seminar zu aktuellen Themen der theoretischen und computergestützten Biologie","leistungspunkte":"1 LP","veranstaltungsformen":[{"form":"Seminar","semesterWochenStunden":1}],"beschreibung":{"inhalte":"* Modellierung biologischer Systeme\n* Bioinformatische Algorithmen\n* Methoden zur Auswertung komplexer biologischer Daten","lernergebnisse":"Die Studierenden sollen einerseits in aktuelle Themenfelder der theoretischen und quantitativen Biologie und Bioinformatik eingeführt werden. Andererseits sollen sie die vortragshafte Darstellung wissenschaftlicher Inhalte sowie den mündlichen wissenschaftlichen Diskurs in englischer Sprache einüben.","literatur":"Aktuelle Arbeiten aus einschlägigen Fachzeitschriften","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreicher Vortrag eines Projektes\n* Aktive Teilnahme an den Diskussionen während des Seminars","haeufigkeit":"Ganzjährig","sprache":"Englisch"},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Martin Lercher","gesamtLeistungspunkte":"1 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":35177900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":35177900}}}', 107);
INSERT INTO public.antrag VALUES (112, 'Initiale Erstellung', '2020-04-06 00:26:38.155094', '2020-04-06 00:26:38.172662', '{"titelDeutsch":"Master-Seminar zu Reproduzierbarkeit bioinformatischer Forschungsergebnisse","titelEnglisch":"Master’s Seminar on Reproducibility in Bioinformatics Research","veranstaltungen":[{"titel":"Master-Seminar zu Reproduzierbarkeit bioinformatischer Forschungsergebnisse","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Reproduzierbarkeit bioinformatischer Forschungsergebnisse“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Die wissenschaftliche Datenanalyse nimmt einen immer größer werdenden Stellenwert in der Forschung ein. Insbesondere in der Bioinformatik hat die Kombination von enorm wachsenden Datenmengen, fehlenden Standards und Anreizen, schlechten Programmierpraktiken und unzureichend dokumentierten Parametern und Versionen zu einer Reproduzierbarkeitskrise geführt. Wissenschaftliche Software wird allzu häufig unzureichend dokumentiert, ineffizient programmiert und nicht gewartet. In diesem Seminar zeigen wir diese Fehler auf, in dem wir versuchen, die Datenanalyse ausgewählter Originalarbeiten zu reproduzieren. Zudem lernen wir, wie man es besser machen kann, indem diese Analysen mit Hilfe des Workflow-Management-Tools Snakemake realisiert werden und, bei Erfolg, auf zertifizierten Online-Speicherdiensten deponiert werden.","lernergebnisse":"Studierende, die das Modul erfolgreich absolviert haben, kennen anschließend Wege aus der Reproduzierbarkeitskrise und können diese in Arbeit vermeiden.","literatur":"Originalliteratur.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Schriftliche Ausarbeitung zum gewählten Thema\n* Begutachtung von anderen Ausarbeitungen\n* Präsentation des eigenen Themas\n* Aktive Teilnahme an Diskussionen\n* Gruppenarbeit (2-4 Personen): Datenanalyse mit Snakemake","haeufigkeit":"Unregelmäßig","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Algorithmen in der Bioinformatik“."}]}],"modulbeauftragte":"Prof. Dr. Gunnar W. Klau","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":155094300}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":155094300}}}', 112);
INSERT INTO public.antrag VALUES (113, 'Initiale Erstellung', '2020-04-06 00:26:38.179493', '2020-04-06 00:26:38.199011', '{"titelDeutsch":"Master-Seminar zu Verteilte und Parallele Systeme","titelEnglisch":"Master’s Seminar on Distributed and Parallel Systems","veranstaltungen":[{"titel":"Master-Seminar zu Verteilte und Parallele Systeme","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Seminar „Verteilte und Parallele Systeme“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"In vielen Bereichen der Forschung und der Industrie werden immer größere Datenmengen (Schlagwort BigData) erfasst und gespeichert. Um diese Daten möglichst effizient verarbeiten zu können sind verteilte und parallele Systeme unabdingbar. Neben der Skalierbarkeit bezüglich der Anzahl an Ressourcen sind auch Fehlertoleranzaspekte sehr wichtig. Bei interaktiven Systemen die Millionen oder Milliarden von Benutzern bedienen ist zusätzlich die Latenz eine besondere Herausforderung.\n\nDieses Seminar behandelt aktuelle Forschungs-Themen in diesem Themen-Umfeld, u.a. Cloud, Batch- und Stream-Processing, Graph-Verarbeitung, Storage-Systeme (key-value, NoSQL, in-memory)","lernergebnisse":"Studierende haben nach erfolgreichem Abschluss dieses Moduls ein vertieftes Verständnis von aktuellen Hard- und Software-Techniken im Themenumfeld verteilte und parallele Systeme. Sie können wissenschaftliche Veröffentlichungen systematisch aufarbeiten, deren Inhalte prägnant zusam- menfassen, kritisch bewerten und präsentieren.","literatur":"Aktuelle wissenschaftliche Publikationen zu den oben genannten Themen.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreiche Teilnahme am Seminar\n* Abschließende Prüfung am Ende des Semesters","haeufigkeit":"Wird nicht mehr angeboten","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"„Verteilte Systeme“."}]}],"modulbeauftragte":"Prof. Dr. Michael Schöttner","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":179492900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":179492900}}}', 113);
INSERT INTO public.antrag VALUES (114, 'Initiale Erstellung', '2020-04-06 00:26:38.206818', '2020-04-06 00:26:38.229264', '{"titelDeutsch":"Mathematische Hintergründe der Wahlmanipulation","titelEnglisch":"Mathematical Background of Manipulation","veranstaltungen":[{"titel":"Mathematische Hintergründe der Wahlmanipulation","leistungspunkte":"","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Seminar","semesterWochenStunden":2},{"form":"Vorlesung „Mathematische Hintergründe der Wahlmanipulation“","semesterWochenStunden":4}],"beschreibung":{"inhalte":"In vielen Situationen profitieren Wähler davon, wenn sie eine unehrliche Stimme abgeben. Gibbard und Satterthwaite haben sogar gezeigt, dass es bei mindestens drei zur Wahl stehenden Alternativen kein nicht manipulierbares Wahlsystem geben kann, welches eine Reihe von sinnvollen Eigenschaften erfüllt. Diese Veranstaltung behandelt die systematische mathematische Analyse von verschiedenen Formen der Manipulation in Wahlen.\n\n* Einführung in die Social Choice Theorie\n  - Formale Grundlagen\n  - 20 Wahlsystemen\n  - Arrows Theorem\n* Grundlagen der Manipulation\n  - Präferenzen über Mengen und Manipulierbarkeit\n  - Beispiele für Manipulation\n  - Resultate\n  - Agenda Manipulierbarkeit und Transitivität\n* Resolute Wahlregeln\n  - Das Gibbard-Satterthwaite Theorem\n  - Gleichstände in Stimmen\n  - Äquivalenz von Arrows Theorem und dem Gibbard-Satterthwaite Theorem\n  - Betrachtung des Beweises des Gibbard-Satterthwaite Theorems\n* Umgang mit den Resultaten\n  - Einführung\n  - Manipulation ist zwar möglich aber schwer\n  - Einschränkung der Annahmen\n  - Variation der formalen Annahmen","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,\n\n* verschiedene Formen der Manipulation formal zu definieren und zu vergleichen\n* bekannte Beweise aus der Literatur wiederholen und erläutern\n* Manipulation in unterschiedliche Formen einteilen\n* Empfehlungen für die Verwendung von Wahlsystemen in unterschiedlichen Einsatzbereichen entwerfen","literatur":"A. Taylor: Social Choice and the Mathematics of Manipulation, Cambridge University Press, 2005.","verwendbarkeit":"* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive und erfolgreiche Mitwirkung in den theoretischen und praktischen Übungen\n* Prüfung am Ende der Veranstaltung (i.d.R. Klausur, 90 Minuten)","haeufigkeit":"Dieses Modul findet in unregelmäßigen Abständen statt.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Ergänzende Literatur","inhalt":"* Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division. J. Rothe (ed.). Unter Vertrag bei Springer. Voraussichtliche Publikation: 2015.\n\nEine kürzere deutsche Version dieses Buches erschien unter dem Titel:\n\n* Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen. Jörg Rothe, Dorothea Baumeister, Claudia Lindner, Irene Rothe. Spektrum Akademischer Verlag, 2011."}]}],"modulbeauftragte":"Jun.-Prof. Dr. Dorothea Baumeister","gesamtLeistungspunkte":"10LP ab PO 2015, alte PO 15 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":206817800}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":206817800}}}', 114);
INSERT INTO public.antrag VALUES (115, 'Initiale Erstellung', '2020-04-06 00:26:38.237072', '2020-04-06 00:26:38.251711', '{"titelDeutsch":"Opportunistische und P2P-basierte Netzwerke","titelEnglisch":"Opportunistic and P2P Networks","veranstaltungen":[{"titel":"Opportunistische und P2P-basierte Netzwerke","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Seminar/Übung „Opportunistische und P2P-basierte Netzwerke“ (auf Englisch)","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Das Modul richtet sich an Studenten, die bereits elementare Kenntnisse im Bereich Rechnernetze besitzen und die das wissenschaftliche Arbeiten an neuster Forschung im Rahmen von opportunistischen und P2P-basierten Netzwerken kennenlernen wollen. Nach erfolgreichem Bestehen des Moduls verstehen die Studierenden methodische und fachbezogene Grundkenntnisse in ein aktuelles Forschungsthemenfeld, erlernen Methodiken für die Konzeption und Evaluation von neuen Forschungsansätzen in diesem Themenfeld sowie das Schreiben und das gegenseitige Begutachten von wissenschaftlichen Artikeln.\n\nOrganisation des Moduls:\n\n* Einführungsinhalte:\n  * Einführung in die Methodik der wissenschaftlichenArbeitsweise an einem (kleinen) Beispiel im Bereich Peer-to-Peer-Protokolle oder Protokolle für opportunistische Netzwerke\n  * Kennenlernen gängiger Evaluationstools für Netzwerkprotokolle in diesen Forschungsbereichen\n  * Einführung in die Konzeption und Begutachtung von wissenschaftlichen Artikeln\n* Praktikum/Übung in Einzelarbeit oder kleinen Teams:\n  * Einarbeitung in ein ausgewähltes Themenfeld aus einer Menge von Vorschlägen\n  * Design eines Netzwerkprotokolls\n  * Umsetzung und Evaluation in einem gängigen Evaluationstool\n  * Schreiben eines wissenschaftlichen Artikels zu der Funktionsweise und Evaluation des Protokolls\n  * Vorstellung der Ergebnisse auf einer universitätsinternen Konferenz","lernergebnisse":"Studierende verstehen nach erfolgreichem Abschluss dieses Moduls, wie die Konzeption, Evaluation und Präsentation von neuen Forschungsergebnissen im Bereich der Peer-to-Peer-Forschung und im Bereich der opportunistischen Netzwerke stattfindet.\n\nStudenten werden mit dem Abschluss des Moduls die Methodiken zur Erstellung, Evaluation und Beschreibung einer neuen Lösung in den genannten Forschungsbereichen anwenden können.","literatur":"Zu dieser Veranstaltung gibt es kein Lehrbuch","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* erfolgreiche Teilnahme an der praktischen Übung\n* mündliche Prüfung / Präsentation","haeufigkeit":"Jedes Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Rechnernetze”"}]}],"modulbeauftragte":"Jun.-Prof. Dr.-Ing. Kalman Graffi","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":237071800}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":237071800}}}', 115);
INSERT INTO public.antrag VALUES (116, 'Initiale Erstellung', '2020-04-06 00:26:38.257567', '2020-04-06 00:26:38.274157', '{"titelDeutsch":"Paralleles Rechnen mit Grafikkarten","titelEnglisch":"Parallel Computing on Graphic Cards","veranstaltungen":[{"titel":"Paralleles Rechnen mit Grafikkarten","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Vorlesung „Paralleles Rechnen mit Grafikkarten“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Aufbau von nVidia-basierten GPGPU-Karten\n* Kernelprogrammierung in CUDA C\n* Parallele Algorithmen\n* Speicherarchitektur von Grafikkarten\n* Streams\n* Interoperabilität von CUDA und OpenGL","lernergebnisse":"Studierenden sollen nach Absolvieren der Lehrveranstaltung massiv parallele Algorithmen für nVidia-Karten in CUDA C entwickeln und optimieren können. Dafür soll auf eine solide Kenntnis der Hardware-Architektur zurückgegriffen werden können.","literatur":"* J. Sanders, E. Kandrot, „CUDA by Example“, Addison Wesley (2010)\n* J. Cheng, M. Grossman, T. McKercher, “Professinal CUDA C Programming”, John Wiley \u0026 Sons (2014)\n* “CUDA Toolkit Documentation”, [http://docs.nvidia.com/cuda/index.html](http://docs.nvidia.com/cuda/index.html)","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreiche Teilnahme an den Übungen\n* Abschließende Prüfung am Ende des Semesters","haeufigkeit":"I.d.R. jährlich.","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"Solide Kenntnisse in C/C++, Linux und/oder Windows, Eclipse und/oder VisualStudio und teilweise OpenGL und GLUT."}]}],"modulbeauftragte":"Dr. Stephan Raub","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":256591200}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":256591200}}}', 116);
INSERT INTO public.antrag VALUES (117, 'Initiale Erstellung', '2020-04-06 00:26:38.280012', '2020-04-06 00:26:38.299531', '{"titelDeutsch":"Peer-to-Peer Systeme","titelEnglisch":"Peer-to-Peer Systems","veranstaltungen":[{"titel":"Peer-to-Peer Systeme","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Vorlesung „Peer-to-Peer Systeme“ (auf Englisch)","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Das Modul richtet sich an Studenten, die bereits elementare Kenntnisse im Bereich Rechnernetze besitzen und die Grundlagen von Peer-to-Peer Systemen verstehen wollen. Peer-to-Peer Systeme kennzeichnen sich durch Algorithmen und Mechanismen, in denen die beteiligten Knoten sowohl Anbieter als auch Konsumenten der zur Verfügung gestellten Ressourcen sind.\n\nThemen der Vorlesung und Übung\n\n* Strukturierte Overlaynetzwerke (Chord, Can, Pastry, ...)\n* Unstrukturierte Overlaynetzwerke (Gnutella, BubbleStorm, ...)\n* Lokationsbasierte Overlaynetzwerke\n* Erweiterungen von Overlaynetzwerken (Heterogenität, Anonymität, NAT ...)\n* Sicherheit in Peer-to-Peer-Systemen\n* BitTorrent\n* Monitoring in Peer-to-Peer-Systemen","lernergebnisse":"Studierende verstehen nach erfolgreichem Abschluss dieses Moduls die grundlegende Funktionsweise von Peer-to-Peer-Netzwerken und dezentralen Datenhaltungsansätzen. Sie verfügen über grundlegende praktische Kenntnisse zu der Gestaltung von Peer-to-Peer-Mechanismen, ferner lernen Sie den Umgang mit einem aktuellen Peer-to-Peer-Simulator, um selbstständig derartige Mechanismen evaluieren und tiefer verstehen zu können.","literatur":"* Ralf Steinmetz, Klaus Wehrle (Hrsg.): Peer-to-Peer Systems and Applications; 629 Seiten, Springer, ISBN 3-540-29192-X, 2005.\n* Peter Mahlmann, Christian Schindelhauer: Peer-to-Peer-Netzwerke; 293 Seiten, Springer, ISBN 978-3-540-33991-5, 2007.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Mitarbeit in Vorlesung\n* erfolgreiche Teilnahme an der praktischen Übung\n* mündliche Prüfung","haeufigkeit":"Jedes Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* „Rechnernetze\""}]}],"modulbeauftragte":"Jun.-Prof. Dr.-Ing. Kalman Graffi","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":279036900}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":280011700}}}', 117);
INSERT INTO public.antrag VALUES (118, 'Initiale Erstellung', '2020-04-06 00:26:38.307339', '2020-04-06 00:26:38.331282', '{"titelDeutsch":"Programmsynthese und Transformation","titelEnglisch":"Programmsynthese und Transformation","veranstaltungen":[{"titel":"Programmsynthese und Transformation","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Praktische Übung","semesterWochenStunden":1},{"form":"Vorlesung „Programmsynthese und Transformation“","semesterWochenStunden":2},{"form":"Übung","semesterWochenStunden":1}],"beschreibung":{"inhalte":"Dieses Modul beschäftigt sich mit Synthese und Transformation von Programmen und Softwaresystemen. Dazu gehört sowohl die Anpassung undOptimierung bestehender Software durch partielle Auswertung, als auch die automatische Generierung individueller Algorithmen.\n\nDie Themen sind:\n\n* Transformation und Optimierung von Programmen\n* Partielle Auswertung und Automatische Compilergenerierung\n* Techniken zur Programmsynthese\n* Synthese von Programmen basierend auf\n  * Spezifikationen\n  * Programmskizzen\n  * Beispieldaten","lernergebnisse":"Nach erfolgreichem Abschluss des Moduls sollten die Studierenden:\n\n* Vorteile und Grenzen partieller Auswertung benennen können\n* verstehen wie Programme mit Hilfe partieller Auswertung spezialisiert werden\n* in der Lage sein einen partiellen Auswerter für eine gegebene (simple) Programmiersprache selber zu entwickeln\n* Techniken der Programmsynthese benennen und vergleichen können\n* einfache Synthesewerkzeuge implementieren können","literatur":"Als Lehrbuch wird ein eigenes Skript verwendet.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreiche Bearbeitung der Pflichtübungen\n* Bestehender Klausur","haeufigkeit":"Normalerweise jedes Jahr im Sommersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"Grundlagen der logischen Programmierung und von Prolog (zum Beispiel aus dem Modul „Einführung in die logische Programmierung”) sind empfohlen, aber nicht zwingend notwendig."}]}],"modulbeauftragte":"Prof. Dr. Michael Leuschel","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":306363000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":306363000}}}', 118);
INSERT INTO public.antrag VALUES (119, 'Initiale Erstellung', '2020-04-06 00:26:38.339074', '2020-04-06 00:26:38.36008', '{"titelDeutsch":"Reinforcement Learning","titelEnglisch":"Reinforcement Learning","veranstaltungen":[{"titel":"Reinforcement Learning","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Reinforcement Learning“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* The reinforcement learning problem\n* Multi-armed bandits\n* Markov Decision processes\n* Dynamic programming\n* Monte Carlo Methods\n* Temporal-difference learning\n* On-and off-policy methods\n* Elligibility traces\n* Policy gradients","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltung:\n\n* die theoretischen Grundlagen des Reinforcement Learnings verstehen und erklären können, und\n* Algorithmen des Reinforcement learning implemetieren und anwenden können.","literatur":"* Richard Sutton, Andrew Barto, \"Reinforcement Learning: An Introduction\", 2018, MIT press, draft online available","verwendbarkeit":"* WahlpflichtbereichPraktische oder Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik\n* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science","voraussetzungenBestehen":"* Aktive Teilnahme an den Übungen\n* Erfolgreiches Bearbeiten der Übungsaufgaben\n* Abschließende Prüfung","haeufigkeit":"Etwa alle zwei Jahre","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"* Machine Learning\n* Lineare Algebra, Analysis, Stochastik, Numerik"}]}],"modulbeauftragte":"Prof. Dr. Stefan Harmeling","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":338098600}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":338098600}}}', 119);
INSERT INTO public.antrag VALUES (120, 'Initiale Erstellung', '2020-04-06 00:26:38.365936', '2020-04-06 00:26:38.379598', '{"titelDeutsch":"Relational Databases and Data Analysis","titelEnglisch":"Relational Databases and Data Analysis","veranstaltungen":[{"titel":"Relational Databases and Data Analysis","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Relational Databases and Data Analysis“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"Lecture:\n\n* Introduction into the relational database model and relational data warehouses;\n* Design of relational databases\n* Multi-dimensional modelling for (relational ) data warehouses\n* SQL\n* OLAP\n* Complex OLAP queries in SQL for data analysis","lernergebnisse":"Relational Databases\nStudents understand the relational model for databases togetherwith its foundations (e.g.  relational  algebra). They  are  able  to  design  relational  databases  and  to  express  simple  and  complex database queries using SQL\n\nData  warehouses\nStudents know  the  basic architecture and central concepts of data  warehouses and can explain them. They can design relational data warehouses using multi-dimensional modelling.\n\nOLAP and complex database queries\nStudents are able to understand, analysis and formulate complex OLAP and database queries using the SQL query language and its OLAP extension.","literatur":"TBD","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science","voraussetzungenBestehen":"* Regular and active participation in the exercises\n* Passing the examination\n* Written examination or oral examination","haeufigkeit":"Irregular","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Stefan Conrad","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":365935700}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":365935700}}}', 120);
INSERT INTO public.antrag VALUES (121, 'Initiale Erstellung', '2020-04-06 00:26:38.38643', '2020-04-06 00:26:38.403106', '{"titelDeutsch":"Sicherheitskritische Systeme","titelEnglisch":"Safety-Critical Systems","veranstaltungen":[{"titel":"Sicherheitskritische Systeme","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":1},{"form":"Praktische Übung","semesterWochenStunden":1},{"form":"Vorlesung „Sicherheitskritische Systeme“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Dieses Modul befasst sich mit der Entwicklung möglichst fehlerfreier Software mit Hilfe der formalen B- Methode.\n* Die B-Methode wurde in den 80er Jahren von Jean-Raymond Abrial entworfen und hat eine sehr gute Werkzeugunterstützung (AtelierB, Rodin, ProB). Sie ist außerdem eine der am weitesten verbreiteten formalen Methoden in Europa. Ein Paradebeispiel der formalen Entwicklungsweise in B ist das erfolgreiche METEOR Projekt (Steuersystem für die automatischen Züge der Linie 14 der Pariser U-Bahn), bei dem 100,000 Zeilen von B mit Hilfe von 28,000 Beweisen in eine robuste Implementierung übersetzt wurde.","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* Die Grundzüge der B Sprache (Syntax und Semantik) zusammenfassen können und mit klassischen Programmiersprachen vergleichen können\n* neue formale Spezifikationen mit B erstellen können und dabei praktische B Werkzeuge (hauptsächlich Rodin und ProB) benutzen können\n* Spezifikationen auf Fehler untersuchen zu können\n* Einfache Spezifikationen auf Papier und mit Hilfe einer automatisierten Beweisumgebung (Rodin) beweisen können\n* Grundlagen der Verfeinerung nutzen zu können","literatur":"* J.R. Abrial: Modeling in Event-B. System and Software Engineering.\n* Steve Schneider: The B-Method: An Introduction.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Wahlpflichtbereich Theoretische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* Erfolgreiche Bearbeitung der Pflichtübungen,\n* Bestehen der Klausur.","haeufigkeit":"Normalerweise jedes Jahr im Wintersemester","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”","zusatzfelder":[{"titel":"Empfohlene Vorkenntnisse","inhalt":"Grundlagen in mathematischer Logik (zum Beispiel aus dem Modul „Softwaretechnik und Programmiersprachen”)"}]}],"modulbeauftragte":"Prof. Dr. Michael Leuschel","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":386429500}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":386429500}}}', 121);
INSERT INTO public.antrag VALUES (122, 'Initiale Erstellung', '2020-04-06 00:26:38.409937', '2020-04-06 00:26:38.436288', '{"titelDeutsch":"Spoken Dialogue Systems","titelEnglisch":"Spoken Dialogue Systems","veranstaltungen":[{"titel":"Spoken Dialogue Systems","leistungspunkte":"5 LP","veranstaltungsformen":[{"form":"Vorlesung „Spoken Dialogue Systems“","semesterWochenStunden":2},{"form":"Übung","semesterWochenStunden":1}],"beschreibung":{"inhalte":"Introduction: architecture of a spoken dialogue system, dialogue acts, turn management issues\n\nSemantic decoding: representing and decoding meaning from user inputs, semantic decoding as a classification task, semantic decoding as a sequence-to-sequence learning task Dialogue state tracking: tracking beliefs over multiple turns, classical generative and discriminative approaches, recent deep learning approaches, integration of decoding and tracking. Dialogue Management: modelling via Markov Decision Processes, reinforcement learning, gradient methods, Gaussian Processes Response Generation: template methods, generative models, recent neural network approaches Current research topics: incremental dialogue, towards open-domain systems, end-to-end neural network architectures\n\nPractical Work:\n\nStudents will be provided with a set of Python tools which will enable them to configure and test a simple spoken dialogue system. They will be asked to implement a simple dialogue state tracker and a reinforcement learning algorithm and optimize the dialogue manager in interaction with a simulated user. This will give them an opportunity to explore a practical example of reinforcement learning.","lernergebnisse":"On completion of this module, students should understand:\n\nThe purpose and operation of the main components of a spoken dialogue system.\n\nHow the framework of partially observable Markov decision processes can be used to model a spoken dialogue system.\n\nHow classification, regression, sequence-to-sequence models and reinforcement learning can be used to implement a spoken dialogue system. The various options for optimizing and adapting a statistical spoken dialogue system, both off-line and on-line, and how deep learning can be utilised to achieve state of the art results in dialogue modelling.","literatur":"TBD","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science","voraussetzungenBestehen":"* Regular and active participation in the exercises\n* Passing the examination\n* Written report of 2000 words covering the practical [100%]","haeufigkeit":"Irregular","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”"}],"modulbeauftragte":"Prof. Dr. Milica Gasic","gesamtLeistungspunkte":"5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":409936800}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":409936800}}}', 122);
INSERT INTO public.antrag VALUES (123, 'Initiale Erstellung', '2020-04-06 00:26:38.44312', '2020-04-06 00:26:38.463613', '{"titelDeutsch":"Transaktionsverwaltung","titelEnglisch":"Transactionmanagement","veranstaltungen":[{"titel":"Transaktionsverwaltung","leistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","veranstaltungsformen":[{"form":"Übung","semesterWochenStunden":2},{"form":"Vorlesung „Transaktionsverwaltung“","semesterWochenStunden":2}],"beschreibung":{"inhalte":"* Transaktionseigenschaften und -anforderungen (ACID, ...)\n* Serialisierbarkeit (Final-State-, Sicht-, Konfliktserialisierbarkeit)\n* Abbrucheigenschaften (Rücksetzbarkeit, Vermeidung kaskadierender Abbrüche, Striktheit)\n* Sperrverfahren und -protokolle\n* Recovery\n* Strukturierte Transaktionsmodelle\n* ACTA","lernergebnisse":"Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,\n\n* die Probleme der Transaktionsverwaltung in Datenbanksystemen zu erläutern\n* Eigenschaften von Transaktionsschedules zu bestimmen\n* Recovery-Verfahren zu vergleichen und zu bewerten\n* die Einsatzmöglichkeiten strukturierter Transaktionsmodelle zu durchschauen","literatur":"* P. Bernstein, V. Hadzilacos, N. Goodman: Concurrency Control and Recovery in Database Systems, Addison-Wesley, Reading, MA, 1987.\n* J. Gray, A. Reuter: Transaction Processing: Concepts and Techniques, Morgan Kaufmann Publishers, San Mateo, CA, 1993.\n* G. Weikum, G. Vossen: Transactional Information Systems: Theory, Algorithms, and the Practice of Concurrency Control and Recovery, Morgan Kaufmann Publishers, 2001.","verwendbarkeit":"* Wahlpflichtbereich Praktische oder Technische Informatik\n* Schwerpunktbereich\n* Individuelle Ergänzung\n* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik","voraussetzungenBestehen":"* aktive Teilnahme an den Übungen\n* erfolgreiches Bearbeiten der Übungsaufgaben\n* abschließende Prüfung (i.d.R. mündlich)","haeufigkeit":"Siehe unten","sprache":""},"voraussetzungenTeilnahme":"Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:\n\n* „Programmierung”\n* „Rechnerarchitektur“\n* „Algorithmen und Datenstrukturen”\n* „Theoretische Informatik”\n* „Datenbanksysteme“","zusatzfelder":[{"titel":"Häufigkeit","inhalt":"* unregelmäßig\n* wird im Wechsel mit den Modulen/Veranstaltungen „Data Warehouses“, „Knowledge Discovery in Databases“, „Knowledge Discovery in Databases – Ausgewählte Themen“, „Multimedia-Datenbanksysteme“ und „Information Retrieval und Natural Language Processing” angeboten, so dass jedes Semester mindestens eine dieser Veranstaltungen angeboten wird."}]}],"modulbeauftragte":"Prof. Dr. Stefan Conrad","gesamtLeistungspunkte":"5 LP ab PO 2015, alte PO 7,5 LP","studiengang":"Master-Studiengang Informatik","modulkategorie":"WAHLPFLICHT_MA","datumErstellung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":442143000}},"datumAenderung":{"date":{"year":2020,"month":4,"day":6},"time":{"hour":0,"minute":26,"second":38,"nano":442143000}}}', 123);


--
-- Data for Name: modul; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.modul VALUES (1, '2020-04-06 00:26:34.228216', '2020-04-06 00:26:34.22724', '10 LP', 'Prof. Dr. Stefan Harmeling, Prof. Dr. Michael Schöttner', 0, true, 'Bachelor-Studiengang Informatik', 'Programmierung', 'Programming');
INSERT INTO public.modul VALUES (2, '2020-04-06 00:26:34.556445', '2020-04-06 00:26:34.556445', '10 LP', 'Die Dozenten der Mathematik (Festlegung jeweils 1 Jahr im Voraus in einer Sitzung der Wissenschaftlichen Einrichtung)', 1, true, 'Bachelor-Studiengang Informatik', 'Analysis II', 'Calculus of Several Variables');
INSERT INTO public.modul VALUES (3, '2020-04-06 00:26:34.59841', '2020-04-06 00:26:34.59841', '10 LP', 'Die Dozenten der Mathematik (Festlegung jeweils 1 Jahr im Voraus in einer Sitzung der Wissenschaftlichen Einrichtung)', 1, true, 'Bachelor-Studiengang Informatik', 'Angewandte Mathematik (Wahlweise Numerik I oder Stochastik)', 'Applied Mathematics');
INSERT INTO public.modul VALUES (4, '2020-04-06 00:26:34.652884', '2020-04-06 00:26:34.652884', '5 LP', 'Lehrende der jeweiligen Fächer', 3, true, 'Bachelor-Studiengang Informatik', 'Praxis- und Berufsorientierung', 'Professional Issues');
INSERT INTO public.modul VALUES (5, '2020-04-06 00:26:34.693873', '2020-04-06 00:26:34.693873', '10 LP', 'Priv.-Doz. Dr. Frank Gurski, Prof. Dr. Gunnar W. Klau, Prof. Dr. Martin Lercher, Prof. Dr. Egon Wanke', 0, true, 'Bachelor-Studiengang Informatik', 'Algorithmen und Datenstrukturen', 'Algorithms and Data Structures');
INSERT INTO public.modul VALUES (6, '2020-04-06 00:26:34.731935', '2020-04-06 00:26:34.731935', '5 LP', 'Prof. Dr. Stefan Conrad, Prof. Dr. Martin Mauve, Prof. Dr. Michael Schöttner', 0, true, 'Bachelor-Studiengang Informatik', 'Einführung Rechnernetze, Datenbanken und Betriebssysteme', 'Introduction to Computer Networks, Databases, and Operating Systems');
INSERT INTO public.modul VALUES (7, '2020-04-06 00:26:34.775851', '2020-04-06 00:26:34.775851', '9 LP ab PO 2016, alte PO‘s 10 LP', 'Prof. Dr. Stefan Conrad, Prof. Dr. Martin Mauve', 0, true, 'Bachelor-Studiengang Informatik', 'Rechnerarchitektur', 'Computer Architecture');
INSERT INTO public.modul VALUES (8, '2020-04-06 00:26:34.823259', '2020-04-06 00:26:34.823259', '8 LP ab PO 2016, alte PO‘s 10 LP', 'Dr. Jens Bendisposto', 0, true, 'Bachelor-Studiengang Informatik', 'Professionelle Softwareentwicklung (Programmierpraktikum I)', 'Professional Software Development (Programming Project I)');
INSERT INTO public.modul VALUES (9, '2020-04-06 00:26:34.858393', '2020-04-06 00:26:34.858393', '8 LP', 'Dr. Jens Bendisposto', 0, true, 'Bachelor-Studiengang Informatik', 'Softwareentwicklung im Team (Programmierpraktikum II)', 'Teamwork in Software Development (Programming Project II)');
INSERT INTO public.modul VALUES (10, '2020-04-06 00:26:34.889622', '2020-04-06 00:26:34.889622', '10 LP', 'Prof. Dr. Michael Leuschel, Prof. Dr. Jörg Rothe, Jun.-Prof. Dr. Dorothea Baumeister', 0, true, 'Bachelor-Studiengang Informatik', 'Theoretische Informatik', 'Theoretical Computer Science');
INSERT INTO public.modul VALUES (11, '2020-04-06 00:26:34.931587', '2020-04-06 00:26:34.931587', '10 LP', 'Die Dozenten der Mathematik (Festlegung jeweils 1 Jahr im Voraus in einer Sitzung der Wissenschaftlichen Einrichtung)', 1, true, 'Bachelor-Studiengang Informatik', 'Lineare Algebra I', 'Linear Algebra I');
INSERT INTO public.modul VALUES (12, '2020-04-06 00:26:34.972312', '2020-04-06 00:26:34.972312', '10 LP', 'Die Dozenten der Mathematik (Festlegung jeweils 1 Jahr im Voraus in einer Sitzung der Wissenschaftlichen Einrichtung)', 1, true, 'Bachelor-Studiengang Informatik', 'Analysis I', 'Calculus of One Variable');
INSERT INTO public.modul VALUES (13, '2020-04-06 00:26:35.012859', '2020-04-06 00:26:35.012859', '10 LP', 'Prof. Dr. Michael Schöttner', 6, true, 'Master-Studiengang Informatik', 'Verteilte Systeme', 'Distributed Systems');
INSERT INTO public.modul VALUES (14, '2020-04-06 00:26:35.041669', '2020-04-06 00:26:35.041669', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Michael Schöttner', 6, true, 'Master-Studiengang Informatik', 'Verteilte und Parallele Programmierung', 'Distributed and Parallel Programming');
INSERT INTO public.modul VALUES (15, '2020-04-06 00:26:35.073874', '2020-04-06 00:26:35.073874', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Michael Leuschel', 6, true, 'Master-Studiengang Informatik', 'Vertiefung Logische Programmierung', 'Advanced Logic Programming');
INSERT INTO public.modul VALUES (16, '2020-04-06 00:26:35.109008', '2020-04-06 00:26:35.109008', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Martin Mauve', 6, true, 'Master-Studiengang Informatik', 'Vertiefung Rechnernetze', 'Advanced Computer Networks');
INSERT INTO public.modul VALUES (17, '2020-04-06 00:26:35.138285', '2020-04-06 00:26:35.137309', '5 LP ab PO 2015, alte PO 7,5 LP', 'Priv.-Doz. Dr. Frank Gurski', 6, true, 'Master-Studiengang Informatik', 'Zeichnen von Graphen', 'Graph Drawing');
INSERT INTO public.modul VALUES (18, '2020-04-06 00:26:35.163659', '2020-04-06 00:26:35.163659', '20 LP', 'Die Dozenten der Informatik sowie gegebenenfalls der Mathematisch-Naturwissenschaftlichen Schwerpunktfächer', 7, true, 'Master-Studiengang Informatik', 'Projektarbeit', 'Individual Research Project');
INSERT INTO public.modul VALUES (19, '2020-04-06 00:26:35.187081', '2020-04-06 00:26:35.187081', '30 LP', 'Dozenten der Informatik sowie der als Schwerpunktfach wählbaren mathematisch-naturwissenschaftlichen Fächer', 8, true, 'Master-Studiengang Informatik', 'Master-Arbeit', 'Master’s Thesis');
INSERT INTO public.modul VALUES (20, '2020-04-06 00:26:35.212292', '2020-04-06 00:26:35.212292', '5 LP ab PO 2013, alte PO’s 7,5 LP (Bachelor, ohne Seminar)
7,5 LP (Master, inkl. Seminar)', 'Prof. Dr. Gunnar W. Klau', 4, true, 'Bachelor-Studiengang Informatik', 'Algorithmen in der Bioinformatik', 'Algorithms in Bioinformatics I');
INSERT INTO public.modul VALUES (21, '2020-04-06 00:26:35.250862', '2020-04-06 00:26:35.250862', '10 LP', 'Prof. Dr. Michael Schöttner', 4, true, 'Bachelor-Studiengang Informatik', 'Betriebssysteme und Systemprogrammierung', 'Operating Systems and System Programming');
INSERT INTO public.modul VALUES (22, '2020-04-06 00:26:35.277212', '2020-04-06 00:26:35.277212', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Prof. Dr. Michael Leuschel', 4, true, 'Bachelor-Studiengang Informatik', 'Compilerbau', 'Compiler Construction');
INSERT INTO public.modul VALUES (23, '2020-04-06 00:26:35.30546', '2020-04-06 00:26:35.30546', '10 LP ab PO 2013, alte PO’s 15 LP', 'Prof. Dr. Stefan Conrad', 4, true, 'Bachelor-Studiengang Informatik', 'Datenbanksysteme', 'Database Systems');
INSERT INTO public.modul VALUES (24, '2020-04-06 00:26:35.335713', '2020-04-06 00:26:35.335713', '5 LP', 'Prof. Dr. Martin Lercher, Dr. Mayo Röttger', 4, true, 'Bachelor-Studiengang Informatik', 'Einführung in die naturwissenschaftliche Informatik', 'Introduction to Scientific Computer Science');
INSERT INTO public.modul VALUES (25, '2020-04-06 00:26:35.36934', '2020-04-06 00:26:35.36934', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Prof. Dr. Egon Wanke', 4, true, 'Bachelor-Studiengang Informatik', 'Graphenalgorithmen I', 'Algorithms for Graphs I');
INSERT INTO public.modul VALUES (26, '2020-04-06 00:26:35.40252', '2020-04-06 00:26:35.40252', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Prof. Dr. Michael Schöttner', 4, true, 'Bachelor-Studiengang Informatik', 'Grundlagen Verteilter Systeme', 'Foundations of Distributed Systems');
INSERT INTO public.modul VALUES (27, '2020-04-06 00:26:35.453269', '2020-04-06 00:26:35.453269', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Prof. Dr. Michael Leuschel', 4, true, 'Bachelor-Studiengang Informatik', 'Introduction to Logic Programming (vormals Einführung in die logische Programmierung)', 'Introduction to Logic Programming');
INSERT INTO public.modul VALUES (28, '2020-04-06 00:26:35.495233', '2020-04-06 00:26:35.495233', '5 LP', 'Priv.-Doz. Dr. Frank Gurski', 4, true, 'Bachelor-Studiengang Informatik', 'Knapsack Problems', 'Knapsack Problems');
INSERT INTO public.modul VALUES (29, '2020-04-06 00:26:35.530367', '2020-04-06 00:26:35.530367', '10 LP ab PO 2013, alte PO’s 15 LP', 'Prof. Dr. Jörg Rothe', 4, true, 'Bachelor-Studiengang Informatik', 'Kryptokomplexität I', 'Cryptocomplexity I');
INSERT INTO public.modul VALUES (30, '2020-04-06 00:26:35.589898', '2020-04-06 00:26:35.589898', '10 LP ab PO 2013, alte PO’s 15 LP', 'Prof. Dr. Stefan Harmeling', 4, true, 'Bachelor-Studiengang Informatik', 'Machine Learning', 'Machine Learning');
INSERT INTO public.modul VALUES (31, '2020-04-06 00:26:35.629954', '2020-04-06 00:26:35.62898', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Jun.-Prof. Dr. Dorothea Baumeister', 4, true, 'Bachelor-Studiengang Informatik', 'Algorithmen zur Entscheidungsfindung unplugged', 'Decision-making Algorithms Unplugged');
INSERT INTO public.modul VALUES (32, '2020-04-06 00:26:35.663182', '2020-04-06 00:26:35.663182', '5 LP', 'Jun.-Prof. Dr. Dorothea Baumeister', 4, true, 'Bachelor-Studiengang Informatik', 'Matching', 'Matching');
INSERT INTO public.modul VALUES (33, '2020-04-06 00:26:35.700315', '2020-04-06 00:26:35.700315', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Priv.-Doz. Dr. Frank Gurski', 4, true, 'Bachelor-Studiengang Informatik', 'Networks, Crowds, and Markets', 'Networks, Crowds, and Markets');
INSERT INTO public.modul VALUES (34, '2020-04-06 00:26:35.73545', '2020-04-06 00:26:35.73545', '5 LP ab PO 2013, alte PO’s 7,5 L', 'Prof. Dr. Jörg Rothe', 4, true, 'Bachelor-Studiengang Informatik', 'Nichtkooperative Spieltheorie', 'Noncooperative Game Theory');
INSERT INTO public.modul VALUES (35, '2020-04-06 00:26:35.772534', '2020-04-06 00:26:35.772534', '10 LP ab PO 2013, alte PO’s 15 LP', 'Prof. Dr. Jörg Rothe', 4, true, 'Bachelor-Studiengang Informatik', 'Präferenzaggregation durch Wählen: Algorithmik und Komplexität', 'Preferene Aggregation by Voting: Algorithmics and Complexity');
INSERT INTO public.modul VALUES (36, '2020-04-06 00:26:35.815986', '2020-04-06 00:26:35.815986', '10 LP ab PO 2013, alte PO’s 15 LP', 'Jun.-Prof. Dr. Kalman Graffi, Prof. Dr. Martin Mauve', 4, true, 'Bachelor-Studiengang Informatik', 'Rechnernetze', 'Computer Networks');
INSERT INTO public.modul VALUES (37, '2020-04-06 00:26:35.860864', '2020-04-06 00:26:35.860864', '5 LP', 'Prof. Dr. Martin Lercher', 4, true, 'Bachelor-Studiengang Informatik', 'Statistische Datenanalyse', 'Statistical Data Analysis');
INSERT INTO public.modul VALUES (38, '2020-04-06 00:26:35.894046', '2020-04-06 00:26:35.894046', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Prof. Dr. Michael Leuschel', 4, true, 'Bachelor-Studiengang Informatik', 'Überblick Künstliche Intelligenz', 'Overview of Artificial Intelligence');
INSERT INTO public.modul VALUES (39, '2020-04-06 00:26:35.932107', '2020-04-06 00:26:35.932107', '10 LP ab PO 2013, alte PO’s 15 LP', 'Jun.-Prof. Dr. Dorothea Baumeister', 4, true, 'Bachelor-Studiengang Informatik', 'Verfahren zur kollektiven Entscheidungsfindung', 'Methods for Collective Decision-Making');
INSERT INTO public.modul VALUES (40, '2020-04-06 00:26:35.967756', '2020-04-06 00:26:35.967756', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Prof. Dr. Michael Leuschel, Jens Bendisposto, John Witulski', 4, true, 'Bachelor-Studiengang Informatik', 'Von NAND zu Tetris', 'From NAND to Tetris');
INSERT INTO public.modul VALUES (41, '2020-04-06 00:26:36.002933', '2020-04-06 00:26:36.002933', '15 LP', 'Dozenten der Informatik sowie der als Schwerpunktfach wählbaren mathematisch-naturwissenschaftlichen Fächer', 5, true, 'Bachelor-Studiengang Informatik', 'Bachelor-Arbeit', 'Bachelor Thesis');
INSERT INTO public.modul VALUES (42, '2020-04-06 00:26:36.030261', '2020-04-06 00:26:36.030261', '5 LP', 'Priv.-Doz. Dr. Frank Gurski', 4, true, 'Bachelor-Studiengang Informatik', 'Algorithmen zur Visualisierung von Graphen', 'Algorithms for the Visualization of Graphs');
INSERT INTO public.modul VALUES (43, '2020-04-06 00:26:36.064925', '2020-04-06 00:26:36.064925', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Prof. Dr. Jörg Rothe', 4, true, 'Bachelor-Studiengang Informatik', 'Algorithmische Eigenschaften von Wahlsystemen', 'Algorithmic Properties of Voting Systems I');
INSERT INTO public.modul VALUES (44, '2020-04-06 00:26:36.102512', '2020-04-06 00:26:36.102512', '5 LP für alle PO’s', 'Prof. Dr. Egon Wanke', 4, true, 'Bachelor-Studiengang Informatik', 'Algorithmische Geometrie', 'Computational Geometry');
INSERT INTO public.modul VALUES (45, '2020-04-06 00:26:36.128647', '2020-04-06 00:26:36.128647', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Prof. Dr. Egon Wanke', 4, true, 'Bachelor-Studiengang Informatik', 'Algorithmische Komplexitätstheorie', 'Algorithmic Complexity Theory');
INSERT INTO public.modul VALUES (46, '2020-04-06 00:26:36.167685', '2020-04-06 00:26:36.167685', '5 LP', 'Prof. Dr. Gunnar W. Klau', 4, true, 'Bachelor-Studiengang Informatik', 'Angewandte Algorithmik', 'Applied Algorithmics');
INSERT INTO public.modul VALUES (47, '2020-04-06 00:26:36.206722', '2020-04-06 00:26:36.206722', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Priv.-Doz. Dr. Frank Gurski', 4, true, 'Bachelor-Studiengang Informatik', 'Approximative Algorithmen', 'Approximate Algorithms');
INSERT INTO public.modul VALUES (48, '2020-04-06 00:26:36.247709', '2020-04-06 00:26:36.247709', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Prof. Dr. Michael Schöttner', 4, true, 'Bachelor-Studiengang Informatik', 'Betriebssysteme', 'Operating Systems');
INSERT INTO public.modul VALUES (49, '2020-04-06 00:26:36.275036', '2020-04-06 00:26:36.275036', '5 LP', 'Dr. Stefan Hoffmann', 6, true, 'Master-Studiengang Informatik', 'Algebraische und Strukturelle Graphentheorie', 'Algebraic and Structural Graph Theory');
INSERT INTO public.modul VALUES (50, '2020-04-06 00:26:36.306265', '2020-04-06 00:26:36.306265', '5 LP ab PO 2015, alte PO 7,5 LP', 'Jun.-Prof. Dr. Kálmán Graffi und Mitarbeiter', 6, true, 'Master-Studiengang Informatik', 'Android-Programmierung', 'Android Programming');
INSERT INTO public.modul VALUES (51, '2020-04-06 00:26:36.333134', '2020-04-06 00:26:36.333134', '5LP ab PO 2015, alte PO 7,5LP', 'Prof. Dr. Gunnar W. Klau, Prof. Dr. Martin Lercher', 6, true, 'Master-Studiengang Informatik', 'Angewandte Bioinformatik', 'Applied Bioinformatics');
INSERT INTO public.modul VALUES (52, '2020-04-06 00:26:36.360882', '2020-04-06 00:26:36.360882', '5 LP ab PO 2015, alte PO 7,5 LP', 'Priv.-Doz. Dr. Frank Gurski', 6, true, 'Master-Studiengang Informatik', 'Approximationsalgorithmen', 'Approximation Algorithms');
INSERT INTO public.modul VALUES (53, '2020-04-06 00:26:36.396104', '2020-04-06 00:26:36.396104', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Michael Schöttner', 6, true, 'Master-Studiengang Informatik', 'Betriebssystem-Entwicklung', 'Operating System Development');
INSERT INTO public.modul VALUES (54, '2020-04-06 00:26:36.422841', '2020-04-06 00:26:36.422841', '10LP', 'Prof. Dr. Michael Schöttner', 6, true, 'Master-Studiengang Informatik', 'Betriebssysteme Vertiefung', 'Advanced Operating Systems');
INSERT INTO public.modul VALUES (55, '2020-04-06 00:26:36.452781', '2020-04-06 00:26:36.452781', '5 LP for all PO''s', 'Dr. Radu Tudoran (Huawei, Munich)', 6, true, 'Master of Computer Science', 'Big Data Techniques, Technologies and Trends', 'Big Data Techniques, Technologies and Trends');
INSERT INTO public.modul VALUES (56, '2020-04-06 00:26:36.483966', '2020-04-06 00:26:36.483966', '5 LP', 'Prof. Dr. Michael Leuschel', 6, true, 'Master-Studiengang Informatik', 'Blockchain', 'Blockchain');
INSERT INTO public.modul VALUES (57, '2020-04-06 00:26:36.511805', '2020-04-06 00:26:36.511805', '10 LP ab PO 2015, alte PO 15 LP', 'Prof. Dr. Egon Wanke', 6, true, 'Master-Studiengang Informatik', 'Algorithmen für Ad-hoc-und Sensornetzwerke', 'Algorithms for Ad-hoc and Sensornetworks');
INSERT INTO public.modul VALUES (58, '2020-04-06 00:26:36.53913', '2020-04-06 00:26:36.53913', '10 LP ab PO 2015, alte PO 15 LP', 'Priv.-Doz. Dr. Frank Gurski', 6, true, 'Master-Studiengang Informatik', 'Algorithmen für planare Graphen', 'Algorithms for Planar Graphs');
INSERT INTO public.modul VALUES (59, '2020-04-06 00:26:36.567941', '2020-04-06 00:26:36.567941', '5LP ab PO 2015, alte PO 7,5LP', 'Priv.-Doz. Dr. Frank Gurski', 6, true, 'Master-Studiengang Informatik', 'Algorithmen für schwere Probleme', 'Algorithmics for Hard Problems');
INSERT INTO public.modul VALUES (60, '2020-04-06 00:26:36.597727', '2020-04-06 00:26:36.597727', '5LP', 'Prof. Dr. Gunnar W. Klau', 6, true, 'Master-Studiengang Informatik', 'Algorithmen in der Bioinformatik II', 'Algorithms in Bioinformatics II');
INSERT INTO public.modul VALUES (61, '2020-04-06 00:26:36.625095', '2020-04-06 00:26:36.625095', '5LP', 'Prof. Dr. Gunnar W. Klau', 6, true, 'Master-Studiengang Informatik', 'Algorithmen in der Cheminformatik', 'Algorithms in Cheminformatics');
INSERT INTO public.modul VALUES (62, '2020-04-06 00:26:36.652931', '2020-04-06 00:26:36.652931', '10 LP ab PO 2015, alte PO 15 LP', 'Prof. Dr. Jörg Rothe', 6, true, 'Master-Studiengang Informatik', 'Algorithmische Spieltheorie', 'Algorithmic Game Theory');
INSERT INTO public.modul VALUES (63, '2020-04-06 00:26:36.686242', '2020-04-06 00:26:36.686242', '10LP', 'Prof. Dr. Tobias Marschal', 6, true, 'Master-Studiengang Informatik', 'Algorithms for Sequence Analysis', 'Algorithms for Sequence Analysis');
INSERT INTO public.modul VALUES (64, '2020-04-06 00:26:36.71064', '2020-04-06 00:26:36.71064', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Jörg Rothe', 6, true, 'Master-Studiengang Informatik', 'Algorithmische Eigenschaften von Wahlsystemen II', 'Algorithmic Properties of Voting Systems II');
INSERT INTO public.modul VALUES (65, '2020-04-06 00:26:36.742851', '2020-04-06 00:26:36.742851', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Jörg Rothe', 6, true, 'Master-Studiengang Informatik', 'Cake-cutting Algorithms', 'Cake-cutting Algorithms');
INSERT INTO public.modul VALUES (66, '2020-04-06 00:26:36.773618', '2020-04-06 00:26:36.772639', '5 LP ab PO 2015, alte PO 7,5 LP', 'PD Dr. Dr.-Ing. Wilfried Linder', 6, true, 'Master-Studiengang Informatik', 'Einführung in die Geoinformatik', 'Introduction to Geoinformatics');
INSERT INTO public.modul VALUES (67, '2020-04-06 00:26:36.799965', '2020-04-06 00:26:36.799965', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Martin Lercher, Dr. Pablo Verde', 6, true, 'Master-Studiengang Informatik', 'Einführung in die statistische Analyse mittels Computersimulationen', 'Introduction to Statistical Analysis through Computer Simulations');
INSERT INTO public.modul VALUES (68, '2020-04-06 00:26:36.824364', '2020-04-06 00:26:36.824364', '5 LP', 'Dr. Stefan Hoffmann', 6, true, 'Master-Studiengang Informatik', 'Entwurfs- und Analysetechniken für Algorithmen', 'Design Principles and Analytic Methods for Algorithms');
INSERT INTO public.modul VALUES (69, '2020-04-06 00:26:36.845835', '2020-04-06 00:26:36.845835', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Michael Leuschel, Jens Bendisposto', 6, true, 'Master-Studiengang Informatik', 'Funktionale Programmierung', 'Functional Programming');
INSERT INTO public.modul VALUES (70, '2020-04-06 00:26:36.876131', '2020-04-06 00:26:36.876131', '5 LP', 'Dr. Ludmila Himmelspach', 6, true, 'Master-Studiengang Informatik', 'Fuzzy-Clusteranalyse', 'Fuzzy Cluster Analysis');
INSERT INTO public.modul VALUES (71, '2020-04-06 00:26:36.902991', '2020-04-06 00:26:36.902991', '5 LP', 'Dr. Ludmila Himmelspach', 6, true, 'Master-Studiengang Informatik', 'Fuzzy Systeme', 'Fuzzy Systems');
INSERT INTO public.modul VALUES (72, '2020-04-06 00:26:36.929848', '2020-04-06 00:26:36.929848', '10 LP', 'Prof. Dr. Jörg Rothe', 6, true, 'Master-Studiengang Informatik', 'Gerechte Aufteilungsverfahren', 'Fair Division');
INSERT INTO public.modul VALUES (73, '2020-04-06 00:26:36.955478', '2020-04-06 00:26:36.955478', '10 LP ab PO 2015, alte PO 15 LP', 'Prof. Dr. Egon Wanke', 6, true, 'Master-Studiengang Informatik', 'Graphenalgorithmen II', 'Algorithms for Graphs II');
INSERT INTO public.modul VALUES (74, '2020-04-06 00:26:36.984744', '2020-04-06 00:26:36.984744', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Stefan Harmeling', 6, true, 'Master-Studiengang Informatik', 'Causality', 'Causality');
INSERT INTO public.modul VALUES (75, '2020-04-06 00:26:37.036469', '2020-04-06 00:26:37.036469', '5 LP', 'Dr. Deniz Sezer', 6, true, 'Master-Studiengang Informatik', 'Computational Systems Biology', 'Computational Systems Biology');
INSERT INTO public.modul VALUES (76, '2020-04-06 00:26:37.076061', '2020-04-06 00:26:37.076061', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Stefan Harmeling', 6, true, 'Master-Studiengang Informatik', 'Computer Vision', 'Computer Vision');
INSERT INTO public.modul VALUES (77, '2020-04-06 00:26:37.108775', '2020-04-06 00:26:37.108775', '5 LP', 'Prof. Dr. Stefan Dietze', 6, true, 'Master-Studiengang Informatik', 'Data & KnowledgeEngineering (DKE)', 'Data & KnowledgeEngineering (DKE)');
INSERT INTO public.modul VALUES (78, '2020-04-06 00:26:37.137077', '2020-04-06 00:26:37.137077', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Stefan Conrad', 6, true, 'Master-Studiengang Informatik', 'Data Warehouses', 'Data Warehouses');
INSERT INTO public.modul VALUES (79, '2020-04-06 00:26:37.163696', '2020-04-06 00:26:37.163696', '5 LP', 'Prof. Dr. Stefan Harmeling', 6, true, 'Master-Studiengang Informatik', 'Deep Learning (vormals Machine Learning – Deep Learning)', 'Deep Learning (formerly Machine Learning – Deep Learning)');
INSERT INTO public.modul VALUES (80, '2020-04-06 00:26:37.191022', '2020-04-06 00:26:37.191022', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Michael Leuschel', 6, true, 'Master-Studiengang Informatik', 'Dynamische Programmiersprachen', 'Dynamic Programming Languages');
INSERT INTO public.modul VALUES (81, '2020-04-06 00:26:37.221341', '2020-04-06 00:26:37.221319', '5 LP ab PO 2015, alte PO 7,5 LP', 'Priv.-Doz. Dr. Frank Gurski', 6, true, 'Master-Studiengang Informatik', 'Effiziente Algorithmen', 'Efficient Algorithms');
INSERT INTO public.modul VALUES (82, '2020-04-06 00:26:37.253528', '2020-04-06 00:26:37.253528', '5 LP', 'Prof. Dr. Gunnar W. Klau', 6, true, 'Master-Studiengang Informatik', 'Introduction to Linear Optimization (vormals Grundlagen der Linearen Optimierung)', 'Introduction to Linear Optimization');
INSERT INTO public.modul VALUES (83, '2020-04-06 00:26:37.28086', '2020-04-06 00:26:37.28086', '5 LP', 'Prof. Dr. Stefan Harmeling', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar Information Theory, Inference, and Learning Algorithms', 'Master’s Seminar Information Theory, Inference, and Learning Algorithms');
INSERT INTO public.modul VALUES (84, '2020-04-06 00:26:37.311114', '2020-04-06 00:26:37.311114', '5 LP', 'Prof. Dr. Egon Wanke', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar über Algorithmen für graphentheoretische Konzepte in der Informatik', 'Master’s Seminar on Algorithms for Graph Theoretical Concepts in Computer Science');
INSERT INTO public.modul VALUES (85, '2020-04-06 00:26:37.34332', '2020-04-06 00:26:37.34332', '5 LP', 'Priv.-Doz. Dr. Frank Gurski', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar über Algorithmen für perfekte Graphen', 'Master’s Seminar on Algorithms for Perfect Graphs');
INSERT INTO public.modul VALUES (86, '2020-04-06 00:26:37.371622', '2020-04-06 00:26:37.371622', '5 LP', 'Priv.-Doz. Dr. Frank Gurski', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar über Anwendungen von gerichteten Netzwerkstrukturen', 'Master’s Seminar on Applications for Structures of Directed Networks');
INSERT INTO public.modul VALUES (87, '2020-04-06 00:26:37.399923', '2020-04-06 00:26:37.399923', '5 LP', 'Priv.-Doz. Dr. Frank Gurski', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar über Graphparameter für gerichtete Graphen', 'Master’s Seminar on Graph Parameters for Directed Graphs');
INSERT INTO public.modul VALUES (88, '2020-04-06 00:26:37.429712', '2020-04-06 00:26:37.429712', '5 LP', 'Prof. Dr. Jörg Rothe', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar über Kollektive Entscheidungsfindung', 'Master’s Seminar on Collective Decision Making');
INSERT INTO public.modul VALUES (89, '2020-04-06 00:26:37.472227', '2020-04-06 00:26:37.472227', '5 LP', 'Prof. Dr. Martin Lercher', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar über Modellierung biologischer Zellen', 'Master’s Seminar on Modelling Biological Cells');
INSERT INTO public.modul VALUES (90, '2020-04-06 00:26:37.537652', '2020-04-06 00:26:37.537652', '5 LP', 'Priv.-Doz. Dr. Frank Gurski', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar über NP-Schwere Probleme', 'Master’s Seminar on NP-hard problems');
INSERT INTO public.modul VALUES (91, '2020-04-06 00:26:37.573351', '2020-04-06 00:26:37.573351', '5 LP ab PO 2015, alte PO 7,5 LP', 'Jun.-Prof. Dr. Dorothea Baumeister', 6, true, 'Master-Studiengang Informatik', 'Judgment Aggregation', 'Judgment Aggregation');
INSERT INTO public.modul VALUES (92, '2020-04-06 00:26:37.609516', '2020-04-06 00:26:37.609516', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Stefan Conrad', 6, true, 'Master-Studiengang Informatik', 'Knowledge Discovery in Databases', 'Knowledge Discovery in Databases');
INSERT INTO public.modul VALUES (93, '2020-04-06 00:26:37.643726', '2020-04-06 00:26:37.643726', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Stefan Conrad', 6, true, 'Master-Studiengang Informatik', 'Knowledge Discovery in Databases - Ausgewählte Themen', 'Knowledge Discovery in Databases - Selected Topics');
INSERT INTO public.modul VALUES (94, '2020-04-06 00:26:37.680815', '2020-04-06 00:26:37.680815', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Jörg Rothe', 6, true, 'Master-Studiengang Informatik', 'Kooperative Spieltheorie', 'Cooperative Game Theory');
INSERT INTO public.modul VALUES (95, '2020-04-06 00:26:37.708137', '2020-04-06 00:26:37.708137', '10LP ab PO 2015, alte PO 15LP', 'Prof. Dr. Jörg Rothe', 6, true, 'Master-Studiengang Informatik', 'Kryptokomplexität II', 'Cryptocomplexity II');
INSERT INTO public.modul VALUES (96, '2020-04-06 00:26:37.734248', '2020-04-06 00:26:37.734248', '5 LP', 'Prof. Dr. Stefan Dietze', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar Advances in Data Science', 'Master’s Seminar Advances in Data Science');
INSERT INTO public.modul VALUES (97, '2020-04-06 00:26:37.761575', '2020-04-06 00:26:37.761575', '5 LP', 'Prof. Dr. Michael Schöttner', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar Big-Data-Systeme und Cloud-Computing', 'Master’s Seminar on Big-Data Systems and Cloud Computing');
INSERT INTO public.modul VALUES (98, '2020-04-06 00:26:37.787429', '2020-04-06 00:26:37.787429', '5 LP', 'Prof. Dr. Stefan Conrad', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar Datenbanken und Informationssysteme', 'Master’s Seminar Databases and Information Systems');
INSERT INTO public.modul VALUES (99, '2020-04-06 00:26:37.815262', '2020-04-06 00:26:37.815262', '5 LP', 'Priv.-Doz. Dr. Frank Gurski', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar über weitebeschränkte gerichtete Graphklassen', 'Master’s Seminar on Bounded Width Directed Graph Classes');
INSERT INTO public.modul VALUES (100, '2020-04-06 00:26:37.850394', '2020-04-06 00:26:37.850394', '10 LP', 'Prof. Dr. Markus Kollmann', 6, true, 'Master-Studiengang Informatik', 'Methods of Artificial Intelligence in Life Sciences', 'Methods of Artificial Intelligence in Life Sciences');
INSERT INTO public.modul VALUES (101, '2020-04-06 00:26:37.880651', '2020-04-06 00:26:37.880651', '5LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Martin Mauve, Jun.-Prof. Dr.-Ing. Kalman Graffi', 6, true, 'Master-Studiengang Informatik', 'Mobilkommunikation', 'Mobile Communications');
INSERT INTO public.modul VALUES (102, '2020-04-06 00:26:37.90946', '2020-04-06 00:26:37.90946', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Michael Leuschel', 6, true, 'Master-Studiengang Informatik', 'Model Checking', 'Model Checking');
INSERT INTO public.modul VALUES (103, '2020-04-06 00:26:37.941084', '2020-04-06 00:26:37.941084', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Martin Lercher', 6, true, 'Master-Studiengang Informatik', 'Modellierung metabolischer Netzwerke', 'Modelling Metabolic Networks');
INSERT INTO public.modul VALUES (104, '2020-04-06 00:26:37.964504', '2020-04-06 00:26:37.964504', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Stefan Conrad', 6, true, 'Master-Studiengang Informatik', 'Multimedia-Datenbanksysteme', 'Multimedia-Databasesystems');
INSERT INTO public.modul VALUES (105, '2020-04-06 00:26:37.98835', '2020-04-06 00:26:37.98835', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Stefan Conrad', 6, true, 'Master-Studiengang Informatik', 'Natural Language Processing (vorm. Information Retrieval und Natural Language Processing)', 'Natural Language Processing (formerly Information Retrieval and Natural Language Processing)');
INSERT INTO public.modul VALUES (106, '2020-04-06 00:26:38.01078', '2020-04-06 00:26:38.01078', '10 LP ab PO 2015, alte PO 15 LP', 'Prof. Dr. Martin Mauve', 6, true, 'Master-StudiengangInformatik', 'Netzwerksicherheit', 'Security in Networked Systems');
INSERT INTO public.modul VALUES (107, '2020-04-06 00:26:38.035178', '2020-04-06 00:26:38.035178', '1 LP', 'Prof. Dr. Martin Lercher', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar zu aktuellen Themen der theoretischen und computergestützten Biologie', 'Master’s Seminar on Current Topics in Theoretical and Computational Biology');
INSERT INTO public.modul VALUES (108, '2020-04-06 00:26:38.058599', '2020-04-06 00:26:38.058599', '5 LP', 'Dr. Jens Bendisposto', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar zu Analyse von Software-Systemen', 'Master’s Seminar on Analysis of Software Systems');
INSERT INTO public.modul VALUES (109, '2020-04-06 00:26:38.076167', '2020-04-06 00:26:38.076167', '5 LP', 'Jun.-Prof. Dr. Dorothea Baumeister', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar zu Informatik unplugged', 'Master’s Seminar on Computer Science Unplugged');
INSERT INTO public.modul VALUES (110, '2020-04-06 00:26:38.102517', '2020-04-06 00:26:38.102517', '5 LP', 'Prof. Dr. Gunnar W. Klau', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar zu Kombinatorische Optimierung in der Bioinformatik', 'Master’s Seminar on Combinatorial Optimization in Bioinformatics');
INSERT INTO public.modul VALUES (111, '2020-04-06 00:26:38.131673', '2020-04-06 00:26:38.131673', '5 LP', 'Prof. Dr. Stefan Harmeling', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar zu Machine Learning', 'Master’s Seminar on Machine Learning');
INSERT INTO public.modul VALUES (112, '2020-04-06 00:26:38.155094', '2020-04-06 00:26:38.155094', '5 LP', 'Prof. Dr. Gunnar W. Klau', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar zu Reproduzierbarkeit bioinformatischer Forschungsergebnisse', 'Master’s Seminar on Reproducibility in Bioinformatics Research');
INSERT INTO public.modul VALUES (113, '2020-04-06 00:26:38.179493', '2020-04-06 00:26:38.179493', '5 LP', 'Prof. Dr. Michael Schöttner', 6, true, 'Master-Studiengang Informatik', 'Master-Seminar zu Verteilte und Parallele Systeme', 'Master’s Seminar on Distributed and Parallel Systems');
INSERT INTO public.modul VALUES (114, '2020-04-06 00:26:38.206818', '2020-04-06 00:26:38.206818', '10LP ab PO 2015, alte PO 15 LP', 'Jun.-Prof. Dr. Dorothea Baumeister', 6, true, 'Master-Studiengang Informatik', 'Mathematische Hintergründe der Wahlmanipulation', 'Mathematical Background of Manipulation');
INSERT INTO public.modul VALUES (115, '2020-04-06 00:26:38.237072', '2020-04-06 00:26:38.237072', '5 LP ab PO 2015, alte PO 7,5 LP', 'Jun.-Prof. Dr.-Ing. Kalman Graffi', 6, true, 'Master-Studiengang Informatik', 'Opportunistische und P2P-basierte Netzwerke', 'Opportunistic and P2P Networks');
INSERT INTO public.modul VALUES (116, '2020-04-06 00:26:38.256591', '2020-04-06 00:26:38.256591', '5 LP ab PO 2015, alte PO 7,5 LP', 'Dr. Stephan Raub', 6, true, 'Master-Studiengang Informatik', 'Paralleles Rechnen mit Grafikkarten', 'Parallel Computing on Graphic Cards');
INSERT INTO public.modul VALUES (117, '2020-04-06 00:26:38.280012', '2020-04-06 00:26:38.279037', '5 LP ab PO 2015, alte PO 7,5 LP', 'Jun.-Prof. Dr.-Ing. Kalman Graffi', 6, true, 'Master-Studiengang Informatik', 'Peer-to-Peer Systeme', 'Peer-to-Peer Systems');
INSERT INTO public.modul VALUES (118, '2020-04-06 00:26:38.306363', '2020-04-06 00:26:38.306363', '5 LP', 'Prof. Dr. Michael Leuschel', 6, true, 'Master-Studiengang Informatik', 'Programmsynthese und Transformation', 'Programmsynthese und Transformation');
INSERT INTO public.modul VALUES (119, '2020-04-06 00:26:38.338099', '2020-04-06 00:26:38.338099', '5 LP', 'Prof. Dr. Stefan Harmeling', 6, true, 'Master-Studiengang Informatik', 'Reinforcement Learning', 'Reinforcement Learning');
INSERT INTO public.modul VALUES (120, '2020-04-06 00:26:38.365936', '2020-04-06 00:26:38.365936', '5 LP', 'Prof. Dr. Stefan Conrad', 6, true, 'Master-Studiengang Informatik', 'Relational Databases and Data Analysis', 'Relational Databases and Data Analysis');
INSERT INTO public.modul VALUES (121, '2020-04-06 00:26:38.38643', '2020-04-06 00:26:38.38643', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Michael Leuschel', 6, true, 'Master-Studiengang Informatik', 'Sicherheitskritische Systeme', 'Safety-Critical Systems');
INSERT INTO public.modul VALUES (122, '2020-04-06 00:26:38.409937', '2020-04-06 00:26:38.409937', '5 LP', 'Prof. Dr. Milica Gasic', 6, true, 'Master-Studiengang Informatik', 'Spoken Dialogue Systems', 'Spoken Dialogue Systems');
INSERT INTO public.modul VALUES (123, '2020-04-06 00:26:38.442143', '2020-04-06 00:26:38.442143', '5 LP ab PO 2015, alte PO 7,5 LP', 'Prof. Dr. Stefan Conrad', 6, true, 'Master-Studiengang Informatik', 'Transaktionsverwaltung', 'Transactionmanagement');


--
-- Data for Name: veranstaltung; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.veranstaltung VALUES (1, 'Jedes Wintersemester', 'Dieses Modul vermittelt grundlegende Programmierkenntnisse in einer objektorientierten Programmiersprache. Darüber hinaus werden einführend Aspekte von Algorithmen und Datenstrukturen behandelt. Es wird keine Programmiererfahrung vorausgesetzt.

* Grundlegende Begriffe der Informatik
* Primitive Datentypen und Variablen
* Kontrollstrukturen
* Eigene Datentypen (Klassen) und Arrays
* Programmstrukturen im Speicher (Heap, Stack)
* Konzepte der Objektorientierung (Polymorphie, Schnittstellen)
* Rekursion
* Fehlerbehandlung
* Dynamische Datenstrukturen (Listen, Binärbäume, Hashing)
* Suchen und Sortieren (ausgewählte Algorithmen, u.a. binäre Suche, BubbleSort, QuickSort)
* Datenströme (Standard-Eingabe und -Ausgabe, einfache 2D-Grafik, Dateien)', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,
    
* Begriffe der Informatik und der Programmierung zu nennen und zu erläutern
* einfache Algorithmen (iterativ und rekursiv) zu verstehen, deren Ablauf zu beschreiben, sowie selbst zu erstellen
* eigene Datentypen zu konzipieren und anzuwenden
* einfache objektorientierte Programme mit Polymorphie, Vererbung und Schnittstellen zu entwickeln
* die behandelten dynamischen Datenstrukturen anzuwenden', '* R. Schiedermeier, „Programmieren mit Java“, Pearson Studium, 2010.
* C. Ullenboom, „Java ist auch eine Insel“, 11. Aufl., 2014
* R. Sedgewick & K. Wayne, „Introduction to Programming in Java“, Addison-Wesley, 2007.', '', '* Pflichtbereich
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik
* Modul D1 im Studienbereich Informatik (D) im Integrativen Bachelor-Studiengang Sprachtechnologie und Informationswissenschaft', '* aktive und erfolgreiche Mitwirkung in den theoretischen und praktischen Übungen
* schriftliche Prüfung (Klausur, i.d.R. 90 Minuten)', '10 LP', 'Programmierung', 'Keine', 1);
INSERT INTO public.veranstaltung VALUES (2, 'Jedes Semester', 'Differentialrechnung mehrerer Veränderlicher, Mittelwertsätze und Taylor-Formel in mehreren Veränderlichen, Satz über implizite Funktionen, Extremwerte mit und ohne Nebenbedingungen, normierte und metrische Räume, Banachscher Fixpunktsatz, gewöhnliche Differentialgleichungen, Existenz- und Eindeutigkeitssätze, spezielle Lösungsmethoden, lineare Differentialgleichungen, Systeme mit konstanten Koeffizienten, Stabilität', 'Die Studierenden bewältigen die Begriffsbildungen und grundlegenden Resultate der mehrdimensionalen Analysis sowie der gewöhnlichen Differentialgleichungen. Sie argumentieren anhand der Definitionen und Sätze und können intuitive Vorstellungen mathematisch präzisieren. Sie sind in der Lage, Übungsaufgaben selbstständig zu lösen und diese Lösungen in den Übungsgruppen zu präsentieren sowie kritisch zu diskutieren. Sie verfügen über Methoden der systematischen und effizienten Wissensaneignung.', '* H. Amann, J. Escher: Analysis II.
* R. Denk, R. Racke: Kompendium der Analysis. Band 1.', '', '* Bachelor-Studiengang Informatik
* Bachelor-Studiengang Mathematik
* Bachelor-Studiengang Physik', '* Erfolgreiche Teilnahme an den Übungsgruppen
* Schriftliche Prüfung (Anmeldung in der Vorlesung)
* Die Klausuren zu beiden Lehrveranstaltungen müssen bestanden werden; das Modul wird nicht benotet.', '10 LP', 'Analysis II', 'Voraussetzungen nach Prüfungsordnungen: Keine; Empfohlene Voraussetzung: Analysis I', 2);
INSERT INTO public.veranstaltung VALUES (3, 'Jedes Wintersemester', 'Interpolation und Approximation, Quadraturverfahren, direkte Verfahren zur Lösung linearer Gleichungssysteme, Iterative Verfahren zur Lösung nichtlinearer Gleichungssysteme, Fehleranalyse', 'Die Studierenden bewältigen die Begriffsbildungen und grundlegenden Resultate der numerischen Mathematik. Sie argumentieren anhand der Definitionen und Sätze und können intuitive Vorstellungen mathematisch präzisieren. Sie sind in der Lage, Übungsaufgaben selbstständig zu lösen und diese Lösungen in den Übungsgruppen zu präsentieren sowie kritisch zu diskutieren. Sie können abstrakte Algorithmen zu einem konkreten Programm umsetzen. Sie verfügen über Methoden der systematischen und effizienten Wissensaneignung.', '* P. Deuflhard, A.Hohmann: Numerische Mathematik 1.
* R. Freund, R. Hoppe: Stoer/Bulirsch: Numerische Mathematik 1.', '', '* Bachelor-Studiengang Informatik
* Bachelor-Studiengang Mathematik', '* Erfolgreiche Teilnahme an den Übungsgruppen
* Schriftliche Prüfung (Anmeldung in der Vorlesung)
* Die Klausur muss bestanden werden; das Modul wird nicht benotet.', '10 LP', 'Numerik I', 'Voraussetzungen nach Prüfungsordnungen: Keine; Empfohlene Voraussetzung: Analysis I-II, Lineare Algebra I, Computergestützte Mathematik zur linearen Algebra', 3);
INSERT INTO public.veranstaltung VALUES (4, 'Jedes Wintersemester', 'Grundlagen der Wahrscheinlichkeitsrechnung, Modelle für Zufallsexperimente, Anwendungsbeispiele in der Informatik und den Naturwissenschaften, Unabhängigkeit von Zufallsvariablen, erzeugende Funktionen, Gesetz der großen Zahlen, zentraler Grenzwertsatz, Maximum-Likelihood-Schätzer, Signifikanztests, lineare Regression', 'Die Studierenden bewältigen die Begriffsbildungen und grundlegenden Resultate der Stochastik. Sie argumentieren anhand der Definitionen und Sätze und können intuitive Vorstellungen mathematisch präzisieren. Sie sind in der Lage, Übungsaufgaben selbstständig zu lösen und diese Lösungen in den Übungsgruppen zu präsentieren sowie kritisch zu diskutieren. Sie verfügen über Methoden der systematischen und effizienten Wissensaneignung.', '* N. Henze: Stochastik für Einsteiger.
* U. Krengel: Einführung in die Wahrscheinlichkeitstheorie und Statistik.', '', '* Bachelor-Studiengang Informatik
* Bachelor-Studiengang Mathematik', '* Erfolgreiche Teilnahme an den Übungsgruppen
* Schriftliche Prüfung (Anmeldung in der Vorlesung)
* Die Klausur muss bestanden werden; das Modul wird nicht benotet.', '10 LP', 'Stochastik', 'Voraussetzungen nach Prüfungsordnungen: Keine; Empfohlene Voraussetzung: Analysis I, Lineare Algebra I', 3);
INSERT INTO public.veranstaltung VALUES (5, 'regelmäßige Angebote der Universität', 'Die Studierenden sollen in diesem Modul die Grundlagen von wissenschaftlichen Arbeitstechniken bzw. die professionelle Präsentation von Ergebnissen erlernen.
Die Studierenden können weiterhin im Rahmen eines Industriepraktikums im Umfeld der Informatik ihre theoretischen Kenntnisse praktisch anwenden und vertiefen. Ferner lernen Sie die betrieblichen Abläufe kennen und können ihre sozialen Kompetenzen weiter verbessern.', '', '', '', 'Bachelor-Studiengang Informatik', 'Erfolgreiche Teilnahme an den ausgewählten Veranstaltungen; der Erwerb von Leistungspunkten richtet sich nach den jeweiligen Regelungen für die besuchten Veranstaltungen. Bei Praktika richtet sich die Vergabe von Leistungspunkten nach der Dauer des Praktikums: 1 LP entspricht dabei in der Regel 28 Stunden Praktikum, zusätzlich ca. 2 Stunden Nachbereitung.', '5 LP', 'Praxis- und Berufsorientierung', 'Keine', 4);
INSERT INTO public.veranstaltung VALUES (110, 'I.d.R. jährlich', '* Methoden und Metriken zur Bewertung der Qualität von Software
* Analyse und Bewertung von historischen Daten z.B. aus Versionskontrollsystemen
* Analyse und Bewertung von technischen Schulden einer Software', 'Studierende haben nach erfolgreichem Abschluss dieses Moduls Kenntnisse über gängige Methoden, Metriken und Werkzeuge zur Analyse von großen Softwaresystemen.', 'Wird zu Beginn der Veranstaltung bekanntgegeben.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Aktive und erfolgreiche Mitwirkung am Seminar
* Abschlusstest zum Ende der Vorlesungszeit', '5 LP', 'Master-Seminar zu Analyse von Software-Systemen', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 108);
INSERT INTO public.veranstaltung VALUES (6, 'Jedes Wintersemester', 'Dieses Modul vermittelt grundlegende Kenntnisse aus folgenden Bereichen.
    
* Algorithmen und ihre formalen Grundlagen
* Rechenmodelle, Effizienzmaße
* Sortierverfahren (Quicksort, Heapsort, Mergesort, ...)
* Aufwandsabschätzung im Mittel
* Suchstrategien (Binärsuche, Interpolationsuche, Textsuche, ...)
* Dictionaries (offene Hashverfahren, dynamische Hashverfahren)
* Suchbäume (AVL-Bäume, B-Bäume, Splay-Trees, ...)
* Vorrangswarteschlangen (Heaps, Binominal Queues, Fibonacci-Heaps, ...)
* Amortisierte Laufzeitanalysen
* Einführung in Graphenalgorithmen (Tiefensuche, Breitensuche, Zusammenhangsprobleme, ...)', 'Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein Basisverständnis der wichtigsten Grundlagen über Algorithmen. Sie haben die Fähigkeit zur Problemspezifikation und algorithmischen Problembearbeitung erworben.', '* Thomas Ottmann, Peter Widmayer: Algorithmen und Datenstrukturen, Spektrum Akademischer Verlag, 5. Auflage, 2012
* Richard Johnsonbaugh, Marcus Schäfer: Algorithms, Pearson Education, 2004
* Jon Kleinberg, Eva Tardos: Algorithm Design, Addison Wesley, 2006', '', '* Pflichtbereich
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* aktive Mitarbeit in den Übungen
* Abgabe der Hausaufgaben
* schriftliche Klausur (i.d.R. 90 Minuten) oder mündliche Prüfung am Ende des Semesters', '10 LP', 'Algorithmen und Datenstrukturen', 'Keine', 5);
INSERT INTO public.veranstaltung VALUES (7, 'Jedes Sommersemester', 'Die Vorlesung gibt einen Überblick über verschiedene Themen der praktischen Informatik. In der Übung werden diese Inhalte eingeübt.

* Aufbau und grundlegende Funktionsweise des Internets
* Socketprogrammierung
* Speicherverwaltung (virtueller Speicher, Heap, Stack)
* Grundlegende Funktionsweise von Dateisystemen
* Nebenläufigkeit (Threads, Scheduling, Synchronisierung)
* Entity-Relationship-Modellierung
* Relationenmodell
* Grundlagen von SQL', 'Nach erfolgreicher Teilnahme an den Veranstaltungen dieses Moduls können die Studierenden
    
* die wichtigsten Komponenten des Internets benennen,
* sowie deren Beziehungen untereinander und Ihre grundsätzliche Funktion beschreiben,
* einfache Programme mit Netzwerknutzung schreiben,
* grundlegende Funktionen eines Betriebssystems benennen und erläutern,
* einfache nebenläufige Programme schreiben,
* die Aufgaben eines Datenbanksystems benennen,
* Datenbanken in Form von ER Modellen darstellen und
* einfache Datenbankanfragen in SQL schreiben.', '* J. F. Kurose, K. W. Ross: Computer Networking – A Top-Down Approach Featuring the Internet; 6th Edition; Pearson, 2012
* A. Heuer, G. Saake, K.-U. Sattler: Datenbanken – Konzepte und Sprachen, 5. Aufl., mitp-Verlag, Bonn, 2013
* A. Tanenbaum: Modern Operating Systems, 4. Aufl., Prentice Hall, 2014.
* W. Stallings, Operating Systems: Internals and Design Principles, Prentice Hall, 8. Aufl., 2014.', '', '* Pflichtbereich
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* aktive und erfolgreiche Teilnahme an den Übungen
* schriftliche Prüfung (i.d.R. 60 Minuten) am Ende des Semesters', '5 LP', 'Einführung Rechnernetze, Datenbanken und Betriebssysteme', 'Keine', 6);
INSERT INTO public.veranstaltung VALUES (8, 'Die Vorlesung „Assemblerprogrammierung“ und die praktische Übung werden in der vorlesungsfreien Zeit im Anschluss an das Sommersemester angeboten.', 'Die Vorlesung „Hardwarenahe Programmierung“ und die praktische Übung (4 LP) vermitteln Kenntnisse in der Assemblerprogrammierung sowie einer systemnahen imperativen Programmiersprache. Es wird vorausgesetzt, dass die Teilnehmer übliche Programmelemente, wie Variablen, Verzweigungen, Schleifen und Funktionen sicher verwenden können.

* Grundlagen der Assembler Programmierung
* Programmierung in einer systemnahen imperativen Programmiersprache
* dynamische Speicherverwaltung inkl. Identifizierung von Speicherlecks
* ein zur Programmiersprache passendes Build-Tool sowie eine geeignete Testumgebung', 'Nach erfolgreicher Teilnahme an den Veranstaltungen dieses Moduls können die Studierenden

* wiedergeben wie ein moderner Computer aufgebaut ist,
* die verschiedenen Schichten einer Rechnerarchitektur beschreiben und dabei auf ihre Verbindung untereinander eingehen,
* erklären, wie eine CPU/ALU aus elementaren digitalen Schaltungen konstruiert wird,
* zentrale Funktionen eines Betriebssystems identifizieren und ihre Arbeitsweise an einfachen Beispielen darstellen,
* einfache digitale Schaltungen entwerfen und optimieren,
* einfache Assemblerprogramme in x86 Assembler entwickeln,
* sich selbstständig Kenntnisse in einer neuen Programmiersprache aneignen,
* Programme in der Programmiersprache C unter Berücksichtigung dynamischer Speicherverwaltung entwickeln und
* Werkzeuge für typische Aufgaben bei der Programmierung (Speicherverwaltung, Build-Prozesse, Tests) verwenden.', 'Die primären Lehrbücher zu den verschiedenen Bestandteilen dieses Moduls sind:
    
* Andrew S. Tanenbaum and Todd Austin: Structured Computer Organization; 6th Edition; Pearson; 2013. Prentice Hall; 5th Edition; 2006
* David Griffiths and Dawn Griffiths (dt. Lars Schulten): C von Kopf bis Fuß; O‘Reilly Verlag; 2012
* Paul A. Carter: PC Assembly Language; Online; 2003', '', '* Pflichtbereich
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* aktive und erfolgreiche Teilnahme an den Übungen zur Vorlesung „Rechnerarchitektur“
* aktive und erfolgreiche Teilnahme an den praktischen Übungen
* schriftliche Prüfung (Klausur, i.d.R. 60 Minuten)', '4 LP', 'Hardwarenahe Programmierung', 'Keine', 7);
INSERT INTO public.veranstaltung VALUES (9, 'Die Vorlesung „Rechnerarchitektur“ mit zugehöriger Übung wird jedes Sommersemester angeboten.', 'Die Vorlesung „Rechnerarchitektur“ sowie die dazugehörige Übung (5 LP) behandelt den Aufbau eines Rechners. Dabei wird insbesondere auf folgende Themengebiete eingegangen:
* Datendarstellung
* einfache Fehlererkennende und -korrigierende Codes
* Konzepte zur effizienten Datenverarbeitung (Pipelines, Caches)
* digitale Logik
* digitale Schaltungen
* Mikroprogrammierung', 'Nach erfolgreicher Teilnahme an den Veranstaltungen dieses Moduls können die Studierenden
* wiedergeben wie ein moderner Computer aufgebaut ist,
* die verschiedenen Schichten einer Rechnerarchitektur beschreiben und dabei auf ihre Verbindung untereinander eingehen,
* erklären, wie eine CPU/ALU aus elementaren digitalen Schaltungen konstruiert wird,
* zentrale Funktionen eines Betriebssystems identifizieren und ihre Arbeitsweise an einfachen Beispielen darstellen,
* einfache digitale Schaltungen entwerfen und optimieren,
* einfache Assemblerprogramme in x86 Assembler entwickeln,
* sich selbstständig Kenntnisse in einer neuen Programmiersprache aneignen,
* Programme in der Programmiersprache C unter Berücksichtigung dynamischer Speicherverwaltung entwickeln und
* Werkzeuge für typische Aufgaben bei der Programmierung (Speicherverwaltung, Build-Prozesse, Tests) verwenden.', 'Die primären Lehrbücher zu den verschiedenen Bestandteilen dieses Moduls sind:
* Andrew S. Tanenbaum and Todd Austin: Structured Computer Organization; 6th Edition; Pearson; 2013. Prentice Hall; 5th Edition; 2006
* David Griffiths and Dawn Griffiths (dt. Lars Schulten): C von Kopf bis Fuß; O‘Reilly Verlag; 2012
* Paul A. Carter: PC Assembly Language; Online; 2003', '', '* Pflichtbereich
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* aktive und erfolgreiche Teilnahme an den Übungen zur Vorlesung „Rechnerarchitektur“
* aktive und erfolgreiche Teilnahme an den praktischen Übungen
* schriftliche Prüfung (Klausur, i.d.R. 60 Minuten)', '5 LP', 'Rechnerarchitektur', 'Keine', 7);
INSERT INTO public.veranstaltung VALUES (10, 'Jedes Sommersemester.', '* Prinzipien objektorientierter Software Entwicklung
* Prozesse in der professionellen Softwareentwicklung
* Grundlegende Softwarearchitekturen
* Werkzeuge der Softwareentwicklung', 'Studierende sollen nach erfolgreichem Abschluss des Moduls
    
* grundlegende Architekturen beschreiben können
* selbständig Problemstellungen analysieren können
* aus einfachen Problemstellungen ein objektorientiertes System zur Lösung entwerfen können
* eine Lösung hinsichtlich der Wartbarkeit analysieren und verbessern können
* mit den gängigen Werkzeugen (z.B. IDE) umgehen können', '* Robert C. Martin, Clean Code: A Handbook of Agile Software Craftsmanship, Prentice Hall, 2008
* Robert C. Martin, The Clean Coder: A Code of Conduct for Professional Programmers, Prentice Hall, 2011', '', '* Professionelle Softwareentwicklung
* Modul D2 im Studienbereich Informatik (D) im Integrativen Bachelor-Studiengang Sprachtechnologie und Informationswissenschaft', '* Aktive und erfolgreiche Mitwirkung in den Übungen (Projekten)
* Abschlusstest (unbenotet) zum Ende der Vorlesungszeit', '8 LP ab PO 2016, alte PO‘s 10 LP', 'Professionelle Softwareentwicklung (Programmierpraktikum I)', 'Erfolgreicher Abschluss des Moduls:

* „Programmierung”', 8);
INSERT INTO public.veranstaltung VALUES (11, 'Jedes Wintersemester.', '* Projektbezogene Gruppenarbeit
* Entwurf und Gliederung eines umfangreicheren Programms
* Dokumentation
* Diskussion über Softwareaufbau und Design im Team
* Werkzeuge zur Teamkoordination', 'Nach erfolgreichem Abschluss des Moduls sollen die Studierenden in der Lage sein,
    
* grundlegende Entwicklungsprozesse beschreiben zu können,
* eine gestellte komplexere Aufgabe verstehen und in Teilaufgaben strukturieren zu können,
* die Teilaufgaben in einem Team entsprechend eines Entwicklungsprozesses implementieren zu können,
* die einzelnen Bestandteile sowie das Gesamtprogramms mit geeigneten Verfahren testen zu können,
* mit den Werkzeugen zur Softwareentwicklung im Team (Versionskontrolle, CI Systeme, Bugtracker) sicher umgehen zu können.', '* Robert C. Martin, Clean Code: A Handbook of Agile Software Craftsmanship, Prentice Hall, 2008
* Robert C. Martin, The Clean Coder: A Code of Conduct for Professional Programmers, Prentice Hall, 2011', '', '* Softwareentwicklung im Team', '* Aktive und erfolgreiche Mitwirkung an dem Gruppenprojekt
* Abschlusstest (unbenotet) zum Ende der Vorlesungszeit
* Vortrag/Vorstellung der Ergebnisse im Plenum', '8 LP', 'Softwareentwicklung im Team (Programmierpraktikum II)', 'Erfolgreicher Abschluss des Moduls:

* „Professionelle Softwareentwicklung (Programmierpraktikum I)”', 9);
INSERT INTO public.veranstaltung VALUES (12, 'Jedes Sommersemester', '* Formale Sprachen und Automaten
  * Grundbegriffe
    * Wörter, Sprachen und Grammatiken
    * Die Chomsky-Hierarchie
  * Reguläre Sprachen
    * Endliche Automaten
    * Reguläre Ausdrücke
    * Gleichungssysteme
    * Das Pumping-Lemma
    * Satz von Myhill und Nerode und Minimalautomaten
    * Abschlusseigenschaften regulärer Sprachen
    * Charakterisierungen regulärer Sprachen
  * Kontextfreie Sprachen
    * Normalformen
    * Das Pumping-Lemma
    * Der Satz von Parikh
    * Abschlusseigenschaften kontextfreier Sprachen
    * Der Algorithmus von Cocke, Younger und Kasami
    * Kellerautomaten
  * Deterministisch kontextfreie Sprachen
    * Deterministische Kellerautomaten
    * LR(k)- und LL(k)-Grammatiken
    * Anwendung: Syntaxanalyse durch LL(k)-Parser
  * Kontextsensitive und L0-Sprachen
    * Turingmaschinen
    * Linear beschränkte Automaten
    * Zusammenfassung
* Berechenbarkeit
  * Intuitiver Berechenbarkeitsbegriff und die These von Church
  * Turing-Berechenbarkeit
  * LOOP-, WHILE- und GOTO-Berechenbarkeit
    * LOOP-Berechenbarkeit
    * WHILE-Berechenbarkeit
    * GOTO-Berechenbarkeit
  * Primitiv rekursive und partiell rekursive Funktionen
    * Primitiv rekursive Funktionen
    * Die Ackermann-Funktion
    * Allgemein und partiell rekursive Funktionen
    * Der Hauptsatz der Berechenbarkeitstheorie
  * Entscheidbarkeit und Aufzählbarkeit
    * Einige grundlegende Sätze
    * Entscheidbarkeit
    * Rekursiv aufzählbare Mengen
  * Unentscheidbarkeit
    * Der Satz von Rice
    * Reduzierbarkeit
    * Das Postsche Korrespondenzproblem
    * Unentscheidbarkeit in der Chomsky-Hierarchie
    * Zusammenfassung', 'Ziel dieser Veranstaltung ist die Vermittlung von Grundlagenwissen aus den Bereichen Formale Sprachen und Automaten sowie Berechenbarkeitstheorie. Am Ende der Veranstaltung sollten Studierende in der Lage sein, formale Sprachen in die Chomsky-Hierarchie einzuordnen, verschiedene äquivalente Automatenmodelle ineinander bzw. in Grammatiken des entsprechenden Typs umzuformen, Argumente für die In-Äquivalenz von bestimmten Automatenmodellen bzw. Grammatiktypen zu geben, die algorithmische Entscheidbarkeit von Problemen einzuschätzen und Argumente für die Nichtentscheidbarkeit von Problemen zu geben. Auch sollten sie die Erkenntnis gewonnen haben, dass es nicht berechenbare Funktionen gibt, und eine Vorstellung vom Aufbau eines Compilers und von lexikalischer und Syntaxanalyse erworben haben. Neben diesen Kenntnissen sollten sie sich auch Fertigkeiten im Umgang mit formalen Begriffs- und Modellbildungen sowie mit formalen Argumentationsweisen sowie bestimmte Beweistechniken (wie etwa Diagonalisierung) angeeignet haben.', '* Uwe Schöning: Theoretische Informatik - kurz gefasst, Spektrum Akademischer Verlag, 2. Auflage, 1995.
* John E. Hopcroft, Rajeev Motwani, Jeffrey D. Ullman: Einführung in die Automatentheorie, Formale Sprachen und Komplexitätstheorie, Pearson Studium, 2. Auflage, 2002.
* Klaus W. Wagner: Theoretische Informatik. Eine kompakte Einführung, Springer-Verlag, 2. Auflage, Berlin, Heidelberg, 2003.

### Ergänzende Literatur

* Norbert Blum: Theoretische Informatik. Eine anwendungsorientierte Einführung, Oldenbourg, 2001.
* Alexander Asteroth, Christel Baier: Theoretische Informatik. Eine Einführung in Berechenbarkeit, Komplexität und formale Sprachen mit 101 Beispielen, Pearson Studium, 2002.', '', '* Pflichtbereich
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* erfolgreiche Bearbeitung der Übungsaufgaben
* Bestehen der schriftlichen Prüfung (Klausur)', '10 LP', 'Theoretische Informatik', 'Keine', 10);
INSERT INTO public.veranstaltung VALUES (13, 'Jedes Semester', 'Lineare Gleichungssysteme, Mengen, Gruppen, Ringe, Körper, komplexe Zahlen, endliche Primkörper, Vektorräume, Basen, Summenvektorräume, Äquivalenzrelationen, Quotientenvektorräume, lineare Abbildungen, Matrizen, Kern und Bild, Isomorphiesatz, Rang, Gauß-Algorithmus, Endomorphismen, Determinante, Laplace-Entwicklung, Eigenwerte und Eigenvektoren, charakteristisches Polynom, Diagonalisierbarkeit, Skalarprodukte, Länge und Winkel, Gram-Schmidt-Verfahren, orthogonale und unitäre Endomorphismen', 'Die Studierenden bewältigen die Begriffsbildungen und grundlegenden Resultate der linearen Algebra. Sie argumentieren anhand der Definitionen und Sätze und können intuitive Vorstellungen mathematisch präzisieren. Sie sind in der Lage, Übungsaufgaben selbstständig zu lösen und diese Lösungen in den Übungsgruppen zu präsentieren sowie kritisch zu diskutieren. Sie verfügen über Methoden der systematischen und effizienten Wissensaneignung.', '* S. Bosch: Lineare Algebra.
* G. Fischer: Lineare Algebra.', '', '* Bachelor-Studiengang Informatik
* Bachelor-Studiengang Mathematik
* Bachelor-Studiengang Physik', '* Erfolgreiche Teilnahme an der Übungsgruppen
* Schriftliche Prüfung (Anmeldung in der Vorlesung)
* Die Klausur muss bestanden werden; das Modul wird nicht benotet.', '10 LP', 'Lineare Algebra I', 'Voraussetzungen nach Prüfungsordnungen: Keine; Empfohlene Voraussetzung: Keine', 11);
INSERT INTO public.veranstaltung VALUES (14, 'Jedes Semester', 'Reelle und komplexe Zahlen, Folgen, Konvergenz, Cauchy-Folgen, Grenzwerte, Reihen, Stetigkeit, Kompaktheit, spezielle Funktionen, Differentialrechnung, Integralrechnung, Funktionenfolgen, Potenzreihen, Taylor-Entwicklung', 'Die Studierenden bewältigen die Begriffsbildungen und grundlegenden Resultate der Analysis einer Veränderlichen. Sie argumentieren anhand der Definitionen und Satze und können intuitive Vorstellungen mathematisch präzisieren. Sie sind in der Lage, Übungsaufgaben selbstständig zu lösen und diese Lösungen in den Übungsgruppen zu präsentieren sowie kritisch zu diskutieren. Sie verfügen über Methoden der systematischen und effizienten Wissensaneignung.', '* H. Amann, J. Escher: Analysis I.
* R. Denk, R. Racke: Kompendium der Analysis. Band 1.', '', '* Bachelor-Studiengang Informatik
* Bachelor-Studiengang Mathematik
* Bachelor-Studiengang Physik', '* Erfolgreiche Teilnahme an den Übungsgruppen
* Schriftliche Prüfung (Anmeldung in der Vorlesung)
* Die Klausur muss bestanden werden; das Modul wird nicht benotet.', '10 LP', 'Analysis I', 'Voraussetzungen nach Prüfungsordnungen: Keine; Empfohlene Voraussetzung: Keine', 12);
INSERT INTO public.veranstaltung VALUES (15, 'I.d.R. jährlich', '* Architekturformen
* Grundlagen (Prozesse, Threads, Sperren)
* Kommunikation: Nachrichten, entfernte Methodenaufrufe und gemeinsamer Speicher
* Namensdienste (DNS, Gnutella, Chord, CAN, Pastry)
* Koordination: Zeit, wechselseitiger Ausschluss und globale Zustände, Transaktionen
* Replikation und Konsistenz
* Gruppenkommunikation (atomarer Multicast, Overlay-Multicast)
* Fehlertoleranz: Fehlermodelle, Checkpointing
* Konsensus (flooding consensus, Paxos, byzantinische Generäle)
* Verteilte Dateisysteme (NFS, GoogleFS, CFS, IVY, OceanStore)
* Sicherheit: Grundlagen Verschlüsselung und Authentisierung

In den Übungen wird neben Aufgaben auf Papier auch ein verteilter In-Memory Key-Value-Store entwickelt. Die Implementierung erfolgt in mehreren Stufen und dientder Vertiefung der verteilten und parallelen Konzepte aus der Vorlesung.', 'Studierende können nach erfolgreichem Abschluss dieses Moduls Begriffe und Konzepte im Umfeld verteil-ter Systeme in eigenen Worten erklären. Ferner können Sie die behandelten Algorithmen auf Papier und in eigenen Programmen anwenden und vergleichen.', '* G. Coulouris et.al., „Distributed Systems: Concepts and Design“, Addison-Wesley, 5. Aufl. 2011
* A. Tanenbaum and M. van Steen: „Distributed Systems: Principles and Paradigms”, 3. Auflage, Pren-tice Hall, 2013.
* K. Birman, „Guide to Reliable Distributed Systems: Building High-Assurance Applications and Cloud-Hosted Services“, Springer, 1. Auflage, 2012.
* Weitere relevante Publikationen werden in der Vorlesung bekannt gegeben', '', '* WahlpflichtbereichPraktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', 'Erfolgreiche Bearbeitung der Übungsaufgaben. Erfolgreiche Teilnahme an der Prüfung am Ende der Veran-staltung.', '10 LP', 'Verteilte Systeme', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 13);
INSERT INTO public.veranstaltung VALUES (16, 'Wird nicht mehr angeboten.', '* Grundlagen der Parallelisierung
* Prozesse, Threads, Synchronisierung (mit und ohne Sperren)
* Transactional Memory
* Sockets
* Infiniband
* Fallstudien
* OpenMP
* Message Passing Interface (MPI)

In den Übungen warden die Programmiersprachen Java und C verwendet.', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* einfache Algorithmen zu parallelisieren
* die besprochenen Konzepteanzuwenden
* parallele Problemstellung korrekt zu synchronisieren und gegebene Lösungen zubewerten', 'Wird in der Vorlesung bekannt gegeben.', '', '* WahlpflichtbereichPraktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Erfolgreiche Bearbeitung von Übungsaufgaben
* Abschließende Prüfung am Ende des Semesters', '5 LP ab PO 2015, alte PO 7,5 LP', 'Verteilte und Parallele Programmierung', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 14);
INSERT INTO public.veranstaltung VALUES (17, 'Normalerweise jedes Jahr im Wintersemester', 'Dieses Modul beschäftigt sich mit fortgeschrittenen Themen der logischenProgrammierung. Dazu gehören vertiefende Themen aus dem Constraint LogicProgramming. Weiterhin befasst sich das Modul mit der Ent-wicklung vonInterpretern sowie Programmanalyse-und Verifikationswerkzeugen in Prolog.

Die Themen sind:

* Fortgeschrittene Programmiertechniken in Prolog
* Metaprogrammierung in Prolog und Anwendungen
* Anwendung von Constraint Logic Programming
* Entwicklung eigener Constraint Solver
* Interpreterentwicklung in Prolog
* Programmanalyse mit abstrakter Interpretation und Datenflussanalyse', 'Nach erfolgreichem Abschluss des Moduls sollten die Studierenden:

* Problemstellungen mit Hilfe von Constraint Solvern lösen können
* gängige Techniken für die Implementierung von Constraint Solvern kennen und umsetzen können
* eigene Constraint Solver entwickeln können
* verstehen wie Programmiersprachen mit Interpretern implementiert werden können
* in der Lage sein für eine neue Programmiersprache einen Interpreter in Prolog selber zu entwickeln
* in der Lage sein einen Interpreter für Prolog in Prolog zu schreiben
* die Grundzüge der abstrakten Interpretation und ihrer Anwendung zur Programmverifikation erläutern und vergleichen können
* einfache Analyse und Verifikationswerkzeuge in Prolog entwickeln können', 'Als Lehrbuch wird ein eigenes Skript verwendet.', '', '* WahlpflichtbereichPraktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Erfolgreiche Bearbeitung der Pflichtübungen
* Bestehen der Klausur', '5 LP ab PO 2015, alte PO 7,5 LP', 'Vertiefung Logische Programmierung', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 15);
INSERT INTO public.veranstaltung VALUES (18, 'Jedes Sommersemester', 'Rechnernetze im Allgemeinen und das Internet im Besonderen wurden seit den frühen Anfängen des ARPA-NET maßgeblich durch wissenschaftliche Arbeiten geprägt. Ziel der Veranstaltung ist es, das Grundwissen aus der Vorlesung Rechnernetze durch ein intensives Studium der richtungsweisenden Veröffentlichungen im Bereich Rechnernetze zu vertiefen. Um dieses Lernziel zu erreichen wird folgende Lehrform verwendet: jede Woche wird den Teilnehmern eine wissenschaftliche Veröffentlichung genannt. Diese ist prinzipiell in englischer Sprache verfasst. Die Teilnehmer arbeiten diese Veröffentlichung selbständig durch, so dass sie in der Lage sind, deren Inhalt vor allen anderen Teilnehmern an der Tafel zu präsentieren. Jede Woche fin-det eine Diskussionsveranstaltung statt, bei der zufällig ausgewählte Teilnehmer die Veröffentlichung vorstel-len. Anschließend diskutieren alle Teilnehmer die Veröffentlichung.', 'Studierende haben nach erfolgreichem Abschluss dieses Moduls ein vertieftes Verständnis der Funktionsweise von Computernetzwerken. Sie können wissenschaftliche Veröffentlichungen systematisch aufarbeiten, deren Inhalte prägnant zusammenfassen und kritisch bewerten.', 'Zu dieser Veranstaltung gibt es kein Lehrbuch.', '', '* WahlpflichtbereichPraktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Mitarbeit in Vorlesung
* aktiveVorbereitung der Veröffentlichungen
* mündliche Prüfung', '5 LP ab PO 2015, alte PO 7,5 LP', 'Vertiefung Rechnernetze', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 16);
INSERT INTO public.veranstaltung VALUES (19, 'Dieses Modul wird in unregelmäßigen Abständen angeboten.', 'Beim Zeichnen von Graphen betrachtet man das Problem der Visualisierung struktureller Informationen, wel-che sich als Graphen darstellen lassen. Das automatische Zeichnen von Graphen hat wichtige Anwendun-gen in vielen Bereichen der Informatik, wie z.B. Datenbanken, VLSI-und Netzwerk-Design, Software Engine-ering und visuelle Benutzerschnittstellen. Dieses Modul befasst sich mit verschiedenen Arten zum Zeichnen von Graphen und Algorithmen, welche diese Zeichnungen konstruieren.

* Grundlagen
* Zeichnen von Bäumen
* Zeichnen von planaren Graphen
* Flüsse und orthogonale Zeichnungen
* Hierarchische Zeichenverfahren
* Kräftebasierte Zeichenverfahren', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die besprochenen Zeichenvarianten für Graphen zu erläutern und formal zu definieren
* die behandelten Algorithmen zu verstehen und für konkrete Eingaben Zeichnungen zu konstruieren
* für die Algorithmen zum Zeichnen auf Gittern den Platzbedarf von Zeichnungen zu ermitteln
* Vor-und Nachteile spezieller Grapheigenschaften beim Zeichnen zu hinterfragen', '* G. Di Battista, P. Eades, I.G. Tollis, R. Tamassia: Graph Drawing: Algorithms for the Visualization of Graphs, Prentice Hall, 1999.
* M. Jünger, P. Mutzel: Graph Drawing Software, Springer Verlag, 2004.
* M. Kaufmann, D. Wagner: Drawing Graphs: Methods and Models, Springer Verlag, 2001.
* T. Nishizeki, MD S. Rahman: Planar Graph Drawing, World Scientific Pub Co, 2004.', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', 'Aktive Mitarbeit in den Übungen, Abgabe der Übungsaufgaben, Bestehen der Klausur zum Ende des Semesters', '5 LP ab PO 2015, alte PO 7,5 LP', 'Zeichnen von Graphen', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 17);
INSERT INTO public.veranstaltung VALUES (20, 'Jedes Semester (je Arbeitsgruppe i.d.R. mindestens jährlich)', 'In diesem Modul soll der Student das selbständige wissenschaftliche Arbeiten erwerben und sich auf die Master-Arbeitvorbereiten. Die Inhalte hängen deshalb sehr stark vom jeweiligen Fachgebiet und den Inte-ressensgebieten des Studenten ab.', 'Nach erfolgreichem Abschluss des Moduls sollte der Student

* die wichtigen Konzepte des Fachgebiets der Projekt-bzw.zukünftigen Master-Arbeitzusammenfas-sen und veranschaulichen können
* wichtige Artikel und Bücher für spezifische Problemstellungen des Fachgebiets ermitteln können
* Konzepte des Fachgebiets hinterfragen können und entscheiden können welche für seine zukünftige Master-Arbeitin Betracht kommen
* die wissenschaftlichen Methoden des Fachbereichs beschreiben undanwenden können', '', '', '* Projektarbeit', 'Die konkreten Anforderungen hängen von der zu bearbeitenden Aufgabenstellung ab. Daher sind die Kriterien zum Erwerb der Leistungspunkte zu Beginn der Projektarbeit individuell festzulegen.', '20 LP', 'Projektarbeit', '* Keine', 18);
INSERT INTO public.veranstaltung VALUES (21, 'Bei Vorliegen der Voraussetzungen ist der Beginn der Abschlussarbeit jederzeit möglich, d.h. die Vergabe von Themen ist nicht an bestimmte Zeiten im Semester gebunden.', 'Der Inhalt der Master-Arbeit liegt im ausgewählten Schwerpunktfach', 'Mit der schriftlichen Abschlussarbeit sollen die Studierenden nachweisen, dass sie in der Lage sind, innerhalb einer vorgegebenen Frist (von 6 Monaten) ein Themaaus dem von ihnen gewählten Schwerpunkfach selbstständig mit wissenschaftlichen Methoden zu analysieren sowie die Erkenntnisse prägnant zu entwickeln und kompetent zu bewerten bzw. zu interpretieren. Die Master-Arbeitmuss in deutscher oder englischer Sprache verfasst und in einem mündlichen Vortrag präsentiert werden.', '', '', '* Master-Arbeit', 'Erfolgreiche Bearbeitung des Themas und Darstellung in einer fristgerecht abgegebenen Ausarbeitung (Master-Arbeit); Präsentation in einem mündlichen Vortrag mit Diskussion', '30 LP', 'Master-Arbeit', 'Für die Anmeldung zur Master-Arbeit müssen mindestens 60 der im Rahmen des Master-Studiums zu erwerbenden Leistungspunkte nachgewiesen werden. Das Thema der Master-Arbeit wird aus dem Gebiet des gewählten Schwerpunktfachs vergeben. Dazu sollten üblicherweise beide Module im Schwerpunktfach erfolgreich abgeschlossen sein.', 19);
INSERT INTO public.veranstaltung VALUES (22, 'Jedes Studienjahr, in der Regel im Sommersemester', '* Biologische und algorithmische Grundlagen
* Exhaustive Suche: DNA-Motive
* Gierige Algorithmen: Genom-Umordnungen
* Dynamische Programmierung: Sequenz-Alignment
* Graphen-Algorithmen: Sequenzierung
* Kombinatorische Mustersuche, BLAST
* Hidden Markov Modelle
* Cluster & Cliquen
* Phylogenetische Bäume und molekulare Evolution
* Maximum-Likelihood und Bayesianische Methoden
* Randomisierte Motivsuche', 'Nach der Veranstaltung werden die Studierende in der Lage sein:

* verschiedene Klassen von Algorithmen zu differenzieren;
* klassische Algorithmen und spezielle bioinformatische Algorithmen auf biologische Probleme anzuwenden;
* gelernte Algorithmen exemplarisch in der Programmiersprache Python umzusetzen;
* bioinformatische Probleme mit den vorgestellten Algorithmen selbständig lösen zu können.', '* Neil C. Jones, Pavel A. Pevzner: An Introduction to Bioinformatics Algorithms. The MIT Press, 2004.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik
* Teil eines Master-Moduls im Master-Studiengang Biologie', '* aktive Teilnahme an den Übungen
* erfolgreiches Bearbeiten der Übungsaufgaben (50%)
* abschließende Prüfung (i.d.R. schriftlich)', '5 LP ab PO 2013, alte PO’s 7,5 LP (Bachelor, ohne Seminar)
7,5 LP (Master, inkl. Seminar)', 'Algorithmen in der Bioinformatik', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung“
* „Rechnerarchitektur“

Master-Studierende müssen zusätzlich folgende Module erfolgreich abgeschlossen haben:

* „Algorithmen und Datenstrukturen“
* „Theoretische Informatik“', 20);
INSERT INTO public.veranstaltung VALUES (23, 'I.d.R. jährlich', '* Grundlagen: C- und UNIX Shell-Programmierung
* Grundlegende Betriebssystemkonzepte, u.a. Speicher (Heap, Stack), Adressräume, Prozesse und Threads, Scheduling, Synchronisierung, Interrupts, Dateisysteme, Interprozess-Kommunikation, Schutzmechanismen
* Programmierung von Systemsoftware
* Praktische Übungen, direkt am Rechner', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* Betriebssystemkonzepte zu erläutern
* Zusammenhänge zwischen der Ausführung von Programmen und dem Betriebssystemen zu verstehen und zu erklären
* Synchronisierungsprobleme in parallelen Threads zu erkennen und eigene Synchronisierungslösungen zu konzipieren
* einfache Systemprogramme auf Basis der Systemaufrufschnittstelle UNIX-ähnlicher Betriebssysteme in der Programmiersprache C zu entwickeln', '* Andrew S. Tanenbaum: „Modern Operating Systems”, 4. Auflage, Prentice Hall, 2014.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', 'Erfolgreiche Bearbeitung der Übungsaufgaben. Erfolgreiche Teilnahme an der Prüfung am Ende der Veranstaltung.', '10 LP', 'Betriebssysteme und Systemprogrammierung', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 21);
INSERT INTO public.veranstaltung VALUES (24, 'Jährlich im Wintersemester', 'Die Inhalte dieses Moduls sind wie folgt:

* Grundlagen des Compilerbaus
* Lexikale Analyse (reguläre Ausdrücke und endliche Automaten)
* Syntaxanalyse (kontextfreie Grammatiken und deterministisches Parsing)
* Semantische Analyse
* Code-Generierung
* Benutzen von Werkzeugen zur automatischen Erzeugung von Compilern', 'Nach erfolgreichem Abschluss des Moduls sollte der Student:

* verstehen wie Programmiersprachen übersetzt und implementiert werden
* Syntaxbeschreibungen einer Programmiersprache verstehen und anpassen können. Insbesondere soll der Student ermitteln können ob die Beschreibung für eine automatisierte Bearbeitung in einem Compiler geeignet ist
* in der Lage sein für eine neue Programmiersprache einen Parser, bzw. Compiler selbst zu entwickeln', '* Andrew W. Appel, Modern Compiler Implementation in Java, 2nd Edition, Cambridge University Press, (ISBN-13: 9780521820608 — ISBN-10: 052182060X).
* Alfred V. Aho, Monica S. Lam, Ravi Sethi, Jeffrey D. Ullman, Compilers: Principles, Techniques, and Tools (2nd Edition), Addison Wesley, ISBN-13: 978-0321486813.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', 'Erfolgreiche Bearbeitung der Pflichtübungen; Erfolgreiche Entwicklung eines eigenen Compilers; Bestehen der Klausur;', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Compilerbau', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 22);
INSERT INTO public.veranstaltung VALUES (25, 'Jährlich im Wintersemester', 'Dieses Modul vermittelt grundlegende Kenntnisse zu Datenbanksystemen. Der Schwerpunkt liegt auf relationalen Datenbanksystemen. Neben den verschiedenen Phasen des Datenbankentwurfs werden ausführlich Anfragen und Anwendungsprogrammierung behandelt. Darüber hinaus werden weitere Themen (u.a. Architektur, Transaktionsverwaltung, Anfrageoptimierung) angesprochen. Im Einzelnen werden behandelt:

* Aufgaben eines Datenbanksystems
* Architektur von Datenbanksystemen
* Daten(bank)modelle; hierarchische Modelle, Netzwerkmodell, Relationales Modell
* Anfragesprachen für relationale Datenbanken und ihre Grundlagen; Relationale Algebra, Tupel- und Bereichskalkül, QBE, SQL
* konzeptioneller Datenbankentwurf
* logischer Datenbankentwurf; Normalisierung
* Datenbankanwendungsprogrammierung; Datenbankanbindung im Web
* Transaktionen und Grundlagen der Transaktionsverwaltung
* Anfrageverarbeitung und -optimierung', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die Aufgaben und Funktionen eines Datenbanksystems zu nennen und zu erläutern
* selbstständig Datenbanken zu entwerfen,
* Datenbankanfragen in verschiedenen Formalismen (SQL, Relationenalgebra, Tupelkalkül) zu formulieren und die Effizienz der Auswertung verschiedener Formulierungen zu bewerten,
* Datenbankanwendungen zu programmieren,
* die grundlegenden Aspekte der Transaktionsverwaltung Nebenläufigkeit und der Synchronisierung zu verstehen', '* Heuer, A., Saake, G., Sattler, K.-U.: Datenbanken - Konzepte und Sprachen.5. Aufl., mitp-Verlag, Bonn, 2013
* Vossen, G.; Datenbankmodelle, Datenbanksprachen und Datenbankmanagement-Systeme. 5. Aufl., Oldenbourg, München, 2008
* Kemper, A., Eickler, A.; Datenbanksysteme --Eine Einführung. 9. Aufl., Oldenbourg, München, 2013
* Elmasri, R.; Navathe, S.B.; Fundamentals of Database Systems, Addison-Wesley / Pearson, 2011
* Date, C.J.; An Introduction to Database Systems, 8/e; Addison-Wesley / Pearson, 2004
* Garcia-Molina, H., Ullman, J.D., Widom, J.; Database Systems: The Complete Book. 2/e, Prentice Hall / Pearson, 2009', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik
* Modul D3 im Studienbereich Informatik (D) im Integrativen Bachelor-Studiengang Sprachtechnologie und Informationswissenschaft', '* Aktive und erfolgreiche Teilnahme an den Übungen (in der Regel mit Hausaufgaben)
* erfolgreicher Abschluss der Praktischen Übungen durch ein kleines Projekt, in dem eine Aufgabe mit Datenbankentwurf und Datenbankanwendungsprogrammierung zu bearbeiten ist
* schriftliche Prüfung (Klausur, i.d.R. 90 Minuten)', '10 LP ab PO 2013, alte PO’s 15 LP', 'Datenbanksysteme', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”

Wünschenswert sind zudem fundierte Kenntnisse aus dem Modul Algorithmen und Datenstrukturen', 23);
INSERT INTO public.veranstaltung VALUES (26, 'Jährlich im Wintersemester', 'Implementierung verschiedener Algorithmen in der Programmiersprache Python: z.B.

* Rekursion am Beispiel des Problems der unabhängigen phylogenetischen Kontraste
* Lateraler Gentransfer oder phylogenetische Artefakte? Statistischer Test der Übereinstimmung von Bäumen mit nicht-identischen Blattmengen ohne einen verlässlichen Referenzbaum
* MAD: Wurzeln phylogenetischer Stammbäume mit Hilfe des Mean-Ancestor-Deviation-Verfahrens
* Gruppierungsverfahren: Neighbor-Joining, Markov-Clustering-Algorithmus, k-Means, Expectation Maximization
* Pebble-Game-Algorithmus und die Steifigkeitsanalyse von Biomolekülen
* Gibbs-Sampling zur Motivsuche in DNA-Sequenzen

Der Kurs beschreibt mit Hilfe ausgewählter Beispiele die Anwendung der Informatik und Statistik zur Lösung
verschiedener Probleme aus Biologie, Physik und Chemie.', 'Die Studierenden verstehen die zugrundeliegenden naturwissenschaftlichen Hintergründe und die damit verbundenen Problemstellungen. Sie beherrschen die zur Problemlösung angewendeten Algorithmen und statistischen Verfahren. Sie können diese eigenständig in der Programmiersprache Python implementieren und sind in der Lage, verschiedene Lösungswege kritisch miteinander zu vergleichen und zu diskutieren.', 'Wird im Rahmen der Vorlesung vorgestellt', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete', '* Mindestens 50 Prozent der Punkte aus den Übungsaufgaben
* Bestehen der Abschlussprüfung', '5 LP', 'Einführung in die naturwissenschaftliche Informatik', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 24);
INSERT INTO public.veranstaltung VALUES (27, 'Jedes Wintersemester', 'Dieses Modul vermittelt grundlegende Kenntnisse aus folgenden Bereichen.

* Suchmethoden auf Graphen
* Topologische Anordnungen
* Zusammenhangsprobleme
* Kürzeste Wege
* Minimale Spannbäume
* Netzwerkfluss-Probleme
* Matching-Probleme', 'Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein erweitertes Verständnis der theoretischen Grundlagen über den Entwurf von Graphalgorithmen.', 'Verschiedene aktuelle Lehrbücher über Graphenalgorithmen', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* aktive Mitarbeit in den Übungen
* Abgabe der Hausaufgaben
* schriftliche Klausur (i.d.R. 90 Minuten) oder mündliche Prüfung am Ende des Semesters', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Graphenalgorithmen I', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 25);
INSERT INTO public.veranstaltung VALUES (28, 'Wird nicht mehr angeboten', '* Architekturformen: Client/Server, P2P, hybride Ansätze
* Kommunikation Sockets (UDP, TCP), entfernter Methodenaufruf (RMI), verteilter gemeinsamer Speicher (DSM)
* Koordination: Uhrensynchronisierung, logische Zeit, wechselseitiger Ausschluss, globale Zustände, Wahlen, Terminierung, Verklemmungen
* Replikation und Konsistenz: daten- und klientenzentrierte Modelle, Aktualisierungsmethoden
* Fehlertoleranz: Fehlermodelle, Konsensus, Checkpointing
* Sicherheit: Grundlagen Verschlüsselung und Authentisierung', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* Kommunikationsformen (Nachrichten, entfernte Aufrufe, gemeinsamer Speicher) in eigenen Programmen anzuwenden.
* Koordinationsalgorithmen zu verstehen und zu konzipieren.
* Konsistenzstrategien für Replikate zu vergleichen und zu bewerten
* Grundlegende Fehlertoleranz und Sicherheitsaspekte in verteilten Systemen zu erläutern', '* G. Coulouris et.al., „Distributed Systems: Concepts and Design“, Addison-Wesley, 5. Aufl. 2011
* A. Tanenbaum and M. van Steen: „Distributed Systems: Principles and Paradigms”, 3. Auflage, Prentice Hall, 2013.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* Erfolgreiche Teilnahme an der Prüfung am Ende der Veranstaltung.', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Grundlagen Verteilter Systeme', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 26);
INSERT INTO public.veranstaltung VALUES (29, 'Jährlich im Wintersemester', 'In der imperativen Programmierung werden Programme durch Sequenzen von Instruktionen dargestellt. In der logischen Programmierung beschreibt man statt einer Lösung für ein Problem in Form eines Algorithmus das Problem durch Fakten und Regeln und der Computer findet selbständig eine Lösung. Das eröffnet einen völlig neuen und radikal unterschiedlichen Blickwinkel auf das Programmieren der auch bei der alltäglichen Entwicklung mit C oder Java sehr nützlich ist.

Die Vorlesung behandelt die Themen:

* Aussagenlogik, Prädikatenlogik
* Resolution
* Programmieren mit Horn Klauseln
* Praktische Grundlagen von Prolog
* Suchalgorithmen und Künstliche Intelligenz mit Prolog
* Grundzüge der Constraint-Programmierung', 'Nach erfolgreichem Abschluss des Moduls sollte der Student

* die logischen Grundlagen von Prolog verstehen und logische Berechnungen in Aussagenlogik und Prädikatenlogik durchführen können
* die praktischen Datenstrukturen von Prolog benutzen können
* in der Lage sein kleinere Prolog Programme eigenständig entwickeln zu können
* wichtige Suchalgorithmen vergleichen können und praktisch in Prolog umsetzen
* kleinere Aufgaben der künstlichen Intelligenz in Prolog lösen können', '* Nilsson, Maluszynski - Logic, Programming and Prolog (eBook)
* Blackburn, Bos, Striegnitz, Learn Prolog Now!, College Publications', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik
* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science', '* Aktive und erfolgreiche Mitwirkung in den Übungen
* Erfolgreiche Teilnahme an der Abschlussprüfung', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Introduction to Logic Programming (vormals Einführung in die logische Programmierung)', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 27);
INSERT INTO public.veranstaltung VALUES (30, 'Dieses Halb-Modul wird in unregelmäßigen Abständen angeboten.', 'Dieses Modul befasst sich mit verschiedenen Varianten des Rucksackproblems und stellt verschiedene Lösungsmethoden für diese Probleme vor.', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die besprochenen Rucksackprobleme zu erläutern
* die Ideen der vorgestellten Algorithmen zu kennen und
* die behandelten Algorithmen auf konkrete Eingaben anzuwenden', '* H. Kellerer, U. Pferschy, D. Pisinger: Knapsack Problems, Springer, 2010.
* B. Korte, J. Vygen: Kombinatorische Optimierung, Springer, 2008', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', 'Aktive Mitarbeit in den Übungen, Bestehen der Klausur zum Ende des Semesters', '5 LP', 'Knapsack Problems', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 28);
INSERT INTO public.veranstaltung VALUES (31, 'Etwa alle zwei Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.', '* Einführung in die Kryptologie
  * Aufgaben und Ziele der Kryptologie
  * Einige klassische Kryptosysteme und ihre Kryptoanalyse
    * Substitutions- und Permutationschiffren
    * Affin Lineare Blockchiffren
    * Block- und Stromchiffren
  * Perfekte Geheimhaltung
    * Satz von Shannon und Vernams One-Time Pad
    * Entropie und Schlüsselmehrdeutigkeit
  * RSA, Primzahltests und das Faktorisierungsproblem
    * Das Public-Key Kryptosystem RSA
    * Digitale Signaturen mit RSA
    * Primzahltests und das Faktorisierungsproblem
    * Sicherheit von RSA: Mögliche Angriffe und Gegenmaßnahmen
* Einführung in die Komplexitätstheorie
  * Grundlagen
    * Komplexitätsmaße und -klassen
    * Kompression und Beschleunigung
    * Hierarchiesätze
    * Eine untere Schranke
  * Zwischen L und PSPACE
    * Einfache Inklusionen
    * Komplexitätsbeschränkte Many-one-Reduktionen
    * Vollständige Probleme in NL
    * NP-vollständige Probleme', 'Ziel des Moduls Kryptokomplexität I ist die Vermittlung von Kenntnissen über die wichtigsten Kryptosysteme (also effiziente Algorithmen zur Verschlüsselung und legitimierten Entschlüsselung); andererseits wird die Sicherheit solcher Systeme behandelt, die häufig auf der Komplexität geeigneter Probleme beruht. Deshalb wird auch in die Grundlagen der Komplexitätstheorie eingeführt, insbesondere mit dem Ziel, Methoden zum Nachweis unterer Schranken bezüglich der Komplexitätsmaße Rechenzeit und Speicherplatz zu verstehen und anwenden zu können. Dies ergänzt auch die Veranstaltungen zur Algorithmik, in denen es vorrangig um den Nachweis oberer Schranken (also die Entwicklung möglichst effizienter Algorithmen) für Probleme geht. Am Ende der Veranstaltung sollten Studierende in der Lage sein, die erlernten Modellbildungen und Techniken auf neue Probleme, Kryptosysteme und Algorithmen anwenden können. So sollen sie etwa die Komplexität von Problemen, die Sicherheit von kryptographischen Verfahren und die Laufzeit und den Speicherplatzbedarf von Algorithmen einschätzen können. Besonderer Wert wird darauf gelegt, dass die Studierenden die enge Verflechtung dieser Gebiete verstehen.', '* Jörg Rothe: Komplexitätstheorie und Kryptologie. Eine Einführung in Kryptokomplexität, eXamen.Press, Springer-Verlag, 2008.
* Jörg Rothe: Complexity Theory and Cryptology. An Introduction to Crypto-complexity, EATCS Texts in Theoretical Computer Science, Springer-Verlag, 2005.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* erfolgreiche Bearbeitung der Übungsaufgaben
* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung', '10 LP ab PO 2013, alte PO’s 15 LP', 'Kryptokomplexität I', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 29);
INSERT INTO public.veranstaltung VALUES (32, 'I.d.R. jährlich.', 'Dieses Modul vermittelt grundlegendes Wissen zu folgenden Themen:

* Probability, frequentist statistics, Bayesian statistics
* Supervised learning, unsupervised learning
* Generative vs discriminative models
* Linear regression, linear discriminant analysis
* Gaussian processes
* Support vector machines
* Kernel trick, kernel PCA
* Graphical models
* Neural networks', 'Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,

* die Grundlagen des Maschinellen Lernens zu beschreiben und anzuwenden
* die mathematische Beschreibung dieser Grundlagen zu erklären und einfache Sachverhalte zu beweisen
* die Grundlagen und ihre mathematischen Beschreibungen anzuwenden, um selbständig Datenanalyseprobleme zu bearbeiten', 'Es wird nicht ein bestimmtes Lehrbuch verwendet, jedoch sind folgende Bücher hilfreich:

* Murphy, Machine Learning: A Probabilistic Perspective
* MacKay, Information Theory, Inference, and Learning Algorithms, Cambridge 2003
* Barber, Bayesian Reasoning and Machine Learning, Cambridge 2012
* Rasmussen/Williams, Gaussian Processes for Machine Learning, MIT 2006
* Bishop, Pattern Recognition and Machine Learning, Springer 2007
* Schölkopf/Smola, Learning with Kernels, MIT 2001
* Jaynes, Probability Theory – the Logic of Science, Cambridge 2003', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik
* Pflichtbereich im Master-Studiengang Artificial Intelligence and Data Science', '* Aktive und erfolgreiche Mitwirkung in den Übungen;
* Prüfung zu Vorlesung und Übungen am Ende des Semesters', '10 LP ab PO 2013, alte PO’s 15 LP', 'Machine Learning', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”

Hilfreich ist erfolgreicher Abschluss der Mathematik Module:

* "Lineare Algebra", "Analysis", "Stochastik" und "Numerik"', 30);
INSERT INTO public.veranstaltung VALUES (33, 'Dieses Modul findet in unregelmäßigen Abständen statt.', 'Diese Veranstaltung beschäftigt sich mit verschiedenen Bereichen zur Entscheidungsfindung aus Sicht der Informatik mit einem speziellen Fokus auf „Informatik unplugged“. Ziel von Informatik unplugged ist es, fundamentale Konzepte der Informatik anhand von einzelnen Aktivitäten zu erlernen. Dabei haben alle diese Aktivitäten gemeinsam, dass keine Computer benötigt werden. In dieser Veranstaltung sollen die Studierenden zunächst dieses Gesamtkonzept kennenlernen und sich danach in Kleingruppen intensiv mit einem Thema aus dem Bereich der Entscheidungsfindung auseinandersetzen. Im Anschluss daran sollen die Teilnehmer selber unplugged Aktivitäten zu einem gewählten Thema entwickeln, und die zugrundeliegenden Konzepte den anderen Teilnehmern vorstellen. Die unplugged Aktivität soll dabei den Zugang zu einem neuen Themengebiet erleichtern. In Übungsaufgaben soll der erlernte Inhalt angewendet werden. Beispiele für Themengebiete sind Algorithmen zur Entscheidungsfindung in den Bereichen Hedonic Games, Matching oder Majority graphs.
In dieser Veranstaltung müssen Vorträge ausgearbeitet und gehalten werden, außerdem muss eine schriftliche Zusammenfassung des gewählten Themas erfolgen. Durch gegenseitige Begutachtungen sollen die Studierenden ihre Fähigkeiten im Bereich der kritischen und fairen Begutachtung erweitern.', 'Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,

* das Konzept von Informatik unplugged zu erläutern.
* Informatik unplugged Aktivitäten mit anderen Teilnehmern durchzuführen, und das dahintersteckende fundamentale Konzept anschaulich zu erklären.
* neue Informatik unplugged Aktivitäten zu Algorithmen zur Entscheidungsfindung selbst zu entwickeln.
* sich einen neuen Themenbereich selbstständig zu erarbeiten.
* ein selbständig erarbeitetes Thema anschaulich zu präsentieren
* erlernte Inhalte anzuwenden', '* Computer Science Unplugged. Tim Bell, Ian H. Witten, und Mike Fellows. Online verfügbar unter: [http://csunplugged.org](http://csunplugged.org)
* Abenteuer Informatik: IT zum Anfassen – von Routenplaner bis Online Banking. Jens Gallenbacher, Spektrum Akademischer Verlag, 2012.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* Schriftliche Ausarbeitung einer neuen unplugged Aktivität
* Vorstellen der neu erarbeiteten unplugged Aktivität
* Vorstellen der theoretischen Grundlagen zu der erarbeiteten unplugged Aktivität
* erfolgreiche Bearbeitung der wöchentlichen Übungsaufgaben
* angemessene Begutachtung einer anderen schriftlichen Zusammenfassung
* Bestehen der Prüfung am Ende der Veranstaltung über alle Themengebiete der Veranstaltung (i.d.R. Klausur, 90 Minuten)', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Algorithmen zur Entscheidungsfindung unplugged', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 31);
INSERT INTO public.veranstaltung VALUES (34, 'Dieses Modul findet in unregelmäßigen Abständen statt.', 'Dieses Modul beschäftigt sich mit unterschiedlichen Arten von Matching bzw. Zuteilungsverfahren. Solche Verfahren können in unterschiedlichen Bereichen eingesetzt werden, Beispiele sind die Vergabe von Studienplätzen, die Verteilung von Assistenzärzten auf Krankenhäuser oder das Nierentransplantationsproblem. Inhalt der Veranstaltung sind verschiedene Verfahren mit ihren axiomatischen und algorithmischen Eigenschaften.', 'Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,

* Zuteilungsverfahren in unterschiedlichen Situationen durchzuführen
* Herausforderung von praktischen Zuteilungsverfahren zu identifizieren
* neue Verfahren zur Zuteilung für spezielle Einsatzbereiche zu entwickeln und im Hinblick auf Ihre Eigenschaften zu untersuchen
* bekannte Verfahren zur Zuteilung auf neue Einsatzbereiche zu übertragen
* verschiedene Verfahren zur Zuteilung gegenüber zu stellen
* Empfehlungen für bestimmte Einsatzbereiche der Zuteilung zu geben', '* The Stable Marriage Problem, Structure and Algorithms. Dan Gusfield and Robert W. Irving. MIT
Press, 1989.
* Algorithmics of Matching under Preferences, David F. Manlove. World Scientific Publishing Company,
2013.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* erfolgreiche Bearbeitung der Übungsaufgaben
* aktive und erfolgreiche Mitwirkung in den Übungen
* bestehen der Prüfung am Ende der Veranstaltung (i.d.R. Klausur, 90 Minuten)', '5 LP', 'Matching', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 32);
INSERT INTO public.veranstaltung VALUES (35, 'Dieses Modul wird in unregelmäßigen Abständen angeboten.', 'Dieses Modul befasst sich mit folgenden theoretischen Aspekten von Netzwerken:

* Grundlagen
* Struktur von Netzwerken
* Teilgraphen in Netzwerken
* Zentralitätsmaße in Netzwerken
* Analysemethoden für Netzwerke
* Modellierung von Netzwerken', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die besprochenen Anwendungsbereiche von Netzwerken zu erläutern
* die besprochenen Grundlagen von Netzwerken formal zu definieren
* die behandelten Analysemethoden für Netzwerke zu verstehen und auf konkrete Eingaben anzuwenden', '* D. Easley, J. Kleinberg: Networks, Crowds, and Markets, Cambridge University Press, 2010.
* E. Estrada: The Structure of Complex Networks: Theory and Applications, Oxford University Press, 2011.
* D. Jungnickel: Graphs, Networks and Algorithms, Springer, 2013
* S. Wassermann, K. Faust: Social Network Analysis: Methods and Applications, Cambridge University Press, 2009.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', 'Aktive Mitarbeit in den Übungen, Abgabe der Übungsaufgaben, Bestehen der Klausur zum Ende des Semesters', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Networks, Crowds, and Markets', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 33);
INSERT INTO public.veranstaltung VALUES (36, 'Etwa alle vier Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.', '* Nichtkooperative Spiele: Gegeneinander spielen
  * Grundlagen
    * Normalform, dominante Strategien und Gleichgewichte
    * Weitere Zwei-Personen-Spiele
  * Nash-Gleichgewichte in gemischten Strategien
    * Definition und Eigenschaften gemischter Nash-Gleichgewichte
    * Existenz von Nash-Gleichgewichten in gemischten Strategien
  * Schachmatt: Spielbäume in Spielen mit perfekter Information
    * Sequenzielle Zwei-Personen-Spiele
    * Gleichgewichte in Spielbäumen
  * Full House: Spiele mit unvollkommener Information
    * Das Ziegenproblem
    * Analyse einer einfachen Poker-Variante
  * Wie schwer ist es, ein Nash-Gleichgewicht zu finden?
    * Nash-Gleichgewichte in Nullsummenspielen
    * Nash-Gleichgewichte in allgemeinen Normalform-Spielen', 'Ziel in diesem Modul ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem Gebiet der nichtkooperativen Spieltheorie zu vermitteln. Am Ende der Veranstaltung sollten Studierende wichtige Probleme und die zu ihrer Lösung entwickelten Algorithmen und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können. Insbesondere sollten sie in der Lage sein, „strategische Szenarien“ durch nichtkooperative Spiele zu beschreiben und Stabilitäts- und Gleichgewichtskonzepte in diesen Spielen formal zu charakterisieren. Ebenso sollten sie die Komplexität der für solche Spiele relevanten Entscheidungsprobleme (in einer geeigneten kompakten Darstellung) formal bestimmen und beschreiben können.', '* Jörg Rothe (ed.): Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.

Eine kürzere deutsche Version dieses Buches erschien als:

* Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011.', '', 'Wahlpflichtbereich

* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* erfolgreiche Bearbeitung der Übungsaufgaben
* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung', '5 LP ab PO 2013, alte PO’s 7,5 L', 'Nichtkooperative Spieltheorie', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 34);
INSERT INTO public.veranstaltung VALUES (37, 'Etwa alle zwei Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.', '* Grundlagen der Social-Choice-Theorie
  * Wahlen
  * Wahlsysteme
  * Eigenschaften von Wahlsystemen
  * Einige Wahl-Paradoxa und Unmöglichkeitssätze
* Algorithmik und Komplexität von Wahlproblemen
  * Gewinnerbestimmung
  * Mögliche und notwendige Gewinner
  * Manipulation
  * Wahlkontrolle
  * Bestechung', 'Ziel in diesem Modul ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem jungen, sich rasant entwickelnden, interdisziplinären Gebiet Computational Social Choice zu vermitteln, welches derzeit in der Abteilung „Komplexitätstheorie und Kryptologie“ (Prof. Jörg Rothe und Jun.-Prof. Dorothea Baumeister) intensiv in der Forschung bearbeitet wird und in dem bevorzugt Themen für Bachelor- und Master-Arbeiten ausgegeben werden. Am Ende der Veranstaltung sollten Studierende die wichtigsten Wahlverfahren und ihre „social-choice“-theoretischen Eigenschaften sowie die damit im Zusammenhang stehenden Entscheidungsprobleme (Gewinnerbestimmung, Manipulation, Wahlkontrolle, Bestechung usw.) und die zu ihrer Lösung entwickelten Algorithmen und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können. Ebenso sollten sie die Komplexität dieser Probleme formal bestimmen und beschreiben können.', '* Jörg Rothe (ed.): Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.

Eine kürzere deutsche Version dieses Buches erschien als:

* Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* erfolgreiche Bearbeitung der Übungsaufgaben
* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung', '10 LP ab PO 2013, alte PO’s 15 LP', 'Präferenzaggregation durch Wählen: Algorithmik und Komplexität', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 35);
INSERT INTO public.veranstaltung VALUES (38, 'Jedes Wintersemester.', 'Das Modul „Rechnernetze” richtet sich an Studenten, die verstehen wollen, wie Rechnernetze aus technischer Sicht funktionieren und welche Entwicklungen in der Zukunft zu erwarten sind. Es werden einerseits die grundlegenden Fragestellungen des Gebietes untersucht und andererseits besprochen, wie diese Fragestellungen im Internet gelöst sind. Ziel des Moduls ist es, sowohl ein solides allgemeines Basiswissen im Bereich der Rechnernetze als auch praktisch einsetzbare Kenntnisse zu vermitteln. Damit die Lernziele eines Praktikumsversuchs erreicht werden, ist es erforderlich, dass sich die Studierenden inhaltlich vorbereiten. Um dies zu gewährleisten, werden Studierende nur dann zu einem Praktikumsversuch zugelassen, wenn sie vor Versuchsbeginn ein Antestat erfolgreich absolvieren.', 'Studierende verstehen nach erfolgreichem Abschluss dieses Moduls die grundlegende Funktionsweise moderner Computernetzwerke. Sie verfügen über grundlegende praktische Fähigkeiten in der Netzwerkprogrammierung und der Administration von Computernetzwerken.', 'Das primäre Lehrbuch zu dieser Veranstaltung ist:

* James F. Kurose und Keith W. Ross: Computer Networking – A Top-Down Approach Featuring the Internet; 6th Edition; Pearson, 2012', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* aktive Mitarbeit in den Übungen und im Praktikum
* schriftliche Prüfung (Klausur, i.d.R. 90 Minuten)', '10 LP ab PO 2013, alte PO’s 15 LP', 'Rechnernetze', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 36);
INSERT INTO public.veranstaltung VALUES (39, 'Jedes Studienjahr, in der Regel im Sommersemester', 'Das Modul baut auf einem Kurs und dem zugehörigen Buch (s. Literatur unten) von Prof. Gianluca Bontempi an der Université Libre de Bruxelles zu den statistischen Grundlagen des maschinellen Lernens auf.

Inhalte sind im Einzelnen:

* Die Programmiersprache R für statistical Computing
* beschreibende Statistik
* Grundlagen der Wahrscheinlichkeitsrechnung
* klassische parametrische Schätzung und Tests
* Nicht-parametrische Schätzung und Tests
* Statistisches Lernen
* Lineare Ansätze
* Nicht-lineare Ansätze
* Dimensionalitätsreduktion', 'Die Studierenden werden nach der Veranstaltung in der Lage sein:

* grundlegende Konzepte der Datenanalyse zusammenzufassen;
* selbst Auswertung mit R zu planen und durchzuführen
* grafisch aussagekräftige Darstellungen von Daten zu erstellen.', '* Gianluca Bontempi: Handbook on "Statistical foundations of machine learning", Brüssel 2017', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* aktive Teilnahme an den Übungen
* erfolgreiches Bearbeiten der Übungsaufgaben (50%)
* abschließende Prüfung (i.d.R. schriftlich)', '5 LP', 'Statistische Datenanalyse', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 37);
INSERT INTO public.veranstaltung VALUES (40, 'I.d.R. jährlich', 'Mögliche Inhalte des Seminars, die in Absprache mit den Teilnehmern behandelt werden können sind:

* Grundlagen künstlicher Intelligenz
* Rückblick / Ausblick künstlicher Intelligenz
* Grenzen von KI
* Algorithmen
* Constraint Logic Programming und Constraint Handling Rules
* Inductive / Abductive Logic Programming', 'Nach erfolgreichem Abschluss des Moduls sollte der Student

* ein grundlegendes Verständnis für Fragestellungen und Probleme aus dem Bereich der künstlichen Intelligenz haben,
* Gängige Algorithmen und Techniken aus dem Bereich kennen,
* Mit Prolog und Erweiterungen wie CLP und CHR umgehen können,
* Techniken des “inductive” und “abductive logic programming” kennen und umsetzen können, und
* Aufgaben der künstlichen Intelligenz in Prolog lösen können.', '* Bratko, “Prolog Programming for Artificial Intelligence”, Addison Wesley
* Russel, Norvig, “Artificial Intelligence: A Modern Approach”, Prentice Hall', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* Aktive und erfolgreiche Mitwirkung im Seminar
* Prüfung am Ende des Semesters', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Überblick Künstliche Intelligenz', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”
* Hilfreich ist erfolgreicher Abschluss des Moduls: "Einführung in die logische Programmierung"', 38);
INSERT INTO public.veranstaltung VALUES (41, 'Dieses Modul findet in unregelmäßigen Abständen statt.', 'Dieses Modul beschäftigt sich mit verschiedenen Verfahren zur kollektiven Entscheidungsfindung. Mechanismen zur kollektiven Entscheidungsfindung werden in vielen Bereichen der künstlichen Intelligenz, zum Beispiel bei der Interaktion von autonomen Agenten benötigt. Inhalt der Veranstaltung sind verschiedene Verfahren mit ihren axiomatischen und algorithmischen Eigenschaften. Zu den Verfahren gehören unter anderem:

* Judgment Aggregation
* Wahlen
* Argumentationsgraphen', 'Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,

* kollektive Entscheidungsfindung in unterschiedlichen Situationen durchzuführen
* neue Verfahren zur kollektiven Entscheidungsfindung für spezielle Einsatzbereiche zu entwickeln und im Hinblick auf Ihre Eigenschaften zu untersuchen
* bekannte Verfahren zur kollektiven Entscheidungsfindung auf neue Einsatzbereiche zu übertragen
* verschiedene Verfahren zur kollektiven Entscheidungsfindung gegenüber zu stellen
* Empfehlungen für bestimmte Einsatzbereiche der kollektiven Entscheidungsfindung geben', '* Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division. J. Rothe (ed.). Unter Vertrag bei Springer. Voraussichtliche Publikation: 2015.

Eine kürzere deutsche Version dieses Buches erschien unter dem Titel:

* Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen. Jörg Rothe, Dorothea Baumeister, Claudia Lindner, Irene Rothe. Spektrum Akademischer Verlag, 2011.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* aktive und erfolgreiche Mitwirkung in den theoretischen und praktischen Übungen
* Prüfung am Ende der Veranstaltung (i.d.R. Klausur, 90 Minuten)', '10 LP ab PO 2013, alte PO’s 15 LP', 'Verfahren zur kollektiven Entscheidungsfindung', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 39);
INSERT INTO public.veranstaltung VALUES (42, 'Jährlich, i.d.R. im Sommersemester', 'Diese Veranstaltung bietet eine Reise durch verschiedene Gebiete der Informatik um dabei ein Gesamtbild über die prinzipielle Funktionsweise von Computern vermitteln. Ausgehend von dem NAND-Gatter werden alle wichtigen Hardware-Komponenten eines Computers in einer Simulation nachgebaut, ALU, CPU, RAM, etc. Für die im Rahmen der Vorlesung entwickelte CPU und die dazugehörige Maschinensprache werden schrittweise eine Assemblersprache, eine virtuelle Maschine und eine Programmiersprache sowie der dazugehörige Compiler entwickelt. Mit all diesen Werkzeugen werden schließlich ein einfaches Betriebssystem und Anwendungsprogramme entwickelt.

Die Vorlesung wird begleitet von Übungen. Die eigenständige praktische Anwendung des Gelernten soll im Fokus der Veranstaltung liegen. Die Studenten entwickeln in den Übungen die diversen in der Vorlesung vorgestellten Komponenten moderner Computer.', 'Der Student soll einen Gesamtüberblick über Funktionsweise eines Computers bekommen und auf jeder Ebene (von der untersten Hardwareebene bis zur höchsten Softwareebene)

* die Grundprinzipien erläutern und bewerten können
* eigenständig neue Funktionalitäten auf dieser Eben entwickeln zu können.', '* Noam Nisan, Shimon Schocken "The Elements of Computing Systems: Building a Modern Computer from First Principles", MIT Press.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* aktive Teilnahme an den Übungen
* erfolgreiches Bearbeiten der Übungsaufgaben
* abschließende Prüfung (i.d.R. schriftlich)', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Von NAND zu Tetris', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 40);
INSERT INTO public.veranstaltung VALUES (43, 'Bei Vorliegen der Voraussetzungen ist der Beginn der Abschlussarbeit jederzeit möglich, d.h. die Vergabe von Themen ist nicht an bestimmte Zeiten im Semester gebunden.', 'Der Inhalt der Bachelor-Arbeit liegt im gewählten Schwerpunktfach. Die Bachelor-Arbeit muss in deutscher oder englischer Sprache verfasst und in einem mündlichen Vortrag präsentiert werden.', 'Mit der schriftlichen Abschlussarbeit sollen die Studierenden nachweisen, dass sie in der Lage sind:

* innerhalb einer vorgegebenen Frist (von 3 Monaten)
* ein Thema selbstständig zu bearbeiten
* und dieses angemessen darzustellen.', '', '', '* Bachelor-Arbeit', 'Erfolgreiche Bearbeitung des Themas und Darstellung in einer fristgerecht abgegebenen Ausarbeitung (Bachelor-Arbeit); Präsentation in einem mündlichen Vortrag mit Diskussion', '15 LP', 'Bachelor-Arbeit', 'Für die Anmeldung zur Bachelor-Arbeit müssen mindestens 120 der im Rahmen des Bachelor-Studiums zu erwerbenden Leistungspunkte nachgewiesen werden. Das Thema der Bachelor-Arbeit wird aus dem Gebiet des gewählten Schwerpunktfachs vergeben. Dazu sollten üblicherweise alle Module im Schwerpunktfach erfolgreich abgeschlossen sein.', 41);
INSERT INTO public.veranstaltung VALUES (44, 'Dieses Halb-Modul wird in unregelmäßigen Abständen angeboten.', 'Dieses Modul befasst sich mit verschiedenen Arten zur Visualisierung von Graphen und Algorithmen, welche diese konstruieren.', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein, die besprochenen Visualisierungen für Graphen zu erläutern, die behandelten Algorithmen zu verstehen und auf konkrete Eingaben anzuwenden.', '* G. Di Battista, P. Eades, I.G. Tollis, R. Tamassia: Graph Drawing: Algorithms for the Visualization of Graphs, Prentice Hall, 1999.
* M. Jünger, P. Mutzel: Graph Drawing Software, Springer Verlag, 2004.
* M. Kaufmann, D. Wagner: Drawing Graphs: Methods and Models, Springer Verlag, 2001.
* T. Nishizeki, MD S. Rahman: Planar Graph Drawing, World Scientific Pub Co, 2004.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', 'Aktive Mitarbeit in den Übungen, Bestehen der Klausur zum Ende des Semesters', '5 LP', 'Algorithmen zur Visualisierung von Graphen', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 42);
INSERT INTO public.veranstaltung VALUES (45, 'Etwa alle vier Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.', '* Grundlagen der Social-Choice-Theorie
  * Wahlen
  * Wahlsysteme
  * Eigenschaften von Wahlsystemen
  * Einige Wahl-Paradoxa und Unmöglichkeitssätze
* Algorithmik und Komplexität von Wahlproblemen
  * Gewinnerbestimmung
  * Mögliche und notwendige Gewinner
  * Manipulation', 'Ziel in diesem Modul ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem jungen, sich rasant entwickelnden, interdisziplinären Gebiet Computational Social Choice zu vermitteln, welches derzeit in der Abteilung „Komplexitätstheorie und Kryptologie“ (Prof. Jörg Rothe und Jun.-Prof. Dorothea Baumeister) intensiv in der Forschung bearbeitet wird, und in dem bevorzugt Themen für Bachelor- und Master-Arbeiten ausgegeben werden. Am Ende der Veranstaltung sollten Studierende die wichtigsten Wahlverfahren und ihre „social-choice“-theoretischen Eigenschaften sowie die damit im Zusammenhang stehenden Entscheidungsprobleme (Gewinnerbestimmung, Manipulation usw.) und die zu ihrer Lösung entwickelten Algorithmen und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können. Ebenso sollten sie die Komplexität dieser Probleme formal bestimmen und beschreiben können.', '* Jörg Rothe (ed.): Economics and Computation: An Introduction to Algorithmic Game Theory,
Computational Social Choice, and Fair Division, Springer-Verlag, 2015.

Eine kürzere deutsche Version dieses Buches erschien als:

* Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational
Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und
Teilen, Spektrum Akademischer Verlag (Springer), 2011.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* erfolgreiche Bearbeitung der Übungsaufgaben
* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Algorithmische Eigenschaften von Wahlsystemen', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 43);
INSERT INTO public.veranstaltung VALUES (46, 'Jedes zweite Sommersemester', 'Dieses Modul vermittelt grundlegende Kenntnisse zur Berechnung und Anwendung der folgenden Probleme und Methoden.

* Konvexe Hülle
* Distanzprobleme
* Schnittprobleme
* Voronoi Diagramme
* Polygon Triangulierung
* Delaunay Triangulierung
* Plane-Sweep Algorithmen
* Randomisierte inkrementelle Algorithmen', 'Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein erweitertes Verständnis der theoretischen Grundlagen über den Entwurf von Algorithmen für Fragestellungen aus der algorithmischen Geometrie.', '* de Berg et al: Computational Geometry, Algorithms and applications. Springer-Verlag, Berlin, 2. rev. ed., 2000.
* Preparata, Shamos: Computational geometry, an introduction. Springer-Verlag, New York, 1985.
* Edelsbrunner: Algorithms in Combinatorial Geometry, EATCS Monographs in Computer Science 10. Springer¬Verlag, 1987.
* Matousek: Lectures on discrete geometry, Graduate Texts in Mathematics, 212. Springer-Verlag, New York, 2002.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* aktive Mitarbeit in den Übungen
* Abgabe der Hausaufgaben
* schriftliche Klausur (i.d.R. 90 Minuten) oder mündliche Prüfung am Ende des Semesters', '5 LP für alle PO’s', 'Algorithmische Geometrie', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 44);
INSERT INTO public.veranstaltung VALUES (47, 'Jedes Sommersemester', 'Dieses Modul vermittelt grundlegende Kenntnisse aus folgenden Bereichen.

* Methoden des Algorithmenentwurfs (Teile und Beherrsche, Dynamische Programmierung, ...),
* Einführung in die algorithmische Komplexität (Nichtdeterminismus, NP-Vollständigkeit, ...),
* Schaltkreiskomplexität
* Approximationsalgorithmen
* Parameterisierte Algorithmen
* Randomisierte Algorithmen
* Einführung in Online-Algorithmen', 'Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein erweitertes Verständnis der theoretischen Grundlagen über den Entwurf von Algorithmen. Sie können algorithmische Probleme spezifizieren und sie bzgl. ihrer algorithmischen Komplexität analysieren.', '* Christos H. Papadimitriou, Computational, Addison-Wesley, 1993
* Richard Johnsonbaugh, Marcus Schäfer: Algorithms, Pearson Education, 2004
* Jon Kleinberg, Eva Tardos: Algorithm Design, Addison Wesley, 2006', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', '* aktive Mitarbeit in den Übungen
* Abgabe der Hausaufgaben
* schriftliche Klausur (i.d.R. 90 Minuten) oder mündliche Prüfung am Ende des Semesters', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Algorithmische Komplexitätstheorie', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 45);
INSERT INTO public.veranstaltung VALUES (48, 'Jedes Studienjahr, in der Regel im Wintersemester', '"In theory, there is no difference between theory and practice. In practice, there is."

Algorithmen bilden die Grundlage jedes Computerprogramms. Traditionell liegt der Fokus des Algorithmendesigns auf der Theorie effizienter Algorithmen und deren worst case-Analyse. In dieser Veranstaltung geht es jedoch um praktisch effiziente Algorithmen, oft auch für beweisbar schwere Probleme, mit dem Ziel, die Prinzipien der Optimalität nicht (vollständig) aufzugeben. Themengebiete sind:

* Pattern Matching und Textindizes (von Suffix-Trees zur Burrows-Wheeler-Transformation)
* Algorithmen für schwere Probleme: Branch-and-Bound, Ganzzahlige Lineare Programmierung, Approximationsalgorithmen
* Algorithmen zum Clustern großer Datenmengen
* Google''s Pagerank-Algorithmus

Zudem wird ein ausgewähltes (fiktives) praktisches Problem (aus dem Bereich der Alchemie) im Rahmen einer Programmierchallenge in Gruppenarbeit gelöst.', 'Nach der Veranstaltung werden die Studierenden in der Lage sein

* verschiedene Techniken der Angewandten Algorithmen zu beherrschen und diese auf neue Probleme anzuwenden
* Probleme praktisch effizient zu lösen und diese Lösungen zu implementieren', '* Teilweise Originalarbeiten', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik
* Teil eines Master-Moduls im Master-Studiengang Biologie', '* aktive Teilnahme an den Übungen
* erfolgreiches Bearbeiten der Übungsaufgaben (50%)
* abschließende Prüfung (i.d.R. schriftlich)', '5 LP', 'Angewandte Algorithmik', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung“
* „Rechnerarchitektur“

Master-Studierende müssen zusätzlich folgende Module erfolgreich abgeschlossen haben:

* „Algorithmen und Datenstrukturen“
* „Theoretische Informatik“', 46);
INSERT INTO public.veranstaltung VALUES (49, 'Dieses Halb-Modul wird in unregelmäßigen Abständen angeboten.', 'Dieses Modul befasst sich mit den folgenden schweren Optimierungsproblemen, für die es vermutlich keine effizienten Algorithmen gibt, und stellt verschiedene Näherungslösungen für diese Probleme vor.

* Metric Traveling Salesman
* Job Scheduling
* Knapsack
* Bin Packing', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die besprochenen schweren Optimierungsprobleme zu erläutern und
* die behandelten Approximationsalgorithmen auf konkrete Eingaben anzuwenden', '* K. Jansen, M. Margraf: Approximative Algorithmen und Nichtapproximierbarkeit, de Gruyter Verlag, 2008.
* R. Wanka: Approximationsalgorithmen, Teubner Verlag, 2006.', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', 'Aktive Mitarbeit in den Übungen, Bestehen der Klausur zum Ende des Semesters', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Approximative Algorithmen', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 47);
INSERT INTO public.veranstaltung VALUES (50, 'Wird nicht mehr angeboten', '* Architekturformen: monolitisch, geschichtet, Mikrokern, Client/Server
* Speicher: Segmentierung, Paging, Garbage Collection
* Nebenläufigkeit: Schedulingstrategien, Prozesse, Threads, Interrupts
* Synchronisierung: Semaphore, klassische Problemstellungen, Verklemmungen
* Dateisysteme: FAT, UNIX, EXT, NTFS
* Kommunikation: Signale, Pipes, Sockets
* Sicherheit: HW-Schutz
* Fallstudien, u.a. Linux, Microsoft Windows', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* Betriebssystembegriffe zu nennen und zu erläutern
* Speicherverwaltungstechniken (physikalisch, virtuell, Segmentierung und Paging) auf gegebene Beispiele anzuwenden und zu bewerten.
* Schedulingstrategien anzuwenden und zu bewerten.
* Synchronisierungsprobleme in parallelen Threads zu erkennen und eigene Synchronisierungslösungen zu konzipieren
* Interprozesskommunikation anzuwenden
* grundlegende Betriebssystemkonzepte in modernen Desktop-Betriebssystemen in eigenen Worten erklären zu können', '* Andrew S. Tanenbaum: „Modern Operating Systems”, 4. Auflage, Prentice Hall, 2014', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete
* Nebenfach im Bachelor-Studiengang Physik
* Nebenfach im Bachelor-Studiengang Medizinische Physik', 'Erfolgreiche Teilnahme an der Prüfung am Ende der Veranstaltung.', '5 LP ab PO 2013, alte PO’s 7,5 LP', 'Betriebssysteme', 'Erfolgreicher Abschluss folgender Module:

* „Programmierung”
* „Rechnerarchitektur”', 48);
INSERT INTO public.veranstaltung VALUES (51, 'Jedes Wintersemester', 'Dieses Modul vermittelt Kenntnisse aus folgenden Bereichen:

* Eigenschaften von Adjazenzmatrizen
* Graphhomomorphismen
* Strukturelle Ähnlichkeit von Graphen
* Normalformen von Graphen
* Graphen über algebraischen Strukturen
* Kombinatorische Grapheigenschaften', 'Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend die Fähigkeit, Struktureigenschaften von Graphen und Graphklassen mittels kombinatorischer und algebraischer Methoden zu analysieren.', 'Aktuelle Lehrbücher über Graphentheorie sowie Originalliteratur', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik
* Teil eines Master-Moduls im Master-Studiengang Biologie', 'schriftliche Prüfung (i.d.R. 90 Minuten)oder mündliche Prüfung (i.d.R. 30 Minuten) am Ende des Semesters', '5 LP', 'Algebraische und Strukturelle Graphentheorie', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 49);
INSERT INTO public.veranstaltung VALUES (52, 'Alle 2 Jahre', '* Java
* Grundgerüst einer Android-Anwendung
* Activities & Fragments
* Grafik & Animation
* Eingabeereignisse
* Persistenz und Speicherverwaltung
* Intents & Broadcast Receivers
* Netzwerk
* Native-C (Subkomponente?)
* Erarbeitung eines Anwendungskonzeptes
* Packages (.apk), Libraries (.aar)
* In-App-Purchases', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* mit Hilfe von Java (und Native-C) Android-Anwendungen zu programmieren
* Android Studio als Entwicklungsumgebung anzuwenden
* Anwendungskonzepte zu erarbeiten und umzusetzen
* grundlegende Netzwerkkommunikation zu programmieren
* mit den gewonnenen Kenntnissen das Software-Projekt zu konzipieren und zu realisieren', '* Zigurd Mednieks et al., “Android Programmierung”, O''Reilly, 2013
* Arno Becker, Marcus Pant, “Android -Grundlagen und Programmierung”, dpunkt, 2010
* Android Developer Homepage', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Erfolgreiche Bearbeitung der Pflichtübungen
* Erfolgreiche Entwicklung einer Android-Anwendung
* Bestehen der Klausur', '5 LP ab PO 2015, alte PO 7,5 LP', 'Android-Programmierung', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 50);
INSERT INTO public.veranstaltung VALUES (53, 'Jährlich im Sommersemester', '* Python mit Fokus auf Anwendungen in bioinformatischer “Data Science”
* Workflowmanagement: Snakemake
* Analyse von High-Throughput-Sequencing Daten
* Genome Assembly
* Read Mapping
* Analyse biologischer Netzwerke
* Analyse biologischer Netzwerke
* Berechnung von Stammbäumen
* Identifizierung von Genen, die Zeichen natürlicher Auslese zeigen (dN/dS)
* Modellierung der Evolution von DANN-Sequenzen', 'Die Studierenden verstehen die Grundlagen der vergleichenden Genomik und sind in der Lage, eigenständig Analysen von DNA-Sequenzdaten durchzuführen. Die Studierenden verstehen zugrundeliegende Konzepte fortgeschrittener bioinformatischer Analyse-Pipelines und können diese anwenden. Sie sind in der Lage, ei-gene Schritte dieser Pipelines zu implementieren wie zum Beispiel einen eigenen, einfachen Assembler. Sie verstehen die Herausforderungen der Anwendungen und die Grenzen der bestehenden Ansätze.', 'Wird im Rahmen der Vorlesung vorgestellt', '', '* Wahlpflichtbereich
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete', '* Regelmäßige und aktive Teilnahme am Praktikum
* Rechtzeitige Abgabe von erstellten Programmen / Protokollen, die den Anforderungen wissenschaftlicher Arbeit entsprechen
* Bestehen der Abschlussprüfung', '5LP ab PO 2015, alte PO 7,5LP', 'Angewandte Bioinformatik', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 51);
INSERT INTO public.veranstaltung VALUES (54, 'Dieses Modul wird in unregelmäßigen Abständen angeboten.', 'Dieses Modul befasst sich mit den folgenden schweren Optimierungsproblemen, für die es vermutlich keine effizienten Algorithmen gibt, und stellt verschiedene Ansätze zum Finden von Näherungslösungen für diese Probleme vor.

* Grundlagen
* Metric Traveling Salesman
* Job Scheduling
* Knapsack
* Bin Packing
* Steiner Tree
* Weighted Vertex Cover', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die besprochenen schweren Optimierungsprobleme zu erläutern und formal zu definieren
* die behandelten Approximationsalgorithmen zu verstehen und auf konkrete Eingaben anzuwenden
* die Optimierungsprobleme bekannten Komplexitätsklassen zuzuordnen
* Beweise für die Approximationsgüte von Approximationsalgorithmen zu durchschauen', '* G. Ausiello, P. Crescenzi, G. Gambosi, et al.: Complexity and Approximation: Combinatorial Optimiza-tion Problems and Their Approximability Properties, Springer Verlag, 1999.
* K. Jansen, M. Margraf: Approximative Algorithmen und Nichtapproximierbarkeit, de Gruyter Verlag, 2008.
* V. Vazirani: Approximation Algorithms, Springer Verlag, 2003.
* R. Wanka: Approximationsalgorithmen, Teubner Verlag, 2006.', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', 'Aktive Mitarbeit in den Übungen, Abgabe der Übungsaufgaben, Bestehen der Klausur zum Ende des Se-mesters', '5 LP ab PO 2015, alte PO 7,5 LP', 'Approximationsalgorithmen', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 52);
INSERT INTO public.veranstaltung VALUES (55, 'Circa alle zwei Jahre', 'Die Lehrveranstaltung vermittelt grundlegende Konzepte, die für den Bau eines Betriebssystems erforderlich sind. In der vorlesungsbegleitenden Übung werden diese Kenntnisse praktisch angewendet, indem ein einfa-ches PC-Betriebssystem von Grund auf entwickelt wird. Hierzu sind fundierte Kenntnisse über Aufbau und Funktionsweise der PC-Hardware erforderlich, die ebenfalls in der Lehrveranstaltung vermittelt werden. Angesprochen werden zum Beispiel das Schutzkonzept der IA-32 Architektur, Speicherverwaltung, Interrupt-Verarbeitung und Multi-Threading mit Synchronisierung.', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die Programmiersprache C++ anzuwenden
* grundlegende Betriebssystemfunktionen selbst zu entwickeln
* die Abläufe von Scheduler, Threads, Interrupts und Synchronisierung zu implementieren

Jeder(e) Teilnehmer(in) entwickelt (stufenweise, mit Vorgaben) sein/ihr eigenes Betriebssystem.', '* H. P. Messmer und K. Dembowski, PC-Hardwarebuch, Addison-Wesley 2006
* Intel Corporation, Intel Architecture Software Developer''s Manual.', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Erfolgreiche Bearbeitung der Übungenund Abgabe eines nativ lauffähigen Betriebssystems
* Abschließende Prüfung am Ende des Semesters', '5 LP ab PO 2015, alte PO 7,5 LP', 'Betriebssystem-Entwicklung', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 53);
INSERT INTO public.veranstaltung VALUES (56, 'Circa alle zwei Jahre', 'Dieses Modul baut auf dem eigenen Betriebssystem HHUos auf, welches im Modul „Betriebssystem-Ent-wicklung“ entwickelt wird. HHUos ist ein natives Betriebssystem für die IA32-Architektur. Die Studierenden entwickeln eine oder mehrere fortführende Komponenten für HHUos in C++/C/Assembler. Diese Komponen-ten sollen am Ende in HHUos integriert und dokumentiert werden. Im Rahmen des wöchentlichen Seminars werden Konzepte und Entwicklungen diskutiert, sowohl aus der Literatur, als auch eigene Ideen.', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* Betriebssystem-Konzepte in eigenen Worten zu erklären
* die Programmiersprache C++/C/Assembler für IA32(e)anzuwenden
* fortführende Betriebssystemfunktionen und Hardware-Treiber selbst zu entwickeln', '* H. P. Messmer und K. Dembowski, PC-Hardwarebuch, Addison-Wesley 2006
* Intel Corporation, Intel Architecture Software Developer''s Manual
* Weitere Literatur wird in der Veranstaltung bekannt gegeben', '', '* WahlpflichtbereichPraktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Erfolgreiche Entwicklung nativer Betriebssystem-Komponenten
* Aktive und regelmäßige Teilnahme am wöchentlichen Seminar
* Abschließende mündliche Prüfung am Ende des Semesters', '10LP', 'Betriebssysteme Vertiefung', 'Nur für Master-Studierende:

* „Betriebssystem-Entwicklung“', 54);
INSERT INTO public.veranstaltung VALUES (57, 'No longer avaible.', 'Course description: Big Data is one of the main buzz words nowadays, being a primary focus both for aca-demic research and for industry. Big Data has emerged as a revolution driven by the continuous increasing volumes of data that are being collected at increasing velocities from various source: social networks, IoT, scientific simulations, finance, weather forecasting, etc. Tackling such challenges, commonly referred to as the V’s of Big Data, has lead to the development of a plethora of technologies and concepts. Batch and stream processing are the main classes of dealing with the data, which can be either offline or in real time. Starting from these two categories, different programming models such as MapReduce or reactive program-ming have beenrecently proposed. Additionally multiple technologies have been, and are developed to facili-tate the processing and the data management of Big Data scenarios: HDFS, MapReduce, Spark, Storm, -Flink, Kafka, HBase, Hive, etc. All these form today the Hadoop ecosystem. This course aims to give an in-troduction to technologies and concepts that build the Hadoop ecosystem, both as lecture courses and prac-tical sessions. From the point of view of the lecture courses the focus lays with giving the theoretical back-grounds of the concepts and mechanisms that enable Big Data processing. The course will present the dif-ferent programming models, strategies to deal with large data sets or with data sets on the fly (e.g., MapRe-duce and MapReduce pipelines, Stream topologies, Windows, SQL and Hive Queries and interactive que-ries). From the point of view of the practical sessions the objective is to make the students familiar with the main Big Data processing tools used today in industry such as MapReduce, HDFS, Spark, Flink, HBase, Kafka. At the end of the course the students will have a good understanding of feasible approaches to ad-dress various Big Data scenarios as well as hands-on experience with some of the most commonly used Ha-doop tools.

Course Topics to be addressed:

* Overview of Big Data: what it is, why it has emerged and future trends
* Data models and large scale infrastructures (cluster, grid, cloud, HPC)
* Batch processing
  * Distributed storage systems concepts: GFC, HDFS and Cloud Public Storage (Azure Blobs and AWS S3)
  * NoSQL storage and distributed message queues
  * Google MapReduce programming model and Hadoop MapReduce
  * High level semantics processing tools for offline data: Spark, Hive, Pig, Flink
* Stream processing:
  * Stream overview: what it is and what are the main difference with respect to batch processing,
  * Stream concepts for data processing: operators, windows, sinks, ETLs
* Project topics

Evaluation:

* Project: A topic will be choosen from multiple available ones (sentiment analysis, twitter trends analy-sis, internet/social media search, ...)
* Solution: A software solution will be design, built and delivered as the outcome of the project.
* Technology: The solution will be built using multiple advanced technologies covered in the course.
* Evaluation: The solutiondesign will be presented together with a demo to show the specific use case.', 'The result after complition of this course is that the students will:

* Have an overview of the principles of Big Data analytics
* Have an understanding ofthe data analytics ecosystem
* Have knowledge about the Big Data technologies most used in industry and research
* Have practical experience with Big Data tools from the Hadoop ecosystem, which will give competitive advantage for getting jobs in the domain
* Have a reference project in the area of Big Data that they can showcase in the future to prove their practical experience for industry', 'Literature will be given during the lecture', '', '* Compulsory module in the area of practical and technical computer science
* As focus module
* Individual complementary module
* Application module for the complementary area in the Master studiesmathematics', '* Successfull participation in hands-on exercises
* Submission of a final software project (base for grade)', '5 LP for all PO''s', 'Big Data Techniques, Technologies and Trends', 'Bachelor students must have been passedthe following modules:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 55);
INSERT INTO public.veranstaltung VALUES (58, 'Jedes Sommersemester (falls erfolgreich)', 'Mit einer Blockchain kann man ein dezentrales Buchführungssystem aufsetzen. Die Blockchain Technologie besitzt viele verschiedene praktische Anwendungen in sicherheitskritischen Systemen, die bekannteste ist wahrscheinlich die Kryptowährung Bitcoin. In diesem Modul werden folgende Inhalte abgedeckt:

* Grundlagen der Blockchain Technologie
* Formale Modellierung der Blockchain Technologie
* Praktische Anwendungen der Blockchain (Fintech, Energiemarkt, Verwaltungsprozesse, Gesundheits-wesen, ...)
* Kryptowährungen (Bitcoin, Ethereum, iota, ...)
* Smart Contracts
* Praktische Experimente, prototypische Umsetzung einer eigenen Blockchain
* Risiken', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* Das Funktionsprinzip einer Blockchain verstandenzu haben
* Die Einsatzgebiete und Grenzen der Blockchain Technolgie einschätzen können
* Eigene Blockchain Anwendungen prototypisch umsetzen können', 'Relevante Publikationen werden in der Vorlesung bekannt gegeben', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive und erfolgreiche Mitwirkung in dem Seminar
* eigener Seminarvortrag
* erfolgreiche Umsetzung einer praktischen Aufgabe
* schriftliche Prüfung (Klausur, i.d.R. 90 Minuten)', '5 LP', 'Blockchain', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”

* Platzvergabe nach Studienleistungen (Anzahl an STUPS-Scheinen)', 56);
INSERT INTO public.veranstaltung VALUES (59, 'Jedes zweite Sommersemester', 'Dieses Modul vermittelt grundlegende Kenntnisse aus folgenden Bereichen.

* Verteilte Algorithmen
* Leader Election
* Geographisches Routing
* Topologiekontrolle
* Standortbezogene Dienste
* Standortbestimmung
* Greedy-Einbettungen
* Beacon-Routing
* Interval-Routing
* Hop-Netzwerke
* Network Coding
* Dominierende Mengen
* Maximale unabhängige Mengen', 'Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein breites und vertieftes Verständnis im Bereich „Algorithmen für Ad-hoc-und Sensornetzwerke“.', 'Verschiedene aktuelle Lehrbücher über Ad-hoc-und Sensornetzwerke sowie Originalliteratur', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Mitarbeit in den Übungen
* Abgabe der Hausaufgaben
* 10-minütiger Lehrvortrag über ein Thema der Vorlesung
* schriftliche Klausur (i.d.R. 90 Minuten) oder mündliche Prüfung am Ende des Semesters', '10 LP ab PO 2015, alte PO 15 LP', 'Algorithmen für Ad-hoc-und Sensornetzwerke', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 57);
INSERT INTO public.veranstaltung VALUES (60, 'Dieses Modul wird in unregelmäßigen Abständen angeboten.', 'Dieses Modul vermittelt grundlegende Kenntnisse aus folgenden Bereichen.

* Grundlagen zu planaren Graphen
* Planaritätstests
* Zeichnen von planaren Graphen
* Knoten-und Kantenfärbungen für planare Graphen
* Flüsse in planaren Graphen', 'Studierende, die das Modul erfolgreich absolviert haben, sollen anschließend ein breites und vertieftes Ver-ständnis im Bereich „Algorithmen für planare Graphen“ besitzen. Weiterhin sollen die Studierenden nach Ab-solvierung der Lehrveranstaltungen in der Lage sein, einen guten Vortrag vorzubereiten und zu halten und eine gute schriftliche Ausarbeitung zu dem Vortragsthema anzufertigen.', '* T. Nishizeki, N. Chiba: Planar Graphs: Theory and Algorithms, Dover Pubn Inc, 2008.
* T. Nishizeki, Md. S. Rahman: Planar Graph Drawing, World Scientific Publishing, 2004.
* R. Diestel: Graph Theory, Springer, 2010.
* G. Chartrand, L. Lesniak, P. Zhang: Graphs & Digraphs, CRC Press, 2010.
* R. Tamassia (Editor): Handbook of Graph Visualization, CRC Press, 2014.', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Erfolgreiche Bearbeitung von Übungsaufgaben
* Aktive Mitarbeit im Seminar
* Schriftliche Ausarbeitung eines Seminarthemas
* Vortrag eines Seminarthemas
* Bestehen der Klausur', '10 LP ab PO 2015, alte PO 15 LP', 'Algorithmen für planare Graphen', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 58);
INSERT INTO public.veranstaltung VALUES (61, 'Dieses Modul wird in unregelmäßigen Abständen angeboten.', 'Dieses Modul befasst sich mit schweren Problemen, für die es vermutlich keine effizienten Algorithmen gibt, und stellt unter anderem folgende Lösungsansätze für solche Probleme vor.

* Pseudopolynomielle Algorithmen
* Algorithmen auf speziellen Graphen
* Parametrisierte Algorithmen
  * Standardparameter
  * Parametrisierung in der Baumweite
  * Parametrisierung in der Cliquenweite
* Exakte Exponentialzeit Algorithmen', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die besprochenen schweren Probleme zu erläutern und formal zu definieren
* die behandelten Algorithmen für schwere Probleme zu verstehen und auf konkrete Eingaben anzuwenden
* eine Parametrisierte Laufzeitanalyse von Algorithmen durchzuführen
* die betrachteten Baumstrukturen für gegebene Instanzen zu konstruieren', '* F. Gurski, I. Rothe, J. Rothe, E. Wanke, Exakte Algorithmen für schwere Graphenprobleme, Springer Verlag, 2010
* F.V. Fomin, D. Kratsch: Exact Exponential Algorithms, Springer Verlag, 2010.
* J. Hromkovic: Algorithmics for Hard Problems, Springer Verlag, 2003.', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', 'Aktive Mitarbeit in den Übungen, Abgabe der Übungsaufgaben, Bestehen der Klausur zum Ende des Se-mesters', '5LP ab PO 2015, alte PO 7,5LP', 'Algorithmen für schwere Probleme', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 59);
INSERT INTO public.veranstaltung VALUES (62, 'Jedes Studienjahr, in der Regel im Wintersemester', 'Die Veranstaltung behandelt erweiterte Konzepte der algorithmischen Bioinformatik und konzentriert sich insbesondere auf Gebiete, die in der Arbeitsgruppe Algorithmische Bioinformatik eine besondere Rolle spie-len. Dies sind Themen aus den Bereichen

* Genominformatik
  * Datenstrukturen für Read-Mapping: Suffix-Bäume (Linearzeit), Suffix-Arrays (mit LCP-Arrays), Burrows-Wheeler-Transformation
  * Haplotype Phasing
  * Algorithmen für Genomgraphen
* Netzwerkbiologie
  * Biologische Netzwerke.
  * Netzwerkmodule: Clustering, aktive Module, Netzwerkalignment
  * Logische Modellierung und Verifikation
* Verschiedenes
  * Analyse von drug/perturbation screens
  * Modellierung mit molekularen Graphen', 'Nach der Veranstaltung werden die Studierenden in der Lage sein

* erweiterte algorithmische Konzepte der Bioinformatik aus der Genominformatik, der Netzwerkbiologie und anderen Gebieten zu beherrschen und deren theoretische Grundlagen zu verstehen;
* praktische Probleme aus diesen Bereichen durch Anwendung dieser Konzepte und eigene Implementierungen zu lösen', '* ausgewählte Einzelarbeiten; diese werden im Kurs bereitgestellt', '', '* Wahlpflichtbereich Praktisch/Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik
* Teileines Master-Moduls im Master-Studiengang Biologie', '* aktive Teilnahme an den Übungen
* erfolgreiches Bearbeiten der Übungsaufgaben(50%)
* abschließende Prüfung (i.d.R. schriftlich)', '5LP', 'Algorithmen in der Bioinformatik II', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”
* „Algorithmen in der Bioinformatik“', 60);
INSERT INTO public.veranstaltung VALUES (63, 'Dieses Modul wird in unregelmäßigen Abständen angeboten.', '* Chemische & algorithmische Grundlagen
* Algorithmen auf molekularen Graphen
* Molekulare Deskriptoren
* Algorithmische Massenspektrometrie
* Monte-Carlo Simulationen
* Molekulardynamik', 'Nach der Veranstaltung werden die Studierenden ein vertieftes Verständnis ausgesuchter grundlegender Techniken der Informatik und Mathematik besitzen und in der Lage sein

* klassische Algorithmen und spezielle cheminformatische Algorithmen auf (bio-)chemische Probleme anzuwenden;
* gelernte Algorithmen exemplarisch in der Programmiersprache Python umzusetzen;
* cheminformatische Software-Libraries anzuwenden;
* cheminformatische Probleme mit den vorgestellten Algorithmen selbständig lösen zu können.', '* Leach & Gillet: An Introduction to Chemoinformatics, Springer, 2007
* Leach: Molecular Modeling. Principles and Applications, Prentice Hall, 2nd ed., 2001
* Jensen: Introduction to Computational Chemistry,Wiley, 2007', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung im Master-Studiengang Informatik
* Anwendungsfach im Bachelor-Studiengang Mathematik und Anwendungsgebiete', '* aktiveTeilnahme an den Übungen
* erfolgreiches Bearbeiten der Übungsaufgaben
* abschließende Prüfung (i.d.R. schriftlich)', '5LP', 'Algorithmen in der Cheminformatik', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 61);
INSERT INTO public.veranstaltung VALUES (64, 'Etwa alle zwei Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.', '* Nichtkooperative Spiele: Gegeneinander spielen
  * Grundlagen
    * Normalform, dominante Strategien und Gleichgewichte
    * Weitere Zwei-Personen-Spiele
  * Nash-Gleichgewichte in gemischten Strategien
    * Definition und Eigenschaften gemischter Nash-Gleichgewichte
    * Existenz von Nash-Gleichgewichten in gemischten Strategien
  * Schachmatt: Spielbäume in Spielen mit perfekter Information
    * Sequenzielle Zwei-Personen-Spiele
    * Gleichgewichte in Spielbäumen
  * Full House: Spiele mit unvollkommener Information
    * Das Ziegenproblem
    * Analyse einer einfachen Poker-Variante
  * Wie schwer ist es, ein Nash-Gleichgewicht zu finden?
    * Nash-Gleichgewichte in Nullsummenspielen
    * Nash-Gleichgewichte in allgemeinen Normalform-Spielen
* Kooperative Spiele: Miteinander spielen
  * Grundlagen
    * Kooperative Spiele mit übertragbarem Gewinn
    * Superadditive Spiele
    * Stabilitätskonzepte für kooperative Spiele
  * Einfache Spiele
    * Der Kern einfacher Spiele
    * Darstellungen einfacher Spiele
    * Gewichtete Wahlspiele
    * Dimensionalität
    * Machtindizes
    * Der Shapley-Shubik-Indexund der Shapley-Wert
    * Die Banzhaf-Indizes
  * Komplexität von Problemen für kompakt darstellbare Spiele
    * Spiele auf Graphen
    * Gewichtete Wahlspiele
    * Hedonische Spiele', 'Ziel in diesem Modul ist es, den Studierenden Einblicke in einige derwichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem Gebiet der algorithmischen Spieltheorie zu vermitteln, welches derzeit in der Abteilung „Komplexitätstheorie und Kryptologie“ (Prof. Jörg Rothe und Jun.-Prof. Dorothea Baumeister) intensiv in der Forschung bearbeitet wird und in dem bevorzugt Themen für Bachelor-und Master-Arbeiten ausgegeben werden.  Am Ende der Veranstaltung sollten Studierende wichtige Probleme und die zu ihrer Lösung entwickelten Algorithmen und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können.  Insbesondere sollten sie in der Lage sein, „strategische Szenarien“ durch kooperative bzw. nichtkooperative Spiele zu beschreiben und Stabilitäts-und Gleichgewichtskonzepte in diesen Spielen formal zu charakterisieren. Ebenso sollten sie die Komplexität der für solche Spiele relevanten Entscheidungsprobleme (in einer geeigneten kompakten Darstellung) formal bestimmen und beschreiben können.', '* Jörg Rothe (ed.):Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.

Eine kürzere deutsche Version dieses Buches erschien als:

* Jörg Rothe,Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011.', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik
* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science', '* erfolgreiche Bearbeitung der Übungsaufgaben
* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung', '10 LP ab PO 2015, alte PO 15 LP', 'Algorithmische Spieltheorie', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 62);
INSERT INTO public.veranstaltung VALUES (65, 'Yearly, usually each Summer Term.', 'Sequence information is ubiquitous in many application domains –and collections strings are one important data type in modern Data Dcience. DNA sequencing data are one example that motivates this lecture, but the focus of this course is on algorithms and concepts that are not specific to bioinformatics. This lecture ad-dresses classic as well as recent advanced algorithms for the analysis of large sequence databases. Topics include: full text search without index; approximate pattern matching; index structures such as suffix trees and enhanced suffix arrays, Burrows-Wheeler transform and the FM index; De Bruijn graphs; data compres-sion; multiple sequence alignment; Positional Burrows-Wheeler Transform; and Locality Sensitive Hashing.', 'This course enables students to understand advanced algorithmic concepts in sequence analysis and to ap-ply them in practice. In particular, this course will provide the algorithmic foundation to develop modern tools to process DNA sequencing data. However, the focus is on general algorithmic concepts and hence the scope of applications is not limited to biological sequence analysis.', 'We provide the lecture slides as well as lecture notes that cover most of the course material. Additionally, these books serve as additional reading material:

* Ohlebusch -Bioinformatics Algorithms
* Navarro and Raffinot -Flexible Pattern Matching in Strings
* Mäkinen, Belazzougui, Cunial, Tomescu -Genome-Scale Algorithm Design
* Gusfield -Algorithms on Strings, Trees, and Sequences', 'Englisch', '* WWahlpflichtbereich Praktisch/Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik
* Teil eines Master-Moduls im Master-Studiengang Biologie/ Quantitative Biologie
* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science', '* The weekly exercise sheets come with programming tasks and theory tasks. To be eligible to take the exam, students have to earn 50% of programming tasks and 50% of theory tasks.
* Exams are usually oral.', '10LP', 'Algorithms for Sequence Analysis', 'We assume knowledge corresponding to the BSc-level lectures Programming („Programmierung”), Com-puter Architecture(„Rechnerarchitektur“), Algorithms and Data Structures („Algorithmen und Daten-strukturen”) and Theoretical Computer Science („Theoretische Informatik”).', 63);
INSERT INTO public.veranstaltung VALUES (66, 'Etwa alle vier Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.', '* Grundlagen der Social-Choice-Theorie
  * Wiederholung: Wahlen und Wahlsysteme
  * Wiederholung: Eigenschaften von Wahlsystemen und einige Wahl-Paradoxa und Unmöglichkeitssätze
* Algorithmik und Komplexität von Wahlproblemen
  * Wiederholung: Gewinnerbestimmung, mögliche und notwendige Gewinner und Manipulation
  * Wahlkontrolle
  * Bestechung', 'Ziel in diesem Modul ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem jungen, sich rasant entwickelnden, interdisziplinären Gebiet Computational Social Choicezu vermitteln, welches derzeit in der Abteilung „Komplexitätstheorie und Kryptologie“ (Prof. Jörg Rothe und Jun.-Prof. Dorothea Baumeister) intensiv in der Forschung bearbeitet wird und in dem bevorzugt Themen für Bachelor-und Master-Arbeiten ausgegeben werden. Am Ende der Veranstaltung sollten Studierende die wichtigsten Wahlverfahren und ihre „social-choice“-theoretischen Eigenschaften sowie die damit im Zusammenhang stehenden Entscheidungsprobleme (Wahlkontrolle, Bestechung usw.) und die zu ihrer Lösung entwickelten Algorithmen und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können. Ebenso sollten sie die Komplexität dieser Probleme formal bestimmen und beschreiben können.', '* Jörg Rothe (ed.):Economics and Computation: AnIntroduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.

Eine kürzere deutsche Version dieses Buches erschien als:

*Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011.', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* erfolgreiche Bearbeitung der Übungsaufgaben
* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung', '5 LP ab PO 2015, alte PO 7,5 LP', 'Algorithmische Eigenschaften von Wahlsystemen II', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 64);
INSERT INTO public.veranstaltung VALUES (67, 'Etwa alle zwei Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.', '* Grundlagen
* Bewertungskriterien
    * Fairness
    * Effizienz
    * Manipulation
    * Laufzeit
* Cake-cutting-Protokolle
    * Zwei neidfreie Protokolle für zwei Spieler
    * Proportionale Protokolle für beliebig viele Spieler
    * Überproportionale Protokolle für beliebig viele Spieler
    * Eine Hochzeitsfeier im Königshaus: Aufteilung in ungleiche Anteile
    * Neidfreie Protokolle für drei und vier Spieler
    * Versalzene Sahnetorte: Dirty-Work-Protokolle
    * Gekrümel vermeiden: Minimierung der Schnittanzahl
    * Der Grad der garantierten Neidfreiheit
    * Übersicht über einige Cake-cutting-Protokolle', 'Ziel in diesem Modul ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem Gebiet Fair Division zu vermitteln, welches derzeit in der Abteilung „Komplexitätstheorie und Kryptologie“ (Prof. Jörg Rothe und Jun.-Prof. Dorothea Baumeister) intensiv in der Forschung bearbeitet wird und in dem bevorzugt Themen für Bachelor- und Master-Arbeiten ausgegeben werden. Am Ende der Veranstaltung sollten Studierende die wichtigsten Eigenschaften von gerechten Aufteilungsverfahren für eine teilbare Ressource (Proportionalität, Neidfreiheit usw.) kennen und die dafür entwickelten Protokolle und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können. Insbesondere sollten sie in der Lage sein, über die Eigenschaften von Verfahren zur gerechten Aufteilung formal zu argumentieren und selbstständig solche Verfahren zu entwerfen und zu bewerten.', '* Jörg Rothe (ed.): Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.

Eine kürzere deutsche Version dieses Buches erschien als:

* Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011.', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* erfolgreiche Bearbeitung der Übungsaufgaben
* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung', '5 LP ab PO 2015, alte PO 7,5 LP', 'Cake-cutting Algorithms', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 65);
INSERT INTO public.veranstaltung VALUES (68, 'Wird nicht mehr angeboten', '* Erfassung und Aufbereitung von Geodaten
* Datenstrukturen (Raster, Vektor usw.)
* Grundlagen der Bildverarbeitung
* Koordinatensysteme und –transformationen
* Georeferenzierung
* Räumliche Analysen
* Datenverschneidung
* Räumliche Interpolationsverfahren, Geländemodelle', 'Die Geoinformatik befasst sich im weitesten Sinn mit der Erfassung, Aufbereitung, Analyse und Präsentation von räumlichen Daten. Der Raumbezug erfolgt dabei über Weltkoordinaten und kann beispielsweise per GPS hergestellt werden. Nach erfolgreichem Abschluss der Lehrveranstaltung sollen die Studierenden

* die wichtigsten Koordinatensysteme und Kartennetzentwürfe inklusive der mathematischen Hintergründe verstanden haben,
* die gebräuchlichen Datenstrukturen (Raster, Vektor, Attribute) mit ihren Anwendungsfällen und Vor- und Nachteilen kennen und erläutern können,
* das Georeferenzieren und Verschneiden von Vektor- und Rasterdaten beherrschen sowie
* grundlegende Verfahren der räumlichen Analyse anwenden können.', '* Norbert Bartelme: Geoinformatik. Modelle, Strukturen, Funktionen. Springer.
* Ralf Bill: Grundlagen der Geo-Informationssysteme. Wichmann.
* Norbert de Lange: Geoinformatik in Theorie und Praxis. Springer.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', 'Regelmäßige Teilnahme an den Übungen, Bearbeitung der Aufgaben, schriftliche Prüfung (Klausur, 90 Minuten).', '5 LP ab PO 2015, alte PO 7,5 LP', 'Einführung in die Geoinformatik', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 66);
INSERT INTO public.veranstaltung VALUES (69, 'Jedes Studienjahr, in der Regel im Sommersemester', 'Einführung in Bayesianisches Denken

* Wahrscheinlichkeit und Einführung in Computersimulationen
* Einführung in Bootstrap
* Einführung in Bayesianische Modelle
* Einführung in multivariate Wahrscheinlichkeitsverteilungen und multiple Parameter Modelle

Monte Carlo Simulationsmethoden

* Monte Carlo Methode zur Berechnung von Integralen
* Rejection Sampling
* Importance Sampling
* Sampling Importance Re-sampling

Markov Ketten Monte Carlo Methoden

* Einführung in Markov Ketten
* Metropolis-Hastings Algorithmus
* Gerichtete azyklische Graphen
* Gibbs-sampling
* MCMC output analysis

Statistische Modellierung

* Regression modelling
* Analysis of multiple contingency tables
* Einführung in hierarchische Modelle', 'Die Studierenden werden am Ende des Kurses in der Lage sein,

* die Programmiersprache R sowie die Software OpenBUGS in Zusammenhang mit Bayesianischem Denken zu nutzen
* die Rolle von Computersimulationen und Bayesianischen Methoden für reale Modellierung zu erkennen
* verschiedene Simulationsmethoden zu klassifizieren', '* Andrew Gelman, John B. Carlin, Hal S. Stern: Bayesian Data Analysis. Chapman & Hall, 2004', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik
* Teil eines Master-Moduls im Master-Studiengang Biologie', '* aktive Teilnahme an den Übungen
* erfolgreiches Bearbeiten der Übungsaufgaben
* abschließende Prüfung (i.d.R. schriftlich)', '5 LP ab PO 2015, alte PO 7,5 LP', 'Einführung in die statistische Analyse mittels Computersimulationen', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 67);
INSERT INTO public.veranstaltung VALUES (70, 'Jedes Sommersemester', 'Dieses Modul vertieft Kenntnisse aus folgenden Bereichen:

* Gierige Algorithmen
* Dynamische Programmierung
* Scanline
* Backtracking
* Korrektheitsbeweise
* (amortisierte) Aufwandsabschätzungen', 'Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein vertieftes Verständnis in der systematischen Entwicklung und Analyse von Algorithmen zur Lösung von Entscheidungs- und Optimierungsproblemen.', 'Aktuelle Lehrbücher über Algorithmik sowie Originalliteratur', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik
* Teil eines Master-Moduls im Master-Studiengang Biologie', 'schriftliche Prüfung (i.d.R. 90 Minuten) am Ende des Semesters', '5 LP', 'Entwurfs- und Analysetechniken für Algorithmen', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 68);
INSERT INTO public.veranstaltung VALUES (71, 'Jährlich, i.d.R. im Wintersemester', 'Funktionale Programmierung hat in den letzten Jahren deutlich an Fahrt aufgenommen. Sprachen wie Haskell, Scala, Clojure, OCaml und F# gewinnen immer mehr an Bedeutung und auch Java hat in Version 8 mit Closures endlich Syntax für anonyme Funktionen bekommen.

Ausgehend von den Problemen, mit denen wir in objektorientierten Sprachen permanent konfrontiert sind, wollen wir in dem Kurs neue Ansätze erarbeiten, um so ein umfassenderes Verständnis von Programmierung zu erhalten. Wir werden uns damit befassen, wie wir Programme in funktionalen Sprachen strukturieren und unbeabsichtigte Komplexität loswerden können. Außerdem werden wir uns mit internen domänenspezifischen Sprachen beschäftigen. Die Sprache, die wir in dem Kurs verwenden werden ist Clojure, ein modernes Lisp, das auf der JVM läuft und viele aus softwaretechnischer Sicht interessante Konzepte umsetzt. Wir werden uns ebenfalls mit statischer Typisierung in der Programmiersprache Haskell und nebenläufiger Programmierung in Erlang befassen.', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die Prinzipien der funktionalen Programmierung bezeichnen können und klassischen, imperativen Programmiersprachen gegenüberstellen können
* bewerten für welche Einsatzbereiche die funktionale Programmierung vorteilhaft ist
* eigenständig funktionale Programme erstellen und testen können', '* Abelson, Sussman: Structure and Interpretation of Computer Programs
* Moseley, Marks: Out of the tarpit
* Fogus, Houser: The Joy of Clojure
* Emerick, Carper, Grand: Programming Clojure
* Rathore: Clojure in Action
* Higginbotham: Clojure for the Brave and True', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Teilnahme an den Übungen
* erfolgreiches Bearbeiten der Übungsaufgaben
* abschließende Prüfung (i.d.R. schriftlich)', '5 LP ab PO 2015, alte PO 7,5 LP', 'Funktionale Programmierung', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 69);
INSERT INTO public.veranstaltung VALUES (72, 'unregelmäßig, ggf. im Wechsel mit den Modulen/Veranstaltungen von Prof. Dr. Stefan Conrad.', '* Fuzzy und possibilistische fuzzy Clusteringverfahren
* Bestimmung der Clusteranzahl
* Vergleich von Clusteringergebnissen
* Fuzzy Clustering von unvollständigen Daten
* Fuzzy Clustering hochdimensionaler Daten', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* Nutzen von Konzepten der Fuzzy Logik für das Clustering zu erkennen
* die wichtigsten Verfahren, Herausforderungen und aktuellen Entwicklungen im Bereich Fuzzy-Clusteranalyse zu erläutern
* mit verschiedenen Anwendungsgebieten der Fuzzy Clustering Methoden vertraut zu werden und die entsprechenden Methoden selbstständig anzuwenden', '* F. Höppner, F. Klawonn, R. Kruse: Fuzzy-Clusteranalyse: Verfahren für die Bilderkennung, Klassifikation und Datenanalyse, Vieweg, Braunschweig/Wiesbaden, 1997
* R. Kruse, C. Borgelt, C. Braune, F. Klawonn, C. Moewes, M.
* Steinbrecher: Computational Intelligence: Eine methodische Einführung in Künstliche Neuronale Netze, Evolutionäre Algorithmen, Fuzzy-Systeme und Bayes-Netze, Springer Vieweg, Wiesbaden, 2015

sowie ggfs. weiterführende Literatur (wird in der Veranstaltung bekanntgegeben)', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Teilnahme an den Übungen bzw. dem Seminar
* erfolgreiches Bearbeiten der Übungsaufgaben bzw. Anfertigen einer angemessenen Seminarausarbeitung und Halten eines Vortrags
* abschließende Prüfung (i.d.R. mündlich)', '5 LP', 'Fuzzy-Clusteranalyse', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 70);
INSERT INTO public.veranstaltung VALUES (73, 'unregelmäßig, ggf. im Wechsel mit den Modulen/Veranstaltungen von Prof. Dr. Stefan Conrad.', '* Eigenschaften und Operationen auf fuzzy Mengen
* Fuzzy Relationen
* Zugehörigkeitsfunktionen, Fuzzifizierung und Defuzzifizierung
* Fuzzy Logik und approximatives Schließen
* Fuzzy Regelsysteme
* Fuzzy Methoden in Pattern Recognition', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* theoretischen Grundlagen der fuzzy Mengen Theorie zu erklären
* Nutzen von Konzepten der fuzzy Logik in intelligenten Systemen zu erkennen
* mit verschiedenen Anwendungsgebieten der fuzzy Methoden vertraut zu werden und die entsprechenden Methoden selbstständig anzuwenden', '* R. Kruse, C. Borgelt, C. Braune, F. Klawonn, C. Moewes, M. Steinbrecher: Computational Intelligence: Eine methodische Einführung in Künstliche Neuronale Netze, Evolutionäre Algorithmen, Fuzzy-Systeme und Bayes-Netze, Springer Vieweg, Wiesbaden, 2015
* Timothy J. Ross: Fuzzy Logic with Engineering Applications, John Wiley & Sons Ltd, Chichester, 2004

sowie ggfs. weiterführende Literatur (wird in der Veranstaltung bekanntgegeben)', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Teilnahme an den Übungen bzw. dem Seminar
* erfolgreiches Bearbeiten der Übungsaufgaben bzw. Anfertigen einer angemessenen Seminarausarbeitung und Halten eines Vortrags
* abschließende Prüfung (i.d.R. mündlich)', '5 LP', 'Fuzzy Systeme', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 71);
INSERT INTO public.veranstaltung VALUES (74, 'Etwa alle zwei Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.', '* Cake-Cutting: Gerechte Aufteilung teilbarer Güter
    * Grundlagen
    * Bewertungskriterien

* Cake-cutting-Protokolle
    * Gerechte Aufteilung unteilbarer Güter
    * Definition und Klassifikation von Allokationsproblemen Präferenzerhebung und kompakte Darstellung
    * Kriterien für Allokationen
    * Berechnung von Allokationen: Zentralisierte Mechanismen Dezentralisierte Allokationsprotokolle', 'Ziel in diesem Modul ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem Gebiet der gerechten Aufteilungsverfahren zu vermitteln, welches derzeit in den Abteilungen „Komplexitätstheorie und Kryptologie“ und „Computational Social Choice“ (Prof. Jörg Rothe und Jun.-Prof. Dorothea Baumeister) intensiv in der Forschung bearbeitet wird und in denen bevorzugt Themen für Bachelor- und Master-Arbeiten ausgegeben werden. Am Ende der Veranstaltung sollten Studierende wichtige Probleme und die zu ihrer Lösung entwickelten Verfahren und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können. Insbesondere sollten sie in der Lage sein, verschiedene Fairness-Begriffe zu beschreiben und Aufteilungsprotokolle zu entwerfen und zu bewerten, die Fairness eines gegebenen Typs garantieren. Ebenso sollten sie die Komplexität der für solche Spiele relevanten Entscheidungsprobleme (in einer geeigneten kompakten Darstellung) formal bestimmen und beschreiben können.', '* Jörg Rothe (ed.): Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.

Eine kürzere deutsche Version dieses Buches erschien als:

* Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011.', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* erfolgreiche Bearbeitung der Übungsaufgaben
* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung', '10 LP', 'Gerechte Aufteilungsverfahren', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 72);
INSERT INTO public.veranstaltung VALUES (75, 'Jedes zweite Sommersemester', '* Planare Graphen (Erkennung, Dualität, Färbungsprobleme, ...)
* Chordale Graphen (lexikographische Breitensuche, perfekte Eliminationsordnung, ...)
* Baumweite beschränkte Graphen
* Cliquenweite, Rangweite, NLC-Weite
* Baumautomaten
* Fixed Parameter Tractability
* Minorensatz
* Extremale Graphentheory', 'Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein breites und vertieftes Verständnis im Bereich „Graphenalgorithmen“.', 'Verschiedene aktuelle Lehrbücher über Ad-hoc- und Sensornetzwerke sowie Originalliteratur', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Mitarbeit in den Übungen
* Abgabe der Hausaufgaben
* 10-minütiger Lehrvortrag über ein Thema der Vorlesung
* schriftliche Klausur (i.d.R. 90 Minuten) oder mündliche Prüfung am Ende des Semesters', '10 LP ab PO 2015, alte PO 15 LP', 'Graphenalgorithmen II', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 73);
INSERT INTO public.veranstaltung VALUES (80, 'Siehe unten', '* Anwendungsbereiche
* Data Warehouse–Architektur
* Multidimensionales Datenmodell, Entwurf von Data Warehouses (MOLAP vs. ROLAP; Star- oder Snowflake-Schema)
* Anfragebearbeitung und -optimierung
* Materialisierung von Aggregationssichten
* multidimensionale Index- und Speicherstrukturen
* Extraktion, Transformation, Laden; Data Cleaning
* OLAP und Data Mining', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die Architektur eines Data Warehouse-Systems und ihre Komponenten zu erläutern
* relationale Data Warehouses zu entwerfen
* für ein zu entwickelndes Data Warehouse zu entscheiden, welche Indexstrukturen genutzt werden können
* zu entscheiden, welche Sichten materialisiert werden sollten', '* W. Lehner: Datenbanktechnologie für Data-Warehouse-Systeme. dpunkt-verlag, 2003.
* H. Bauer, A. Günzel (Hrsg.): Data Warehouse Systeme. 4. Aufl.; dpunkt-verlag, 2013', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Teilnahme an den Übungen
* erfolgreiches Bearbeiten der Übungsaufgaben
* abschließende Prüfung (i.d.R. mündlich)', '5 LP ab PO 2015, alte PO 7,5 LP', 'Data Warehouses', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 78);
INSERT INTO public.veranstaltung VALUES (76, 'I.d.R. jährlich.', 'Dieses Modul vermittelt grundlegendes Wissen zu folgenden Themen:

* Directed acyclic graphs, causal graphs
* Conditional independence
* PC algorithm
* Structural equation models
* Additive noise models
* Interventions
* Counterfactuals
* Markov equivalence
* Faithfulness
* Distinguishing cause and effect', 'Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,

* die Grundlagen der kausalen Inferenz zu beschreiben und anzuwenden
* die mathematische Beschreibung dieser Grundlagen und verschiedene Algorithmen zu erklären und Sachverhalte darüber zu beweisen
* die Grundlagen und verschiedene Algorithmen anzuwenden, um selbstständig Problemstellungen der kausalen Inferenz zu bearbeiten.', 'Es wird nicht ein bestimmtes Lehrbuch verwendet, jedoch sind folgende Bücher hilfreich:

* Spirtes/Glymour/Scheines, Causation, Prediction, and Search, MIT 2000
* Pearl: Causality, Cambridge 2000', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik
* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science', '* Aktive und erfolgreiche Mitwirkung in den Übungen;
* Prüfung zu Vorlesung und Übungen am Ende des Semesters', '5 LP ab PO 2015, alte PO 7,5 LP', 'Causality', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 74);
INSERT INTO public.veranstaltung VALUES (77, 'Jährlich im Wintersemester', '* Simple models of population dynamics
    * Exponential and logistic growth
    * Two-species model: Antibiotic resistance
    * Populations in fluctuating environments: Endosymbiotic theory
* Control of protein expression
    * Transcription and statistics of protein binding to DNA
    * Statistical analysis of transcription regulation by proteins
    * Modeling gene-regulatory circuits with differential equations
* Information content of DNA sequences
    * Information and sequence logo
    * Calculating binding energy from sequence
    * Recognizing DNA sequences in the context of the whole genome
* Modeling cellular tradeoffs in bacterial growth
    * Chemical kinetics, Michaelis-Menten mechanism
    * Interdependence of cell growth and protein production
    * Optimization of the bacterial growth rate', 'After successfully completing the course students will be able to

* model the growth/decay of bacterial populations with ordinary differential equations;
* reason about fundamental biological processes, such as protein-DNA binding, gene expression, and metabolic transformations in terms of the relevant spatial, temporal and energetic scales;
* formulate simple physical/mathematical models of genetic and metabolic networks in terms of ordinary differential equations;
* numerically simulate and analyze these models using Python;
* relate the outcomes of these analyses to experimental measurements by generating meaningful scientific plots.', 'In addition to the original research literature that will be given in the lectures, some chapters of the following textbooks will be covered in detail:

* Rob Phillips, Jane Kondev, Julie Theriot, Hernan G. Garcia: Physical Biology of the Cell, Garland Science, 2nd edition, 2016.
* Brian P. Ingalls: Mathematical Modeling in Systems Biology - An Introduction, MIT Press, 2013.
* David S. Goodsell: The Machinery of Life, 2nd ed., Springer Science+Business Media, 2009.
* Nick Lane: Power, Sex, Suicide, Oxford University Press, 2006.
* Gerhart Kirschner: The Plausibility of Life, Yale University Press, 2005.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Regelmäßige und aktive Teilnahme am Praktikum
* Regelmäßige Abgabe der Lösungen zu Übungsaufgaben
* Erfolgreiche Bearbeitung von zwei gesonderten Aufgabenzetteln (Hausarbeiten)
* Bestehen der Abschlussprüfung', '5 LP', 'Computational Systems Biology', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 75);
INSERT INTO public.veranstaltung VALUES (78, 'I.d.R. jährlich.', 'Dieses Modul vermittelt grundlegendes Wissen zu folgenden Themen:

* Image formation
* Image processing
* Matting, segmentation
* Local features, e.g. SIFT
* Computational photography
* Face detection', 'Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,

* die Grundlagen der Computer Vision zu beschreiben und anzuwenden
* die mathematische Beschreibung dieser Grundlagen und verschiedene Algorithmen zu erklären
* die Grundlagen und verschiedene Algorithmen anzuwenden, um selbstständig Problemstellungen der Computer Vision zu bearbeiten.', '* Szeliski, Computer vision, Springer 2010', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Aktive und erfolgreiche Mitwirkung in den Übungen;
* Prüfung zu Vorlesung und Übungen am Ende des Semesters', '5 LP ab PO 2015, alte PO 7,5 LP', 'Computer Vision', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 76);
INSERT INTO public.veranstaltung VALUES (79, 'Unregelmäßig', 'Understanding and interpreting heterogeneous data, in particular in distributed settings such as the Web, remains a challenging task. State-of-the-art Web applications such as Web search engines rely on a combination of approaches for making sense of data, involving both explicit knowledge, for instance, through knowledge graphs such as Wikidata or the Google knowledge graph and semi-structured Web markup, as well as statistical and machine-learning based approaches.
This course provides an introduction to data and knowledge engineering methods and principles, with a particular focus on the Web. This includes methods related to knowledge graphs and formal data & knowledge representation (RDF, OWL, Description Logics), data integration and linking, information extraction, Web data sharing practices (Linked Data, Semantic Web and affiliated W3C standards such as RDF, RDFa, Microdata), as well as emerging approaches in the context of distributional semantics, such as word and entity embeddings. Attention will also be paid to applications of taught techniques to facilitate data sharing and reuse on the Web.', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* Anwendung von W3C Standards (RDF, SPARQL) für Nutzung und Extraktion von Wissensgraphen, Linked Data und strukturierten Daten im Web
* Grundlegendes Verständnis von Informations- und Wissensextraktionsmethoden
* Erstellung formaler Wissensrepräsentationen und -basen mithilfe von Description Logics und Regeln
* Verständnis und Nutzung von strukturiertem Web Markup (RDFa, Microdata, schema.org)', '* “Artificial Intelligence: A Modern Approach” by Stuart Russell and Peter Norvig (2nd edition, Prentice- Hall, 2003)
* “A Semantic Web Primer” by Grigoris Antoniou and Frank van Harmelen (MIT Press, 2004)
* “Foundations of Semantic Web Technologies”, P. Hitzler, M. Krötzsch, S. Rudolph:, CRC Press, 2009.
* “Linked Data – Evolving the Web into a Global Data Space”, T. Heath, Ch. Bizer, Morgan & Claypool, 2011.
* Doing Data Science – Straight Talk from the Frontline, Cathy O’Neil, Rachel Schutt, O’Reilly Media', 'Englisch', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik
* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science', '* aktive Teilnahme an den Übungen bzw. dem Seminar
* erfolgreiches Bearbeiten der Übungsaufgaben
* abschließende Prüfung (i.d.R. schriftlich)', '5 LP', 'Data & KnowledgeEngineering (DKE)', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 77);
INSERT INTO public.veranstaltung VALUES (109, 'Ganzjährig', '* Modellierung biologischer Systeme
* Bioinformatische Algorithmen
* Methoden zur Auswertung komplexer biologischer Daten', 'Die Studierenden sollen einerseits in aktuelle Themenfelder der theoretischen und quantitativen Biologie und Bioinformatik eingeführt werden. Andererseits sollen sie die vortragshafte Darstellung wissenschaftlicher Inhalte sowie den mündlichen wissenschaftlichen Diskurs in englischer Sprache einüben.', 'Aktuelle Arbeiten aus einschlägigen Fachzeitschriften', 'Englisch', '* Wahlpflichtbereich Praktische oder Technische
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Erfolgreicher Vortrag eines Projektes
* Aktive Teilnahme an den Diskussionen während des Seminars', '1 LP', 'Master-Seminar zu aktuellen Themen der theoretischen und computergestützten Biologie', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 107);
INSERT INTO public.veranstaltung VALUES (81, 'Unregelmäßig', 'Dieses Modul behandelt das Deep Learning, welches einen Teilbereich des Machine Learnings darstellt. Dabei haben neben der Theorie auch die Praxis einen besonderen Stellenwert. U.a. werden voraussichtlich folgende Themen behandelt:

* Machine learning & neural networks
* Challenges of deep neural networks
* Deep belief networks
* Convolutional networks
* Auto-Encoders
* Training & Optimization techniques (dropout technique, batch normalization, distributed training, Hyper-parameter search)
* Anwendungen von Deep Learning in
    * Computer Vision,
    * Speech Recognition,
    * Language Modeling', 'Ziel dieser Lehrveranstaltung ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Herausforderungen und aktuellen Entwicklungen im Bereich maschinelles Lernen zu vermitteln. Am Ende der Veranstaltung sollten Studierende komplexe Lernprobleme und die zu ihrer Lösung entwickelten Deep Learning Algorithmen nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können.', 'TBD', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik
* Pflichtbereich im Master-Studiengang Artificial Intelligence and Data Science', '* Aktive Teilnahme an den Übungen
* Erfolgreiches Bearbeiten der Übungsaufgaben
* Abschließende Prüfung (i.d.R. mündlich)', '5 LP', 'Deep Learning (vormals Machine Learning – Deep Learning)', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”

Hilfreich ist erfolgreicher Abschluss der Mathematik Module:
"Lineare Algebra", "Analysis", "Stochastik", "Numerik" und „Knowledge Discovery in Databases“', 79);
INSERT INTO public.veranstaltung VALUES (82, 'Jährlich, in der Regel jedes Sommersemester', 'Diese Vorlesung vermittelt typische Konzepte und Eigenschaften dynamischer Programmiersprachen, z.B. Typisierung und Duck-Typing, Metaprogrammierung u.a. Darüber hinaus wird behandelt wie ein Interpreter für eine dynamische Programmiersprache implementiert wird, um die zuvor behandelten Konzepte zu unterstützen.
In den praktischen Übungen sollen die Studierenden diverse Probleme mit Hilfe der Eigenschaften einer dynamischen Programmiersprache lösen, um ein tieferes Verständnis dieser Konzepte zu erlangen. In der zweiten Semesterhälfte besteht die Aufgabenstellung in der Übung darin, selbständig einen Interpreter für eine vorgegebene dynamische Programmiersprache zu schreiben.', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die Prinzipien der dynamischen Programmierung bezeichnen können und klassischen, imperativen Programmiersprachen gegenüberstellen können
* bewerten für welche Einsatzbereiche die dynamische Programmierung vorteilhaft ist
* eigenständig funktionale Programme erstellen und testen können
* selbständig einen Interpreter für eine vorgegebene dynamische Programmiersprache zu schreiben', '', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Erfolgreiche Bearbeitung der Pflichtübungen
* Erfolgreiche Entwicklung eines eigenen Interpreters
* Bestehen der Klausur', '5 LP ab PO 2015, alte PO 7,5 LP', 'Dynamische Programmiersprachen', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 80);
INSERT INTO public.veranstaltung VALUES (83, 'Dieses Modul wird in unregelmäßigen Abständen angeboten.', 'In diesem Modul werden Algorithmen für effizient lösbare Probleme betrachtet. Anhand fundamentaler Verfahren werden die Prinzipien des Entwurfs und der Analyse von Algorithmen erklärt. Hierzu werden folgende Themen betrachtet.

* Algorithmenentwurfstechniken
* Algebraische und Zahlentheoretische Probleme
* Sortiernetze
* Sortieren auf Prozessorfeldern
* Lineare Programmierung', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die besprochenen Probleme zu erläutern und formal zu definieren
* die behandelten Algorithmen zu verstehen und auf konkrete Eingaben anzuwenden
* die erlernten Methoden für den Entwurf und die Analyse von effizienten Algorithmen anzuwenden
* für vorgegebene Probleme eigenständig Vergleichernetze zu konstruieren
* zu Optimierungsproblemen eine Formulierung als Lineares Programm zu konzipieren', '* N. Blum: Algorithmen und Datenstrukturen, Oldenbourg Verlag, 2004.
* T.H. Cormen, C.E. Leiserson, R.L. Rivest et al.: Algorithmen - Eine Einführung, Oldenbourg Verlag, 2007.
* V. Heun: Grundlegende Algorithmen, Teubner Verlag, 2003.
* H.-W. Lang: Algorithmen, Oldenbourg Verlag, 2006.
* U. Schöning: Algorithmik, Spektrum Akademischer Verlag, 2001.', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', 'Aktive Mitarbeit in den Übungen, Abgabe der Übungsaufgaben, Bestehen der Klausur zum Ende des Semesters', '5 LP ab PO 2015, alte PO 7,5 LP', 'Effiziente Algorithmen', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 81);
INSERT INTO public.veranstaltung VALUES (84, 'Unregelmäßig', '* Grundlagen der Linearen Programmierung
* Geometrische Interpretation und Dualität
* Simplex-Methode
* Ganzzahlige Lineare Programmierung
* Schnittebenenverfahren
* Branch-and-Bound
* Lagrange-Relaxierung
* Netzwerkflüsse: Theorie und Algorithmen
* Ausgewählte Anwendungen in der Bioinformatik. Z.b.: RNA-Strukturvorhersage, Strukturelles Proteinalignment, Peptide Sequencing, Seitenkettenplazierung, Vergleich phylogenetischer Bäume, Fragment Assembly, Haplotype Assembly, Netzwerkanalyse, Netzwerkmodule, Netzwerkalignment
* Großes Programmierprojekt: für eine ausgewählte Fragestellung wird eine Lösung aufgrund der gelernten Konzepte entwickelt und implementiert.', 'Nach der Veranstaltung werden die Studierenden in der Lage sein

* die Grundlagen der Linearen und Ganzzahligen Optimierung zu beherrschen;
* praktische Probleme mit Hilfe der Linearen (ganzz.) Modellierung zu beschreiben;
* Algorithmen zu entwerfen, die diese Modelle lösen', '* Dimitris Bertsimas and John N. Tsitsiklis: Introduction to Linear Optimization. 1997.
* Laurence Wolsey: Integer Programming. 1998.', '', '* Wahlpflichtbereich Praktisch/Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik
* Teil eines Master-Moduls im Master-Studiengang Biologie
* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science', '* aktive Teilnahme an den Übungen
* erfolgreiches Bearbeiten der Übungsaufgaben
* abschließende Prüfung (i.d.R. schriftlich)', '5 LP', 'Introduction to Linear Optimization (vormals Grundlagen der Linearen Optimierung)', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 82);
INSERT INTO public.veranstaltung VALUES (85, 'unregelmäßog', 'Im Seminar sollen die Inhalte der Vorlesung "Machine Learning" weiter vertieft und erweitert werden, z.B. durch Vorstellung einzelner Kapitel aus dem Buch "Information Theory, Inference, and Learning Algorithms" von David MacKay, oder auch anderer Bücher und wissenschaftlichen Veröffentlichungen zum Thema. Jede Woche werden ein oder zwei Themen durch die Teilnehmenden in Form eines Vortrages vorgestellt und diskutiert. Dabei geht es zum einen um die Inhalte, zum anderen darum, wie man einen guten wissenschaftlichen Vortrag hält. Zusätzlich erstellen die Teilnehmenden eine kurze schriftliche Ausarbeitung Ihres Vortrages.', 'Studierende haben nach erfolgreichem Abschluss dieses Moduls ein vertieftes Verständnis verschiedenster Methoden und Techniken aus den Bereichen Information Theory, Inference, and Learning Algorithmen. Sie verbessern Ihre Fähigkeit einen Vortrag über ein Thema aus diesem Bereich zu halten und bekommen ein besseres Verständnis für die im Seminar behandelten Themen.', '* u.a. David J.C.MacKay, "Information Theory, Inference, and Learning Algorithms", Cambridge, PDF freely available on the author''s website', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Schriftliche Ausarbeitung zum gewählten Thema
* Begutachtung von anderen Ausarbeitungen
* Präsentation des eigenen Themas
* Aktive Teilnahme an Diskussionen', '5 LP', 'Master-Seminar Information Theory, Inference, and Learning Algorithms', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 83);
INSERT INTO public.veranstaltung VALUES (86, 'Dieses Modul wird in unregelmäßigen Abständen angeboten.', 'In diesem Seminar werden speziell ausgewählte Themen aus dem Bereich „Algorithmen für graphentheoretische Konzepte in der Informatik“ behandelt. Die Auswahl variiert von Veranstaltung zu Veranstaltung und orientiert sich an den aktuellen Forschungsthemen der Arbeitsgruppe.', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* selbst Einblicke in einige der wichtigsten Themen, Resultate und Methoden aus dem Gebiet der Algorithmen für Graphen zu erarbeiten,
* einen guten Vortrag vorzubereiten und zu halten,
* die Vorträge der anderen Studierenden kritisch zu diskutieren und
* eine gute schriftliche Ausarbeitung zu dem Vortragsthema anzufertigen.', '* Ausgewählte Themen aus dem Bereich „Algorithmen für graphentheoretische Konzepte in der Informatik“.', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Aktive Mitarbeit in den Seminaren und Übungen
* schriftliche Ausarbeitung zu einem Thema des Seminars
* Vortrag des Themas', '5 LP', 'Master-Seminar über Algorithmen für graphentheoretische Konzepte in der Informatik', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”
* „Graphenalgorithmen I“', 84);
INSERT INTO public.veranstaltung VALUES (87, 'Dieses Modul wird in unregelmäßigen Abständen angeboten.', 'Perfekte Graphen sind eine der am besten untersuchten Graphenklassen. Zahlreiche Probleme lassen sich auf perfekten Graphen einfacher oder schneller lösen als auf allgemeinen Graphen. In diesem Seminar sollen verschiedene Typen perfekter Graphen, z.B. Bäume, bipartite Graphen, Intervallgraphen, Vergleichbarkeitsgraphen, Thresholdgraphen und Chordale Graphen vorgestellt und einige klassische Probleme auf diesen betrachtet werden.', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* selbst Einblicke in einige der wichtigsten Themen, Resultate und Methoden aus dem Gebiet der perfekten Graphen zu erarbeiten,
* einen guten Vortrag vorzubereiten und zu halten,
* die Vorträge der anderen Studierenden hören und kritisch zu diskutieren und
* eine gute schriftliche Ausarbeitung zu dem Vortragsthema anzufertigen.', '* M. Golumbic, Algorithmic Graph Theory and Perfect Graphs, Elsevier, 2004.
* F. Gurski, I. Rothe, J. Rothe, E. Wanke, Exakte Algorithmen für schwere Graphenprobleme, Springer Verlag, 2010.
* J.L. Ramirez-Alfonsin, Bruce A. Reed (Editors), Perfect Graphs, Wiley, 2010.', '', '* WahlpflichtbereichTheoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Aktive Mitarbeit in den Seminaren und Übungen
* schriftliche Ausarbeitung zu einem Thema des Seminars
* Vortrag des Themas
* Bestehen der Klausur zum Ende des Semesters', '5 LP', 'Master-Seminar über Algorithmen für perfekte Graphen', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 85);
INSERT INTO public.veranstaltung VALUES (88, 'Dieses Modul wird in unregelmäßigen Abständen angeboten.', 'Gerichtete Netzwerkstrukturen kommen in vielen verschiedenen Gebieten vor, wie zum Beispiel in der Genetik, in sozialen Netzwerken, bei Finanztransaktionen oder bei der Planung einer Infrastruktur. Oft müssen in diesen Teilgebieten Probleme auf oder mit Hilfe von gerichteten Netzwerken gelöst werden. In diesem Seminar soll eine weite Übersicht über mögliche Anwendungsgebiete von gerichteten Netzwerken gegeben werden. Dies soll durch die Vorstellung möglichst aktueller Beispiele aus der Forschung in verschiedenen Gebieten geschehen. Dabei soll besonders Wert auf die verschiedenen Strukturen der gerichtete Graphen bzw. Netzwerke gelegt werden, wobei darauf geachtet werden soll, welche Strukturen oder Klassen von gerichteten Graphen in den Algorithmen zur Lösung des Problems ausgenutzt wurden. Die Studierenden sollen weiter überlegen, welche Probleme in den jeweiligen Teilgebieten noch offen sind und Ideen für Lösungsansätze suchen.', 'Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,

* selbst Einblicke in einige aktuelle Forschungsergebnisse und Resultate aus dem Gebiet der Anwendung von gerichteten Netzwerken zu erarbeiten,
* Theorie im Kontext zu erklären,* einen guten Vortrag vorzubereiten und zu halten,
* Vorträge anderer Studierender kritisch zu diskutieren,
* eine gute schriftliche Ausarbeitung zu dem Vortragsthema anzufertigen,
* eine gute Ausarbeitung und Präsentation mit Latex zu erstellen.', 'Aktuelle Forschungsarbeiten', '', '* WahlpflichtbereichTheoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Aktive Mitarbeit in den Seminaren und Übungen
* schriftliche Ausarbeitung zu einem Thema des Seminars
* Vortrag des Themas
* Bestehen der Klausur zum Ende des Semesters', '5 LP', 'Master-Seminar über Anwendungen von gerichteten Netzwerkstrukturen', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 86);
INSERT INTO public.veranstaltung VALUES (89, 'Dieses Modul wird in unregelmäßigen Abständen angeboten.', 'In diesem Seminar beschäftigen wir uns mit der Analyse von Graphparametern für gerichtete Graphen. Hierzu betrachten wir gerichtete Formen der Cliquenweite, NLC-Weite und Rangweite sowie verschiedene Ansätze für eine gerichtete Form der Baumweite. Es sollen Beziehungen zwischen diesen Parametern und die Weite spezieller Graphklassen bzgl. dieser Parameter vorgestellt werden.', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* selbst Einblicke in einige der wichtigsten Themen, Resultate und Methoden aus dem Gebiet der Graphparameter für gerichtete Graphen zu erarbeiten,
* einen guten Vortrag vorzubereiten und zu halten,
* die Vorträge der anderen Studierenden hören und kritisch zu diskutieren und
* eine gute schriftliche Ausarbeitung/Vortragsfolien zu dem Vortragsthema anzufertigen.', '* J. Bang-Jensen, G. Gutin, Digraphs: Theory, Algorithms and Applications, Springer, 2009.
* A. Brandstädt, V.B. Le, J.P. Spinrad, Graph Classes: A Survey, SIAM Monographs on Discrete Mathematics and Applications. SIAM, 1999.
* M.C. Golumbic. Algorithmic Graph Theory and Perfect Graphs. Academic Press, 1980.
* N.V.R. Mahadev and U.N. Peled. Threshold Graphs and Related Topics. Annals of Discrete Math. 56. Elsevier, North-Holland, 1995.
* aktuelle Forschungsarbeiten', '', '* WahlpflichtbereichTheoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Aktive Mitarbeit in den Seminaren und Übungen
* schriftliche Ausarbeitung/Vortragsfolien zu einem Thema des Seminars
* Vortrag des Themas
* Bestehen der Prüfungzum Ende des Semesters', '5 LP', 'Master-Seminar über Graphparameter für gerichtete Graphen', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik"', 87);
INSERT INTO public.veranstaltung VALUES (90, 'Etwa alle ein bis zwei Jahre, jeweils in Kombination mit den o.g. WP/SP-Modulen von Prof. Rothe.', '* Präferenzaggregation durch Wählen: Algorithmik und Komplexität
* Algorithmische Spieltheorie
* Gerechte Aufteilungsverfahren: Algorithmik und Komplexität', 'Ziel in diesem Modul ist es, dass sich die Studierenden selbst Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem Gebiet *Collective Decision Making* erarbeiten, über ein spezielles Thema aus der Originalliteratur einen Vortrag im Seminar halten und die Vorträge der anderen Studierenden hören und kritisch diskutieren. Weiter gehört eine schriftliche Ausarbeitung zu jedem Vortrag und es findet eine gegenseitige Beurteilung der schriftlichen Ausarbeitungen der Studierenden untereinander statt, wobei die Anonymität sowohl des Autors bzw. der Autorin als auch die des Gutachters bzw. der Gutachterin gewahrt bleibt („double-blind peer-reviewing“). Zu den in diesem Seminar erworbenen Kompetenzen gehört also sowohl die Fähigkeit, einen guten Vortrag vorzubereiten und zu halten, als auch die Fähigkeit der kritischen und fairen Begutachtung.

*Dieses Seminar ist kombinierbar mit dem Modul*

* Algorithmische Spieltheorie

*und mit den folgenden Modulen*:

* Algorithmische Eigenschaften von Wahlsystemen II
* Kooperative Spieltheorie
* Cake-cutting Algorithms', 'Unter anderem Originalarbeiten, die in den folgenden Büchern zitiert werden:

* Jörg Rothe (ed.): Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.

Eine kürzere deutsche Version dieses Buches erschien als:

* Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011', '', '* WahlpflichtbereichTheoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* schriftliche Ausarbeitung zum zugeteilten Thema
* Halten eines Vortrags
* Begutachtung einer anderen schriftlichen Ausarbeitung', '5 LP', 'Master-Seminar über Kollektive Entscheidungsfindung', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 88);
INSERT INTO public.veranstaltung VALUES (91, 'Jährlich im Wintersemester', '* Balancierte Wachstumsmodelle für Bakterien
* Resource-Balance-Analyse
* ME-Modelle (Metabolismus und Genexpression)
* Phänomenologische Wachstumsmodelle
* Kinetische Stoffwechselmodelle', 'Ziel in diesem Modul ist es, dass sich die Studierenden selbst Einblicke in einige der wichtigsten Themen, Resultate und Methoden aus der Modellierung biologischer Prozesse mit Hilfe von Computern erarbeiten, über ein spezielles Thema aus der Originalliteratur einen Vortrag im Seminar halten und die Vorträge der anderen Studierenden hören und kritisch diskutieren. Weiter gehört eine schriftliche Ausarbeitung zu jedem Vortrag und es findet eine gegenseitige Beurteilung der schriftlichen Ausarbeitungen der Studierenden untereinander statt, wobei die Anonymität sowohl des Autors bzw. der Autorin als auch die des Gutachters bzw. der Gutachterin gewahrt bleibt („double-blind peer-reviewing“). Zu den in diesem Seminar erworbenen Kompetenzen gehören also sowohl die Fähigkeit, einen guten Vortrag vorzubereiten und zu halten, als auch die Fähigkeit der kritischen und fairen Begutachtung.', 'Originalarbeiten', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Schriftliche Ausarbeitung zum zugeteilten Thema
* Halten eines Vortrags
* Begutachtung von zwei anderen schriftlichen Ausarbeitungen', '5 LP', 'Master-Seminar über Modellierung biologischer Zellen', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik"', 89);
INSERT INTO public.veranstaltung VALUES (92, 'Unregelmäßig', 'Die Härte mancher Probleme gibt Anlass dazu, kreative Methoden zu finden um sich der Lösung eines Problems zu nähern. Man kann beispielsweise Teilprobleme lösen oder das Problem auf eingeschränkte Klassen untersuchen, um Approximationsalgorithmen bzw. parametrisierte Algorithmen zu finden oder das Problem unter einer bestimmten Einschränkung effizient zu lösen. In diesem Modul werden verschiedene dieser Methoden untersucht. Ziel dieses Moduls ist es, den Studierenden Einblicke in einige wichtige oder aktuelle Forschungsthemen, Resultate und Methoden aus dem Gebiet der NP-schweren Probleme zu geben. Am Ende der Veranstaltung sollen die Studierenden einen Überblick über die vorgestellten Probleme und Resultate sowie ein ausgeprägtes Verständnis über einige ausgewählte Themen haben. Insbesondere sollen Studierende in der Lage sein, ihr Thema anderen Studierenden leicht zugänglich zu machen, sich eigene Beispiele und Aufgaben auszudenken und deren Lösung verständlich zu erklären.', 'Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,

* selbst Einblicke in einige aktuelle Forschungsergebnisse zu verarbeiten und Resultate aus Forschungsergebnissen zu verstehen und präsentieren
* die besprochenen schweren Probleme zu erläutern und formal zu definieren
* die behandelten Algorithmen und Methoden zu verstehen und auf konkrete Eingaben anzuwenden
* Laufzeitanalysen der Algorithmen durchzuführen
* Selbst Aufgaben zu stellen und anderen Studierenden hinreichend gute Materialien zu erstellen, um diese Aufgaben zu lösen', 'Aktuelle Forschungsarbeiten', '', '* WahlpflichtbereichTheoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Aktive Mitarbeit in den Seminaren
* schriftliche Ausarbeitung und Aufgaben erstellen zu einem Thema des Seminars
* Vortrag des Themas
* Bestehen der Prüfung zum Ende des Semesters', '5 LP', 'Master-Seminar über NP-Schwere Probleme', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 90);
INSERT INTO public.veranstaltung VALUES (93, 'Dieses Modul findet in unregelmäßigen Abständen statt.', 'Dieses Modul vermittelt grundlegende Kenntnisse im Bereich der Aggregation von individuellen Urteilen über möglicherweise logisch miteinander verknüpfte Aussagen. Es werden die folgenden Themen behandelt:

* Grundlagen, Einführung in die Social Choice Theorie
* Judgment Aggregation Prozeduren
  * Grundbegriffe
  * Eigenschaften von Urteilsmengen
  * Mehrheitsregel, Voraussetzungs/Folgerungsbasierte Mehrheitsregel, Voraussetzungsbasierte Quotenregeln, Quotenregel, Sequential Majority Priority Regel, Distanzbasierte Prozeduren
* Eigenschaften von Judgment Aggregation Prozeduren
* Unmöglichkeitstheorem von List und Pettit
* Charakterisierung von Quotenregeln
* Agendacharakterisierungen und Agendasicherheit, Möglichkeitsresultate
* Berechnungskomplexität in der gemeinsamen Urteilsfindung
  * Grundlagen Komplexitätstheorie
  * Bestimmung der gemeinsamen Urteilsmenge
  * Manipulation
  * Bestechung
  * Kontrolle
  * Safety of the Agenda', 'Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,

* die Aggregation von individuellen Urteilen an praktischen Beispiel durchzuführen
* spezifische Probleme im Bereiche der gemeinsamen Urteilsfindung zu identifizieren
* neue Prozeduren zur gemeinsamen Urteilsfindung zu entwickeln und im Hinblick auf Ihre Eigenschaften zu untersuchen
* Empfehlung für bestimmte Einsatzbereiche der gemeinsamen Urteilsfindung geben', '* Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division. J. Rothe (ed.). Unter Vertrag bei Springer. Voraussichtliche Publikation: 2015.

Eine kürzere deutsche Version dieses Buches erschien unter dem Titel:

* Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen. Jörg Rothe, Dorothea Baumeister, Claudia Lindner, Irene Rothe. Spektrum Akademischer Verlag, 2011.', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive und erfolgreiche Mitwirkung in den theoretischen und praktischen Übungen
* Prüfung am Ende der Veranstaltung (i.d.R. Klausur, 90 Minuten)', '5 LP ab PO 2015, alte PO 7,5 LP', 'Judgment Aggregation', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 91);
INSERT INTO public.veranstaltung VALUES (94, 'Wird unregelmäßig im Wechsel mit den Modulen/Veranstaltungen „Data Warehouses“, „Multimedia-Datenbanksysteme“, „Knowledge Discovery in Databases – Ausgewählte Kapitel“, „Transaktionsverwaltung“ und „Information Retrieval und Natural Language Processing” angeboten, so dass jedes Semester mindestens eine dieser Veranstaltungen angeboten wird.', '* Grundlagen der Statistik
* Clustering (partitionierten, dichtebasiert, hierarchisch, ...)
* Klassifikation (Entscheidungsbaum, Support-Vektor-Maschine, ...)
* Assoziationsregeln (Frequent-Itemsets, ...)
* Weitere Mining-Verfahren und -Anwendungen', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die verschiedenen Methoden des Knowledge Discovery zu erläutern
* die Methoden vergleichend zu bewerten
* zu entscheiden, welche Methode in welcher Situation sinnvoll eingesetzt werden kann', '* Ester M., Sander J.: Knowledge Discovery in Databases: Techniken und Anwendungen, Springer Verlag, 2000.
* Dunham, M.H.: Data Mining – Introductory and Advanced Topics, Prentice Hall, 2003.
* Tan, P.-N., Steinbach, M., Kumar, V.: Introduction to Data Mining, Addison Wesley, 2006.
* Han J., Kamber M.: Data Mining: Concepts and Techniques, Morgan Kaufmann Publishers, August 2000.
* Berthold M., Hand D. J. (eds.): Intelligent Data Analysis: An Introduction. Springer Verlag, Heidelberg, 1999', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Teilnahme an den Übungen bzw. dem Seminar
* erfolgreiches Bearbeiten der Übungsaufgaben
* abschließende Prüfung (i.d.R. mündlich)', '5 LP ab PO 2015, alte PO 7,5 LP', 'Knowledge Discovery in Databases', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 92);
INSERT INTO public.veranstaltung VALUES (95, 'Siehe unten', 'Es werden zu dem Modul „Knowledge Discovery in Databases“ weiterführende Verfahren behandelt, wobei aktuelle Entwicklungen berücksichtigt werden sollen. Mögliche Themenschwerpunkte sind z.B.

* Temporal Association Rule Mining
* Zeitreihenanalyse und -vorhersage
* Erweiterungen des Clustering z.B. für fehlende Werte
* Outlier Detection', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* spezielle Verfahren in den behandelten Themengebieten zu bewerten und kritisch zu vergleichen
* anhand der Charakteristik des zu lösenden Problems geeignete Verfahren auszuwählen und, wenn
erforderlich, zu kombinieren', '* Ester M., Sander J.: Knowledge Discovery in Databases: Techniken und Anwendungen, Springer Verlag, 2000.
* Dunham, M.H.: Data Mining – Introductory and Advanced Topics, Prentice Hall, 2003.
* Tan, P.-N., Steinbach, M., Kumar, V.: Introduction to Data Mining, Addison Wesley, 2006.
* Han J., Kamber M.: Data Mining: Concepts and Techniques, Morgan Kaufmann Publishers, August 2000.
* Berthold M., Hand D. J. (eds.): Intelligent Data Analysis: An Introduction. Springer Verlag, Heidelberg, 1999.

sowie weiterführende Literatur in Abhängigkeit von den behandelten Themen (wird in der Veranstaltung bekanntgegeben)', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Teilnahme an den Übungen bzw. dem Seminar
* erfolgreiches Bearbeiten der Übungsaufgaben bzw. Anfertigen einer angemessenen Seminarausarbeitung und Halten eines Vortrags
* abschließende Prüfung (i.d.R. mündlich)', '5 LP ab PO 2015, alte PO 7,5 LP', 'Knowledge Discovery in Databases - Ausgewählte Themen', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 93);
INSERT INTO public.veranstaltung VALUES (96, 'Etwa alle vier Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.', '* Kooperative Spiele: Miteinander spielen
  * Grundlagen
    * Kooperative Spiele mit übertragbarem Gewinn
    * Superadditive Spiele
    * Stabilitätskonzepte für kooperative Spiele
  * Einfache Spiele
    * Der Kern einfacher Spiele
    * Darstellungen einfacher Spiele
    * Gewichtete Wahlspiele
    * Dimensionalität
    * Machtindizes
    * Der Shapley-Shubik-Index und der Shapley-Wert
    * Die Banzhaf-Indizes
  * Komplexität von Problemen für kompakt darstellbare Spiele
    * Spiele auf Graphen
    * Gewichtete Wahlspiele
    * Hedonische Spiele', 'Ziel in diesem Modul ist es, den Studierenden Einblicke in einige der wichtigsten Themen, Resultate, Modellbildungen und Methoden aus dem Gebiet der kooperativen Spieltheorie zu vermitteln, welches derzeit in der Abteilung „Komplexitätstheorie und Kryptologie“ (Prof. Jörg Rothe und Jun.-Prof. Dorothea Baumeister) intensiv in der Forschung bearbeitet wird und in dem bevorzugt Themen für Bachelor- und Master-Arbeiten ausgegeben werden. Am Ende der Veranstaltung sollten Studierende wichtige Probleme und die zu ihrer Lösung entwickelten Algorithmen und algorithmischen Techniken nicht nur kennen, sondern sie auch selbstständig modifizieren und anwenden können. Insbesondere sollten sie in der Lage sein, „strategische Szenarien“ durch kooperative Spiele zu beschreiben und Stabilitätskonzepte in diesen Spielen formal zu charakterisieren. Ebenso sollten sie die Komplexität der für solche Spiele relevanten Entscheidungsprobleme (in einer geeigneten kompakten Darstellung) formal bestimmen und beschreiben können.', '* Jörg Rothe (ed.):Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division, Springer-Verlag, 2015.

Eine kürzere deutsche Version dieses Buches erschien als:

* Jörg Rothe, Dorothea Baumeister, Claudia Lindner und Irene Rothe: Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen, Spektrum Akademischer Verlag (Springer), 2011.', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* erfolgreiche Bearbeitung der Übungsaufgaben
* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung', '5 LP ab PO 2015, alte PO 7,5 LP', 'Kooperative Spieltheorie', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 94);
INSERT INTO public.veranstaltung VALUES (97, 'Etwa alle zwei Jahre, im Wechsel mit den anderen WP/SP-Modulen von Prof. Rothe.', '* Vertiefung der Kryptologie
  * Wiederholung: Aufgaben und Ziele der Kryptologie, einige mathematische Grundlagen und RSA
  * Diffie-Hellman und das Problem des diskreten Logarithmus
    * Das Schlüsseltauschprotokoll von Diffie und Hellman
    * Diskrete Logarithmen und das Diffie-Hellman-Problem
  * Die Protokolle von ElGamal
    * Das Public-Key-Kryptosystem und Digitale Signaturen von ElGamal
    * Sicherheit der Protokolle von ElGamal
  * Rabins Public-Key Kryptosystem
    * Rabins Kryptosystem
    * Sicherheit von Rabins System
  * Arthur-Merlin-Spiele und Zero-Knowledge
  * Weitere Protokolle
* Vertiefung der Komplexitätstheorie
  * Wiederholung: Aufgaben und Ziele der Komplexitätstheorie
  * Randomisierte Algorithmen und Komplexitätsklassen
    * PP, RP und ZPP: Monte-Carlo-und Las-Vegas-Algorithmen
    * Quantoren und BPP
    * Graphisomorphie und die Arthur-Merlin-Hierarchie
  * Die Boolesche Hierarchie
    * Probleme in DP
    * Struktur und Eigenschaften der Booleschen Hierarchie über NP
    * Exakte Graphfärbbarkeit
  * Die Polynomialzeit-Hierarchie
    * Orakel-Turingmaschinen
    * Struktur und Eigenschaften der Polynomialzeit-Hierarchie
    * Vollständige Probleme in den Stufen der Polynomialzeit-Hierarchie
    * Die Boolesche Hierarchie kollabiert die Polynomialzeit-Hierarchie', 'Ziel des Moduls Kryptokomplexität II ist die vertiefte Vermittlung von Kenntnissen über die wichtigsten asymmetrischen Kryptosysteme (also effiziente Algorithmen zur Verschlüsselung und legitimierten Entschlüsselung); andererseits wird die Sicherheit solcher Systeme behandelt, die häufig auf der Komplexität geeigneter Probleme beruht. Deshalb werden auch anspruchsvolle Themen der Komplexitätstheorie behandelt, insbesondere mit dem Ziel, Methoden zum Nachweis der genauen Komplexität wichtiger Probleme –z.B. durch ihre Klassifizierung als „vollständige“ Probleme in bestimmten Komplexitätshierarchien –zu verstehen und anwenden zu können. Dies ergänzt auch die Veranstaltungen zur Algorithmik, in denen es vorrangig um den Nachweis oberer Schranken (also die Entwicklung möglichst effizienter Algorithmen) für Probleme geht. Am Ende der Veranstaltung sollten Studierende in der Lage sein, die erlernten Modellbildungen und Techniken auf neue Probleme, Kryptosysteme und Algorithmen anwenden können. So sollen sie etwa die Komplexität von Problemen, die Sicherheit von kryptographischen Verfahren und die Laufzeit und den Speicherplatzbedarf von Algorithmen einschätzen können und in der Lage sein, strukturelle Eigenschaften von Komplexitätshierarchien zu erkennen und zu bewerten. Besonderer Wert wird darauf gelegt, dass die Studierenden die enge Verflechtung dieser Gebiete verstehen', '* Jörg Rothe: Komplexitätstheorie und Kryptologie. Eine Einführung in Kryptokomplexität, eXamen.Press, Springer-Verlag, 2008.
* Jörg Rothe: Complexity Theory andCryptology. An Introduction to Crypto-complexity, EATCS Texts in Theoretical Computer Science, Springer-Verlag, 2005', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* erfolgreiche Bearbeitung der Übungsaufgaben
* Bestehen der schriftlichen Prüfung (Klausur) oder der mündlichen Prüfung', '10LP ab PO 2015, alte PO 15LP', 'Kryptokomplexität II', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 95);
INSERT INTO public.veranstaltung VALUES (98, 'unregelmäßig', 'Learning from data in order to gain useful insights is an important task, generally covered under the data science umbrella. This involves a wide variety of fields such as statistics, artificial intelligence, effective visualization, as well as efficient (big) data engineering, processing and storage, where efficiency and scalability often play crucial roles inorder to cater for the quantity and heterogeneity of data.
The goal of this seminar is to deepen the understanding about data science & engineering techniques through studying and critically evaluating state-of-the-art literature in the field. Participants will be introduced to the critical assessment and discussion of recent scientific developments, thereby learning about emerging technologies as well as gaining the ability to evaluate and discuss focused scientific works. Participants will be given recent literature covering relevant data science areas. Each participant will review independently 1-2 publications and present and discuss its content and contribution, which are then presented and discussed with the entire student participants.', 'Studierende haben nach erfolgreichem Abschluss dieses Moduls ein vertieftes Verständnis aktueller Methoden und typischer Anwendungen im Bereich Data Science. Teilnehmer können wissenschaftliche Veröffentlichungen systematisch aufarbeiten, und deren Inhalte strukturiert zusammenfassen und kritisch bewerten.', 'Zu dieser Veranstaltung gibt es kein Lehrbuch. Einige relevante Grundlagen finden sich in:

* R for Data Science (by Garrett Grolemund and Hadley Wickham) O’Reilly Media
* Statistics in a Nutshell, 2nd Edition, A Desktop Quick Reference, Sarah Boslaugh, O’Reilly Media
* Doing Data Science –Straight Talk from the Frontline, Cathy O’Neil, Rachel Schutt, O’Reilly Media
* Data Analytics with Hadoop, Benjamin Bengfort & Jenny Kim, O‘Reilly Media
* Deep Learning by Ian Goodfellow and Yoshua Bengio and Aaron Courville [www.deeplearningbook.org](www.deeplearningbook.org)', 'Englisch', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik
* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science', '* Schriftliche Ausarbeitung zum gewählten Thema
* Begutachtung von anderen Ausarbeitungen
* Präsentation des eigenen Themas
* Aktive Teilnahme an Diskussionen', '5 LP', 'Master-Seminar Advances in Data Science', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 96);
INSERT INTO public.veranstaltung VALUES (99, 'I.d.R. jährlich', 'In vielen Bereichen der Forschung und der Industrie müssen immer größere Datenmengen (Schlagwort Big-Data) gespeichert und verarbeitet werden. Hierzu sind verteilte und parallele Systeme notwendig sowie große Infrastrukturen. Big-Data-Systeme bieten zahlreiche Plattformen für die verteilte und parallele Datenverarbeitung. Cloud-Computing bietet hierfür eine ideale Grundlage mit verschiedenen Frameworks, Diensten und Speichersystemen sowie einer nutzungsabhängigen Bezahlung, kombiniert mit einer elastischen Skalierung von Ressourcen.

Dieses Seminar behandelt u.a. aktuelle Forschungs-Themen aus den folgenden Bereichen:

* Cloud-Computing& Big-Data
* Batch-und Stream-Processing
* Verteilte Graph-Verarbeitung
* Cloud Storage-Systeme
* Kommunikationsdienste und
* Koordinierungsdienste
* ...', 'Studierende haben nach erfolgreichem Abschluss dieses Moduls ein vertieftes Verständnis von aktuellen Hard- und Software-Techniken im Themenumfeld Big-Data und Cloud-Computing. Sie können wissenschaftliche Veröffentlichungen systematisch aufarbeiten, deren Inhalte prägnant zusammenfassen, kritisch bewerten und präsentieren.', 'Aktuelle wissenschaftliche Publikationen zu den oben genannten Themen.', '', '* WahlpflichtbereichPraktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Erfolgreiche Teilnahme am Seminar
* Abschließende Prüfung am Ende des Semesters', '5 LP', 'Master-Seminar Big-Data-Systeme und Cloud-Computing', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 97);
INSERT INTO public.veranstaltung VALUES (100, 'unregelmäßig', 'Im Seminar werden grundlegende und aktuelle Forschungsarbeiten aus den Gebieten "Information Retrieval", "Natural Language Processing", "Knowledge Discovery in Databases" und "Machine Learning" behandelt, die auf den in den entsprechenden Vorlesungen präsentierten Verfahren aufbauen, diese weiterentwickeln oder neue Verfahren einführen.', 'Studierende haben nach dem erfolgreichen Abschluss dieses Moduls ein vertieftes Verständnis aktueller Methoden und typischer Anwendungen in den oben genannten Bereichen. Teilnehmer können wissenschaftliche Veröffentlichungen systematisch aufarbeiten, und deren Inhalte strukturiert zusammenfassen, präsentieren und kritisch bewerten.', 'Wird zu Beginn der Lehrveranstaltung bekanntgegeben.', 'Deutsch oder Englisch (wird jeweils angekündigt)', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Schriftliche Ausarbeitung zum gewählten Thema
* Präsentation des eigenen Themas
* Aktive Teilnahme an Diskussionen', '5 LP', 'Master-Seminar Datenbanken und Informationssysteme', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 98);
INSERT INTO public.veranstaltung VALUES (101, 'Unregelmäßig', 'In diesem Seminar untersuchen wir spezielle gerichtete Graphklassen darauf, ob sie weitebeschränkt bezüglich spezieller Parameter sind. Hierzu betrachten wir unter anderem gerichtete Formen von Bäumen, Wäldern, Kaktusgraphen, Halin Graphen, planaren Graphen, perfekte Graphen, bipartiten Graphen, Co-Graphen, Split-Graphen Schwellwertgraphen bezüglich ihrer Wegweite, Baumweite, Cliquenweite, NLC-Weite und weiteren gerichteten Parametern.', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* einen Überblick über einige der wichtigsten Themen und Resultate aus dem Gebiet der Graphparameter für gerichtete Graphen zu geben,
* eigene Ergebnisse für einfache Problemstellungen aus diesem Bereich erarbeiten,
* einen guten Vortrag vorzubereiten und zu halten,
* die Vorträge der anderen Studierenden zu hören und kritisch zu diskutieren und
* eine gute schriftliche Ausarbeitung/Vortragsfolien zu dem Vortragsthema anzufertigen.', '* J. Bang-Jensen, G. Gutin, Digraphs: Theory, Algorithms and Applications, Springer, 2009.
* J. Bang-Jensen, G. Gutin, Classes of Directed Graphs, Springer, 2018.
* A. Brandstädt, V.B. Le, J.P. Spinrad, Graph Classes: A Survey, SIAM Monographs on Discrete Mathematics and Applications. SIAM, 1999.
* M.C. Golumbic. Algorithmic Graph Theory and Perfect Graphs. Academic Press, 1980.
* aktuelle Forschungsarbeiten', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Aktive Mitarbeit in den Seminaren und Übungen
* schriftliche Ausarbeitung/Vortragsfolien zu einem Thema des Seminars
* Vortrag des Themas
* Bestehen der Prüfung zum Ende des Semesters', '5 LP', 'Master-Seminar über weitebeschränkte gerichtete Graphklassen', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 99);
INSERT INTO public.veranstaltung VALUES (102, 'Each summer term', 'Lectures and Practical Work: We start with an introduction to convolutional Neural Networks and show how to apply them in the search for overrepresented motifs in DNA. We introduce the necessary data preprocessing steps and illustrate how motif information can be extracted out of the learned weights. We then introduce deep generative models, in particular Variational Autoencoders and autoregessive Models in combination with important deep learning concepts, such as Attention. We introduce the problem of RNA folding and the basics of the biophysical and biochemical mechanisms involved. We use a variant of Monte Carlo Tree Search to efficiently sample the space of possible folding structures and introduce various scoring functions that serve as reward signal. We show that the problem of RNA/Protein folding is tightly related to reinforcement learning. We introduce the concept of self-supervised learning and how it can be applied to detect anomalies in time series data that have been recorded by wearables for high risk patients.', 'Students know how to implement machine learning algorithms in Pytorch and to run it on HPC. They understand the concepts of Deep Learning and are familiar with common Neural Network architectures, such as Convolutional Neural Networks, Autoregressive Models, and Transformer Networks. They are familiar with the predominant sampling methods, such as Important Sampling, MCMC, and Monte Carlo Tree search. They understand the basics of the protein biosynthesis and the problem of predicting 3d RNA/Protein Structure from DNA sequence. They understand the concept of multiple sequence alignments, their relation to Evolutionary Biology, and how it can be used to increase prediction of 3d folding structure of Biomolecules.', 'TBD', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science', '* Regular and active participation in the exercises
* Passing the examination
* Written examination', '10 LP', 'Methods of Artificial Intelligence in Life Sciences', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 100);
INSERT INTO public.veranstaltung VALUES (103, 'unregelmäßig', 'Das Modul richtet sich an Studenten, die bereits elementare Kenntnisse im Bereich Rechnernetze besitzen und die technischen Grundlagen von mobilen Netzen verstehen wollen. Ziel des Moduls ist das Erlernen allgemeiner Grundkenntnisse, das Verständnis von praxisrelevanten Systemen und das Erwerben praktischer Fertigkeiten.

* Grundlagen der Mobilkommunikation (Geschichte, Frequenzen und Regulierungen, Signale, Antennen, Signalausbreitung)
* Medienzugriff (Space-, Frequency-, Time-, Code Division Multiple Access)
* Drahtlose Lokale Netze (IEEE 802.11, Bluetooth)
* Mobilkommunikationssysteme (GSM, GPRS, UMTS, LTE)
* Ad-Hoc Netzwerke (Anwendungen, Wegewahl, DSR, AODV, LSR)', 'Studierende verstehen nach erfolgreichem Abschluss dieses Moduls die grundlegende Funktionsweise von Mobilfunksystemen und mobilen Netzwerken. Sie verstehen die physikalischen Effekte der Funkübertragung, die Herausforderungen und Lösungen für den Mehrfachzugriff sowie die konkreten Protokolle und Standards für die Mobilkommunikation, nämlich IEEE 802.11, 2G-5G und weitere.', '* Jochen Schiller: Mobilkommunikation, 2. Auflage, Addison-Wesley/Pearson Studium, 2003.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Mitarbeit in Vorlesung
* erfolgreiche Teilnahme an der praktischen Übung
* mündliche Prüfung', '5LP ab PO 2015, alte PO 7,5 LP', 'Mobilkommunikation', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 101);
INSERT INTO public.veranstaltung VALUES (104, 'Normalerweise jedes Jahr im Sommersemester', 'Dieses Modul befasst sich mit der vollautomatischen Verifikation von Hardware und Software mit Hilfe von Model Checking Algorithmen und Werkzeugen.

* Model Checking Algorithmen zur Verifikation von temporalen (Safety, Liveness und Fairness) und regulären Eigenschaften
* Kenntnisse und Anwendung von temporalen Logiken (z.B. LTL, CTL, CTL*, ...)
* Verwendung von Model Checking Werkzeugen (z.B. SMV, Spin, ProB, ...)
* Grundlagen fortgeschrittener Methoden (z.B. Binary Decision Diagrams, Partial Order Reduction, Symmetrie, ...)', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* verschiedene Verfahren zur Programmverifikation zu präsentieren, anzuwenden und miteinander zu vergleichen
* einfache Spezifikationen zu erstellen und automatisiert mit Werkzeugen zu prüfen
* temporale und reguläre Eigenschaften in geeigneten Formalismen zu formulieren
* einen eigenen Model Checker zu implementieren', '* Christel Baier und Joost-Pieter Katoen: Principles of Model Checking. MIT Press, 2008.
* M. Clarke, O. Grumberg, D.A. Peled: Model Checking, MIT Press.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', 'mündliche (20-30 Min.) oder schriftliche (Klausur, 90 Minuten) Prüfung', '5 LP ab PO 2015, alte PO 7,5 LP', 'Model Checking', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 102);
INSERT INTO public.veranstaltung VALUES (105, 'Jedes Studienjahr, in der Regel im Wintersemester', '* Einführung in die statistische Programmiersprache R
* Grundlegende Elemente der Linearen Algebra für die Bioinformatik
* Grundeigenschaften und Rekonstruktion der stöchiometrischen Matrix
* Topologie und fundamentale Unterräume der stöchiometrischen Matrix
* Extreme Pathways & Elementarmoden
* Eigenschaften des Lösungsraums
* Flux-Balance Analyse
* Flux-Variability, Flux-Coupling
* Modelierung von Knock-out Mutanten
* Berücksichtigung weiterer biologischer Beschränkungen', 'Die Studierenden können nach Abschluss dieser Vorlesung;

* wichtige Methoden der constraint-based Modellierung von metabolischen Netzwerken zusammenfassen und anwenden;
* biologische Systeme anhand möglicher biochemischer Reaktionen beschreiben;
* lineare Optimierungsprobleme mit Hilfe der Programmiersprache R formulieren und lösen;
* Stoffwechselmodule im Zusammenhang betrachten und deren Verhalten unter verschiedenen Bedingungen simulieren.', '* Bernhard Ø. Palsson: Systems Biology: Properties of Reconstructed Networks. Cambridge University Press, 2006.
* Uwe Ligges: Programmieren mit R. Springer Verlag, 2007
* Günther Gramlich: Lineare Algebra. Eine Einführung für Ingenieure. Fachbuchverlag Leipzig, 2003', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Teilnahme an den Übungen
* erfolgreiches Bearbeiten der Übungsaufgaben (50%)
* abschließende Prüfung (i.d.R. schriftlich)', '5 LP ab PO 2015, alte PO 7,5 LP', 'Modellierung metabolischer Netzwerke', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 103);
INSERT INTO public.veranstaltung VALUES (106, '* unregelmäßig
* wird im Wechsel mit den Modulen/Veranstaltungen „Data Warehouses“, „Knowledge Discovery in Databases“, „Knowledge Discovery in Databases“, „Transaktionsverwaltung“ und „Information Retrieval und Natural Language Processing” angeboten, so dass jedes Semester mindestens eine dieser Veranstaltungen angeboten wird.', '* Information Retrieval
* Multimedia Information Retrieval
* Feature-Transformationsverfahren
* Distanzfunktionen
* Effiziente Algorithmen und Datenstrukturen', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die grundlegenden Fragestellungen des Multimedia Information Retrieval verstehen
* geeignete Distanzfunktionen auszuwählen bzw. zu entwerfen
* ein eigenes Multimedia-Datenbanksystem prinzipiell zu konzipieren', '* Ingo Schmitt: Ähnlichkeitssuche in Multimedia-Datenbanken, Oldenbourg-Verlag München, 2005.
* K. Meyer-Wegener: Multimedia-Datenbanken – Einsatz von Datenbanktechnik in Multimedia-Systemen (2. Auflage), Teubner, Stuttgart, 2003.
* B. Prabhakaran: Multimedia Database Management Systems, Kluwer Academic Publishers, Massachusetts, 1997.
* R. Veltkamp, H. Burkhardt, H.-P. Kriegel (Hrsg.): State-of-the-Art in Content-Based Image and Video Retrieval, Kluwer Academic Publishers, 2001.
* R. Bäza-Yates, B. Ribeiro-Neto: Modern Information Retrieval, Pearson / Addison Wesley, 1999.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Teilnahme an den Übungen bzw. dem Seminar
* erfolgreiches Bearbeiten der Übungsaufgaben bzw. Anfertigen einer angemessenen Seminarausarbeitung und Halten eines Vortrags
* abschließende Prüfung (i.d.R. mündlich)', '', 'Multimedia-Datenbanksysteme', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 104);
INSERT INTO public.veranstaltung VALUES (107, '* unregelmäßig
* wird im Wechsel mit den Modulen/Veranstaltungen „Knowledge Discovery in Databases“, „Multimedia-Datenbanksysteme“, „Knowledge Discovery in Databases – Ausgewählte Kapitel“, „Transaktionsverwaltung“ und „Data Warehouses” angeboten, so dass jedes Semester mindestens eine dieser Veranstaltungen angeboten wird.', '* Evaluation von IR- bzw. NLP-Systemen
* Grundlegende NLP-Werkzeuge
* Grundlegende Formale Modelle
* Retrieval Modelle
* Das Vektorraummodell
* Fortgeschrittene NLP-Werkzeuge
* Anwendungsgebiete', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die grundlegenden Information Retrieval-Modelle zu erläutern
* NLP-Techniken zu verstehen und ihre Einsatzmöglichkeiten zu bewerten
* Information Retrieval- und NLP-Systeme zu konzipieren', '* A. Henrich: Information Retrieval 1 (Grundlagen, Modelle und Anwendungen), eBook (Creative Commons), http://www.uni-bamberg.de/?id=23516, 2008
* R. Baeza-Yates, B. Ribeiro-Neto: Modern Information Retrieval, Addison-Wesley, Boston, 1999
* C. Manning, H. Schütze: Foundations of Statistical Natural Language Processing, MIT Press, Cambridge, 1999

sowie ggfs. weiterführende Literatur (wird in der Veranstaltung bekanntgegeben)', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik
* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science', '* aktive Teilnahme an den Übungen bzw. dem Seminar
* erfolgreiches Bearbeiten der Übungsaufgaben bzw. Anfertigen einer angemessenen Seminarausarbeitung und Halten eines Vortrags
* abschließende Prüfung (i.d.R. mündlich)', '5 LP ab PO 2015, alte PO 7,5 LP', 'Natural Language Processing (vorm. Information Retrieval und Natural Language Processing)', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 105);
INSERT INTO public.veranstaltung VALUES (108, 'Jedes Sommersemester.', 'Moderne Computersysteme sind einer Vielzahl von Angriffen ausgesetzt. Ziel der Vorlesung ist es ein fundamentales Verständnis dafür zu entwickeln, wie man sich vor diesen Angriffen schützen kann. Hierzu werden sowohl die theoretischen Grundlagen diskutiert als auch konkrete Angriffe und Abwehrstrategien praktisch erprobt.

Insbesondere werden die folgenden Themen behandelt:

* Sicherheitslücken und Exploits (Buffer Overflows und Stack Smashing, Shellcode, ...)
* Malware (Viren, Würmer, Trojaner, Botnetze, ...)
* Absichern von Netzwerken (Architektuen, DMZ, Firewalls, IDS, VPN, Denial of Service, ...)
* Sicherheitsprotokolle (PKI, Web of Trust, SSL/TLS, PGP, DNSSec) und Zufallszahlen
* Anonymität im Netz (TOR, ...)
* Passwortspeicherung und Single Sign-on
* Virtualisierung
* Ausfallsicherheit (RAID, UPS)
* Web- und Anwendungssicherheit (CSRF, XSS, SQL Injection, MAC Length Extension, Schwachstel- lenscanner, ...)
* Vermeiden von Spam
* Digitale Währungen (Bitcoin)', 'Studierende verstehen nach erfolgreichem Abschluss dieses Moduls, wie aktuelle Angriffe in Computernetzwerken funktionieren, welche grundsätzlichen Schwachstellen häufig ausgenutzt werden und welche Gegenmaßnahmen gegen welche Angriffsarten schützen können. Studenten werden mit dem Abschluss des Moduls Konzepte für die Absicherung von Netzwerken entwickeln und ein einfaches, abgesichertes Netzwerk aufsetzen können.', 'Zu dieser Veranstaltung gibt es kein Lehrbuch.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Mitarbeit in Vorlesung
* erfolgreiche Teilnahme an der praktischen Übung
* mündliche Prüfung', '10 LP ab PO 2015, alte PO 15 LP', 'Netzwerksicherheit', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:
* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 106);
INSERT INTO public.veranstaltung VALUES (111, 'Dieses Modul findet in unregelmäßigen Abständen statt.', 'Dieses Modul beschäftigt sich mit verschiedenen Themen aus der Informatik unter dem Gesichtspunkt „Informatik unplugged“. Ziel von Informatik unplugged ist es, fundamentale Konzepte der Informatik, anhand von einzelnen Aktivitäten zu erlernen. Dabei haben alle diese Aktivitäten gemeinsam, dass keine Computer benötigt werden. In diesem Seminar sollen die Studierenden zunächst dieses Gesamtkonzept kennenlernen und sich danach in Kleingruppen intensiv mit bestimmten Themen auseinandersetzen. Im Anschluss daran, sollen die Teilnehmer selber unplugged Aktivitäten zu unterschiedlichen Bereichen der Informatik entwickeln. In diesem Seminar müssen mehrere Vorträge ausgearbeitet und gehalten werden, außerdem muss eine schriftliche Ausarbeitung erfolgen, und die Studierenden sollen ihre Fähigkeiten im Bereich der kritischen und fairen Begutachtung erweitern.

Dieses Seminar ist kombinierbar mit den Modulen:

* Judgment Aggregation
* Mathematische Hintergründe der Wahlmanipulation und mit den Modulen (von Prof. Dr. Jörg Rothe):
* Algorithmische Spieltheorie
* Algorithmische Eigenschaften von Wahlsystemen II
* Kooperative Spieltheorie
* Cake-cutting Algorithms
* Kryptokomplexität II', 'Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,

* das Konzept von Informatik unplugged zu erläutern.
* Informatik unplugged Aktivitäten mit anderen Teilnehmern durchführen, und das dahintersteckende fundamentale Konzept anschaulich erklären.
* neue Informatik unplugged Aktivitäten zu ganz unterschiedlichen Bereichen der Informatik selbst zu entwickeln.', '* Computer Science Unplugged. Tim Bell, Ian H. Witten und Mike Fellows. Online verfügbar unter: [http://csunplugged.org](http://csunplugged.org)
* Abenteuer Informatik: IT zum Anfassen – von Routenplaner bis online Banking. Jens Gallenbacher, Spektrum Akademischer Verlag, 2012', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* schriftliche Ausarbeitung einer neuen unplugged Aktivität
* Vorstellen einer vorhandenen und der neu erarbeiteten unplugged Aktivität
* Begutachtung einer anderen schriftlichen Ausarbeitung', '5 LP', 'Master-Seminar zu Informatik unplugged', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 109);
INSERT INTO public.veranstaltung VALUES (112, 'Unregelmäßig', 'Viele bioinformatische Probleme lassen sich als kombinatorische Optimierungsprobleme formulieren. Dieses Modul vermittelt fortgeschrittene Kenntnisse zum Erkennen, Formulieren und Lösen solcher Probleme. Anhand einer Auswahl aus den folgenden aktuellen bioinformatischen Themengebiete werden wichtige Techniken wie Dynamische Programmierung, Graphenalgorithmen, Lineare und Ganzzahlige Lineare Programmierung, Lagrange-Relaxierung und Parameterisierte Algorithmen eingeführt oder wiederholt und vertieft und Lösungsansätze entwickelt.

* Genomik: De Novo-Genomassemblierung: fragment assembly; Haplotype-Phasing; Finden von struktureller Variation
* Strukturbiologie: RNA-Sekundärstruktur: Vorhersage, Vergleich; Proteinstruktur: Vorhersage, protein threading, Seitenkettenplatzierung, Vergleich
* Transkriptomik: Transkript-Assembly
* Proteomik: De Novo-Peptidsequenzierung; Quantifizierung von Polymeren
* Phylogenetik: Perfekte Phylogenie, Vergleich von Bäumen
* Evolution: Finden von Gen-Clustern
* Netzwerkbiologie: Dichte Teilgraphen (Proteinkomplexe); Netzwerkmodule; Netzwerkalignment; Rekonstruktion Boolescher Signalwege
* Krebsgenomik: Finden von driver mutations', 'Studierende, die das Modul erfolgreich absolviert haben, besitzen anschließend ein breites und vertieftes Verständnis im Bereich „Algorithmische Bioinformatik" und können neue Probleme einordnen und mit modernen Optimierungsmethoden lösen.', 'Originalliteratur.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Schriftliche Ausarbeitung zum gewählten Thema
* Begutachtung von anderen Ausarbeitungen
* Präsentation des eigenen Themas
* Aktive Teilnahme an Diskussionen', '', 'Master-Seminar zu Kombinatorische Optimierung in der Bioinformatik', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 110);
INSERT INTO public.veranstaltung VALUES (113, 'Unregelmäßig', 'Machine Learning hat als Oberbegriff für Methoden zur Erkennung von Mustern und Gesetzmäßigkeiten in Daten und der Erzeugung daraus abgeleiteter Entscheidungen und Vorhersagen eine enorme Bedeutung in vielen Fachdisziplinen und Branchen erlangt. Insbesondere die stetig wachsende Menge an digitalen Daten in Unternehmen, Wissenschaft und Internet hat einen massiven Bedarf an Experten auf diesem Gebiet geführt. Da die Entwicklung neuer Methoden in diesem Bereich sehr schnell verläuft, ist eine fortlaufende Auseinandersetzung mit den neuesten Erkenntnissen für künftige Experten unerlässlich. Ziel der Veranstaltung ist es, das Grundwissen aus der Vorlesung Machine Learning durch ein intensives Studium wichtiger wissenschaftlicher Veröffentlichungen zu vertiefen, und die Teilnehmer auf die selbständige Auseinandersetzung mit neuen wissenschaftlichen Entwicklungen in diesem Feld vorzubereiten. Um dieses Lernziel zu erreichen, wird den Teilnehmern wöchentlich eine wissenschaftliche Veröffentlichung in englischer Sprache genannt. Die Teilnehmer arbeiten diese Veröffentlichung selbständig durch, so dass sie in der Lage sind, deren Inhalt vor allen anderen Teilnehmern an der Tafel zu präsentieren. Jede Woche findet eine Diskussionsveranstaltung statt, bei der ausgewählte Teilnehmer die Veröffentlichung vorstellen. Anschließend diskutieren alle Teilnehmer die Veröffentlichung.', 'Studierende haben nach erfolgreichem Abschluss dieses Moduls ein vertieftes Verständnis aktueller Methoden und typischer Anwendungen im Bereich des Machine Learning. Sie können wissenschaftliche Veröffentlichungen systematisch aufarbeiten, deren Inhalte prägnant zusammenfassen und kritisch bewerten.', 'Zu dieser Veranstaltung gibt es kein Lehrbuch.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Schriftliche Ausarbeitung zum gewählten Thema
* Begutachtung von anderen Ausarbeitungen
* Präsentation des eigenen Themas
* Aktive Teilnahme an Diskussionen', '5 LP', 'Master-Seminar zu Machine Learning', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”

Hilfreich ist erfolgreicher Abschluss des Moduls "Lineare Algebra"', 111);
INSERT INTO public.veranstaltung VALUES (114, 'Unregelmäßig', 'Die wissenschaftliche Datenanalyse nimmt einen immer größer werdenden Stellenwert in der Forschung ein. Insbesondere in der Bioinformatik hat die Kombination von enorm wachsenden Datenmengen, fehlenden Standards und Anreizen, schlechten Programmierpraktiken und unzureichend dokumentierten Parametern und Versionen zu einer Reproduzierbarkeitskrise geführt. Wissenschaftliche Software wird allzu häufig unzureichend dokumentiert, ineffizient programmiert und nicht gewartet. In diesem Seminar zeigen wir diese Fehler auf, in dem wir versuchen, die Datenanalyse ausgewählter Originalarbeiten zu reproduzieren. Zudem lernen wir, wie man es besser machen kann, indem diese Analysen mit Hilfe des Workflow-Management-Tools Snakemake realisiert werden und, bei Erfolg, auf zertifizierten Online-Speicherdiensten deponiert werden.', 'Studierende, die das Modul erfolgreich absolviert haben, kennen anschließend Wege aus der Reproduzierbarkeitskrise und können diese in Arbeit vermeiden.', 'Originalliteratur.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Schriftliche Ausarbeitung zum gewählten Thema
* Begutachtung von anderen Ausarbeitungen
* Präsentation des eigenen Themas
* Aktive Teilnahme an Diskussionen
* Gruppenarbeit (2-4 Personen): Datenanalyse mit Snakemake', '5 LP', 'Master-Seminar zu Reproduzierbarkeit bioinformatischer Forschungsergebnisse', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 112);
INSERT INTO public.veranstaltung VALUES (115, 'Wird nicht mehr angeboten', 'In vielen Bereichen der Forschung und der Industrie werden immer größere Datenmengen (Schlagwort BigData) erfasst und gespeichert. Um diese Daten möglichst effizient verarbeiten zu können sind verteilte und parallele Systeme unabdingbar. Neben der Skalierbarkeit bezüglich der Anzahl an Ressourcen sind auch Fehlertoleranzaspekte sehr wichtig. Bei interaktiven Systemen die Millionen oder Milliarden von Benutzern bedienen ist zusätzlich die Latenz eine besondere Herausforderung.

Dieses Seminar behandelt aktuelle Forschungs-Themen in diesem Themen-Umfeld, u.a. Cloud, Batch- und Stream-Processing, Graph-Verarbeitung, Storage-Systeme (key-value, NoSQL, in-memory)', 'Studierende haben nach erfolgreichem Abschluss dieses Moduls ein vertieftes Verständnis von aktuellen Hard- und Software-Techniken im Themenumfeld verteilte und parallele Systeme. Sie können wissenschaftliche Veröffentlichungen systematisch aufarbeiten, deren Inhalte prägnant zusam- menfassen, kritisch bewerten und präsentieren.', 'Aktuelle wissenschaftliche Publikationen zu den oben genannten Themen.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Erfolgreiche Teilnahme am Seminar
* Abschließende Prüfung am Ende des Semesters', '5 LP', 'Master-Seminar zu Verteilte und Parallele Systeme', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 113);
INSERT INTO public.veranstaltung VALUES (116, 'Dieses Modul findet in unregelmäßigen Abständen statt.', 'In vielen Situationen profitieren Wähler davon, wenn sie eine unehrliche Stimme abgeben. Gibbard und Satterthwaite haben sogar gezeigt, dass es bei mindestens drei zur Wahl stehenden Alternativen kein nicht manipulierbares Wahlsystem geben kann, welches eine Reihe von sinnvollen Eigenschaften erfüllt. Diese Veranstaltung behandelt die systematische mathematische Analyse von verschiedenen Formen der Manipulation in Wahlen.

* Einführung in die Social Choice Theorie
  - Formale Grundlagen
  - 20 Wahlsystemen
  - Arrows Theorem
* Grundlagen der Manipulation
  - Präferenzen über Mengen und Manipulierbarkeit
  - Beispiele für Manipulation
  - Resultate
  - Agenda Manipulierbarkeit und Transitivität
* Resolute Wahlregeln
  - Das Gibbard-Satterthwaite Theorem
  - Gleichstände in Stimmen
  - Äquivalenz von Arrows Theorem und dem Gibbard-Satterthwaite Theorem
  - Betrachtung des Beweises des Gibbard-Satterthwaite Theorems
* Umgang mit den Resultaten
  - Einführung
  - Manipulation ist zwar möglich aber schwer
  - Einschränkung der Annahmen
  - Variation der formalen Annahmen', 'Studierende sollen nach Absolvierung der Lehrveranstaltung in der Lage sein,

* verschiedene Formen der Manipulation formal zu definieren und zu vergleichen
* bekannte Beweise aus der Literatur wiederholen und erläutern
* Manipulation in unterschiedliche Formen einteilen
* Empfehlungen für die Verwendung von Wahlsystemen in unterschiedlichen Einsatzbereichen entwerfen', 'A. Taylor: Social Choice and the Mathematics of Manipulation, Cambridge University Press, 2005.', '', '* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive und erfolgreiche Mitwirkung in den theoretischen und praktischen Übungen
* Prüfung am Ende der Veranstaltung (i.d.R. Klausur, 90 Minuten)', '', 'Mathematische Hintergründe der Wahlmanipulation', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 114);
INSERT INTO public.veranstaltung VALUES (117, 'Jedes Sommersemester', 'Das Modul richtet sich an Studenten, die bereits elementare Kenntnisse im Bereich Rechnernetze besitzen und die das wissenschaftliche Arbeiten an neuster Forschung im Rahmen von opportunistischen und P2P-basierten Netzwerken kennenlernen wollen. Nach erfolgreichem Bestehen des Moduls verstehen die Studierenden methodische und fachbezogene Grundkenntnisse in ein aktuelles Forschungsthemenfeld, erlernen Methodiken für die Konzeption und Evaluation von neuen Forschungsansätzen in diesem Themenfeld sowie das Schreiben und das gegenseitige Begutachten von wissenschaftlichen Artikeln.

Organisation des Moduls:

* Einführungsinhalte:
  * Einführung in die Methodik der wissenschaftlichenArbeitsweise an einem (kleinen) Beispiel im Bereich Peer-to-Peer-Protokolle oder Protokolle für opportunistische Netzwerke
  * Kennenlernen gängiger Evaluationstools für Netzwerkprotokolle in diesen Forschungsbereichen
  * Einführung in die Konzeption und Begutachtung von wissenschaftlichen Artikeln
* Praktikum/Übung in Einzelarbeit oder kleinen Teams:
  * Einarbeitung in ein ausgewähltes Themenfeld aus einer Menge von Vorschlägen
  * Design eines Netzwerkprotokolls
  * Umsetzung und Evaluation in einem gängigen Evaluationstool
  * Schreiben eines wissenschaftlichen Artikels zu der Funktionsweise und Evaluation des Protokolls
  * Vorstellung der Ergebnisse auf einer universitätsinternen Konferenz', 'Studierende verstehen nach erfolgreichem Abschluss dieses Moduls, wie die Konzeption, Evaluation und Präsentation von neuen Forschungsergebnissen im Bereich der Peer-to-Peer-Forschung und im Bereich der opportunistischen Netzwerke stattfindet.

Studenten werden mit dem Abschluss des Moduls die Methodiken zur Erstellung, Evaluation und Beschreibung einer neuen Lösung in den genannten Forschungsbereichen anwenden können.', 'Zu dieser Veranstaltung gibt es kein Lehrbuch', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* erfolgreiche Teilnahme an der praktischen Übung
* mündliche Prüfung / Präsentation', '5 LP ab PO 2015, alte PO 7,5 LP', 'Opportunistische und P2P-basierte Netzwerke', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 115);
INSERT INTO public.veranstaltung VALUES (118, 'I.d.R. jährlich.', '* Aufbau von nVidia-basierten GPGPU-Karten
* Kernelprogrammierung in CUDA C
* Parallele Algorithmen
* Speicherarchitektur von Grafikkarten
* Streams
* Interoperabilität von CUDA und OpenGL', 'Studierenden sollen nach Absolvieren der Lehrveranstaltung massiv parallele Algorithmen für nVidia-Karten in CUDA C entwickeln und optimieren können. Dafür soll auf eine solide Kenntnis der Hardware-Architektur zurückgegriffen werden können.', '* J. Sanders, E. Kandrot, „CUDA by Example“, Addison Wesley (2010)
* J. Cheng, M. Grossman, T. McKercher, “Professinal CUDA C Programming”, John Wiley & Sons (2014)
* “CUDA Toolkit Documentation”, [http://docs.nvidia.com/cuda/index.html](http://docs.nvidia.com/cuda/index.html)', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Erfolgreiche Teilnahme an den Übungen
* Abschließende Prüfung am Ende des Semesters', '5 LP ab PO 2015, alte PO 7,5 LP', 'Paralleles Rechnen mit Grafikkarten', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 116);
INSERT INTO public.veranstaltung VALUES (119, 'Jedes Wintersemester', 'Das Modul richtet sich an Studenten, die bereits elementare Kenntnisse im Bereich Rechnernetze besitzen und die Grundlagen von Peer-to-Peer Systemen verstehen wollen. Peer-to-Peer Systeme kennzeichnen sich durch Algorithmen und Mechanismen, in denen die beteiligten Knoten sowohl Anbieter als auch Konsumenten der zur Verfügung gestellten Ressourcen sind.

Themen der Vorlesung und Übung

* Strukturierte Overlaynetzwerke (Chord, Can, Pastry, ...)
* Unstrukturierte Overlaynetzwerke (Gnutella, BubbleStorm, ...)
* Lokationsbasierte Overlaynetzwerke
* Erweiterungen von Overlaynetzwerken (Heterogenität, Anonymität, NAT ...)
* Sicherheit in Peer-to-Peer-Systemen
* BitTorrent
* Monitoring in Peer-to-Peer-Systemen', 'Studierende verstehen nach erfolgreichem Abschluss dieses Moduls die grundlegende Funktionsweise von Peer-to-Peer-Netzwerken und dezentralen Datenhaltungsansätzen. Sie verfügen über grundlegende praktische Kenntnisse zu der Gestaltung von Peer-to-Peer-Mechanismen, ferner lernen Sie den Umgang mit einem aktuellen Peer-to-Peer-Simulator, um selbstständig derartige Mechanismen evaluieren und tiefer verstehen zu können.', '* Ralf Steinmetz, Klaus Wehrle (Hrsg.): Peer-to-Peer Systems and Applications; 629 Seiten, Springer, ISBN 3-540-29192-X, 2005.
* Peter Mahlmann, Christian Schindelhauer: Peer-to-Peer-Netzwerke; 293 Seiten, Springer, ISBN 978-3-540-33991-5, 2007.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Mitarbeit in Vorlesung
* erfolgreiche Teilnahme an der praktischen Übung
* mündliche Prüfung', '5 LP ab PO 2015, alte PO 7,5 LP', 'Peer-to-Peer Systeme', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 117);
INSERT INTO public.veranstaltung VALUES (120, 'Normalerweise jedes Jahr im Sommersemester', 'Dieses Modul beschäftigt sich mit Synthese und Transformation von Programmen und Softwaresystemen. Dazu gehört sowohl die Anpassung undOptimierung bestehender Software durch partielle Auswertung, als auch die automatische Generierung individueller Algorithmen.

Die Themen sind:

* Transformation und Optimierung von Programmen
* Partielle Auswertung und Automatische Compilergenerierung
* Techniken zur Programmsynthese
* Synthese von Programmen basierend auf
  * Spezifikationen
  * Programmskizzen
  * Beispieldaten', 'Nach erfolgreichem Abschluss des Moduls sollten die Studierenden:

* Vorteile und Grenzen partieller Auswertung benennen können
* verstehen wie Programme mit Hilfe partieller Auswertung spezialisiert werden
* in der Lage sein einen partiellen Auswerter für eine gegebene (simple) Programmiersprache selber zu entwickeln
* Techniken der Programmsynthese benennen und vergleichen können
* einfache Synthesewerkzeuge implementieren können', 'Als Lehrbuch wird ein eigenes Skript verwendet.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Erfolgreiche Bearbeitung der Pflichtübungen
* Bestehender Klausur', '5 LP', 'Programmsynthese und Transformation', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 118);
INSERT INTO public.veranstaltung VALUES (121, 'Etwa alle zwei Jahre', '* The reinforcement learning problem
* Multi-armed bandits
* Markov Decision processes
* Dynamic programming
* Monte Carlo Methods
* Temporal-difference learning
* On-and off-policy methods
* Elligibility traces
* Policy gradients', 'Studierende sollen nach Absolvierung der Lehrveranstaltung:

* die theoretischen Grundlagen des Reinforcement Learnings verstehen und erklären können, und
* Algorithmen des Reinforcement learning implemetieren und anwenden können.', '* Richard Sutton, Andrew Barto, "Reinforcement Learning: An Introduction", 2018, MIT press, draft online available', '', '* WahlpflichtbereichPraktische oder Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik
* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science', '* Aktive Teilnahme an den Übungen
* Erfolgreiches Bearbeiten der Übungsaufgaben
* Abschließende Prüfung', '5 LP', 'Reinforcement Learning', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 119);
INSERT INTO public.veranstaltung VALUES (122, 'Irregular', 'Lecture:

* Introduction into the relational database model and relational data warehouses;
* Design of relational databases
* Multi-dimensional modelling for (relational ) data warehouses
* SQL
* OLAP
* Complex OLAP queries in SQL for data analysis', 'Relational Databases
Students understand the relational model for databases togetherwith its foundations (e.g.  relational  algebra). They  are  able  to  design  relational  databases  and  to  express  simple  and  complex database queries using SQL

Data  warehouses
Students know  the  basic architecture and central concepts of data  warehouses and can explain them. They can design relational data warehouses using multi-dimensional modelling.

OLAP and complex database queries
Students are able to understand, analysis and formulate complex OLAP and database queries using the SQL query language and its OLAP extension.', 'TBD', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science', '* Regular and active participation in the exercises
* Passing the examination
* Written examination or oral examination', '5 LP', 'Relational Databases and Data Analysis', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 120);
INSERT INTO public.veranstaltung VALUES (123, 'Normalerweise jedes Jahr im Wintersemester', '* Dieses Modul befasst sich mit der Entwicklung möglichst fehlerfreier Software mit Hilfe der formalen B- Methode.
* Die B-Methode wurde in den 80er Jahren von Jean-Raymond Abrial entworfen und hat eine sehr gute Werkzeugunterstützung (AtelierB, Rodin, ProB). Sie ist außerdem eine der am weitesten verbreiteten formalen Methoden in Europa. Ein Paradebeispiel der formalen Entwicklungsweise in B ist das erfolgreiche METEOR Projekt (Steuersystem für die automatischen Züge der Linie 14 der Pariser U-Bahn), bei dem 100,000 Zeilen von B mit Hilfe von 28,000 Beweisen in eine robuste Implementierung übersetzt wurde.', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* Die Grundzüge der B Sprache (Syntax und Semantik) zusammenfassen können und mit klassischen Programmiersprachen vergleichen können
* neue formale Spezifikationen mit B erstellen können und dabei praktische B Werkzeuge (hauptsächlich Rodin und ProB) benutzen können
* Spezifikationen auf Fehler untersuchen zu können
* Einfache Spezifikationen auf Papier und mit Hilfe einer automatisierten Beweisumgebung (Rodin) beweisen können
* Grundlagen der Verfeinerung nutzen zu können', '* J.R. Abrial: Modeling in Event-B. System and Software Engineering.
* Steve Schneider: The B-Method: An Introduction.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Wahlpflichtbereich Theoretische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* Erfolgreiche Bearbeitung der Pflichtübungen,
* Bestehen der Klausur.', '5 LP ab PO 2015, alte PO 7,5 LP', 'Sicherheitskritische Systeme', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 121);
INSERT INTO public.veranstaltung VALUES (124, 'Irregular', 'Introduction: architecture of a spoken dialogue system, dialogue acts, turn management issues

Semantic decoding: representing and decoding meaning from user inputs, semantic decoding as a classification task, semantic decoding as a sequence-to-sequence learning task Dialogue state tracking: tracking beliefs over multiple turns, classical generative and discriminative approaches, recent deep learning approaches, integration of decoding and tracking. Dialogue Management: modelling via Markov Decision Processes, reinforcement learning, gradient methods, Gaussian Processes Response Generation: template methods, generative models, recent neural network approaches Current research topics: incremental dialogue, towards open-domain systems, end-to-end neural network architectures

Practical Work:

Students will be provided with a set of Python tools which will enable them to configure and test a simple spoken dialogue system. They will be asked to implement a simple dialogue state tracker and a reinforcement learning algorithm and optimize the dialogue manager in interaction with a simulated user. This will give them an opportunity to explore a practical example of reinforcement learning.', 'On completion of this module, students should understand:

The purpose and operation of the main components of a spoken dialogue system.

How the framework of partially observable Markov decision processes can be used to model a spoken dialogue system.

How classification, regression, sequence-to-sequence models and reinforcement learning can be used to implement a spoken dialogue system. The various options for optimizing and adapting a statistical spoken dialogue system, both off-line and on-line, and how deep learning can be utilised to achieve state of the art results in dialogue modelling.', 'TBD', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Wahlbereich im Master-Studiengang Artificial Intelligence and Data Science', '* Regular and active participation in the exercises
* Passing the examination
* Written report of 2000 words covering the practical [100%]', '5 LP', 'Spoken Dialogue Systems', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 122);
INSERT INTO public.veranstaltung VALUES (125, 'Siehe unten', '* Transaktionseigenschaften und -anforderungen (ACID, ...)
* Serialisierbarkeit (Final-State-, Sicht-, Konfliktserialisierbarkeit)
* Abbrucheigenschaften (Rücksetzbarkeit, Vermeidung kaskadierender Abbrüche, Striktheit)
* Sperrverfahren und -protokolle
* Recovery
* Strukturierte Transaktionsmodelle
* ACTA', 'Studierende sollen nach Absolvierung der Lehrveranstaltungen in der Lage sein,

* die Probleme der Transaktionsverwaltung in Datenbanksystemen zu erläutern
* Eigenschaften von Transaktionsschedules zu bestimmen
* Recovery-Verfahren zu vergleichen und zu bewerten
* die Einsatzmöglichkeiten strukturierter Transaktionsmodelle zu durchschauen', '* P. Bernstein, V. Hadzilacos, N. Goodman: Concurrency Control and Recovery in Database Systems, Addison-Wesley, Reading, MA, 1987.
* J. Gray, A. Reuter: Transaction Processing: Concepts and Techniques, Morgan Kaufmann Publishers, San Mateo, CA, 1993.
* G. Weikum, G. Vossen: Transactional Information Systems: Theory, Algorithms, and the Practice of Concurrency Control and Recovery, Morgan Kaufmann Publishers, 2001.', '', '* Wahlpflichtbereich Praktische oder Technische Informatik
* Schwerpunktbereich
* Individuelle Ergänzung
* Anwendungsfach für den Ergänzungsbereich im Master-Studiengang Mathematik', '* aktive Teilnahme an den Übungen
* erfolgreiches Bearbeiten der Übungsaufgaben
* abschließende Prüfung (i.d.R. mündlich)', '5 LP ab PO 2015, alte PO 7,5 LP', 'Transaktionsverwaltung', 'Bachelor-Studierende müssen folgende Module erfolgreich abgeschlossen haben:

* „Programmierung”
* „Rechnerarchitektur“
* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”
* „Datenbanksysteme“', 123);


--
-- Data for Name: veranstaltung_semester; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- Data for Name: veranstaltungsform; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.veranstaltungsform VALUES (1, 'Übung', 2, 1);
INSERT INTO public.veranstaltungsform VALUES (2, 'Vorlesung „Programmierung“', 4, 1);
INSERT INTO public.veranstaltungsform VALUES (3, 'Vorlesung „Analysis II“', 4, 2);
INSERT INTO public.veranstaltungsform VALUES (4, 'Übung', 2, 2);
INSERT INTO public.veranstaltungsform VALUES (5, 'Übung', 2, 3);
INSERT INTO public.veranstaltungsform VALUES (6, 'Vorlesung „Numerik I (Numerical Analysis I)“', 4, 3);
INSERT INTO public.veranstaltungsform VALUES (7, 'Programmierübung', 1, 3);
INSERT INTO public.veranstaltungsform VALUES (8, 'Übung', 2, 4);
INSERT INTO public.veranstaltungsform VALUES (9, 'Vorlesung „Stochastik (Modelling in Stochastics)“', 4, 4);
INSERT INTO public.veranstaltungsform VALUES (10, 'Aus dem Angebot der Heinrich-Heine-Universität Düsseldorf sind Lehrveranstaltungen zur Praxis- und Berufsorientierung zu besuchen.
Dabei müssen zumindest zwei LP in Lehrveranstaltungen erworben werden, die Techniken des wissenschaftlichen Arbeitens oder Präsentationstechniken vermitteln. Hierzu zählen unter anderem:

* Rhetorikseminare / -kurse
* Seminare in der Informatik oder im gewählten Nebenfach
* Veranstaltungen des KUBUS-Programms zu Techniken des wissenschaftlichen Arbeitens oder zu Präsentationstechniken

Die übrigen Leistungspunkte (maximal 3 LP) können in einer oder mehreren der folgenden Veranstaltungsarten erworben werden:

* Praktika mit hohem Informatik-Anteil innerhalb oder außerhalb der Universität (jedoch nicht im Rahmen von Lehrveranstaltungen). Für die Anerkennung ist eine [Praktikumsbescheinigung](https://www.cs.hhu.de/studium-lehre-informatik/studierende/praxis-und-berufsorientierung.html) erforderlich, die den Zeitumfang ausweist und detailliert die Inhalte des Praktikums beschreibt; weiterhin muss durch die Studierenden anhand der vom Fachbereich bereitgestellten Vorlage ein aussagekräftiger [Praktikumsbericht](https://www.cs.hhu.de/fileadmin/redaktion/Fakultaeten/Mathematisch-Naturwissenschaftliche_Fakultaet/Informatik/Studium/Allgemeines/Leitfaden_PraktikumsberichtMJL.pdf) erstellt werden.
* Veranstaltungen rheinjug
* Bewerbungstraining', 0, 5);
INSERT INTO public.veranstaltungsform VALUES (11, '* Vorlesung „Algorithmen und Datenstrukturen“, 4 SWS
* Übung, 2 SWS
* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere 4 SWS', 0, 6);
INSERT INTO public.veranstaltungsform VALUES (12, '* Vorlesung „Einführung Rechnernetze, Datenbanken und Betriebssysteme“, 2 SWS
* Übung, 1 SWS
* Selbststudium, 100h', 0, 7);
INSERT INTO public.veranstaltungsform VALUES (13, '* Vorlesung „Hardwarenahe Programmierung“, 15h (im Block)
* Praktische Übung „Hardwarenahe Programmierung“, 35h (im Block) (Vorlesung und Praktische Übung 4 LP)
* Selbststudium, 175h', 0, 8);
INSERT INTO public.veranstaltungsform VALUES (14, 'Vorlesung „Rechnerarchitektur“', 2, 9);
INSERT INTO public.veranstaltungsform VALUES (15, 'Übung', 1, 9);
INSERT INTO public.veranstaltungsform VALUES (16, '* Vorlesung „Professionelle Softwareentwicklung“, 2 SWS
* Übung, 2 SWS
* Selbststudium, 180h', 0, 10);
INSERT INTO public.veranstaltungsform VALUES (17, '* Vorlesung „Softwareentwicklung im Team“, 2 SWS
* Übung, 2 SWS
* Praktische Übung, 120h (Blockveranstaltung)
* Selbststudium, 60h', 0, 11);
INSERT INTO public.veranstaltungsform VALUES (18, 'Übung', 2, 12);
INSERT INTO public.veranstaltungsform VALUES (19, 'Vorlesung „Theoretische Informatik“', 4, 12);
INSERT INTO public.veranstaltungsform VALUES (20, 'Vorlesung „Lineare Algebra I“', 4, 13);
INSERT INTO public.veranstaltungsform VALUES (21, 'Übung', 2, 13);
INSERT INTO public.veranstaltungsform VALUES (22, 'Übung', 2, 14);
INSERT INTO public.veranstaltungsform VALUES (23, 'Vorlesung „Analysis I“', 4, 14);
INSERT INTO public.veranstaltungsform VALUES (24, 'Vorlesung „Verteilte Systeme“', 4, 15);
INSERT INTO public.veranstaltungsform VALUES (25, 'Übung', 2, 15);
INSERT INTO public.veranstaltungsform VALUES (26, 'Übung', 2, 16);
INSERT INTO public.veranstaltungsform VALUES (27, 'Vorlesung „Verteilte und Parallele Programmierung“', 2, 16);
INSERT INTO public.veranstaltungsform VALUES (28, 'Praktische Übung', 1, 17);
INSERT INTO public.veranstaltungsform VALUES (29, 'Übung', 1, 17);
INSERT INTO public.veranstaltungsform VALUES (30, 'Vorlesung „Vertiefung Logische Programmierung“', 2, 17);
INSERT INTO public.veranstaltungsform VALUES (31, 'Vorlesung „Vertiefung Rechnernetze“', 2, 18);
INSERT INTO public.veranstaltungsform VALUES (32, 'Durcharbeiten von wissenschaftlichen Veröffentlichungen', 2, 18);
INSERT INTO public.veranstaltungsform VALUES (33, 'Übung', 2, 19);
INSERT INTO public.veranstaltungsform VALUES (34, 'Vorlesung „Zeichnen von Graphen“', 2, 19);
INSERT INTO public.veranstaltungsform VALUES (35, 'Die Projektarbeit wird in der Regel in der Arbeitsgruppe durchgeführt, in der später dann auch die Master-Arbeitgeschrieben wird. Jede Arbeitsgruppe baut dieses Modul so auf, dass es am besten auf eine Master-Arbeitvorbereitet. Die Studierenden werden auch in die Forschungsarbeiten der Arbeitsgruppe eingebunden. Die Projektarbeit kann auch als Gruppenarbeit durchgeführt werden, sofern die individuelle Leistung hinreichend festgestellt werden kann.

Folgendes sind typische Bestandteile der Projektarbeit:

* Seminare/Projektpräsentationen
* individuelle Entwurfs-und Programmieraufgaben
* Durchführen von Experimenten oder Evaluierungen
* Lesen und Verarbeiten von Fachliteratur
* Mitwirken in Forschungsprojekten', 0, 20);
INSERT INTO public.veranstaltungsform VALUES (36, 'Übung', 2, 22);
INSERT INTO public.veranstaltungsform VALUES (37, 'Vorlesung „Algorithmen in der Bioinformatik“', 2, 22);
INSERT INTO public.veranstaltungsform VALUES (38, 'Seminar (nur Master)', 2, 22);
INSERT INTO public.veranstaltungsform VALUES (39, 'Übung', 2, 23);
INSERT INTO public.veranstaltungsform VALUES (40, 'Vorlesung „Betriebssysteme und Systemprogrammierung”', 4, 23);
INSERT INTO public.veranstaltungsform VALUES (41, 'Praktische Übung', 2, 23);
INSERT INTO public.veranstaltungsform VALUES (42, 'Übung', 2, 24);
INSERT INTO public.veranstaltungsform VALUES (43, 'Vorlesung „Compilerbau“', 2, 24);
INSERT INTO public.veranstaltungsform VALUES (44, 'Praktische Übung', 2, 24);
INSERT INTO public.veranstaltungsform VALUES (45, 'Übung', 2, 25);
INSERT INTO public.veranstaltungsform VALUES (46, 'Praktische Übung bzw. Praktikum', 2, 25);
INSERT INTO public.veranstaltungsform VALUES (47, 'Vorlesung „Datenbanksysteme“', 4, 25);
INSERT INTO public.veranstaltungsform VALUES (48, 'Übung', 2, 26);
INSERT INTO public.veranstaltungsform VALUES (49, 'Vorlesung „Einführung in die naturwissenschaftliche Informatik“', 2, 26);
INSERT INTO public.veranstaltungsform VALUES (50, '* Vorlesung „Graphenalgorithmen I“, 2 SWS
* Übung, 2 SWS
* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere 2 SWS', 0, 27);
INSERT INTO public.veranstaltungsform VALUES (51, 'Übung/Seminar', 2, 28);
INSERT INTO public.veranstaltungsform VALUES (52, 'Vorlesung „Grundlagen Verteilter Systeme“', 2, 28);
INSERT INTO public.veranstaltungsform VALUES (53, 'Vorlesung „Einführung in die logische Programmierung“', 2, 29);
INSERT INTO public.veranstaltungsform VALUES (54, 'Übung', 2, 29);
INSERT INTO public.veranstaltungsform VALUES (55, 'Praktische Übung bzw. Praktikum', 2, 29);
INSERT INTO public.veranstaltungsform VALUES (56, 'Übung', 2, 30);
INSERT INTO public.veranstaltungsform VALUES (57, 'Vorlesung „Knapsack Problems“', 2, 30);
INSERT INTO public.veranstaltungsform VALUES (58, 'Vorlesung „Kryptokomplexität I“', 4, 31);
INSERT INTO public.veranstaltungsform VALUES (59, 'Übung', 2, 31);
INSERT INTO public.veranstaltungsform VALUES (60, 'Seminar', 2, 31);
INSERT INTO public.veranstaltungsform VALUES (61, 'Übung', 2, 32);
INSERT INTO public.veranstaltungsform VALUES (62, 'Vorlesung „Machine Learning“', 4, 32);
INSERT INTO public.veranstaltungsform VALUES (63, 'Vorlesung „Algorithmen zur Entscheidungsfindung unplugged“', 4, 33);
INSERT INTO public.veranstaltungsform VALUES (64, 'Übung', 2, 34);
INSERT INTO public.veranstaltungsform VALUES (65, 'Vorlesung „Matching“', 2, 34);
INSERT INTO public.veranstaltungsform VALUES (66, 'Übung', 2, 35);
INSERT INTO public.veranstaltungsform VALUES (67, 'Vorlesung „Networks, Crowds, and Markets“', 2, 35);
INSERT INTO public.veranstaltungsform VALUES (68, 'Vorlesung „Nichtkooperative Spieltheorie“', 2, 36);
INSERT INTO public.veranstaltungsform VALUES (69, 'Übung', 1, 36);
INSERT INTO public.veranstaltungsform VALUES (70, 'Übung', 2, 37);
INSERT INTO public.veranstaltungsform VALUES (71, 'Seminar', 2, 37);
INSERT INTO public.veranstaltungsform VALUES (72, 'Vorlesung „Präferenzaggregation durch Wählen: Algorithmik und Komplexität“', 4, 37);
INSERT INTO public.veranstaltungsform VALUES (73, 'Übung', 2, 38);
INSERT INTO public.veranstaltungsform VALUES (74, 'Vorlesung „Rechnernetze“', 4, 38);
INSERT INTO public.veranstaltungsform VALUES (75, 'Praktikum', 2, 38);
INSERT INTO public.veranstaltungsform VALUES (76, 'Übung', 2, 39);
INSERT INTO public.veranstaltungsform VALUES (77, 'Vorlesung „Statistische Datenanalyse“', 2, 39);
INSERT INTO public.veranstaltungsform VALUES (78, 'Übung / Vorbereitung', 2, 40);
INSERT INTO public.veranstaltungsform VALUES (79, 'Seminar „Überblick Künstliche Intelligenz“', 2, 40);
INSERT INTO public.veranstaltungsform VALUES (80, 'Übung', 2, 41);
INSERT INTO public.veranstaltungsform VALUES (81, 'Seminar', 2, 41);
INSERT INTO public.veranstaltungsform VALUES (82, 'Vorlesung „Verfahren zur kollektiven Entscheidungsfindung“', 4, 41);
INSERT INTO public.veranstaltungsform VALUES (83, 'Übung', 2, 42);
INSERT INTO public.veranstaltungsform VALUES (84, 'Projekt', 2, 42);
INSERT INTO public.veranstaltungsform VALUES (85, 'Vorlesung „Von NAND zu Tetris“', 2, 42);
INSERT INTO public.veranstaltungsform VALUES (86, 'Übung', 2, 44);
INSERT INTO public.veranstaltungsform VALUES (87, 'Vorlesung „Algorithmen zur Visualisierung von Graphen“', 2, 44);
INSERT INTO public.veranstaltungsform VALUES (88, 'Vorlesung „Algorithmische Eigenschaften von Wahlsystemen I“', 2, 45);
INSERT INTO public.veranstaltungsform VALUES (89, 'Übung', 1, 45);
INSERT INTO public.veranstaltungsform VALUES (90, '* Vorlesung „Algorithmische Geometrie“, 2 SWS
* Übung, 2 SWS
* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere 4 SWS', 0, 46);
INSERT INTO public.veranstaltungsform VALUES (91, '* Vorlesung „Algorithmische Komplexitätstheorie“, 2 SWS
* Übung, 2 SWS
* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere 4 SWS', 0, 47);
INSERT INTO public.veranstaltungsform VALUES (92, 'Übung', 2, 48);
INSERT INTO public.veranstaltungsform VALUES (93, 'Vorlesung „Angewandte Algorithmik“', 2, 48);
INSERT INTO public.veranstaltungsform VALUES (94, 'Übung', 2, 49);
INSERT INTO public.veranstaltungsform VALUES (95, 'Vorlesung „Approximative Algorithmen“', 2, 49);
INSERT INTO public.veranstaltungsform VALUES (96, 'Übung/Seminar', 2, 50);
INSERT INTO public.veranstaltungsform VALUES (97, 'Vorlesung „Betriebssysteme“', 2, 50);
INSERT INTO public.veranstaltungsform VALUES (98, '* Vorlesung „Algebraische und Strukturelle Graphentheorie“, 2 SWS
* Übungen, 2 SWS
* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere 2 SWS', 0, 51);
INSERT INTO public.veranstaltungsform VALUES (99, 'Vorlesung „Android-Programmierung“', 2, 52);
INSERT INTO public.veranstaltungsform VALUES (100, 'Seminar/Praktische Übung', 2, 52);
INSERT INTO public.veranstaltungsform VALUES (101, 'Praktikum', 4, 53);
INSERT INTO public.veranstaltungsform VALUES (102, 'Vorlesung „Angewandte Bioinformatik“', 2, 53);
INSERT INTO public.veranstaltungsform VALUES (103, 'Übung', 2, 54);
INSERT INTO public.veranstaltungsform VALUES (104, 'Vorlesung „Approximationsalgorithmen“', 2, 54);
INSERT INTO public.veranstaltungsform VALUES (105, 'Übung', 2, 55);
INSERT INTO public.veranstaltungsform VALUES (106, 'Vorlesung „Betriebssystementwicklung“', 2, 55);
INSERT INTO public.veranstaltungsform VALUES (107, 'Seminar „Betriebssysteme Vertiefung“', 2, 56);
INSERT INTO public.veranstaltungsform VALUES (108, 'Praktische Übungen', 6, 56);
INSERT INTO public.veranstaltungsform VALUES (109, 'Hands-on exercises', 2, 57);
INSERT INTO public.veranstaltungsform VALUES (110, 'Lecture „Big Data Techniques, Technologies and Trends“', 2, 57);
INSERT INTO public.veranstaltungsform VALUES (111, 'Übung', 2, 58);
INSERT INTO public.veranstaltungsform VALUES (112, 'Seminar „Blockchain“', 2, 58);
INSERT INTO public.veranstaltungsform VALUES (113, 'Eigenarbeit', 0, 58);
INSERT INTO public.veranstaltungsform VALUES (114, '* Vorlesung „Algorithmen für Ad-hoc- und Sensornetzwerke“, 4 SWS
* Übung, 2 SWS
* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere 4 SWS', 0, 59);
INSERT INTO public.veranstaltungsform VALUES (115, 'Übung', 2, 60);
INSERT INTO public.veranstaltungsform VALUES (116, 'Seminar', 2, 60);
INSERT INTO public.veranstaltungsform VALUES (117, 'Vorlesung „Algorithmen für planare Graphen“', 2, 60);
INSERT INTO public.veranstaltungsform VALUES (118, 'Übung', 2, 61);
INSERT INTO public.veranstaltungsform VALUES (119, 'Vorlesung „Algorithmen für schwere Probleme“', 2, 61);
INSERT INTO public.veranstaltungsform VALUES (120, 'Übung', 2, 62);
INSERT INTO public.veranstaltungsform VALUES (121, 'Vorlesung „Algorithmen in der Bioinformatik II“', 2, 62);
INSERT INTO public.veranstaltungsform VALUES (122, 'Übung', 2, 63);
INSERT INTO public.veranstaltungsform VALUES (123, 'Vorlesung „Algorithmen in der Cheminformatik“', 2, 63);
INSERT INTO public.veranstaltungsform VALUES (124, 'Übung', 2, 64);
INSERT INTO public.veranstaltungsform VALUES (125, 'Vorlesung „Algorithmische Spieltheorie"', 4, 64);
INSERT INTO public.veranstaltungsform VALUES (126, 'Übung', 2, 65);
INSERT INTO public.veranstaltungsform VALUES (127, 'Vorlesung „Algorithms for Sequence Analysis“ (English)', 4, 65);
INSERT INTO public.veranstaltungsform VALUES (128, 'Übung', 1, 66);
INSERT INTO public.veranstaltungsform VALUES (129, 'Vorlesung „Algorithmische Eigenschaften von Wahlsystemen II“', 2, 66);
INSERT INTO public.veranstaltungsform VALUES (130, 'Vorlesung „Cake-cutting Algorithms“', 2, 67);
INSERT INTO public.veranstaltungsform VALUES (131, 'Übung', 1, 67);
INSERT INTO public.veranstaltungsform VALUES (132, 'Vorlesung „Geoinformatik“', 2, 68);
INSERT INTO public.veranstaltungsform VALUES (133, 'Übung (im Block)', 2, 68);
INSERT INTO public.veranstaltungsform VALUES (134, 'Theoretische und Praktische Übungen', 2, 69);
INSERT INTO public.veranstaltungsform VALUES (135, 'Vorlesung „Einführung in die statistische Analyse mittels Computersimulationen“ (auf Englisch)', 2, 69);
INSERT INTO public.veranstaltungsform VALUES (136, '* Vorlesung „Entwurfs- und Analysetechniken für Algorithmen“, 2 SWS
* Übungen, 2 SWS
* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere, 2 SWS', 0, 70);
INSERT INTO public.veranstaltungsform VALUES (137, 'Übung', 2, 71);
INSERT INTO public.veranstaltungsform VALUES (138, 'Praktische Übung', 2, 71);
INSERT INTO public.veranstaltungsform VALUES (139, 'Vorlesung „Funktionale Programmierung“', 2, 71);
INSERT INTO public.veranstaltungsform VALUES (140, 'Übung/Seminar', 2, 72);
INSERT INTO public.veranstaltungsform VALUES (141, 'Vorlesung „Fuzzy-Clusteranalyse“', 2, 72);
INSERT INTO public.veranstaltungsform VALUES (142, 'Vorlesung „Fuzzy Systeme“', 2, 73);
INSERT INTO public.veranstaltungsform VALUES (143, 'Übung/Seminar', 2, 73);
INSERT INTO public.veranstaltungsform VALUES (144, 'Übung', 2, 74);
INSERT INTO public.veranstaltungsform VALUES (145, 'Vorlesung „Gerechte Aufteilungsverfahren“', 4, 74);
INSERT INTO public.veranstaltungsform VALUES (146, '* Vorlesung „Graphenalgorithmen II“, 4 SWS
* Übung, 2 SWS
* Die Bearbeitung der Hausaufgaben erfordern durchschnittlich weitere 4 SWS', 0, 75);
INSERT INTO public.veranstaltungsform VALUES (147, 'Übung', 2, 76);
INSERT INTO public.veranstaltungsform VALUES (148, 'Vorlesung „Causality“', 2, 76);
INSERT INTO public.veranstaltungsform VALUES (149, 'Praktikum und Übung (in englischer Sprache)', 2, 77);
INSERT INTO public.veranstaltungsform VALUES (150, 'Vorlesung „Computational Systems Biology“ (in englischer Sprache)', 2, 77);
INSERT INTO public.veranstaltungsform VALUES (151, 'Übung', 2, 78);
INSERT INTO public.veranstaltungsform VALUES (152, 'Vorlesung „Computer Vision“', 2, 78);
INSERT INTO public.veranstaltungsform VALUES (153, 'Vorlesung „Data & Knowledge Engineering“ (englischsprachig)', 2, 79);
INSERT INTO public.veranstaltungsform VALUES (154, 'Übung (englischsprachig)', 2, 79);
INSERT INTO public.veranstaltungsform VALUES (155, 'Theoretische und Praktische Übungen', 2, 80);
INSERT INTO public.veranstaltungsform VALUES (156, 'Vorlesung „Data Warehouses“', 2, 80);
INSERT INTO public.veranstaltungsform VALUES (157, 'Übung', 2, 81);
INSERT INTO public.veranstaltungsform VALUES (158, 'Vorlesung „Deep Learning“', 2, 81);
INSERT INTO public.veranstaltungsform VALUES (159, 'Übung', 2, 82);
INSERT INTO public.veranstaltungsform VALUES (160, 'Vorlesung „Dynamische Programmiersprachen“', 2, 82);
INSERT INTO public.veranstaltungsform VALUES (161, 'Übung', 2, 83);
INSERT INTO public.veranstaltungsform VALUES (162, 'Vorlesung „Effiziente Algorithmen“', 2, 83);
INSERT INTO public.veranstaltungsform VALUES (163, 'Vorlesung „Grundlagen der Linearen Optimierung“', 2, 84);
INSERT INTO public.veranstaltungsform VALUES (164, 'Seminar „Information Theory, Inference, and Learning Algorithms“', 2, 85);
INSERT INTO public.veranstaltungsform VALUES (165, 'Seminar „Algorithmen für graphentheoretische Konzepte in der Informatik“', 2, 86);
INSERT INTO public.veranstaltungsform VALUES (166, 'Seminar „Algorithmen für perfekte Graphen“', 2, 87);
INSERT INTO public.veranstaltungsform VALUES (167, 'Seminar „Anwendungen von gerichteten Netzwerkstrukturen“', 2, 88);
INSERT INTO public.veranstaltungsform VALUES (168, 'Seminar „Graphparameter für gerichtete Graphen“', 2, 89);
INSERT INTO public.veranstaltungsform VALUES (169, 'Seminar „Collective Decision Making"', 2, 90);
INSERT INTO public.veranstaltungsform VALUES (170, 'Seminar, „Modeling biological cells“', 2, 91);
INSERT INTO public.veranstaltungsform VALUES (171, 'Seminar„NP-Schwere Probleme“', 2, 92);
INSERT INTO public.veranstaltungsform VALUES (172, 'Vorlesung „Judgment Aggregation“', 2, 93);
INSERT INTO public.veranstaltungsform VALUES (173, 'Vorlesung „Knowledge Discovery in Databases“', 2, 94);
INSERT INTO public.veranstaltungsform VALUES (174, 'Vorlesung „Knowledge Discovery in Databases – Ausgewählte Themen“', 2, 95);
INSERT INTO public.veranstaltungsform VALUES (175, 'Vorlesung „Kooperative Spieltheorie"', 2, 96);
INSERT INTO public.veranstaltungsform VALUES (176, 'Vorlesung „Kryptokomplexität I"', 2, 97);
INSERT INTO public.veranstaltungsform VALUES (177, 'Seminar „Advances in Data Science“ (englischsprachig)', 2, 98);
INSERT INTO public.veranstaltungsform VALUES (178, 'Seminar „Big-Data-Systeme und Cloud-Computing“', 2, 99);
INSERT INTO public.veranstaltungsform VALUES (179, 'Seminar „Datenbanken und Informationssysteme“', 2, 100);
INSERT INTO public.veranstaltungsform VALUES (180, 'Seminar „Weitebeschränkte gerichtete Graphklassen“', 2, 101);
INSERT INTO public.veranstaltungsform VALUES (181, 'Übungen', 2, 101);
INSERT INTO public.veranstaltungsform VALUES (182, 'Übung', 8, 102);
INSERT INTO public.veranstaltungsform VALUES (183, 'Vorlesung „Methods of Artificial Intelligence in Life Sciences“', 4, 102);
INSERT INTO public.veranstaltungsform VALUES (184, 'Übung', 2, 103);
INSERT INTO public.veranstaltungsform VALUES (185, 'Vorlesung „Mobilkommunikation”', 2, 103);
INSERT INTO public.veranstaltungsform VALUES (186, 'Übung (nach Vereinbarung)', 2, 104);
INSERT INTO public.veranstaltungsform VALUES (187, 'Vorlesung/Seminar „Model Checking“', 2, 104);
INSERT INTO public.veranstaltungsform VALUES (188, 'Eigenarbeit', 0, 104);
INSERT INTO public.veranstaltungsform VALUES (189, 'Übung', 2, 105);
INSERT INTO public.veranstaltungsform VALUES (190, 'Vorlesung „Modellierung metabolischer Netzwerke“', 2, 105);
INSERT INTO public.veranstaltungsform VALUES (191, 'Übung/Seminar', 2, 106);
INSERT INTO public.veranstaltungsform VALUES (192, 'Vorlesung „Multimedia-Datenbanksysteme“', 2, 106);
INSERT INTO public.veranstaltungsform VALUES (193, 'Übung/Seminar', 2, 107);
INSERT INTO public.veranstaltungsform VALUES (194, 'Vorlesung „Information Retrieval und Natural Language Processing“', 2, 107);
INSERT INTO public.veranstaltungsform VALUES (195, 'Praktische Übung', 2, 108);
INSERT INTO public.veranstaltungsform VALUES (196, 'Vorlesung „Netzwerksicherheit“', 4, 108);
INSERT INTO public.veranstaltungsform VALUES (197, 'Übungen', 2, 108);
INSERT INTO public.veranstaltungsform VALUES (198, 'Seminar', 1, 109);
INSERT INTO public.veranstaltungsform VALUES (199, 'Seminar „Analyse von Software-Systemen“', 2, 110);
INSERT INTO public.veranstaltungsform VALUES (200, 'Seminar „Informatik unplugged“', 2, 111);
INSERT INTO public.veranstaltungsform VALUES (201, 'Seminar „Kombinatorische Optimierung in der Bioinformatik', 2, 112);
INSERT INTO public.veranstaltungsform VALUES (202, 'Seminar „Machine Learning“', 2, 113);
INSERT INTO public.veranstaltungsform VALUES (203, 'Seminar „Reproduzierbarkeit bioinformatischer Forschungsergebnisse“', 2, 114);
INSERT INTO public.veranstaltungsform VALUES (204, 'Seminar „Verteilte und Parallele Systeme“', 2, 115);
INSERT INTO public.veranstaltungsform VALUES (205, 'Übung', 2, 116);
INSERT INTO public.veranstaltungsform VALUES (206, 'Seminar', 2, 116);
INSERT INTO public.veranstaltungsform VALUES (207, 'Vorlesung „Mathematische Hintergründe der Wahlmanipulation“', 4, 116);
INSERT INTO public.veranstaltungsform VALUES (208, 'Seminar/Übung „Opportunistische und P2P-basierte Netzwerke“ (auf Englisch)', 2, 117);
INSERT INTO public.veranstaltungsform VALUES (209, 'Vorlesung „Paralleles Rechnen mit Grafikkarten“', 2, 118);
INSERT INTO public.veranstaltungsform VALUES (210, 'Vorlesung „Peer-to-Peer Systeme“ (auf Englisch)', 2, 119);
INSERT INTO public.veranstaltungsform VALUES (211, 'Praktische Übung', 1, 120);
INSERT INTO public.veranstaltungsform VALUES (212, 'Vorlesung „Programmsynthese und Transformation“', 2, 120);
INSERT INTO public.veranstaltungsform VALUES (213, 'Übung', 1, 120);
INSERT INTO public.veranstaltungsform VALUES (214, 'Übung', 2, 121);
INSERT INTO public.veranstaltungsform VALUES (215, 'Vorlesung „Reinforcement Learning“', 2, 121);
INSERT INTO public.veranstaltungsform VALUES (216, 'Übung', 2, 122);
INSERT INTO public.veranstaltungsform VALUES (217, 'Vorlesung „Relational Databases and Data Analysis“', 2, 122);
INSERT INTO public.veranstaltungsform VALUES (218, 'Übung', 1, 123);
INSERT INTO public.veranstaltungsform VALUES (219, 'Praktische Übung', 1, 123);
INSERT INTO public.veranstaltungsform VALUES (220, 'Vorlesung „Sicherheitskritische Systeme“', 2, 123);
INSERT INTO public.veranstaltungsform VALUES (221, 'Vorlesung „Spoken Dialogue Systems“', 2, 124);
INSERT INTO public.veranstaltungsform VALUES (222, 'Übung', 1, 124);
INSERT INTO public.veranstaltungsform VALUES (223, 'Übung', 2, 125);
INSERT INTO public.veranstaltungsform VALUES (224, 'Vorlesung „Transaktionsverwaltung“', 2, 125);


--
-- Data for Name: zusatzfeld; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.zusatzfeld VALUES (1, 'keine', 'Empfohlene Vorkenntnisse', 16);
INSERT INTO public.zusatzfeld VALUES (2, 'Grundlagen der logischen Programmierung und von Prolog (zum Beispiel aus dem Modul „Einführung in die logische Programmierung”)', 'Empfohlene Vorkenntnisse', 17);
INSERT INTO public.zusatzfeld VALUES (3, 'Rechnernetze', 'Empfohlene Vorkenntnisse', 18);
INSERT INTO public.zusatzfeld VALUES (4, '* Douglas R. Stinson: Cryptography: Theory and Practice, Chapman & Hall/CRC, 2006.
* Johannes Buchmann: Einführung in die Kryptographie, Springer-Verlag, 2001.
* Christos Papadimitriou: Computational Complexity, Addison-Wesley, 1995.
* Gerd Wechsung: Vorlesungen zur Komplexitätstheorie, Teubner-Verlag, 2000.', 'Ergänzende Literatur', 31);
INSERT INTO public.zusatzfeld VALUES (5, '* Martin J. Osborne and Ariel Rubinstein: A Course in Game Theory, MIT Press, 1994.
* Noam Nisan, Tim Roughgarden, Eva Tardos, and Vijay V. Vazirani (eds.): Algorithmic Game Theory, Cambridge University Press, 2008.', 'Ergänzende Literatur', 36);
INSERT INTO public.zusatzfeld VALUES (6, '* Piotr Faliszewski, Lane A. Hemaspaandra, Edith Hemaspaandra, and Jörg Rothe: A Richer Understanding of the Complexity of Election Systems, Chapter 14 in: „Fundamental Problems in Computing: Essays in Honor of Professor Daniel J. Rosenkrantz,” pp. 375-406, S. Ravi and S. Shukla (eds.), Springer, 2009.
* Felix Brandt, Vincent Conitzer, Ulle Endriss, Jerome Lang, and Ariel Procaccia (eds.): Handbook of Computational Social Choice, Cambridge University Press, 2015.
* Steven J. Brams and Peter C. Fishburn: Voting Procedures, Chapter 4 in: „Handbook of Social Choice and Welfare,” Kenneth J. Arrow, Amartya Sen, and Kotaro Suzumura (eds.), North-Holland, 2002.', 'Ergänzende Literatur', 37);
INSERT INTO public.zusatzfeld VALUES (7, '* Netzwerkprogrammierung in Java
* Implementierung eines minimalen Webservers
* Aufsetzen eines komplexen Netzwerkes
* Konfiguration und Erprobung von Firewalls', 'Themen des Praktikums:', 38);
INSERT INTO public.zusatzfeld VALUES (8, '* Einleitung und Übersicht
* Anwendungsschicht
  * World Wide Web / HTTP
  * File Transfer / FTP
  * E-Mail / SMTP
  * Domain Name System /DNS
  * Peer-to-Peer Anwendungen (Guntella/KaZaA/Bittorrent)
  * Socketprogrammierung mit UDP und TCP
* Transportschicht
  * Adressierung
  * UDP
  * Zuverlässige Datenübertragung
  * Überlastkontrolle
  * TCP
* Netzwerkschicht
  * Virtuelle Leitungen und Datagrammnetzwerke
  * Funktionsweise und Aufbau von Routern
  * Adressierung / DHCP
  * Das Internetprotokoll / IP, ICMP
  * Link State Routing, Distance Vector Routing
  * RIP, OSPF, BGP
* Sicherungsschicht
  * Rahmenbildung
  * Fehlererkennung und -korrektur
  * Medienzugriff in Lokalen Netzen
  * Adressierung / ARP
  * Ethernet, Hubs, Switches
  * PPP
  * IP over ATM und MPLS
* Multimediakommunikation
  * Anwendungen
  * Streaming
  * Multimedia über Best-Effort Netzwerke
  * Multimediaprotokolle / RTSP, RTP, SIP
  * Differentiated Services
  * Integrated Services
* Netzwerksicherheit
  * Grundlagen der Krytographie
  * Nachrichtenintegrität
  * Authentifizierung
  * Absichern von E-Mail / PGP
  * Absichern von TCP / SSL, TLS
  * Absichern von IP / IPSec
  * Firewalls und Intrusion Detection Systeme', 'Themen der Vorlesung und Übung', 38);
INSERT INTO public.zusatzfeld VALUES (9, '* Piotr Faliszewski, Lane A. Hemaspaandra, Edith Hemaspaandra, and Jörg Rothe: A Richer Understanding of the Complexity of Election Systems, Chapter 14 in: „Fundamental Problems in Computing: Essays in Honor of Professor Daniel J. Rosenkrantz,” pp. 375-406, S. Ravi and S. Shukla (eds.), Springer, 2009.
* Felix Brandt, Vincent Conitzer, Ulle Endriss, Jerome Lang, and Ariel Procaccia (eds.): Handbook of Computational Social Choice, Cambridge University Press, 2015.
* Steven J. Brams and Peter C. Fishburn: Voting Procedures, Chapter 4 in: „Handbook of Social Choice and Welfare,” Kenneth J. Arrow, Amartya Sen, and Kotaro Suzumura (eds.), North-Holland, 2002.', 'Ergänzende Literatur', 45);
INSERT INTO public.zusatzfeld VALUES (10, '* „Graphenalgorithmen I”
* „Lineare Algebra I”', 'Empfohlene Vorkenntnisse', 51);
INSERT INTO public.zusatzfeld VALUES (11, '* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”
* „Algorithmische Komplexitätstheorie“
* „Graphenalgorithmen I“', 'Empfohlene Vorkenntnisse', 59);
INSERT INTO public.zusatzfeld VALUES (12, '* „Algorithmen in der Bioinformatik“', 'Empfohlene Vorkenntnisse', 63);
INSERT INTO public.zusatzfeld VALUES (13, '* Bezalel Peleg and Peter Sudhölter: Introduction to the Theory of Cooperative Games, Kluwer Academic Publishers, 2003.
* Martin J. Osborne and Ariel Rubinstein: A Course in Game Theory, MIT Press, 1994.
* Georgios Chalkiadakis, Edith Elkind, and Michael Wooldridge: Computational Aspects of Cooperative Game Theory, Morgan and Claypool Publishers, 2011.
* Noam Nisan, Tim Roughgarden, Eva Tardos, and Vijay V. Vazirani (eds.): Algorithmic Game Theory, Cambridge University Press, 2008.', 'Ergänzende Literatur', 64);
INSERT INTO public.zusatzfeld VALUES (14, '* Piotr Faliszewski, Lane A. Hemaspaandra, Edith Hemaspaandra, and Jörg Rothe: A Richer Understanding of the Complexity of Election Systems, Chapter 14 in: „Fundamental Problems in Computing: Essays in Honor of Professor Daniel J. Rosenkrantz,” pp. 375-406, S. Ravi and S. Shukla (eds.), Springer, 2009.
* Piotr Faliszewskiund Jörg Rothe: Control and Bribery in Voting, Chapter 7 in: „Handbook of Computational Social Choice,” Felix Brandt, Vincent Conitzer, Ulle Endriss, Jerome Lang, and Ariel Procaccia (eds.), Cambridge University Press, 2015.
* Steven J. Brams and Peter C. Fishburn: Voting Procedures, Chapter 4 in: „Handbook of Social Choice and Welfare,” Kenneth J. Arrow, Amartya Sen, and Kotaro Suzumura (eds.), North-Holland, 2002.', 'Ergänzende Literatur', 66);
INSERT INTO public.zusatzfeld VALUES (15, '* Jack Robertson and William Webb: Cake-Cutting Algorithms: Be Fair if You Can, A K Peters, 1998.
* Steven J. Brams and Alan D. Taylor: Fair Division: From Cake-Cutting to Dispute Resolution, Cambridge University Press, 1996.', 'Ergänzende Literatur:', 67);
INSERT INTO public.zusatzfeld VALUES (16, '* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”', 'Empfohlene Vorkenntnisse', 70);
INSERT INTO public.zusatzfeld VALUES (17, '* Jack Robertson und William Webb: Cake-Cutting Algorithms: Be Fair if You Can, A K Peters, 1998.
* Steven J. Brams und Alan D. Taylor: Fair Division: From Cake-Cutting to Dispute Resolution, Cambridge University Press, 1996.', 'Ergänzende Literatur:', 74);
INSERT INTO public.zusatzfeld VALUES (18, '* „Algorithmen und Datenstrukturen”
* „Theoretische Informatik”
* „Algorithmische Komplexitätstheorie“
* „Graphenalgorithmen I“', 'Empfohlene Vorkenntnisse', 75);
INSERT INTO public.zusatzfeld VALUES (19, '„Datenbanksysteme“', 'Empfohlene Vorkenntnisse', 80);
INSERT INTO public.zusatzfeld VALUES (20, 'Wird unregelmäßig im Wechsel mit den Modulen/Veranstaltungen „Knowledge Discovery in Databases“, „Multimedia-Datenbanksysteme“, „Knowledge Discovery in Databases – Ausgewählte Kapitel“, „Transaktionsverwaltung“ und „Information Retrieval und Natural Language Processing” angeboten, so dass jedes Semester mindestens eine dieser Veranstaltungen angeboten wird.', 'Häufigkeit', 80);
INSERT INTO public.zusatzfeld VALUES (21, '„Machine Learning“ „Computer Vision“', 'Empfohlene Vorkenntnisse', 81);
INSERT INTO public.zusatzfeld VALUES (22, 'Grundlagen des Compilerbaus (zum Beispiel aus dem Modul "Compilerbau", ehemals "Softwaretechnik und Programmiersprachen").', 'Empfohlene Vorkenntnisse', 82);
INSERT INTO public.zusatzfeld VALUES (23, '* „Machine Learning“, „Lineare Algebra“, „Analysis“, Stochastik“, „Numerik“', 'Empfohlene Vorkenntnisse', 85);
INSERT INTO public.zusatzfeld VALUES (24, '* „Graphenalgorithmen II“', 'Empfohlene Vorkenntnisse', 86);
INSERT INTO public.zusatzfeld VALUES (25, '* „Algorithmen für planare Graphen“ oder
* „Algorithmen für schwere Probleme“', 'Empfohlene Vorkenntnisse', 87);
INSERT INTO public.zusatzfeld VALUES (26, '* „Algorithmen für schwere Probleme“ oder
* „Approximationsalgorithmen“oder
* „Master-Seminar über Algorithmen für perfekte Graphen“', 'Empfohlene Vorkenntnisse', 88);
INSERT INTO public.zusatzfeld VALUES (27, '* „Algorithmen für schwere Probleme"', 'Empfohlene Vorkenntnisse', 89);
INSERT INTO public.zusatzfeld VALUES (28, 'Unter anderem Originalarbeiten, die in den folgenden Büchern zitiert werden:

* Piotr Faliszewski, Lane A. Hemaspaandra, Edith Hemaspaandra, and Jörg Rothe: A Richer Understanding of the Complexity of Election Systems, Chapter 14 in: „Fundamental Problems in Computing: Essays in Honor of Professor Daniel J. Rosenkrantz,” pp. 375-406, S. Ravi and S. Shukla (eds.), Springer, 2009.
* Felix Brandt, Vincent Conitzer, Ulle Endriss, Jerome Lang, and Ariel Procaccia (eds.): Handbook of Computational Social Choice, Cambridge University Press, 2015.
* Steven J. Brams and Peter C. Fishburn: Voting Procedures, Chapter 4 in: „Handbook of Social Choice and Welfare,” Kenneth J. Arrow, Amartya Sen, and Kotaro Suzumura (eds.), North-Holland, 2002.
* Bezalel Peleg and Peter Sudhölter: Introduction to the Theory of Cooperative Games, Kluwer Academic Publishers, 2003.
* Georgios Chalkiadakis, Edith Elkind, and Michael Wooldridge: Computational Aspects of Cooperative Game Theory, Morgan and Claypool Publishers, 2011.
* Noam Nisan, Tim Roughgarden, Eva Tardos, and Vijay V. Vazirani (eds.): Algorithmic Game Theory, Cambridge University Press, 2008.
* Jack Robertson and William Webb: Cake-Cutting Algorithms: Be Fair if You Can, A K Peters, 1998.
* Steven J. Brams and Alan D. Taylor: Fair Division: From Cake-Cutting to Dispute Resolution, Cambridge University Press, 1996.', 'Ergänzende Literatur', 90);
INSERT INTO public.zusatzfeld VALUES (29, '* "Algorithmen für schwere Probleme" oder
* "Approximationsalgorithmen" oder
* "Seminar für Perfekte Graphen" oder
* "Master-Seminar über Anwendungen von gerichteten Netzwerkstrukturen"', 'Empfohlene Vorkenntnisse', 92);
INSERT INTO public.zusatzfeld VALUES (30, '* C. List. The Theory of Judgment Aggregation: An Introductory Review. Synthese, 187(1):179-207, 2012.
* C. List and C. Puppe. Judgment Aggregation: A Survey. In P. Anand, P. Pattanaik and C. Puppe (eds.), Handbook of Rational and Social Choice, Oxford University Press, 2009.
* D. Grossi and G. Pigozzi. Introduction to Judgment Aggregation. In N. Bezhanishviliand V. Goranko (eds.), Lectures on Logic and Computation, Springer-Verlag, 2012', 'Ergänzende Literatur', 93);
INSERT INTO public.zusatzfeld VALUES (31, 'Wird unregelmäßig im Wechsel mit den Modulen/Veranstaltungen „Data Warehouses“, „Multimedia-Datenbanksysteme“, „Knowledge Discovery in Databases“, „Transaktionsverwaltung“ und „Information Retrieval und Natural Language Processing” angeboten, so dass jedes Semester mindestens eine dieser Veranstaltungen angeboten wird.', 'Häufigkeit', 95);
INSERT INTO public.zusatzfeld VALUES (32, '* Bezalel Peleg and Peter Sudhölter: Introduction to the Theory of Cooperative Games, Kluwer Academic Publishers, 2003.
* Georgios Chalkiadakis, Edith Elkind, and Michael Wooldridge: Computational Aspects of Cooperative Game Theory, Morgan and Claypool Publishers, 2011.
* Noam Nisan, Tim Roughgarden, Eva Tardos, and Vijay V. Vazirani (eds.): Algorithmic Game Theory, Cambridge University Press, 2008.', 'Ergänzende Literatur', 96);
INSERT INTO public.zusatzfeld VALUES (33, '* Douglas R. Stinson: Cryptography: Theory and Practice, Chapman & Hall/CRC, 2006.
* Johannes Buchmann: Einführung in die Kryptographie, Springer-Verlag, 2001.
* Christos Papadimitriou: Computational Complexity, Addison-Wesley, 1995.
* Gerd Wechsung: Vorlesungen zur Komplexitätstheorie, Teubner-Verlag, 2000.', 'Ergänzende Literatur', 97);
INSERT INTO public.zusatzfeld VALUES (34, '* „Verteilte Systeme“.', 'Empfohlene Vorkenntnisse', 99);
INSERT INTO public.zusatzfeld VALUES (35, '* Vorlesung „Algorithmen für schwere Probleme”', 'Empfohlene Vorkenntnisse', 101);
INSERT INTO public.zusatzfeld VALUES (36, 'Modul „Rechnernetze”', 'Empfohlene Vorkenntnisse', 103);
INSERT INTO public.zusatzfeld VALUES (37, 'Grundlagen in mathematischer Logik (zum Beispiel aus dem Modul „Sicherheitskritische Systeme”)', 'Empfohlene Vorkenntnisse', 104);
INSERT INTO public.zusatzfeld VALUES (38, '„Datenbanksysteme“', 'Empfohlene Vorkenntnisse', 106);
INSERT INTO public.zusatzfeld VALUES (39, '* „Rechnernetze“', 'Empfohlene Vorkenntnisse', 108);
INSERT INTO public.zusatzfeld VALUES (40, '* „Professionelle Softwareentwicklung (Programmierpraktikum 1)“ und „Softwareentwicklung im Team (Programmierpraktikum 2)“', 'Empfohlene Vorkenntnisse', 110);
INSERT INTO public.zusatzfeld VALUES (41, '„Algorithmen in der Bioinformatik“.', 'Empfohlene Vorkenntnisse', 112);
INSERT INTO public.zusatzfeld VALUES (42, '„Machine Learning“, „Computer Vision“', 'Empfohlene Vorkenntnisse', 113);
INSERT INTO public.zusatzfeld VALUES (43, '* „Algorithmen in der Bioinformatik“.', 'Empfohlene Vorkenntnisse', 114);
INSERT INTO public.zusatzfeld VALUES (44, '„Verteilte Systeme“.', 'Empfohlene Vorkenntnisse', 115);
INSERT INTO public.zusatzfeld VALUES (45, '* Economics and Computation: An Introduction to Algorithmic Game Theory, Computational Social Choice, and Fair Division. J. Rothe (ed.). Unter Vertrag bei Springer. Voraussichtliche Publikation: 2015.

Eine kürzere deutsche Version dieses Buches erschien unter dem Titel:

* Einführung in Computational Social Choice. Individuelle Strategien und kollektive Entscheidungen beim Spielen, Wählen und Teilen. Jörg Rothe, Dorothea Baumeister, Claudia Lindner, Irene Rothe. Spektrum Akademischer Verlag, 2011.', 'Ergänzende Literatur', 116);
INSERT INTO public.zusatzfeld VALUES (46, '* „Rechnernetze”', 'Empfohlene Vorkenntnisse', 117);
INSERT INTO public.zusatzfeld VALUES (47, 'Solide Kenntnisse in C/C++, Linux und/oder Windows, Eclipse und/oder VisualStudio und teilweise OpenGL und GLUT.', 'Empfohlene Vorkenntnisse', 118);
INSERT INTO public.zusatzfeld VALUES (48, '* „Rechnernetze"', 'Empfohlene Vorkenntnisse', 119);
INSERT INTO public.zusatzfeld VALUES (49, 'Grundlagen der logischen Programmierung und von Prolog (zum Beispiel aus dem Modul „Einführung in die logische Programmierung”) sind empfohlen, aber nicht zwingend notwendig.', 'Empfohlene Vorkenntnisse', 120);
INSERT INTO public.zusatzfeld VALUES (50, '* Machine Learning
* Lineare Algebra, Analysis, Stochastik, Numerik', 'Empfohlene Vorkenntnisse', 121);
INSERT INTO public.zusatzfeld VALUES (51, 'Grundlagen in mathematischer Logik (zum Beispiel aus dem Modul „Softwaretechnik und Programmiersprachen”)', 'Empfohlene Vorkenntnisse', 123);
INSERT INTO public.zusatzfeld VALUES (52, '* unregelmäßig
* wird im Wechsel mit den Modulen/Veranstaltungen „Data Warehouses“, „Knowledge Discovery in Databases“, „Knowledge Discovery in Databases – Ausgewählte Themen“, „Multimedia-Datenbanksysteme“ und „Information Retrieval und Natural Language Processing” angeboten, so dass jedes Semester mindestens eine dieser Veranstaltungen angeboten wird.', 'Häufigkeit', 125);


--
-- Name: antrag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.antrag_id_seq', 123, true);


--
-- Name: modul_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.modul_id_seq', 123, true);


--
-- Name: veranstaltung_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.veranstaltung_id_seq', 125, true);


--
-- Name: veranstaltungsform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.veranstaltungsform_id_seq', 224, true);


--
-- Name: zusatzfeld_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.zusatzfeld_id_seq', 52, true);


--
-- Name: antrag antrag_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.antrag
    ADD CONSTRAINT antrag_pkey PRIMARY KEY (id);


--
-- Name: modul modul_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.modul
    ADD CONSTRAINT modul_pkey PRIMARY KEY (id);


--
-- Name: veranstaltung veranstaltung_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.veranstaltung
    ADD CONSTRAINT veranstaltung_pkey PRIMARY KEY (id);


--
-- Name: veranstaltungsform veranstaltungsform_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.veranstaltungsform
    ADD CONSTRAINT veranstaltungsform_pkey PRIMARY KEY (id);


--
-- Name: zusatzfeld zusatzfeld_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.zusatzfeld
    ADD CONSTRAINT zusatzfeld_pkey PRIMARY KEY (id);


--
-- Name: veranstaltungsform fk65occnx0dug4m5ltqgngmx4bu; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.veranstaltungsform
    ADD CONSTRAINT fk65occnx0dug4m5ltqgngmx4bu FOREIGN KEY (veranstaltung_id) REFERENCES public.veranstaltung(id);


--
-- Name: veranstaltung fk83oivd0ctfeqifuev9c7419se; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.veranstaltung
    ADD CONSTRAINT fk83oivd0ctfeqifuev9c7419se FOREIGN KEY (modul_id) REFERENCES public.modul(id);


--
-- Name: zusatzfeld fk8e25hexqxbwwd6knu72focfc5; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.zusatzfeld
    ADD CONSTRAINT fk8e25hexqxbwwd6knu72focfc5 FOREIGN KEY (veranstaltung_id) REFERENCES public.veranstaltung(id);


--
-- Name: veranstaltung_semester fktip3cgqr82kbmnu5diif1gj42; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.veranstaltung_semester
    ADD CONSTRAINT fktip3cgqr82kbmnu5diif1gj42 FOREIGN KEY (veranstaltung_id) REFERENCES public.veranstaltung(id);


--
-- PostgreSQL database dump complete
--

