--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-04-16 11:45:22

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 951 (class 1247 OID 27112)
-- Name: drank; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.drank AS (
	merk character varying(30),
	soort character varying(30),
	brouwerij character varying(30),
	beginjaar integer,
	eindjaar integer
);


ALTER TYPE public.drank OWNER TO postgres;

--
-- TOC entry 271 (class 1255 OID 27121)
-- Name: cast2(public.drank); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.cast2(in_drank public.drank) RETURNS text
    LANGUAGE plpgsql
    AS $$
begin
return in_drank.merk;
end;
$$;


ALTER FUNCTION public.cast2(in_drank public.drank) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 267 (class 1259 OID 27113)
-- Name: dranken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dranken OF public.drank (
    merk NOT NULL
);


ALTER TABLE public.dranken OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 27118)
-- Name: bier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bier (
    alcohol_percentage integer
)
INHERITS (public.dranken);


ALTER TABLE public.bier OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 27094)
-- Name: file_organisations; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.file_organisations (
    index integer,
    tweede integer
)
SERVER file_server
OPTIONS (
    filename E'C:\\Users\\sarah\\Desktop\\semester 4\\test.csv',
    format 'csv'
);


ALTER FOREIGN TABLE public.file_organisations OWNER TO postgres;

--
-- TOC entry 4953 (class 0 OID 27118)
-- Dependencies: 268
-- Data for Name: bier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bier (merk, soort, brouwerij, beginjaar, eindjaar, alcohol_percentage) FROM stdin;
bier2	trappist	Westmalle	1940	2010	10
\.


--
-- TOC entry 4952 (class 0 OID 27113)
-- Dependencies: 267
-- Data for Name: dranken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dranken (merk, soort, brouwerij, beginjaar, eindjaar) FROM stdin;
bier	trappist	Westmalle	1940	2010
\.


--
-- TOC entry 4808 (class 2606 OID 27117)
-- Name: dranken dranken_merk_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dranken
    ADD CONSTRAINT dranken_merk_key UNIQUE (merk);


-- Completed on 2024-04-16 11:45:23

--
-- PostgreSQL database dump complete
--

