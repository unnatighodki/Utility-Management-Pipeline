--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-02-24 22:42:12 EST

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

DROP DATABASE "DW_Utility_Management";
--
-- TOC entry 3727 (class 1262 OID 32806)
-- Name: DW_Utility_Management; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "DW_Utility_Management" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE "DW_Utility_Management" OWNER TO postgres;

\connect "DW_Utility_Management"

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
-- TOC entry 6 (class 2615 OID 33121)
-- Name: DW_Utility_Management; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "DW_Utility_Management";


ALTER SCHEMA "DW_Utility_Management" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 243 (class 1259 OID 33066)
-- Name: bills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bills (
    providerid integer NOT NULL,
    paymentid integer NOT NULL,
    facilityid integer NOT NULL,
    fromdatekey integer NOT NULL,
    todatekey integer NOT NULL,
    billamount double precision,
    unitprice double precision,
    deliverycost double precision,
    supplycost double precision,
    usageperiod double precision
);


ALTER TABLE public.bills OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 32947)
-- Name: calendarquarter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calendarquarter (
    calendarquarterid integer NOT NULL,
    calendarquarter character varying(20),
    calendaryearid integer
);


ALTER TABLE public.calendarquarter OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 32946)
-- Name: calendarquarter_calendarquarterid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calendarquarter_calendarquarterid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calendarquarter_calendarquarterid_seq OWNER TO postgres;

--
-- TOC entry 3728 (class 0 OID 0)
-- Dependencies: 235
-- Name: calendarquarter_calendarquarterid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calendarquarter_calendarquarterid_seq OWNED BY public.calendarquarter.calendarquarterid;


--
-- TOC entry 234 (class 1259 OID 32940)
-- Name: calendaryear; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calendaryear (
    calendaryearid integer NOT NULL,
    calendaryear integer,
    leapyearflag boolean
);


ALTER TABLE public.calendaryear OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 32939)
-- Name: calendaryear_calendaryearid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calendaryear_calendaryearid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calendaryear_calendaryearid_seq OWNER TO postgres;

--
-- TOC entry 3729 (class 0 OID 0)
-- Dependencies: 233
-- Name: calendaryear_calendaryearid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calendaryear_calendaryearid_seq OWNED BY public.calendaryear.calendaryearid;


--
-- TOC entry 218 (class 1259 OID 32831)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    cityid integer NOT NULL,
    city character varying(50),
    stateid integer
);


ALTER TABLE public.city OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 32830)
-- Name: city_cityid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_cityid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_cityid_seq OWNER TO postgres;

--
-- TOC entry 3730 (class 0 OID 0)
-- Dependencies: 217
-- Name: city_cityid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_cityid_seq OWNED BY public.city.cityid;


--
-- TOC entry 244 (class 1259 OID 33096)
-- Name: consumption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumption (
    providerid integer NOT NULL,
    facilityid integer NOT NULL,
    fromdatekey integer NOT NULL,
    todatekey integer NOT NULL,
    numberofunits double precision,
    averageunits double precision,
    usageperiod double precision
);


ALTER TABLE public.consumption OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 32990)
-- Name: dates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dates (
    dateid integer NOT NULL,
    actualdate date,
    dayoftheweek integer,
    weekendflag boolean,
    holidayflag boolean,
    monthid integer
);


ALTER TABLE public.dates OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 32989)
-- Name: dates_dateid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dates_dateid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dates_dateid_seq OWNER TO postgres;

--
-- TOC entry 3731 (class 0 OID 0)
-- Dependencies: 239
-- Name: dates_dateid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dates_dateid_seq OWNED BY public.dates.dateid;


--
-- TOC entry 220 (class 1259 OID 32843)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    departmentid integer NOT NULL,
    departmentname character varying(250),
    departmentdescription character varying(1000),
    departmentshortname character varying(250)
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 32842)
-- Name: department_departmentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_departmentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_departmentid_seq OWNER TO postgres;

--
-- TOC entry 3732 (class 0 OID 0)
-- Dependencies: 219
-- Name: department_departmentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_departmentid_seq OWNED BY public.department.departmentid;


--
-- TOC entry 224 (class 1259 OID 32869)
-- Name: enterprise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enterprise (
    enterpriseid integer NOT NULL,
    enterprisetypename character varying(250),
    enterprisedescription character varying(1000)
);


