--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO "Guest";

--
-- Name: dates; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE dates (
    id bigint NOT NULL,
    date date,
    meetup_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE dates OWNER TO "Guest";

--
-- Name: dates_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dates_id_seq OWNER TO "Guest";

--
-- Name: dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE dates_id_seq OWNED BY dates.id;


--
-- Name: meetups; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE meetups (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    catagory character varying,
    street character varying,
    city character varying,
    state character varying,
    zip integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE meetups OWNER TO "Guest";

--
-- Name: meetups_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE meetups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meetups_id_seq OWNER TO "Guest";

--
-- Name: meetups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE meetups_id_seq OWNED BY meetups.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE profiles (
    id bigint NOT NULL,
    user_id integer,
    birthday date,
    gender character varying,
    zip integer,
    photo character varying,
    bio character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE profiles OWNER TO "Guest";

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profiles_id_seq OWNER TO "Guest";

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE profiles_id_seq OWNED BY profiles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "Guest";

--
-- Name: users; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE users (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    password character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: dates id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY dates ALTER COLUMN id SET DEFAULT nextval('dates_id_seq'::regclass);


--
-- Name: meetups id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY meetups ALTER COLUMN id SET DEFAULT nextval('meetups_id_seq'::regclass);


--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY profiles ALTER COLUMN id SET DEFAULT nextval('profiles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	default_env	2017-10-04 16:47:04.052023	2017-10-04 16:47:04.052023
\.


--
-- Data for Name: dates; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY dates (id, date, meetup_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('dates_id_seq', 1, false);


--
-- Data for Name: meetups; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY meetups (id, name, description, catagory, street, city, state, zip, created_at, updated_at) FROM stdin;
\.


--
-- Name: meetups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('meetups_id_seq', 1, false);


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY profiles (id, user_id, birthday, gender, zip, photo, bio, created_at, updated_at) FROM stdin;
1	8	2017-10-17	neutral	32313		asdfsdf	2017-10-04 20:14:24.010557	2017-10-04 20:14:24.010557
2	8	\N	neutral	32313		asdfsdf	2017-10-04 20:14:54.376923	2017-10-04 20:14:54.376923
3	8	\N	neutral	32313		asdfsdf	2017-10-04 20:15:49.711608	2017-10-04 20:15:49.711608
4	9	2017-10-26	female	\N			2017-10-04 20:30:12.612641	2017-10-04 20:30:12.612641
5	9	\N	\N	\N			2017-10-04 20:30:54.405186	2017-10-04 20:30:54.405186
\.


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('profiles_id_seq', 5, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY schema_migrations (version) FROM stdin;
20171004164423
20171004164743
20171004165724
20171004170315
20171004181451
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY users (id, first_name, last_name, email, password, created_at, updated_at) FROM stdin;
1	John	Long	meechllada@gmail.com	asdfa	2017-10-04 17:57:40.33865	2017-10-04 17:57:40.33865
2	mitchell	Long	mwlong23@gmail.com	googlegoogle	2017-10-04 17:58:02.223897	2017-10-04 17:58:02.223897
3	mitchell	Long	mwlong23@gmail.com	googlegoogle	2017-10-04 17:58:04.549157	2017-10-04 17:58:04.549157
4	mitchell	Long	mwlong23@gmail.com	googlegoogle	2017-10-04 17:58:05.619198	2017-10-04 17:58:05.619198
5	mitchell	anzalone	meechllada@gmail.com	googlegoogle	2017-10-04 18:17:13.978258	2017-10-04 18:17:13.978258
6	mitchell	Long	mwlong23@gmail.com	googlegoogle	2017-10-04 18:45:04.352901	2017-10-04 18:45:04.352901
7	mitchell	Long	mwlong23@gmail.com	googlegoogle	2017-10-04 18:45:58.270443	2017-10-04 18:45:58.270443
8	mitchell	Long	mwlong23@gmail.com	googlegoogle	2017-10-04 20:08:42.761368	2017-10-04 20:08:42.761368
9	John	Doe	john@test.com	googlegoogle	2017-10-04 20:29:58.590513	2017-10-04 20:29:58.590513
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('users_id_seq', 9, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: dates dates_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY dates
    ADD CONSTRAINT dates_pkey PRIMARY KEY (id);


--
-- Name: meetups meetups_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY meetups
    ADD CONSTRAINT meetups_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

