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
-- Name: ammunition_ammunition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ammunition_ammunition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ammunition_ammunition_id_seq OWNER TO postgres;

--
-- Name: ammunition_ammunition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ammunition_ammunition_id_seq OWNED BY public.ammunition.ammunition_id;


--
-- Name: arcane_focus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arcane_focus (
    arcane_focus_id integer NOT NULL,
    arcane_focus_type character varying(30) NOT NULL,
    arcane_focus_name character varying(30) NOT NULL,
    arcane_focus_price integer NOT NULL,
    arcane_focus_weight integer NOT NULL
);


ALTER TABLE public.arcane_focus OWNER TO postgres;

--
-- Name: arcane_focus_arcane_focus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.arcane_focus_arcane_focus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.arcane_focus_arcane_focus_id_seq OWNER TO postgres;

--
-- Name: arcane_focus_arcane_focus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.arcane_focus_arcane_focus_id_seq OWNED BY public.arcane_focus.arcane_focus_id;


--
-- Name: armor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armor (
    armor_id integer NOT NULL,
    armor_type character varying(20) NOT NULL,
    armor_name character varying(30) NOT NULL,
    armort_price integer NOT NULL,
    armor_weight integer NOT NULL,
    armor_class character varying(50) NOT NULL,
    armor_power character varying(3),
    armor_secrecy character varying(6),
    armor_to_dress character varying(10) NOT NULL,
    armor_to_undress character varying(10) NOT NULL
);


ALTER TABLE public.armor OWNER TO postgres;

--
-- Name: armor_armor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.armor_armor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.armor_armor_id_seq OWNER TO postgres;

--
-- Name: armor_armor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.armor_armor_id_seq OWNED BY public.armor.armor_id;


--
-- Name: camp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.camp (
    camp_id integer NOT NULL,
    camp_type character varying(30) NOT NULL,
    camp_name character varying(30) NOT NULL,
    camp_price integer NOT NULL,
    camp_weight integer NOT NULL
);


ALTER TABLE public.camp OWNER TO postgres;

--
-- Name: camp_camp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.camp_camp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.camp_camp_id_seq OWNER TO postgres;

--
-- Name: camp_camp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.camp_camp_id_seq OWNED BY public.camp.camp_id;


--
-- Name: clothes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clothes (
    clothes_id integer NOT NULL,
    clothes_type character varying(30) NOT NULL,
    clothes_name character varying(30) NOT NULL,
    clothes_price integer NOT NULL,
    clothes_weight integer NOT NULL
);


ALTER TABLE public.clothes OWNER TO postgres;

--
-- Name: clothes_clothes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clothes_clothes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clothes_clothes_id_seq OWNER TO postgres;

--
-- Name: clothes_clothes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clothes_clothes_id_seq OWNED BY public.clothes.clothes_id;


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
-- Name: consumables_consumables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consumables_consumables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consumables_consumables_id_seq OWNER TO postgres;

--
-- Name: consumables_consumables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consumables_consumables_id_seq OWNED BY public.consumables.consumables_id;


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
-- Name: container_container_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.container_container_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.container_container_id_seq OWNER TO postgres;

--
-- Name: container_container_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.container_container_id_seq OWNED BY public.container.container_id;


--
-- Name: druidic_focus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.druidic_focus (
    druidic_focus_id integer NOT NULL,
    druidic_focus_type character varying(30) NOT NULL,
    druidic_focus_name character varying(30) NOT NULL,
    druidic_focus_price integer NOT NULL,
    druidic_focus_weight integer NOT NULL
);


ALTER TABLE public.druidic_focus OWNER TO postgres;

--
-- Name: druidic_focus_druidic_focus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.druidic_focus_druidic_focus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.druidic_focus_druidic_focus_id_seq OWNER TO postgres;

--
-- Name: druidic_focus_druidic_focus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.druidic_focus_druidic_focus_id_seq OWNED BY public.druidic_focus.druidic_focus_id;


--
-- Name: explosives; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.explosives (
    explosives_id integer NOT NULL,
    explosives_type character varying(15) NOT NULL,
    explosives_name character varying(30) NOT NULL,
    explosives_price integer NOT NULL,
    explosives_weight real NOT NULL
);


ALTER TABLE public.explosives OWNER TO postgres;

--
-- Name: explosives_explosives_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.explosives_explosives_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.explosives_explosives_id_seq OWNER TO postgres;

--
-- Name: explosives_explosives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.explosives_explosives_id_seq OWNED BY public.explosives.explosives_id;


