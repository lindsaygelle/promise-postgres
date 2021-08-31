--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: account; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA account;


ALTER SCHEMA account OWNER TO postgres;

--
-- Name: language; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA language;


ALTER SCHEMA language OWNER TO postgres;

--
-- Name: location; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA location;


ALTER SCHEMA location OWNER TO postgres;

--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account; Type: TABLE; Schema: account; Owner: postgres
--

CREATE TABLE account.account (
    created timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    edited timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    email character varying(255) NOT NULL,
    id integer NOT NULL,
    name character varying(15) NOT NULL
);


ALTER TABLE account.account OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: account; Owner: postgres
--

CREATE SEQUENCE account.account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account.account_id_seq OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: account; Owner: postgres
--

ALTER SEQUENCE account.account_id_seq OWNED BY account.account.id;


--
-- Name: settings; Type: TABLE; Schema: account; Owner: postgres
--

CREATE TABLE account.settings (
    account integer NOT NULL,
    biography character varying(160),
    country integer NOT NULL,
    edited timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    language integer NOT NULL
);


ALTER TABLE account.settings OWNER TO postgres;

--
-- Name: settings_account_seq; Type: SEQUENCE; Schema: account; Owner: postgres
--

CREATE SEQUENCE account.settings_account_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account.settings_account_seq OWNER TO postgres;

--
-- Name: settings_account_seq; Type: SEQUENCE OWNED BY; Schema: account; Owner: postgres
--

ALTER SEQUENCE account.settings_account_seq OWNED BY account.settings.account;


--
-- Name: settings_country_seq; Type: SEQUENCE; Schema: account; Owner: postgres
--

CREATE SEQUENCE account.settings_country_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account.settings_country_seq OWNER TO postgres;

--
-- Name: settings_country_seq; Type: SEQUENCE OWNED BY; Schema: account; Owner: postgres
--

ALTER SEQUENCE account.settings_country_seq OWNED BY account.settings.country;


--
-- Name: settings_language_seq; Type: SEQUENCE; Schema: account; Owner: postgres
--

CREATE SEQUENCE account.settings_language_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account.settings_language_seq OWNER TO postgres;

--
-- Name: settings_language_seq; Type: SEQUENCE OWNED BY; Schema: account; Owner: postgres
--

ALTER SEQUENCE account.settings_language_seq OWNED BY account.settings.language;


--
-- Name: language; Type: TABLE; Schema: language; Owner: postgres
--

CREATE TABLE language.language (
    created timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL,
    name public.citext NOT NULL
);


ALTER TABLE language.language OWNER TO postgres;

--
-- Name: language_id_seq; Type: SEQUENCE; Schema: language; Owner: postgres
--

CREATE SEQUENCE language.language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE language.language_id_seq OWNER TO postgres;

--
-- Name: language_id_seq; Type: SEQUENCE OWNED BY; Schema: language; Owner: postgres
--

ALTER SEQUENCE language.language_id_seq OWNED BY language.language.id;


--
-- Name: tag; Type: TABLE; Schema: language; Owner: postgres
--

CREATE TABLE language.tag (
    created timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL,
    language integer NOT NULL,
    name public.citext NOT NULL,
    tag public.citext NOT NULL,
    CONSTRAINT tag_name_check CHECK ((char_length((name)::text) <= 20)),
    CONSTRAINT tag_tag_check CHECK ((char_length((tag)::text) = 5))
);


ALTER TABLE language.tag OWNER TO postgres;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: language; Owner: postgres
--

CREATE SEQUENCE language.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE language.tag_id_seq OWNER TO postgres;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: language; Owner: postgres
--

ALTER SEQUENCE language.tag_id_seq OWNED BY language.tag.id;


--
-- Name: tag_language_seq; Type: SEQUENCE; Schema: language; Owner: postgres
--

CREATE SEQUENCE language.tag_language_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE language.tag_language_seq OWNER TO postgres;