ALTER TABLE public.enterprise OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 32868)
-- Name: enterprise_enterpriseid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enterprise_enterpriseid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enterprise_enterpriseid_seq OWNER TO postgres;

--
-- TOC entry 3733 (class 0 OID 0)
-- Dependencies: 223
-- Name: enterprise_enterpriseid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enterprise_enterpriseid_seq OWNED BY public.enterprise.enterpriseid;


--
-- TOC entry 222 (class 1259 OID 32852)
-- Name: facility; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facility (
    facilityid integer NOT NULL,
    supervisorname character varying(50),
    supervisoremail character varying(20),
    area double precision,
    numberoffloors integer,
    streetaddress character varying(250),
    postalcode integer,
    departmentid integer,
    cityid integer
);


ALTER TABLE public.facility OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 32851)
-- Name: facility_facilityid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facility_facilityid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facility_facilityid_seq OWNER TO postgres;

--
-- TOC entry 3734 (class 0 OID 0)
-- Dependencies: 221
-- Name: facility_facilityid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facility_facilityid_seq OWNED BY public.facility.facilityid;


--
-- TOC entry 232 (class 1259 OID 32928)
-- Name: fiscalquarter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fiscalquarter (
    fiscalquarterid integer NOT NULL,
    fiscalquarter integer,
    fiscalyearid integer
);


ALTER TABLE public.fiscalquarter OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 32927)
-- Name: fiscalquarter_fiscalquarterid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fiscalquarter_fiscalquarterid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fiscalquarter_fiscalquarterid_seq OWNER TO postgres;

--
-- TOC entry 3735 (class 0 OID 0)
-- Dependencies: 231
-- Name: fiscalquarter_fiscalquarterid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fiscalquarter_fiscalquarterid_seq OWNED BY public.fiscalquarter.fiscalquarterid;


--
-- TOC entry 230 (class 1259 OID 32921)
-- Name: fiscalyear; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fiscalyear (
    fiscalyearid integer NOT NULL,
    fiscalyear integer,
    leapyearflag boolean
);


ALTER TABLE public.fiscalyear OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 32920)
-- Name: fiscalyear_fiscalyearid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fiscalyear_fiscalyearid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fiscalyear_fiscalyearid_seq OWNER TO postgres;

--
-- TOC entry 3736 (class 0 OID 0)
-- Dependencies: 229
-- Name: fiscalyear_fiscalyearid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fiscalyear_fiscalyearid_seq OWNED BY public.fiscalyear.fiscalyearid;


--
-- TOC entry 238 (class 1259 OID 32973)
-- Name: months; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.months (
    monthid integer NOT NULL,
    monthnumber integer,
    monthfullname character varying(10),
    monthshortname character varying(10),
    fiscalquarterid integer,
    calendarquarterid integer
);


ALTER TABLE public.months OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 32972)
-- Name: months_monthid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.months_monthid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.months_monthid_seq OWNER TO postgres;

--
-- TOC entry 3737 (class 0 OID 0)
-- Dependencies: 237
-- Name: months_monthid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.months_monthid_seq OWNED BY public.months.monthid;


--
-- TOC entry 242 (class 1259 OID 33003)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    paymentid integer NOT NULL,
    paymentmethod character varying(250),
    accountowner character varying(250),
    accountownername character varying(50),
    bankname character varying(250),
    bankaddress character varying(250),
    postalcode integer,
    cityid integer
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 33002)
-- Name: payment_paymentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_paymentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_paymentid_seq OWNER TO postgres;

--
-- TOC entry 3738 (class 0 OID 0)
-- Dependencies: 241
-- Name: payment_paymentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_paymentid_seq OWNED BY public.payment.paymentid;


--
-- TOC entry 226 (class 1259 OID 32878)
-- Name: providercategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.providercategory (
    providercategoryid integer NOT NULL,
    enterprisetypename character varying(250),
    providercategorydescription character varying(1000)
);


ALTER TABLE public.providercategory OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 32877)
-- Name: providercategory_providercategoryid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.providercategory_providercategoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.providercategory_providercategoryid_seq OWNER TO postgres;

