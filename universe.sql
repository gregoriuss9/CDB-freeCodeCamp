--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    star_id integer,
    volume integer,
    year_discovered integer,
    has_life boolean,
    has_water boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    volume integer,
    year_discovered integer,
    has_life boolean,
    has_water boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    object_id integer,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    has_life boolean NOT NULL,
    distance_from_earth numeric(7,2),
    volume integer,
    year_discovered integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    galaxy_id integer,
    volume integer,
    year_discovered integer,
    has_life boolean,
    has_water boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy A', 'this is galaxy A', 1, 1000, 1881, true, false);
INSERT INTO public.galaxy VALUES (2, 'galaxy B', 'this is galaxy B', 2, 1000, 1881, true, false);
INSERT INTO public.galaxy VALUES (3, 'galaxy C', 'this is galaxy C', 3, 1000, 1823, false, true);
INSERT INTO public.galaxy VALUES (4, 'galaxy D', 'this is galaxy D', 4, 1000, 1773, false, true);
INSERT INTO public.galaxy VALUES (5, 'galaxy 5', 'this is galaxy 5', 5, 1000, 1881, true, false);
INSERT INTO public.galaxy VALUES (6, 'galaxy F', 'this is galaxy F', 6, 1000, 1823, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon A', 'lorem ipsum', 1200, 1997, true, true, 1);
INSERT INTO public.moon VALUES (2, 'moon B', 'lorem ipsum', 1200, 1997, true, true, 2);
INSERT INTO public.moon VALUES (3, 'moon C', 'lorem ipsum', 1200, 1997, true, true, 3);
INSERT INTO public.moon VALUES (4, 'moon D', 'lorem ipsum', 1200, 1997, false, true, 4);
INSERT INTO public.moon VALUES (5, 'moon E', 'lorem ipsum', 1200, 1997, true, false, 5);
INSERT INTO public.moon VALUES (6, 'moon F', 'lorem ipsum', 1200, 1997, true, true, 6);
INSERT INTO public.moon VALUES (7, 'moon G', 'lorem ipsum', 1200, 1997, true, true, 7);
INSERT INTO public.moon VALUES (8, 'moon H', 'lorem ipsum', 1200, 1997, true, true, 8);
INSERT INTO public.moon VALUES (9, 'moon I', 'lorem ipsum', 1200, 1997, true, true, 9);
INSERT INTO public.moon VALUES (10, 'moon J', 'lorem ipsum', 1200, 1997, true, true, 10);
INSERT INTO public.moon VALUES (11, 'moon K', 'lorem ipsum', 1200, 1997, true, true, 11);
INSERT INTO public.moon VALUES (12, 'moon L', 'lorem ipsum', 1200, 1997, true, true, 12);
INSERT INTO public.moon VALUES (13, 'moon M', 'lorem ipsum', 1200, 1997, true, true, 1);
INSERT INTO public.moon VALUES (14, 'moon N', 'lorem ipsum', 1200, 1997, false, true, 2);
INSERT INTO public.moon VALUES (15, 'moon O', 'lorem ipsum', 1200, 1997, true, false, 3);
INSERT INTO public.moon VALUES (16, 'moon P', 'lorem ipsum', 1200, 1997, true, true, 4);
INSERT INTO public.moon VALUES (17, 'moon Q', 'lorem ipsum', 1200, 1997, true, true, 5);
INSERT INTO public.moon VALUES (18, 'moon R', 'lorem ipsum', 1200, 1997, true, true, 6);
INSERT INTO public.moon VALUES (19, 'moon S', 'lorem ipsum', 1200, 1997, true, true, 7);
INSERT INTO public.moon VALUES (20, 'moon T', 'lorem ipsum', 1200, 1997, true, true, 8);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 1, 'info1', 'lorem impsum');
INSERT INTO public.more_info VALUES (2, 2, 'info2', 'lorem impsum');
INSERT INTO public.more_info VALUES (3, 3, 'info3', 'lorem impsum');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet A', 'this is planet A', true, NULL, 1500, 1881, 1);
INSERT INTO public.planet VALUES (2, 'planet B', 'this is planet B', false, 1800.34, 1600, 1802, 2);
INSERT INTO public.planet VALUES (3, 'planet C', 'this is planet C', false, 100.78, 1600, 1880, 3);
INSERT INTO public.planet VALUES (4, 'planet D', 'this is planet D', true, 100.78, 1600, 1880, 4);
INSERT INTO public.planet VALUES (5, 'planet E', 'this is planet E', true, 1550.78, 1600, 1880, 5);
INSERT INTO public.planet VALUES (6, 'planet F', 'this is planet F', false, 200.78, 1600, 1880, 6);
INSERT INTO public.planet VALUES (7, 'planet G', 'this is planet G', false, 100.78, 1600, 1880, 1);
INSERT INTO public.planet VALUES (8, 'planet H', 'this is planet H', false, 100.68, 1600, 1880, 2);
INSERT INTO public.planet VALUES (9, 'planet I', 'this is planet I', false, 100.78, 1600, 1880, 3);
INSERT INTO public.planet VALUES (10, 'planet J', 'this is planet J', true, 100.78, 1600, 1880, 4);
INSERT INTO public.planet VALUES (11, 'planet K', 'this is planet K', true, 1550.78, 1600, 1880, 5);
INSERT INTO public.planet VALUES (12, 'planet L', 'this is planet L', false, 200.78, 1600, 1880, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star A', 'this is star A', 1, 1000, 1881, true, false);
INSERT INTO public.star VALUES (2, 'star B', 'this is star B', 2, 1000, 1881, true, false);
INSERT INTO public.star VALUES (3, 'star C', 'this is star C', 3, 1000, 1823, false, true);
INSERT INTO public.star VALUES (4, 'star D', 'this is star D', 4, 1000, 1773, false, true);
INSERT INTO public.star VALUES (5, 'star E', 'this is star E', 5, 1000, 1883, false, false);
INSERT INTO public.star VALUES (6, 'star F', 'this is star F', 6, 1000, 1902, true, true);


--
-- Name: galaxy_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

