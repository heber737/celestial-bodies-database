--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    galaxy_type text,
    estimated_mass_in_solar_masses character varying(30),
    average_diameter_in_light_years integer,
    number_of_stars_in_billions numeric,
    distance_from_earth_in_light_years integer
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    mass_in_kg character varying(30),
    diameter_in_km integer,
    orbital_distance_in_km integer,
    rotational_period_in_earth_days numeric,
    average_temp_in_celsius integer,
    has_water boolean,
    has_an_atmosphere boolean,
    planet_id integer
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
-- Name: notable_objects; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.notable_objects (
    notable_objects_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type character varying(40),
    average_orbital_distance_in_au numeric,
    estimated_mass_in_kg character varying(30),
    average_temperature_in_celsius integer,
    rotational_speed_in_km_h numeric,
    orbital_speed_in_km_s numeric,
    orbital_period_in_earth_years numeric,
    notable_facts text
);


ALTER TABLE public.notable_objects OWNER TO freecodecamp;

--
-- Name: notable_objects_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.notable_objects_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notable_objects_object_id_seq OWNER TO freecodecamp;

--
-- Name: notable_objects_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.notable_objects_object_id_seq OWNED BY public.notable_objects.notable_objects_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    planet_type character varying(30),
    diameter_in_km integer,
    "mass_x_10²⁴_kg" numeric,
    average_orbital_distance_in_au numeric,
    orbital_period_in_earth_years numeric,
    rotational_period_in_hours numeric,
    number_of_moons integer,
    has_rings boolean,
    atmospheric_main_components text,
    star_id integer
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    spectral_type character varying(30),
    estimated_mass_in_solar_masses numeric,
    diameter_in_km integer,
    distance_from_earth_in_light_years numeric,
    absolute_magnitude numeric,
    has_planets boolean,
    has_companion_stars boolean,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: notable_objects notable_objects_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.notable_objects ALTER COLUMN notable_objects_id SET DEFAULT nextval('public.notable_objects_object_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Sb; Sbc; SB(rs)bc', '1.15x10^12', 87400, 100, 26439);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'SA(s)b', '1.5x10^12', 152000, 1000, 2500000);
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 'SA(s)cd', '5x10^10', 61120, 40, 3200000);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 4, 'SB(s)m', '1.38x10^10', 32200, 20, 163000);
INSERT INTO public.galaxy VALUES ('NGC 3109', 5, 'SB(s)m', '2.3x10^10', 41700, 0.75, 4348000);
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 6, 'SB(s)m pec', '7x10^9', 18900, 3, 203700);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, '7.34×10^22', 3474, 384400, 27.3, 50, true, false, 3);
INSERT INTO public.moon VALUES ('Phobos', 2, '1.07×10^16', 22530, 9378, 0.32, -4, false, false, 4);
INSERT INTO public.moon VALUES ('Deimos', 3, '1.47×10^15', 12, 23458, 1.26, -40, false, false, 4);
INSERT INTO public.moon VALUES ('Io', 4, '8.93×10^22', 3643, 421700, 1.77, -140, false, false, 5);
INSERT INTO public.moon VALUES ('Europa', 5, '4.80×10^22', 3122, 671034, 3.55, -170, true, false, 5);
INSERT INTO public.moon VALUES ('Ganymede', 6, '1.48×10^23', 5262, 1070412, 7.15, -163, true, false, 5);
INSERT INTO public.moon VALUES ('Callisto', 7, '1.08×10^23', 4821, 1882709, 16.69, -139, true, false, 5);
INSERT INTO public.moon VALUES ('Mimas', 8, '3.75×10^19', 396, 185539, 0.94, -200, true, false, 6);
INSERT INTO public.moon VALUES ('Enceladus', 9, '1.08×10^20', 504, 237948, 1.37, -201, true, false, 6);
INSERT INTO public.moon VALUES ('Tethys', 10, '6.17×10^20', 1062, 294619, 1.89, -187, true, false, 6);
INSERT INTO public.moon VALUES ('Dione', 11, '1.09×10^21', 1123, 377396, 2.74, -186, true, false, 6);
INSERT INTO public.moon VALUES ('Titan', 13, '1.35×10^23', 5149, 1221870, 15.95, -179, true, true, 6);
INSERT INTO public.moon VALUES ('Rhea', 12, '2.31×10^21', 1527, 527108, 4.52, -174, true, false, 6);
INSERT INTO public.moon VALUES ('Iapetus', 14, '1.81×10^21', 1469, 3560820, 79.32, -140, true, false, 6);
INSERT INTO public.moon VALUES ('Miranda', 15, '6.4×10^19', 472, 129800, 1.41, -190, true, false, 7);
INSERT INTO public.moon VALUES ('Ariel', 16, '1.35×10^21', 1158, 190900, 2.52, -210, true, false, 7);
INSERT INTO public.moon VALUES ('Umbriel', 17, '1.17×10^21', 1169, 265970, 4.14, -210, true, false, 7);
INSERT INTO public.moon VALUES ('Titania', 18, '3.4×10^21', 1578, 436300, 8.71, -203, true, false, 7);
INSERT INTO public.moon VALUES ('Oberon', 19, '3.01×10^21', 1523, 582600, 13.46, -203, true, false, 7);
INSERT INTO public.moon VALUES ('Triton', 20, '2.14×10^22', 2706, 354760, 5.88, -235, true, true, 8);