--
-- TOC entry 3739 (class 0 OID 0)
-- Dependencies: 225
-- Name: providercategory_providercategoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.providercategory_providercategoryid_seq OWNED BY public.providercategory.providercategoryid;


--
-- TOC entry 216 (class 1259 OID 32824)
-- Name: states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.states (
    stateid integer NOT NULL,
    statename character varying(50),
    statenameshort character varying(10),
    country character varying(20)
);


ALTER TABLE public.states OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 32823)
-- Name: states_stateid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.states_stateid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_stateid_seq OWNER TO postgres;

--
-- TOC entry 3740 (class 0 OID 0)
-- Dependencies: 215
-- Name: states_stateid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.states_stateid_seq OWNED BY public.states.stateid;


--
-- TOC entry 228 (class 1259 OID 32899)
-- Name: utilityprovider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilityprovider (
    providerid integer NOT NULL,
    providername character varying(50),
    description character varying(250),
    streetaddress character varying(100),
    postalcode integer,
    cityid integer,
    enterpriseid integer,
    providercategoryid integer
);


ALTER TABLE public.utilityprovider OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 32898)
-- Name: utilityprovider_providerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilityprovider_providerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilityprovider_providerid_seq OWNER TO postgres;

--
-- TOC entry 3741 (class 0 OID 0)
-- Dependencies: 227
-- Name: utilityprovider_providerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilityprovider_providerid_seq OWNED BY public.utilityprovider.providerid;


--
-- TOC entry 3523 (class 2604 OID 32950)
-- Name: calendarquarter calendarquarterid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendarquarter ALTER COLUMN calendarquarterid SET DEFAULT nextval('public.calendarquarter_calendarquarterid_seq'::regclass);


--
-- TOC entry 3522 (class 2604 OID 32943)
-- Name: calendaryear calendaryearid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendaryear ALTER COLUMN calendaryearid SET DEFAULT nextval('public.calendaryear_calendaryearid_seq'::regclass);


--
-- TOC entry 3514 (class 2604 OID 32834)
-- Name: city cityid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN cityid SET DEFAULT nextval('public.city_cityid_seq'::regclass);


--
-- TOC entry 3525 (class 2604 OID 32993)
-- Name: dates dateid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dates ALTER COLUMN dateid SET DEFAULT nextval('public.dates_dateid_seq'::regclass);


--
-- TOC entry 3515 (class 2604 OID 32846)
-- Name: department departmentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN departmentid SET DEFAULT nextval('public.department_departmentid_seq'::regclass);


--
-- TOC entry 3517 (class 2604 OID 32872)
-- Name: enterprise enterpriseid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enterprise ALTER COLUMN enterpriseid SET DEFAULT nextval('public.enterprise_enterpriseid_seq'::regclass);


--
-- TOC entry 3516 (class 2604 OID 32855)
-- Name: facility facilityid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility ALTER COLUMN facilityid SET DEFAULT nextval('public.facility_facilityid_seq'::regclass);


--
-- TOC entry 3521 (class 2604 OID 32931)
-- Name: fiscalquarter fiscalquarterid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscalquarter ALTER COLUMN fiscalquarterid SET DEFAULT nextval('public.fiscalquarter_fiscalquarterid_seq'::regclass);


--
-- TOC entry 3520 (class 2604 OID 32924)
-- Name: fiscalyear fiscalyearid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscalyear ALTER COLUMN fiscalyearid SET DEFAULT nextval('public.fiscalyear_fiscalyearid_seq'::regclass);


--
-- TOC entry 3524 (class 2604 OID 32976)
-- Name: months monthid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.months ALTER COLUMN monthid SET DEFAULT nextval('public.months_monthid_seq'::regclass);


--
-- TOC entry 3526 (class 2604 OID 33006)
-- Name: payment paymentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN paymentid SET DEFAULT nextval('public.payment_paymentid_seq'::regclass);


--
-- TOC entry 3518 (class 2604 OID 32881)
-- Name: providercategory providercategoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.providercategory ALTER COLUMN providercategoryid SET DEFAULT nextval('public.providercategory_providercategoryid_seq'::regclass);


--
-- TOC entry 3513 (class 2604 OID 32827)
-- Name: states stateid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states ALTER COLUMN stateid SET DEFAULT nextval('public.states_stateid_seq'::regclass);