--
-- Name: tag_language_seq; Type: SEQUENCE OWNED BY; Schema: language; Owner: postgres
--

ALTER SEQUENCE language.tag_language_seq OWNED BY language.tag.language;


--
-- Name: country; Type: TABLE; Schema: location; Owner: postgres
--

CREATE TABLE location.country (
    alpha_2 public.citext NOT NULL,
    alpha_3 public.citext NOT NULL,
    created timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL,
    name public.citext NOT NULL,
    "numeric" smallint NOT NULL,
    CONSTRAINT country_alpha_2_check CHECK ((char_length((alpha_2)::text) <= 2)),
    CONSTRAINT country_alpha_3_check CHECK ((char_length((alpha_3)::text) <= 3)),
    CONSTRAINT country_name_check CHECK ((char_length((name)::text) <= 60))
);


ALTER TABLE location.country OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: location; Owner: postgres
--

CREATE SEQUENCE location.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE location.country_id_seq OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: location; Owner: postgres
--

ALTER SEQUENCE location.country_id_seq OWNED BY location.country.id;


--
-- Name: account id; Type: DEFAULT; Schema: account; Owner: postgres
--

ALTER TABLE ONLY account.account ALTER COLUMN id SET DEFAULT nextval('account.account_id_seq'::regclass);


--
-- Name: settings account; Type: DEFAULT; Schema: account; Owner: postgres
--

ALTER TABLE ONLY account.settings ALTER COLUMN account SET DEFAULT nextval('account.settings_account_seq'::regclass);


--
-- Name: settings country; Type: DEFAULT; Schema: account; Owner: postgres
--

ALTER TABLE ONLY account.settings ALTER COLUMN country SET DEFAULT nextval('account.settings_country_seq'::regclass);


--
-- Name: settings language; Type: DEFAULT; Schema: account; Owner: postgres
--

ALTER TABLE ONLY account.settings ALTER COLUMN language SET DEFAULT nextval('account.settings_language_seq'::regclass);


--
-- Name: language id; Type: DEFAULT; Schema: language; Owner: postgres
--