--
-- Data for Name: notable_objects; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.notable_objects VALUES (1, 'Pluto', 'Dwarf Planet', 39.5, '1.3×10^22', -233, 46.9, 4.7, 248, 'Largest object in the Kuiper Belt; once considered a planet.');
INSERT INTO public.notable_objects VALUES (2, 'Ceres', 'Dwarf Planet/Asteroid', 2.77, '9.4×10^20', -106, 329, 17.9, 4.6, 'Largest object in the asteroid belt; has water ice.');
INSERT INTO public.notable_objects VALUES (3, 'Haumea', 'Dwarf Planet', 43.1, '4.0×10^21', -241, 2320, 4.5, 285, 'Extremely fast rotation causes its elongated shape.');
INSERT INTO public.notable_objects VALUES (4, 'Makemake', 'Dwarf Planet', 45.8, '3.1×10^21', -243, 20.62, 4.4, 306.22, 'Second brightest object in the Kuiper Belt after Pluto.');
INSERT INTO public.notable_objects VALUES (5, 'Eris', 'Dwarf Planet', 67.8, '1.6×10^22', -243, 21.7, 3.4, 557, 'More massive than Pluto; discovery led to Plutos reclassification.');
INSERT INTO public.notable_objects VALUES (6, 'Vesta', 'Asteroid', 2.36, '2.59×10^20', -3, 50.2, 19.3, 3.64, 'Second largest asteroid; has basaltic surface.');
INSERT INTO public.notable_objects VALUES (7, 'Pallas', 'Asteroid', 2.77, '2.1×10^20', -3, 23.3, 17.9, 4.61, 'Third largest asteroid; highly inclined orbit.');
INSERT INTO public.notable_objects VALUES (8, 'Hyakutake (C/1996 B2)', 'Comet', NULL, '2.5×10^13', NULL, NULL, 0.65, 70000, 'Exceptionally bright comet of the 20th century.');
INSERT INTO public.notable_objects VALUES (9, 'Halleys Comet (1P/Halley)', 'Comet', NULL, '2.2×10^14', NULL, NULL, 7, 76, 'Most famous periodic comet, visible to the naked eye.');
INSERT INTO public.notable_objects VALUES (10, 'Oumuamua (1I/2017 U1)', 'Interstellar Object', NULL, NULL, NULL, NULL, NULL, NULL, 'First observed interstellar object passing through our solar system.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 'Terrestrial', 4879, 0.33, 0.39, 0.24, 1406.4, 0, false, 'Trace exosphere (Hydrogen, Helium, Oxygen, Sodium, Calcium, Potassium)', 1);
INSERT INTO public.planet VALUES ('Venus', 2, 'Terrestrial', 12104, 4.87, 0.72, 0.62, 5832, 0, false, 'Carbon Dioxide, Nitrogen', 1);
INSERT INTO public.planet VALUES ('Earth', 3, 'Terrestrial', 12742, 5.97, 1, 1, 23.9, 1, false, 'Nitrogen, Oxygen, Argon', 1);
INSERT INTO public.planet VALUES ('Mars', 4, 'Terrestrial', 6779, 0.642, 1.52, 1.88, 24.6, 2, false, 'Carbon Dioxide, Nitrogen, Argon', 1);
INSERT INTO public.planet VALUES ('Jupiter', 5, 'Gas Giant', 139820, 1898, 5.2, 11.86, 9.9, 95, true, 'Hydrogen, Helium', 1);
INSERT INTO public.planet VALUES ('Saturn', 6, 'Gas Giant', 116460, 568, 9.58, 29.45, 10.7, 146, true, 'Hydrogen, Helium', 1);
INSERT INTO public.planet VALUES ('Neptune', 8, 'Ice Giant', 49244, 102, 30.05, 164.79, 16.1, 14, true, 'Hydrogen, Helium, Methane', 1);
INSERT INTO public.planet VALUES ('Uranus', 7, 'Ice Giant', 50724, 86.8, 19.22, 84.02, 17.2, 27, true, 'Hydrogen, Helium, Methane', 1);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 10, 'Terrestrial (not confirmed)', 15290, 6.4, 0.04856, 11.186, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('GJ 1289 b', 11, 'Ice Giant', 29781, 37.44, 0.27, 0.3060274, NULL, NULL, NULL, NULL, 11);
INSERT INTO public.planet VALUES ('Kepler-186b', 12, 'Terrestrial', 13761, 7.402, 0.0378, 0.0106487416438, NULL, NULL, false, NULL, 12);
INSERT INTO public.planet VALUES ('Kepler-186f', 13, 'Terrestrial', 18348, 8.598, 0.43, 0.356164, NULL, NULL, false, NULL, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 'G2V', 1, 1391400, 0.0000158125, 4.83, true, false, 1);
INSERT INTO public.star VALUES ('Proxima Centauri', 2, 'M5.5', 0.1221, 214550, 4.2465, 15.60, true, false, 1);
INSERT INTO public.star VALUES ('Rigil Kentaurus', 3, 'G2V', 1.0788, 1702240, 4.344, 4.38, false, true, 1);
INSERT INTO public.star VALUES ('Toliman', 4, 'K1V', 0.9092, 1201600, 4.344, 5.71, true, true, 1);
INSERT INTO public.star VALUES ('Betelgeuse', 5, 'M1–M2 Ia–ab', 16.5, 1234171800, 408, -5.85, false, true, 1);
INSERT INTO public.star VALUES ('Rigel', 6, 'B8Iab', 18, 109781500, 864.3, -6.69, false, true, 1);
INSERT INTO public.star VALUES ('Vega', 7, 'A0Va', 2.135, 3280000, 25.04, 0.582, false, false, 1);
INSERT INTO public.star VALUES ('Alpheratz', 8, 'B8IV', 3.64, 4090000, 97.02, -0.193, false, true, 1);
INSERT INTO public.star VALUES ('Beta Trianguli', 9, 'A8III', 2.6, 6090000, 141, 0.035, false, true, 1);
INSERT INTO public.star VALUES ('WOH G64', 10, 'M7.5Ie + B', 19, 1110000000, 160000, -6.00, false, true, 4);
INSERT INTO public.star VALUES ('GJ 1289', 11, 'M4.5Ve', 0.21, 340893, 28.89746, NULL, true, false, 1);
INSERT INTO public.star VALUES ('Kepler-186', 12, 'M1V', 0.544, 727702, 582, NULL, true, false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: notable_objects_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.notable_objects_object_id_seq', 10, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
-- Name: notable_objects notable_objects_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.notable_objects
    ADD CONSTRAINT notable_objects_name_key UNIQUE (name);


--
-- Name: notable_objects notable_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.notable_objects
    ADD CONSTRAINT notable_objects_pkey PRIMARY KEY (notable_objects_id);


--
-- Name: notable_objects object_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.notable_objects
    ADD CONSTRAINT object_id_unique UNIQUE (notable_objects_id);


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
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

