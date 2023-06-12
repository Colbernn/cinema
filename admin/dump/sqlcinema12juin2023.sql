--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-06-12 13:26:07

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

--
-- TOC entry 230 (class 1255 OID 24946)
-- Name: verifier_connexion(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.verifier_connexion(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	
	declare f_login alias for $1;
	declare f_password alias for $2;
	declare id integer;
	declare retour integer;
begin
	select into id id_admin from administrateur where nom_admin=f_login and mot_de_passe=f_password;
	if not found
	then
	  retour=0;
	else
	  retour=1;
	end if;
	return retour;
end;
';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 24878)
-- Name: administrateur; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.administrateur (
    id_admin integer NOT NULL,
    nom_admin text,
    mot_de_passe text DEFAULT 'changeme'::text NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 24877)
-- Name: administrateur_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.administrateur_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 222
-- Name: administrateur_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.administrateur_id_admin_seq OWNED BY public.administrateur.id_admin;


--
-- TOC entry 217 (class 1259 OID 24851)
-- Name: films; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.films (
    id_film integer NOT NULL,
    nom_film text,
    realisateur text,
    duree text,
    description text,
    image_film text,
    id_genre integer
);


--
-- TOC entry 216 (class 1259 OID 24850)
-- Name: films_id_film_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.films_id_film_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 216
-- Name: films_id_film_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.films_id_film_seq OWNED BY public.films.id_film;


--
-- TOC entry 215 (class 1259 OID 24842)
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres (
    id_genre integer NOT NULL,
    libelle_genre text
);


--
-- TOC entry 214 (class 1259 OID 24841)
-- Name: genres_id_genre_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genres_id_genre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 214
-- Name: genres_id_genre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genres_id_genre_seq OWNED BY public.genres.id_genre;


--
-- TOC entry 227 (class 1259 OID 24906)
-- Name: reservations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reservations (
    id_res integer NOT NULL,
    date_res text,
    nbr_ticket integer,
    prix_total text,
    id_seance integer,
    id_user integer
);


--
-- TOC entry 226 (class 1259 OID 24905)
-- Name: reservations_id_res_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reservations_id_res_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 226
-- Name: reservations_id_res_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reservations_id_res_seq OWNED BY public.reservations.id_res;


--
-- TOC entry 221 (class 1259 OID 24869)
-- Name: salles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.salles (
    id_salle integer NOT NULL,
    nbr_siege integer,
    type text
);


--
-- TOC entry 220 (class 1259 OID 24868)
-- Name: salles_id_salle_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.salles_id_salle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 220
-- Name: salles_id_salle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.salles_id_salle_seq OWNED BY public.salles.id_salle;


--
-- TOC entry 225 (class 1259 OID 24887)
-- Name: seances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.seances (
    id_seance integer NOT NULL,
    date_seance text,
    heure_seance text,
    id_film integer,
    id_salle integer
);


--
-- TOC entry 224 (class 1259 OID 24886)
-- Name: seances_id_seance_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.seances_id_seance_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 224
-- Name: seances_id_seance_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.seances_id_seance_seq OWNED BY public.seances.id_seance;


--
-- TOC entry 219 (class 1259 OID 24860)
-- Name: utilisateurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.utilisateurs (
    id_user integer NOT NULL,
    nom text,
    prenom text,
    age integer,
    mail text,
    image_utilisateur text,
    mdp_utilisateur text
);


--
-- TOC entry 218 (class 1259 OID 24859)
-- Name: utilisateurs_id_user_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.utilisateurs_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 218
-- Name: utilisateurs_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.utilisateurs_id_user_seq OWNED BY public.utilisateurs.id_user;


--
-- TOC entry 228 (class 1259 OID 33164)
-- Name: vue_films; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_films AS
 SELECT films.id_film,
    films.nom_film,
    films.realisateur,
    films.duree,
    films.description,
    films.image_film
   FROM public.films
  ORDER BY films.nom_film;


--
-- TOC entry 229 (class 1259 OID 33182)
-- Name: vue_films_seances_genres; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_films_seances_genres AS
 SELECT films.id_film,
    films.nom_film,
    films.realisateur,
    films.duree,
    films.description,
    films.image_film,
    genres.id_genre,
    genres.libelle_genre,
    seances.id_seance,
    seances.date_seance,
    seances.heure_seance,
    salles.id_salle,
    salles.type,
    salles.nbr_siege
   FROM public.films,
    public.genres,
    public.seances,
    public.salles
  WHERE ((genres.id_genre = films.id_genre) AND (seances.id_film = films.id_film) AND (salles.id_salle = seances.id_salle));


--
-- TOC entry 3216 (class 2604 OID 24881)
-- Name: administrateur id_admin; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.administrateur ALTER COLUMN id_admin SET DEFAULT nextval('public.administrateur_id_admin_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 24854)
-- Name: films id_film; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.films ALTER COLUMN id_film SET DEFAULT nextval('public.films_id_film_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 24845)
-- Name: genres id_genre; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres ALTER COLUMN id_genre SET DEFAULT nextval('public.genres_id_genre_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 24909)
-- Name: reservations id_res; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations ALTER COLUMN id_res SET DEFAULT nextval('public.reservations_id_res_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 24872)
-- Name: salles id_salle; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salles ALTER COLUMN id_salle SET DEFAULT nextval('public.salles_id_salle_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 24890)
-- Name: seances id_seance; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seances ALTER COLUMN id_seance SET DEFAULT nextval('public.seances_id_seance_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 24863)
-- Name: utilisateurs id_user; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.utilisateurs ALTER COLUMN id_user SET DEFAULT nextval('public.utilisateurs_id_user_seq'::regclass);


--
-- TOC entry 3392 (class 0 OID 24878)
-- Dependencies: 223
-- Data for Name: administrateur; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.administrateur (id_admin, nom_admin, mot_de_passe) VALUES (1, 'admin', 'changeme');


--
-- TOC entry 3386 (class 0 OID 24851)
-- Dependencies: 217
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.films (id_film, nom_film, realisateur, duree, description, image_film, id_genre) VALUES (1, 'Avengers: Endgame', 'Anthony et Joe Russo', '3h02', 'Les Avengers se réunissent pour affronter le Titan fou Thanos et sauver l''univers.', 'avengers.jpg', 1);
INSERT INTO public.films (id_film, nom_film, realisateur, duree, description, image_film, id_genre) VALUES (2, 'Kill Bill', 'Quentin Tarentino', '1h51', 'La Mariée, qui est enceinte, survit à ses blessures mais sombre dans le coma. Toutefois, la Mariée n''est pas une personne ordinaire. Autrefois tueuse à gages dans une organisation secrète, le Détachement International des Vipères Assassines, elle est une combattante hors pair. Sortant du coma quatre années plus tard, elle n''a plus qu''un seul but, se venger de ses anciens complices.', 'killbill.jpg', 1);
INSERT INTO public.films (id_film, nom_film, realisateur, duree, description, image_film, id_genre) VALUES (5, 'Inception', 'Christopher Nolan', '2h', 'Des scientifiques traversent les rêves pour se faire de l''argent.', 'inception.jpg', 1);


--
-- TOC entry 3384 (class 0 OID 24842)
-- Dependencies: 215
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.genres (id_genre, libelle_genre) VALUES (1, 'Action');
INSERT INTO public.genres (id_genre, libelle_genre) VALUES (2, 'Comédie');
INSERT INTO public.genres (id_genre, libelle_genre) VALUES (3, 'Drame');
INSERT INTO public.genres (id_genre, libelle_genre) VALUES (4, 'Science-fiction');


--
-- TOC entry 3396 (class 0 OID 24906)
-- Dependencies: 227
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.reservations (id_res, date_res, nbr_ticket, prix_total, id_seance, id_user) VALUES (1, '2023-04-17', 2, '25.00', 1, 1);
INSERT INTO public.reservations (id_res, date_res, nbr_ticket, prix_total, id_seance, id_user) VALUES (21, NULL, 1, '10', 1, 1);
INSERT INTO public.reservations (id_res, date_res, nbr_ticket, prix_total, id_seance, id_user) VALUES (24, NULL, 1, '10', 1, 1);
INSERT INTO public.reservations (id_res, date_res, nbr_ticket, prix_total, id_seance, id_user) VALUES (25, '2023-04-18', 1, '10', 1, 1);
INSERT INTO public.reservations (id_res, date_res, nbr_ticket, prix_total, id_seance, id_user) VALUES (26, '2023-12-15', 2, '20', 37, 1);
INSERT INTO public.reservations (id_res, date_res, nbr_ticket, prix_total, id_seance, id_user) VALUES (27, '2023-12-15', 2, '20', 37, 1);


--
-- TOC entry 3390 (class 0 OID 24869)
-- Dependencies: 221
-- Data for Name: salles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.salles (id_salle, nbr_siege, type) VALUES (1, 100, 'IMAX');
INSERT INTO public.salles (id_salle, nbr_siege, type) VALUES (2, 100, '2D');


--
-- TOC entry 3394 (class 0 OID 24887)
-- Dependencies: 225
-- Data for Name: seances; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.seances (id_seance, date_seance, heure_seance, id_film, id_salle) VALUES (1, '2023-04-18', '20:00', 1, 1);
INSERT INTO public.seances (id_seance, date_seance, heure_seance, id_film, id_salle) VALUES (6, '2023-04-16', '20:00', 2, 2);
INSERT INTO public.seances (id_seance, date_seance, heure_seance, id_film, id_salle) VALUES (7, '2023-04-20', '20:00', 1, 2);
INSERT INTO public.seances (id_seance, date_seance, heure_seance, id_film, id_salle) VALUES (8, '2024-12-19', '20:00', 5, 1);
INSERT INTO public.seances (id_seance, date_seance, heure_seance, id_film, id_salle) VALUES (17, '2023-12-12', '20:00', 1, 1);
INSERT INTO public.seances (id_seance, date_seance, heure_seance, id_film, id_salle) VALUES (36, '2023-12-12', '20:00', 2, 2);
INSERT INTO public.seances (id_seance, date_seance, heure_seance, id_film, id_salle) VALUES (37, '2023-12-15', '15:00', 2, 1);
INSERT INTO public.seances (id_seance, date_seance, heure_seance, id_film, id_salle) VALUES (38, '2023-12-15', '15:00', 2, 1);


--
-- TOC entry 3388 (class 0 OID 24860)
-- Dependencies: 219
-- Data for Name: utilisateurs; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.utilisateurs (id_user, nom, prenom, age, mail, image_utilisateur, mdp_utilisateur) VALUES (1, 'Durand', 'Jean', 30, 'jean.durand@mail.com', NULL, NULL);
INSERT INTO public.utilisateurs (id_user, nom, prenom, age, mail, image_utilisateur, mdp_utilisateur) VALUES (4, 'Chevalier', 'Steven', 24, 'steven.chevalier@gmail.com', NULL, NULL);
INSERT INTO public.utilisateurs (id_user, nom, prenom, age, mail, image_utilisateur, mdp_utilisateur) VALUES (5, 'Urbain', 'Matthew', 23, 'urb.mat@gmail.com', 'image.jpg', 'test');
INSERT INTO public.utilisateurs (id_user, nom, prenom, age, mail, image_utilisateur, mdp_utilisateur) VALUES (6, 'Urbain', 'Matthew', 19, 'admin@gmail.com', 'image.jpg', 'test');
INSERT INTO public.utilisateurs (id_user, nom, prenom, age, mail, image_utilisateur, mdp_utilisateur) VALUES (7, 'Etienne', 'Samuel', 49, 'samuel.etienne@gmail.com', 'image.jpg', 'test');
INSERT INTO public.utilisateurs (id_user, nom, prenom, age, mail, image_utilisateur, mdp_utilisateur) VALUES (8, 'Banner', 'Bruce', 56, 'bruce.banner@gmail.com', 'image.jpg', 'test');


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 222
-- Name: administrateur_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.administrateur_id_admin_seq', 1, true);


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 216
-- Name: films_id_film_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.films_id_film_seq', 9, true);


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 214
-- Name: genres_id_genre_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genres_id_genre_seq', 4, true);


--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 226
-- Name: reservations_id_res_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reservations_id_res_seq', 27, true);


--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 220
-- Name: salles_id_salle_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.salles_id_salle_seq', 4, true);


--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 224
-- Name: seances_id_seance_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.seances_id_seance_seq', 38, true);


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 218
-- Name: utilisateurs_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.utilisateurs_id_user_seq', 8, true);


--
-- TOC entry 3229 (class 2606 OID 24885)
-- Name: administrateur administrateur_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.administrateur
    ADD CONSTRAINT administrateur_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 3223 (class 2606 OID 24858)
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id_film);


--
-- TOC entry 3221 (class 2606 OID 24849)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id_genre);


--
-- TOC entry 3233 (class 2606 OID 24913)
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id_res);


--
-- TOC entry 3227 (class 2606 OID 24876)
-- Name: salles salles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salles
    ADD CONSTRAINT salles_pkey PRIMARY KEY (id_salle);


--
-- TOC entry 3231 (class 2606 OID 24894)
-- Name: seances seances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seances
    ADD CONSTRAINT seances_pkey PRIMARY KEY (id_seance);


--
-- TOC entry 3225 (class 2606 OID 24867)
-- Name: utilisateurs utilisateurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.utilisateurs
    ADD CONSTRAINT utilisateurs_pkey PRIMARY KEY (id_user);


--
-- TOC entry 3234 (class 2606 OID 33191)
-- Name: films films_id_genre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_id_genre_fkey FOREIGN KEY (id_genre) REFERENCES public.genres(id_genre);


--
-- TOC entry 3237 (class 2606 OID 24914)
-- Name: reservations reservations_id_seance_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_id_seance_fkey FOREIGN KEY (id_seance) REFERENCES public.seances(id_seance);


--
-- TOC entry 3238 (class 2606 OID 24919)
-- Name: reservations reservations_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.utilisateurs(id_user);


--
-- TOC entry 3235 (class 2606 OID 24895)
-- Name: seances seances_id_film_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seances
    ADD CONSTRAINT seances_id_film_fkey FOREIGN KEY (id_film) REFERENCES public.films(id_film);


--
-- TOC entry 3236 (class 2606 OID 24900)
-- Name: seances seances_id_salle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seances
    ADD CONSTRAINT seances_id_salle_fkey FOREIGN KEY (id_salle) REFERENCES public.salles(id_salle);


-- Completed on 2023-06-12 13:26:10

--
-- PostgreSQL database dump complete
--