ALTER TABLE ONLY language.language ALTER COLUMN id SET DEFAULT nextval('language.language_id_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: language; Owner: postgres
--

ALTER TABLE ONLY language.tag ALTER COLUMN id SET DEFAULT nextval('language.tag_id_seq'::regclass);


--
-- Name: tag language; Type: DEFAULT; Schema: language; Owner: postgres
--

ALTER TABLE ONLY language.tag ALTER COLUMN language SET DEFAULT nextval('language.tag_language_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.country ALTER COLUMN id SET DEFAULT nextval('location.country_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: account; Owner: postgres
--

COPY account.account (created, edited, email, id, name) FROM stdin;
2021-08-31 01:58:34.315218+00	2021-08-31 01:58:34.315218+00	lindsay.gelle@gmail.com	1	linne
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: account; Owner: postgres
--

COPY account.settings (account, biography, country, edited, language) FROM stdin;
1	hello	1	2021-08-31 06:01:05.480619+00	1
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: language; Owner: postgres
--

COPY language.language (created, id, name) FROM stdin;
2021-08-31 05:56:44.310035+00	1	english
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: language; Owner: postgres
--

COPY language.tag (created, id, language, name, tag) FROM stdin;
2021-08-31 05:56:44.310035+00	1	1	United States	en-US
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: location; Owner: postgres
--

COPY location.country (alpha_2, alpha_3, created, id, name, "numeric") FROM stdin;
au	aus	2021-08-31 01:58:34.315218+00	1	australia	36
\.


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: account; Owner: postgres
--

SELECT pg_catalog.setval('account.account_id_seq', 1, true);


--
-- Name: settings_account_seq; Type: SEQUENCE SET; Schema: account; Owner: postgres
--

SELECT pg_catalog.setval('account.settings_account_seq', 1, false);


--
-- Name: settings_country_seq; Type: SEQUENCE SET; Schema: account; Owner: postgres
--

SELECT pg_catalog.setval('account.settings_country_seq', 1, false);


--
-- Name: settings_language_seq; Type: SEQUENCE SET; Schema: account; Owner: postgres
--

SELECT pg_catalog.setval('account.settings_language_seq', 1, false);


--
-- Name: language_id_seq; Type: SEQUENCE SET; Schema: language; Owner: postgres
--

SELECT pg_catalog.setval('language.language_id_seq', 1, true);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: language; Owner: postgres
--

SELECT pg_catalog.setval('language.tag_id_seq', 1, true);


--
-- Name: tag_language_seq; Type: SEQUENCE SET; Schema: language; Owner: postgres
--

SELECT pg_catalog.setval('language.tag_language_seq', 1, false);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: location; Owner: postgres
--

SELECT pg_catalog.setval('location.country_id_seq', 1, true);


--
-- Name: account account_email_key; Type: CONSTRAINT; Schema: account; Owner: postgres
--

ALTER TABLE ONLY account.account
    ADD CONSTRAINT account_email_key UNIQUE (email);


--
-- Name: account account_name_key; Type: CONSTRAINT; Schema: account; Owner: postgres
--

ALTER TABLE ONLY account.account
    ADD CONSTRAINT account_name_key UNIQUE (name);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: account; Owner: postgres
--

ALTER TABLE ONLY account.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: language language_name_key; Type: CONSTRAINT; Schema: language; Owner: postgres
--

ALTER TABLE ONLY language.language
    ADD CONSTRAINT language_name_key UNIQUE (name);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: language; Owner: postgres
--

ALTER TABLE ONLY language.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- Name: tag tag_name_key; Type: CONSTRAINT; Schema: language; Owner: postgres
--

ALTER TABLE ONLY language.tag
    ADD CONSTRAINT tag_name_key UNIQUE (name);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: language; Owner: postgres
--

ALTER TABLE ONLY language.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: tag tag_tag_key; Type: CONSTRAINT; Schema: language; Owner: postgres
--

ALTER TABLE ONLY language.tag
    ADD CONSTRAINT tag_tag_key UNIQUE (tag);


--
-- Name: country country_alpha_2_key; Type: CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.country
    ADD CONSTRAINT country_alpha_2_key UNIQUE (alpha_2);


--
-- Name: country country_alpha_3_key; Type: CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.country
    ADD CONSTRAINT country_alpha_3_key UNIQUE (alpha_3);


--
-- Name: country country_name_key; Type: CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.country
    ADD CONSTRAINT country_name_key UNIQUE (name);


--
-- Name: country country_numeric_key; Type: CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.country
    ADD CONSTRAINT country_numeric_key UNIQUE ("numeric");


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: settings settings_account_fkey; Type: FK CONSTRAINT; Schema: account; Owner: postgres
--

ALTER TABLE ONLY account.settings
    ADD CONSTRAINT settings_account_fkey FOREIGN KEY (account) REFERENCES account.account(id) ON DELETE CASCADE;


--
-- Name: settings settings_country_fkey; Type: FK CONSTRAINT; Schema: account; Owner: postgres
--

ALTER TABLE ONLY account.settings
    ADD CONSTRAINT settings_country_fkey FOREIGN KEY (country) REFERENCES location.country(id);


--
-- Name: settings settings_language_fkey; Type: FK CONSTRAINT; Schema: account; Owner: postgres
--

ALTER TABLE ONLY account.settings
    ADD CONSTRAINT settings_language_fkey FOREIGN KEY (language) REFERENCES language.language(id);


--
-- Name: tag tag_language_fkey; Type: FK CONSTRAINT; Schema: language; Owner: postgres
--

ALTER TABLE ONLY language.tag
    ADD CONSTRAINT tag_language_fkey FOREIGN KEY (language) REFERENCES language.language(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

