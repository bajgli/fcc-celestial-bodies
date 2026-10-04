--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    no_stars integer,
    nearest_galaxy numeric(18,1),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    type character varying(10),
    has_atmosphere boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    has_moon boolean,
    type character varying(10)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    no_planets integer,
    is_dwarf boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
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
-- Name: tablename; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.tablename (
    tablename_id integer NOT NULL,
    name character varying(20) NOT NULL,
    is_thing boolean
);


ALTER TABLE public.tablename OWNER TO freecodecamp;

--
-- Name: tablename_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.tablename_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tablename_table_id_seq OWNER TO freecodecamp;

--
-- Name: tablename_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.tablename_table_id_seq OWNED BY public.tablename.tablename_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: tablename tablename_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tablename ALTER COLUMN tablename_id SET DEFAULT nextval('public.tablename_table_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 250000000, 0.2, 'Barred spiral galaxy that contains our Solar System');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000, 2.5, 'Nearest large spiral galaxy and the most distant object visible to the naked eye');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40000000, 2.7, 'Third-largest member of the Local Group, a small spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 30000000, 0.2, 'Irregular satellite galaxy of the Milky Way');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 100000000, 23.0, 'Classic grand-design spiral interacting with a smaller companion');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 100000000, 29.3, 'Spiral galaxy with a bright nucleus and a prominent dust lane');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Rocky', false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Rocky', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Rocky', false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Rocky', true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Icy', false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Icy', false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Icy', false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Icy', true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'Icy', false);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 'Icy', false);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 'Icy', false);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 'Icy', false);
INSERT INTO public.moon VALUES (13, 'Titania', 7, 'Icy', false);
INSERT INTO public.moon VALUES (14, 'Oberon', 7, 'Icy', false);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 'Icy', false);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 'Icy', false);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 'Icy', false);
INSERT INTO public.moon VALUES (18, 'Triton', 8, 'Icy', true);
INSERT INTO public.moon VALUES (19, 'Nereid', 8, 'Icy', false);
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 'Icy', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 'Rocky');
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 'Rocky');
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 'Earth-like');
INSERT INTO public.planet VALUES (4, 'Mars', 1, true, 'Rocky');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, true, 'Gas');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, true, 'Gas');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, true, 'Ice giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, true, 'Ice giant');
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, false, 'Rocky');
INSERT INTO public.planet VALUES (10, 'Proxima d', 2, false, 'Rocky');
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 4, false, 'Rocky');
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 3, false, 'Rocky');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 8, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 2, true);
INSERT INTO public.star VALUES (3, 'TRAPPIST-1', 1, 7, true);
INSERT INTO public.star VALUES (4, 'Kepler-452', 1, 1, true);
INSERT INTO public.star VALUES (5, 'Sirius', 1, 0, false);
INSERT INTO public.star VALUES (6, 'R136a1', 4, 0, false);


--
-- Data for Name: tablename; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.tablename VALUES (1, 'Nebula', true);
INSERT INTO public.tablename VALUES (2, 'Comet', true);
INSERT INTO public.tablename VALUES (3, 'Asteroid', true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: tablename_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.tablename_table_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: tablename tablename_nameofsmth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tablename
    ADD CONSTRAINT tablename_nameofsmth_key UNIQUE (name);


--
-- Name: tablename tablename_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tablename
    ADD CONSTRAINT tablename_pkey PRIMARY KEY (tablename_id);


--
-- Name: tablename tablename_table_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tablename
    ADD CONSTRAINT tablename_table_id_key UNIQUE (tablename_id);


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
