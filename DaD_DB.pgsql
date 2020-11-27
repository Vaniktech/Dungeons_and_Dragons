--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0 (Ubuntu 13.0-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.0 (Ubuntu 13.0-1.pgdg20.04+1)

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
-- Name: ammunition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ammunition (
    ammunition_id integer NOT NULL,
    ammunition_type character varying(30) NOT NULL,
    ammunition_name character varying(30) NOT NULL,
    ammunition_price integer NOT NULL,
    ammunition_weight real NOT NULL
);


ALTER TABLE public.ammunition OWNER TO postgres;

--
-- Name: armor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armor (
    armor_id integer NOT NULL,
    armor_type character varying(30) NOT NULL,
    armor_name character varying(30) NOT NULL,
    armort_price integer NOT NULL,
    armor_weight integer NOT NULL,
    armor_class text NOT NULL
);


ALTER TABLE public.armor OWNER TO postgres;

--
-- Name: consumables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumables (
    consumables_id integer NOT NULL,
    consumables_type character varying(30) NOT NULL,
    consumables_name character varying(40) NOT NULL,
    consumables_price integer NOT NULL,
    consumables_weight real NOT NULL
);


ALTER TABLE public.consumables OWNER TO postgres;

--
-- Name: container; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.container (
    container_id integer NOT NULL,
    container_type character varying(10) NOT NULL,
    container_name character varying(30) NOT NULL,
    container_price integer NOT NULL,
    container_weight real NOT NULL
);


ALTER TABLE public.container OWNER TO postgres;

--
-- Name: food; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food (
    food_id integer NOT NULL,
    food_type character varying(25),
    food_name character varying(30) NOT NULL,
    food_price integer NOT NULL
);


ALTER TABLE public.food OWNER TO postgres;

--
-- Name: for_horse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.for_horse (
    fh_id integer NOT NULL,
    fh_type character varying(5),
    fh_name character varying(20) NOT NULL,
    fh_price integer NOT NULL,
    fh_weight integer
);


ALTER TABLE public.for_horse OWNER TO postgres;

--
-- Name: gear; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gear (
    gear_id integer NOT NULL,
    gear_type character varying(15) NOT NULL,
    gear_name character varying(30) NOT NULL,
    gear_price integer NOT NULL,
    gear_weight real NOT NULL
);


ALTER TABLE public.gear OWNER TO postgres;

--
-- Name: horse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.horse (
    horse_id integer NOT NULL,
    horse_name character varying(20) NOT NULL,
    horse_price integer NOT NULL,
    horse_speed integer NOT NULL,
    horse_weightup integer NOT NULL
);


ALTER TABLE public.horse OWNER TO postgres;

--
-- Name: kit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kit (
    kit_id integer NOT NULL,
    kit_type character varying(30) NOT NULL,
    kit_name character varying(30) NOT NULL,
    kit_price integer NOT NULL,
    kit_weight integer NOT NULL
);


ALTER TABLE public.kit OWNER TO postgres;

--
-- Name: tool; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tool (
    tool_id integer NOT NULL,
    tool_type character varying(30),
    tool_name character varying(35) NOT NULL,
    tool_price integer,
    tool_weight real
);


ALTER TABLE public.tool OWNER TO postgres;

--
-- Name: transport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transport (
    transport_id integer NOT NULL,
    horse_id integer NOT NULL,
    fh_id integer NOT NULL,
    wt_id integer NOT NULL
);


ALTER TABLE public.transport OWNER TO postgres;

--
-- Name: water_transport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.water_transport (
    wt_id integer NOT NULL,
    wt_name character varying(20) NOT NULL,
    wt_price integer NOT NULL,
    wt_speed integer
);


ALTER TABLE public.water_transport OWNER TO postgres;

--
-- Name: weapon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weapon (
    weapon_id integer NOT NULL,
    weapon_type character varying(30) NOT NULL,
    weapon_name character varying(20) NOT NULL,
    weapon_price integer NOT NULL,
    weapon_weight real,
    weapon_damage character varying(15) NOT NULL,
    weapon_properties text
);


ALTER TABLE public.weapon OWNER TO postgres;

--
-- Data for Name: ammunition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ammunition (ammunition_id, ammunition_type, ammunition_name, ammunition_price, ammunition_weight) FROM stdin;
\.


--
-- Data for Name: armor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.armor (armor_id, armor_type, armor_name, armort_price, armor_weight, armor_class) FROM stdin;
\.


--
-- Data for Name: consumables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumables (consumables_id, consumables_type, consumables_name, consumables_price, consumables_weight) FROM stdin;
\.


--
-- Data for Name: container; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.container (container_id, container_type, container_name, container_price, container_weight) FROM stdin;
\.


--
-- Data for Name: food; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food (food_id, food_type, food_name, food_price) FROM stdin;
\.


--
-- Data for Name: for_horse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.for_horse (fh_id, fh_type, fh_name, fh_price, fh_weight) FROM stdin;
\.


--
-- Data for Name: gear; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gear (gear_id, gear_type, gear_name, gear_price, gear_weight) FROM stdin;
\.


--
-- Data for Name: horse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horse (horse_id, horse_name, horse_price, horse_speed, horse_weightup) FROM stdin;
\.


--
-- Data for Name: kit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kit (kit_id, kit_type, kit_name, kit_price, kit_weight) FROM stdin;
\.


--
-- Data for Name: tool; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tool (tool_id, tool_type, tool_name, tool_price, tool_weight) FROM stdin;
\.


--
-- Data for Name: transport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transport (transport_id, horse_id, fh_id, wt_id) FROM stdin;
\.


--
-- Data for Name: water_transport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.water_transport (wt_id, wt_name, wt_price, wt_speed) FROM stdin;
\.


--
-- Data for Name: weapon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weapon (weapon_id, weapon_type, weapon_name, weapon_price, weapon_weight, weapon_damage, weapon_properties) FROM stdin;
\.


--
-- Name: ammunition ammunition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ammunition
    ADD CONSTRAINT ammunition_pkey PRIMARY KEY (ammunition_id);


--
-- Name: armor armor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armor
    ADD CONSTRAINT armor_pkey PRIMARY KEY (armor_id);


--
-- Name: consumables consumables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumables
    ADD CONSTRAINT consumables_pkey PRIMARY KEY (consumables_id);


--
-- Name: container container_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container
    ADD CONSTRAINT container_pkey PRIMARY KEY (container_id);


--
-- Name: food food_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food
    ADD CONSTRAINT food_pkey PRIMARY KEY (food_id);


--
-- Name: for_horse for_horse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.for_horse
    ADD CONSTRAINT for_horse_pkey PRIMARY KEY (fh_id);


--
-- Name: gear gear_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear
    ADD CONSTRAINT gear_pkey PRIMARY KEY (gear_id);


--
-- Name: horse horse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horse
    ADD CONSTRAINT horse_pkey PRIMARY KEY (horse_id);


--
-- Name: kit kit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kit
    ADD CONSTRAINT kit_pkey PRIMARY KEY (kit_id);


--
-- Name: tool tool_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tool
    ADD CONSTRAINT tool_pkey PRIMARY KEY (tool_id);


--
-- Name: transport transport_fh_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transport
    ADD CONSTRAINT transport_fh_id_key UNIQUE (fh_id);


--
-- Name: transport transport_horse_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transport
    ADD CONSTRAINT transport_horse_id_key UNIQUE (horse_id);


--
-- Name: transport transport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transport
    ADD CONSTRAINT transport_pkey PRIMARY KEY (transport_id);


--
-- Name: transport transport_wt_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transport
    ADD CONSTRAINT transport_wt_id_key UNIQUE (wt_id);


--
-- Name: water_transport water_transport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_transport
    ADD CONSTRAINT water_transport_pkey PRIMARY KEY (wt_id);


--
-- Name: weapon weapon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon
    ADD CONSTRAINT weapon_pkey PRIMARY KEY (weapon_id);


--
-- Name: for_horse for_horse_fh_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.for_horse
    ADD CONSTRAINT for_horse_fh_id_fkey FOREIGN KEY (fh_id) REFERENCES public.transport(fh_id);


--
-- Name: horse horse_horse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horse
    ADD CONSTRAINT horse_horse_id_fkey FOREIGN KEY (horse_id) REFERENCES public.transport(horse_id);


--
-- Name: water_transport water_transport_wt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_transport
    ADD CONSTRAINT water_transport_wt_id_fkey FOREIGN KEY (wt_id) REFERENCES public.transport(wt_id);


--
-- PostgreSQL database dump complete
--