--
-- TOC entry 3519 (class 2604 OID 32902)
-- Name: utilityprovider providerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilityprovider ALTER COLUMN providerid SET DEFAULT nextval('public.utilityprovider_providerid_seq'::regclass);


--
-- TOC entry 3556 (class 2606 OID 33070)
-- Name: bills bills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (providerid, paymentid, facilityid, fromdatekey, todatekey);


--
-- TOC entry 3548 (class 2606 OID 32952)
-- Name: calendarquarter calendarquarter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendarquarter
    ADD CONSTRAINT calendarquarter_pkey PRIMARY KEY (calendarquarterid);


--
-- TOC entry 3546 (class 2606 OID 32945)
-- Name: calendaryear calendaryear_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendaryear
    ADD CONSTRAINT calendaryear_pkey PRIMARY KEY (calendaryearid);


--
-- TOC entry 3530 (class 2606 OID 32836)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (cityid);


--
-- TOC entry 3558 (class 2606 OID 33100)
-- Name: consumption consumption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumption
    ADD CONSTRAINT consumption_pkey PRIMARY KEY (providerid, facilityid, fromdatekey, todatekey);


--
-- TOC entry 3552 (class 2606 OID 32995)
-- Name: dates dates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dates
    ADD CONSTRAINT dates_pkey PRIMARY KEY (dateid);


--
-- TOC entry 3532 (class 2606 OID 32850)
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (departmentid);


--
-- TOC entry 3536 (class 2606 OID 32876)
-- Name: enterprise enterprise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enterprise
    ADD CONSTRAINT enterprise_pkey PRIMARY KEY (enterpriseid);


--
-- TOC entry 3534 (class 2606 OID 32857)
-- Name: facility facility_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility
    ADD CONSTRAINT facility_pkey PRIMARY KEY (facilityid);


--
-- TOC entry 3544 (class 2606 OID 32933)
-- Name: fiscalquarter fiscalquarter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscalquarter
    ADD CONSTRAINT fiscalquarter_pkey PRIMARY KEY (fiscalquarterid);


--
-- TOC entry 3542 (class 2606 OID 32926)
-- Name: fiscalyear fiscalyear_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscalyear
    ADD CONSTRAINT fiscalyear_pkey PRIMARY KEY (fiscalyearid);


--
-- TOC entry 3550 (class 2606 OID 32978)
-- Name: months months_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.months
    ADD CONSTRAINT months_pkey PRIMARY KEY (monthid);


--
-- TOC entry 3554 (class 2606 OID 33010)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (paymentid);


--
-- TOC entry 3538 (class 2606 OID 32885)
-- Name: providercategory providercategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.providercategory
    ADD CONSTRAINT providercategory_pkey PRIMARY KEY (providercategoryid);


--
-- TOC entry 3528 (class 2606 OID 32829)
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (stateid);


--
-- TOC entry 3540 (class 2606 OID 32904)
-- Name: utilityprovider utilityprovider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilityprovider
    ADD CONSTRAINT utilityprovider_pkey PRIMARY KEY (providerid);


--
-- TOC entry 3571 (class 2606 OID 33081)
-- Name: bills bills_facilityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_facilityid_fkey FOREIGN KEY (facilityid) REFERENCES public.facility(facilityid);


--
-- TOC entry 3572 (class 2606 OID 33086)
-- Name: bills bills_fromdatekey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_fromdatekey_fkey FOREIGN KEY (fromdatekey) REFERENCES public.dates(dateid);


--
-- TOC entry 3573 (class 2606 OID 33076)
-- Name: bills bills_paymentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_paymentid_fkey FOREIGN KEY (paymentid) REFERENCES public.payment(paymentid);


--
-- TOC entry 3574 (class 2606 OID 33071)
-- Name: bills bills_providerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_providerid_fkey FOREIGN KEY (providerid) REFERENCES public.utilityprovider(providerid);


--
-- TOC entry 3575 (class 2606 OID 33091)
-- Name: bills bills_todatekey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_todatekey_fkey FOREIGN KEY (todatekey) REFERENCES public.dates(dateid);