--
-- Name: firearm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firearm (
    firearm_id integer NOT NULL,
    firearm_type character varying(30) NOT NULL,
    firearm_name character varying(30) NOT NULL,
    firearm_price integer NOT NULL,
    firearm_weight real,
    firearm_damage character varying(20) NOT NULL,
    firearm_properties text
);


ALTER TABLE public.firearm OWNER TO postgres;

--
-- Name: firearm_firearm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.firearm_firearm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.firearm_firearm_id_seq OWNER TO postgres;

--
-- Name: firearm_firearm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.firearm_firearm_id_seq OWNED BY public.firearm.firearm_id;


--
-- Name: food; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food (
    food_id integer NOT NULL,
    food_type character varying(25),
    food_name character varying(40) NOT NULL,
    food_price integer NOT NULL
);


ALTER TABLE public.food OWNER TO postgres;

--
-- Name: food_food_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_food_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_food_id_seq OWNER TO postgres;

--
-- Name: food_food_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_food_id_seq OWNED BY public.food.food_id;


--
-- Name: for_horse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.for_horse (
    fh_id integer NOT NULL,
    fh_name character varying(20) NOT NULL,
    fh_price integer NOT NULL,
    fh_weight integer
);


ALTER TABLE public.for_horse OWNER TO postgres;

--
-- Name: for_horse_fh_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.for_horse_fh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.for_horse_fh_id_seq OWNER TO postgres;

--
-- Name: for_horse_fh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.for_horse_fh_id_seq OWNED BY public.for_horse.fh_id;


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
-- Name: gear_gear_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gear_gear_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gear_gear_id_seq OWNER TO postgres;

--
-- Name: gear_gear_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gear_gear_id_seq OWNED BY public.gear.gear_id;


--
-- Name: holly_simbol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.holly_simbol (
    holly_simbol_id integer NOT NULL,
    holly_simbol_type character varying(30) NOT NULL,
    holly_simbol_name character varying(30) NOT NULL,
    holly_simbol_price integer NOT NULL,
    holly_simbol_weight integer NOT NULL
);


ALTER TABLE public.holly_simbol OWNER TO postgres;

--
-- Name: holly_simbol_holly_simbol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.holly_simbol_holly_simbol_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.holly_simbol_holly_simbol_id_seq OWNER TO postgres;

--
-- Name: holly_simbol_holly_simbol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.holly_simbol_holly_simbol_id_seq OWNED BY public.holly_simbol.holly_simbol_id;


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
-- Name: horse_horse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.horse_horse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horse_horse_id_seq OWNER TO postgres;

--
-- Name: horse_horse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.horse_horse_id_seq OWNED BY public.horse.horse_id;


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
-- Name: kit_kit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kit_kit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kit_kit_id_seq OWNER TO postgres;

--
-- Name: kit_kit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kit_kit_id_seq OWNED BY public.kit.kit_id;


--
-- Name: poison; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poison (
    poison_id integer NOT NULL,
    poison_type character varying(25) NOT NULL,
    poison_name character varying(30) NOT NULL,
    poison_price integer NOT NULL
);


ALTER TABLE public.poison OWNER TO postgres;

--
-- Name: poison_poison_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.poison_poison_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poison_poison_id_seq OWNER TO postgres;

--
-- Name: poison_poison_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.poison_poison_id_seq OWNED BY public.poison.poison_id;


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
-- Name: tool_tool_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tool_tool_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tool_tool_id_seq OWNER TO postgres;

--
-- Name: tool_tool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tool_tool_id_seq OWNED BY public.tool.tool_id;


--
-- Name: water_transport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.water_transport (
    wt_id integer NOT NULL,
    wt_name character varying(20) NOT NULL,
    wt_price integer NOT NULL,
    wt_speed_mi real,
    wt_speed_km real
);


ALTER TABLE public.water_transport OWNER TO postgres;

--
-- Name: water_transport_wt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.water_transport_wt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.water_transport_wt_id_seq OWNER TO postgres;

--
-- Name: water_transport_wt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.water_transport_wt_id_seq OWNED BY public.water_transport.wt_id;


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
-- Name: weapon_weapon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weapon_weapon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weapon_weapon_id_seq OWNER TO postgres;

--
-- Name: weapon_weapon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weapon_weapon_id_seq OWNED BY public.weapon.weapon_id;


--
-- Name: ammunition ammunition_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ammunition ALTER COLUMN ammunition_id SET DEFAULT nextval('public.ammunition_ammunition_id_seq'::regclass);


