--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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
-- Name: musics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musics (
    id integer NOT NULL,
    title character varying(200),
    path character varying(200)
);


ALTER TABLE public.musics OWNER TO freezer;

--
-- Name: musics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.musics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.musics_id_seq OWNER TO freezer;

--
-- Name: musics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.musics_id_seq OWNED BY public.musics.id;


--
-- Name: rel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel (
    id_user integer NOT NULL,
    id_music integer NOT NULL
);


ALTER TABLE public.rel OWNER TO freezer;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    pass character varying(200),
    ip character varying(15)
);


ALTER TABLE public.users OWNER TO freezer;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO freezer;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: musics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musics ALTER COLUMN id SET DEFAULT nextval('public.musics_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: musics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.musics (id, title, path) FROM stdin;
\.


--
-- Data for Name: rel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel (id_user, id_music) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, pass, ip) FROM stdin;
1	admin	admin	1.2.3.1
\.


--
-- Name: musics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.musics_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: musics musics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musics
    ADD CONSTRAINT musics_pkey PRIMARY KEY (id);


--
-- Name: rel rel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel
    ADD CONSTRAINT rel_pkey PRIMARY KEY (id_user, id_music);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: rel rel_id_music_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel
    ADD CONSTRAINT rel_id_music_fkey FOREIGN KEY (id_music) REFERENCES public.musics(id);


--
-- Name: rel rel_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel
    ADD CONSTRAINT rel_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