--
-- TOC entry 3566 (class 2606 OID 32953)
-- Name: calendarquarter calendarquarter_calendaryearid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendarquarter
    ADD CONSTRAINT calendarquarter_calendaryearid_fkey FOREIGN KEY (calendaryearid) REFERENCES public.fiscalyear(fiscalyearid);


--
-- TOC entry 3559 (class 2606 OID 32837)
-- Name: city city_stateid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_stateid_fkey FOREIGN KEY (stateid) REFERENCES public.states(stateid);


--
-- TOC entry 3576 (class 2606 OID 33106)
-- Name: consumption consumption_facilityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumption
    ADD CONSTRAINT consumption_facilityid_fkey FOREIGN KEY (facilityid) REFERENCES public.facility(facilityid);


--
-- TOC entry 3577 (class 2606 OID 33111)
-- Name: consumption consumption_fromdatekey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumption
    ADD CONSTRAINT consumption_fromdatekey_fkey FOREIGN KEY (fromdatekey) REFERENCES public.dates(dateid);


--
-- TOC entry 3578 (class 2606 OID 33101)
-- Name: consumption consumption_providerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumption
    ADD CONSTRAINT consumption_providerid_fkey FOREIGN KEY (providerid) REFERENCES public.utilityprovider(providerid);


--
-- TOC entry 3579 (class 2606 OID 33116)
-- Name: consumption consumption_todatekey_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumption
    ADD CONSTRAINT consumption_todatekey_fkey FOREIGN KEY (todatekey) REFERENCES public.dates(dateid);


--
-- TOC entry 3569 (class 2606 OID 32996)
-- Name: dates dates_monthid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dates
    ADD CONSTRAINT dates_monthid_fkey FOREIGN KEY (monthid) REFERENCES public.months(monthid);


--
-- TOC entry 3560 (class 2606 OID 32863)
-- Name: facility facility_cityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility
    ADD CONSTRAINT facility_cityid_fkey FOREIGN KEY (cityid) REFERENCES public.city(cityid);


--
-- TOC entry 3561 (class 2606 OID 32858)
-- Name: facility facility_departmentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility
    ADD CONSTRAINT facility_departmentid_fkey FOREIGN KEY (departmentid) REFERENCES public.department(departmentid);


--
-- TOC entry 3565 (class 2606 OID 32934)
-- Name: fiscalquarter fiscalquarter_fiscalyearid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscalquarter
    ADD CONSTRAINT fiscalquarter_fiscalyearid_fkey FOREIGN KEY (fiscalyearid) REFERENCES public.fiscalyear(fiscalyearid);


--
-- TOC entry 3567 (class 2606 OID 32984)
-- Name: months months_calendarquarterid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.months
    ADD CONSTRAINT months_calendarquarterid_fkey FOREIGN KEY (calendarquarterid) REFERENCES public.calendarquarter(calendarquarterid);


--
-- TOC entry 3568 (class 2606 OID 32979)
-- Name: months months_fiscalquarterid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.months
    ADD CONSTRAINT months_fiscalquarterid_fkey FOREIGN KEY (fiscalquarterid) REFERENCES public.fiscalquarter(fiscalquarterid);


--
-- TOC entry 3570 (class 2606 OID 33011)
-- Name: payment payment_cityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_cityid_fkey FOREIGN KEY (cityid) REFERENCES public.city(cityid);


--
-- TOC entry 3562 (class 2606 OID 32905)
-- Name: utilityprovider utilityprovider_cityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilityprovider
    ADD CONSTRAINT utilityprovider_cityid_fkey FOREIGN KEY (cityid) REFERENCES public.city(cityid);


--
-- TOC entry 3563 (class 2606 OID 32910)
-- Name: utilityprovider utilityprovider_enterpriseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilityprovider
    ADD CONSTRAINT utilityprovider_enterpriseid_fkey FOREIGN KEY (enterpriseid) REFERENCES public.enterprise(enterpriseid);


--
-- TOC entry 3564 (class 2606 OID 32915)
-- Name: utilityprovider utilityprovider_providercategoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilityprovider
    ADD CONSTRAINT utilityprovider_providercategoryid_fkey FOREIGN KEY (providercategoryid) REFERENCES public.providercategory(providercategoryid);


-- Completed on 2023-02-24 22:42:13 EST

--
-- PostgreSQL database dump complete
--