--
-- Name: arcane_focus arcane_focus_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arcane_focus ALTER COLUMN arcane_focus_id SET DEFAULT nextval('public.arcane_focus_arcane_focus_id_seq'::regclass);


--
-- Name: armor armor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armor ALTER COLUMN armor_id SET DEFAULT nextval('public.armor_armor_id_seq'::regclass);


--
-- Name: camp camp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camp ALTER COLUMN camp_id SET DEFAULT nextval('public.camp_camp_id_seq'::regclass);


--
-- Name: clothes clothes_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothes ALTER COLUMN clothes_id SET DEFAULT nextval('public.clothes_clothes_id_seq'::regclass);


--
-- Name: consumables consumables_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumables ALTER COLUMN consumables_id SET DEFAULT nextval('public.consumables_consumables_id_seq'::regclass);


--
-- Name: container container_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container ALTER COLUMN container_id SET DEFAULT nextval('public.container_container_id_seq'::regclass);


--
-- Name: druidic_focus druidic_focus_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.druidic_focus ALTER COLUMN druidic_focus_id SET DEFAULT nextval('public.druidic_focus_druidic_focus_id_seq'::regclass);


--
-- Name: explosives explosives_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.explosives ALTER COLUMN explosives_id SET DEFAULT nextval('public.explosives_explosives_id_seq'::regclass);


--
-- Name: firearm firearm_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firearm ALTER COLUMN firearm_id SET DEFAULT nextval('public.firearm_firearm_id_seq'::regclass);


--
-- Name: food food_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food ALTER COLUMN food_id SET DEFAULT nextval('public.food_food_id_seq'::regclass);


--
-- Name: for_horse fh_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.for_horse ALTER COLUMN fh_id SET DEFAULT nextval('public.for_horse_fh_id_seq'::regclass);


--
-- Name: gear gear_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gear ALTER COLUMN gear_id SET DEFAULT nextval('public.gear_gear_id_seq'::regclass);


--
-- Name: holly_simbol holly_simbol_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holly_simbol ALTER COLUMN holly_simbol_id SET DEFAULT nextval('public.holly_simbol_holly_simbol_id_seq'::regclass);


--
-- Name: horse horse_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horse ALTER COLUMN horse_id SET DEFAULT nextval('public.horse_horse_id_seq'::regclass);


--
-- Name: kit kit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kit ALTER COLUMN kit_id SET DEFAULT nextval('public.kit_kit_id_seq'::regclass);


--
-- Name: poison poison_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poison ALTER COLUMN poison_id SET DEFAULT nextval('public.poison_poison_id_seq'::regclass);


--
-- Name: tool tool_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tool ALTER COLUMN tool_id SET DEFAULT nextval('public.tool_tool_id_seq'::regclass);


--
-- Name: water_transport wt_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_transport ALTER COLUMN wt_id SET DEFAULT nextval('public.water_transport_wt_id_seq'::regclass);


--
-- Name: weapon weapon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapon ALTER COLUMN weapon_id SET DEFAULT nextval('public.weapon_weapon_id_seq'::regclass);


--
-- Data for Name: ammunition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ammunition (ammunition_id, ammunition_type, ammunition_name, ammunition_price, ammunition_weight) FROM stdin;
\.


--
-- Data for Name: arcane_focus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.arcane_focus (arcane_focus_id, arcane_focus_type, arcane_focus_name, arcane_focus_price, arcane_focus_weight) FROM stdin;
\.


--
-- Data for Name: armor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.armor (armor_id, armor_type, armor_name, armort_price, armor_weight, armor_class, armor_power, armor_secrecy, armor_to_dress, armor_to_undress) FROM stdin;
\.


--
-- Data for Name: camp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.camp (camp_id, camp_type, camp_name, camp_price, camp_weight) FROM stdin;
\.


--
-- Data for Name: clothes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clothes (clothes_id, clothes_type, clothes_name, clothes_price, clothes_weight) FROM stdin;
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
-- Data for Name: druidic_focus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.druidic_focus (druidic_focus_id, druidic_focus_type, druidic_focus_name, druidic_focus_price, druidic_focus_weight) FROM stdin;
\.


--
-- Data for Name: explosives; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.explosives (explosives_id, explosives_type, explosives_name, explosives_price, explosives_weight) FROM stdin;
\.


--
-- Data for Name: firearm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.firearm (firearm_id, firearm_type, firearm_name, firearm_price, firearm_weight, firearm_damage, firearm_properties) FROM stdin;
\.


--
-- Data for Name: food; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food (food_id, food_type, food_name, food_price) FROM stdin;
\.


--
-- Data for Name: for_horse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.for_horse (fh_id, fh_name, fh_price, fh_weight) FROM stdin;
\.


--
-- Data for Name: gear; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gear (gear_id, gear_type, gear_name, gear_price, gear_weight) FROM stdin;
\.


--
-- Data for Name: holly_simbol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.holly_simbol (holly_simbol_id, holly_simbol_type, holly_simbol_name, holly_simbol_price, holly_simbol_weight) FROM stdin;
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
-- Data for Name: poison; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poison (poison_id, poison_type, poison_name, poison_price) FROM stdin;
\.


--
-- Data for Name: tool; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tool (tool_id, tool_type, tool_name, tool_price, tool_weight) FROM stdin;
\.


--
-- Data for Name: water_transport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.water_transport (wt_id, wt_name, wt_price, wt_speed_mi, wt_speed_km) FROM stdin;
\.


--
-- Data for Name: weapon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weapon (weapon_id, weapon_type, weapon_name, weapon_price, weapon_weight, weapon_damage, weapon_properties) FROM stdin;
\.


--
-- Name: ammunition_ammunition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ammunition_ammunition_id_seq', 1, false);


--
-- Name: arcane_focus_arcane_focus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arcane_focus_arcane_focus_id_seq', 1, false);


--
-- Name: armor_armor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.armor_armor_id_seq', 1, false);


--
-- Name: camp_camp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.camp_camp_id_seq', 1, false);


--
-- Name: clothes_clothes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clothes_clothes_id_seq', 1, false);


--
-- Name: consumables_consumables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consumables_consumables_id_seq', 1, false);


--
-- Name: container_container_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.container_container_id_seq', 1, false);


--
-- Name: druidic_focus_druidic_focus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.druidic_focus_druidic_focus_id_seq', 1, false);


--
-- Name: explosives_explosives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.explosives_explosives_id_seq', 1, false);


--
-- Name: firearm_firearm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.firearm_firearm_id_seq', 1, false);


--
-- Name: food_food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_food_id_seq', 1, false);


--
-- Name: for_horse_fh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.for_horse_fh_id_seq', 1, false);


--
-- Name: gear_gear_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gear_gear_id_seq', 1, false);


--
-- Name: holly_simbol_holly_simbol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.holly_simbol_holly_simbol_id_seq', 1, false);


--
-- Name: horse_horse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horse_horse_id_seq', 1, false);


--
-- Name: kit_kit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kit_kit_id_seq', 1, false);


--
-- Name: poison_poison_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.poison_poison_id_seq', 1, false);


--
-- Name: tool_tool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tool_tool_id_seq', 1, false);


--
-- Name: water_transport_wt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.water_transport_wt_id_seq', 1, false);


--
-- Name: weapon_weapon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weapon_weapon_id_seq', 1, false);


--
-- Name: ammunition ammunition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ammunition
    ADD CONSTRAINT ammunition_pkey PRIMARY KEY (ammunition_id);


--
-- Name: arcane_focus arcane_focus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arcane_focus
    ADD CONSTRAINT arcane_focus_pkey PRIMARY KEY (arcane_focus_id);


--
-- Name: armor armor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armor
    ADD CONSTRAINT armor_pkey PRIMARY KEY (armor_id);


--
-- Name: camp camp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camp
    ADD CONSTRAINT camp_pkey PRIMARY KEY (camp_id);


--
-- Name: clothes clothes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clothes
    ADD CONSTRAINT clothes_pkey PRIMARY KEY (clothes_id);


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
-- Name: druidic_focus druidic_focus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.druidic_focus
    ADD CONSTRAINT druidic_focus_pkey PRIMARY KEY (druidic_focus_id);


--
-- Name: explosives explosives_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.explosives
    ADD CONSTRAINT explosives_pkey PRIMARY KEY (explosives_id);


--
-- Name: firearm firearm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firearm
    ADD CONSTRAINT firearm_pkey PRIMARY KEY (firearm_id);


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
-- Name: holly_simbol holly_simbol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holly_simbol
    ADD CONSTRAINT holly_simbol_pkey PRIMARY KEY (holly_simbol_id);


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
-- Name: poison poison_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poison
    ADD CONSTRAINT poison_pkey PRIMARY KEY (poison_id);


--
-- Name: tool tool_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tool
    ADD CONSTRAINT tool_pkey PRIMARY KEY (tool_id);


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
-- PostgreSQL database dump complete
--

