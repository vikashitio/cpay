--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-10-04 12:19:00

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
-- TOC entry 246 (class 1259 OID 17374)
-- Name: acquirer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acquirer (
    acquirer_id smallint NOT NULL,
    acquirer_title character varying(200) NOT NULL,
    api_key character varying(200),
    secret_key character varying(200),
    endpoint_url character varying(200),
    callback_url character varying(200),
    success_url character varying(200),
    failed_url character varying(200),
    json_data json,
    status smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.acquirer OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 17373)
-- Name: acquirer_acquirer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.acquirer ALTER COLUMN acquirer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.acquirer_acquirer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 16969)
-- Name: admin_master; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_master (
    admin_id smallint NOT NULL,
    username character varying(100) DEFAULT NULL::character varying,
    password character varying(100) DEFAULT NULL::character varying,
    full_name character varying(50),
    status smallint DEFAULT 1,
    "timestamp" timestamp with time zone DEFAULT now(),
    role character varying(20)
);


ALTER TABLE public.admin_master OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16978)
-- Name: admin_master_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.admin_master ALTER COLUMN admin_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.admin_master_admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16716)
-- Name: transaction_master; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_master (
    id smallint NOT NULL,
    transaction_id character varying(100) NOT NULL,
    client_id smallint NOT NULL,
    volt_id character varying(20) NOT NULL,
    assetid character varying(50) NOT NULL,
    transaction_type character varying(100) DEFAULT now() NOT NULL,
    requestedamount double precision DEFAULT 0.0 NOT NULL,
    amount double precision NOT NULL,
    netamount double precision DEFAULT 0.0 NOT NULL,
    amountusd double precision DEFAULT 0.0 NOT NULL,
    fee double precision DEFAULT 0.0 NOT NULL,
    networkfee double precision DEFAULT 0.0 NOT NULL,
    status character varying(50),
    substatus character varying(200),
    txhash character varying(200),
    operation character varying(100),
    customerrefid character varying(50),
    ip character varying(30),
    source character varying(200),
    destination555 character varying(200),
    note character varying(200),
    createdate timestamp without time zone DEFAULT now() NOT NULL,
    lastupdated timestamp without time zone DEFAULT now() NOT NULL,
    destinationaddress character varying(200),
    createdby character varying(100)
);


ALTER TABLE public.transaction_master OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16715)
-- Name: c_master_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.transaction_master ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.c_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 254 (class 1259 OID 17467)
-- Name: client_api; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_api (
    id smallint NOT NULL,
    client_id smallint NOT NULL,
    apikey character varying(100),
    status smallint DEFAULT 1,
    "timestamp" timestamp with time zone DEFAULT now()
);


ALTER TABLE public.client_api OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 17466)
-- Name: client_api_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.client_api ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.client_api_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16562)
-- Name: client_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_details (
    client_id smallint NOT NULL,
    title character varying(5) DEFAULT NULL::character varying,
    gender character varying(1) DEFAULT NULL::character varying,
    birth_date character varying(30) DEFAULT NULL::character varying,
    country_code character varying(5) DEFAULT NULL::character varying,
    mobile character varying(20) DEFAULT NULL::character varying,
    address_line1 character varying(100) DEFAULT NULL::character varying,
    address_line2 character varying(100) DEFAULT NULL::character varying,
    city character varying(50) DEFAULT NULL::character varying,
    state character varying(50) DEFAULT NULL::character varying,
    country character varying(50) DEFAULT NULL::character varying,
    pincode character varying(10) DEFAULT NULL::character varying,
    add_date character varying(30) DEFAULT NULL::character varying,
    json_log_history character varying(22302) DEFAULT NULL::character varying,
    id smallint NOT NULL
);


ALTER TABLE public.client_details OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16640)
-- Name: client_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.client_details ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.client_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 248 (class 1259 OID 17382)
-- Name: client_fees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_fees (
    fee_id smallint NOT NULL,
    min_amount_fee double precision,
    amount_fee_in_percent double precision,
    client_id smallint NOT NULL
);


ALTER TABLE public.client_fees OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 17381)
-- Name: client_fees_fee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.client_fees ALTER COLUMN fee_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.client_fees_fee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16485)
-- Name: client_master; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_master (
    client_id smallint NOT NULL,
    username character varying(100) DEFAULT NULL::character varying,
    password character varying(100) DEFAULT NULL::character varying,
    full_name character varying(50),
    status smallint DEFAULT 1,
    "timestamp" timestamp with time zone DEFAULT now(),
    totp_secret character varying(100),
    user_agent character varying(200),
    totp_status smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.client_master OWNER TO postgres;

--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN client_master.client_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.client_master.client_id IS 'Merchant ID / USER ID / Registration ID';


--
-- TOC entry 216 (class 1259 OID 16509)
-- Name: client_master_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.client_master ALTER COLUMN client_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.client_master_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 252 (class 1259 OID 17433)
-- Name: client_wallet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_wallet (
    wallet_id smallint NOT NULL,
    client_id smallint,
    crypto_code character varying(10),
    crypto_title character varying(50),
    crypto_network character varying(100),
    crypto_address character varying(200),
    status smallint DEFAULT 1 NOT NULL,
    assetid integer
);


ALTER TABLE public.client_wallet OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 17432)
-- Name: client_wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.client_wallet ALTER COLUMN wallet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.client_wallet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 244 (class 1259 OID 17360)
-- Name: coin_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coin_address (
    address_id smallint NOT NULL,
    coin character varying(10) NOT NULL,
    address character varying(200) NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    lastupdate timestamp without time zone,
    coin_id smallint NOT NULL,
    token_details json
);


ALTER TABLE public.coin_address OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 17359)
-- Name: coin_address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.coin_address ALTER COLUMN address_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.coin_address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16682)
-- Name: coin_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coin_list (
    coin_id smallint NOT NULL,
    coin character varying(10),
    icon character varying(200),
    status smallint DEFAULT 1 NOT NULL,
    coin_title character varying(50),
    coin_network character varying(50),
    coin_status_url character varying(200),
    coin_pay_url character varying(50)
);


ALTER TABLE public.coin_list OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16681)
-- Name: coin_list_coin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.coin_list ALTER COLUMN coin_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.coin_list_coin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 250 (class 1259 OID 17426)
-- Name: crypto_currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crypto_currency (
    crypto_id smallint NOT NULL,
    crypto_code character varying(10),
    crypto_title character varying(50),
    crypto_network character varying(100),
    status smallint DEFAULT 1 NOT NULL,
    crypto_network_short character varying(50)
);


ALTER TABLE public.crypto_currency OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 17425)
-- Name: crypto_currency_crypto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.crypto_currency ALTER COLUMN crypto_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.crypto_currency_crypto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 17126)
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    currency_id smallint NOT NULL,
    currency_name character varying(50),
    currency_code character varying(10),
    currency_territory character varying(100),
    currency_icon_bootstrap character varying(100),
    status smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17125)
-- Name: currency_currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.currency ALTER COLUMN currency_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.currency_currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 256 (class 1259 OID 17494)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id smallint NOT NULL,
    customer_name character varying(100),
    customer_email character varying(100),
    customer_tid character varying(50),
    "timestamp" timestamp without time zone DEFAULT now() NOT NULL,
    client_id smallint
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 17493)
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customer ALTER COLUMN customer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16706)
-- Name: email_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_template (
    template_id smallint NOT NULL,
    template_code character varying(50),
    template_subject character varying(200),
    template_desc text,
    status smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.email_template OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16705)
-- Name: email_template_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.email_template ALTER COLUMN template_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.email_template_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 16826)
-- Name: invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice (
    invoice_id smallint NOT NULL,
    client_id smallint NOT NULL,
    name character varying(50),
    email character varying(100),
    description character varying(200),
    requestedamount double precision NOT NULL,
    requestedcurrency character varying(10) NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    createdate timestamp without time zone DEFAULT now() NOT NULL,
    ip character varying(20) NOT NULL,
    trackid character varying(100),
    product_name character varying(200) DEFAULT 'Pay Request'::character varying,
    invoice_type smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.invoice OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16825)
-- Name: invoice_invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.invoice ALTER COLUMN invoice_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoice_invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16537)
-- Name: login_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_history (
    token_id integer NOT NULL,
    client_id integer,
    login_time timestamp with time zone DEFAULT now(),
    logout_time timestamp with time zone DEFAULT now(),
    login_ip character varying(30),
    login_type smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.login_history OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16560)
-- Name: login_history_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.login_history ALTER COLUMN token_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.login_history_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 17133)
-- Name: support-ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."support-ticket" (
    ticket_id smallint NOT NULL,
    client_id smallint,
    ticket_subject character varying(200),
    ticket_desc text,
    status smallint DEFAULT 1 NOT NULL,
    "timestamp" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."support-ticket" OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17132)
-- Name: support-ticket_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."support-ticket" ALTER COLUMN ticket_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."support-ticket_ticket_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 241 (class 1259 OID 17340)
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id smallint NOT NULL,
    transaction_id character varying(100) NOT NULL,
    client_id smallint NOT NULL,
    assetid integer,
    transaction_type character varying(100) DEFAULT 2 NOT NULL,
    requestedamount double precision DEFAULT 0.0 NOT NULL,
    requestedcurrency character varying(10),
    convertedamount double precision DEFAULT 0.0 NOT NULL,
    convertedcurrency character varying(10) NOT NULL,
    receivedamount double precision DEFAULT 0.0 NOT NULL,
    receivedcurrency character varying(10),
    status character varying(50) NOT NULL,
    substatus smallint DEFAULT 0 NOT NULL,
    customerrefid character varying(50),
    note character varying(200),
    createdate timestamp without time zone DEFAULT now() NOT NULL,
    destinationaddress character varying(200),
    ip character varying(20),
    approved_by character varying(50),
    approver_id smallint,
    approver_comment character varying(200),
    approved_date timestamp without time zone,
    response_hash character varying(200),
    response_from character varying(200),
    response_to character varying(200),
    response_timestamp timestamp without time zone,
    response_json json
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17353)
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.transaction ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16776)
-- Name: transaction_master_nowpayments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_master_nowpayments (
    tid smallint NOT NULL,
    payment_id character varying(50),
    payment_status character varying(20),
    pay_address character varying(50),
    price_amount double precision,
    pay_amount double precision,
    amount_received double precision,
    price_currency character varying(10),
    pay_currency character varying(10),
    order_id character varying(50),
    order_description character varying(200),
    client_id smallint,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    ip character varying(20),
    invoice_id character varying(50),
    token_id character varying(50),
    invoice_url character varying(200),
    request_json text
);


ALTER TABLE public.transaction_master_nowpayments OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16775)
-- Name: transaction_master_nowpayments_tid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.transaction_master_nowpayments ALTER COLUMN tid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.transaction_master_nowpayments_tid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16699)
-- Name: transactions-for deleted; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."transactions-for deleted" (
    transactionid smallint NOT NULL,
    client_id smallint NOT NULL,
    walletid character varying(100),
    transactiontype character varying(20),
    amount character varying(20),
    transaction_hash character varying(100),
    status character varying(10),
    "timestamp" time with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."transactions-for deleted" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16698)
-- Name: transactions_transactionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."transactions-for deleted" ALTER COLUMN transactionid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.transactions_transactionid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16666)
-- Name: wallet_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet_list (
    wallet_id smallint NOT NULL,
    volt_id smallint NOT NULL,
    coin character varying(50),
    address character varying(200),
    legacyaddress character varying(200),
    tag character varying(50),
    total character varying(20),
    available character varying(20),
    pending character varying(20),
    frozen character varying(20),
    lockedamount character varying(20),
    status character varying(10) DEFAULT 2,
    "timestamp" time with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.wallet_list OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16665)
-- Name: wallet_list_wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.wallet_list ALTER COLUMN wallet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wallet_list_wallet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 5070 (class 0 OID 17374)
-- Dependencies: 246
-- Data for Name: acquirer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.acquirer (acquirer_id, acquirer_title, api_key, secret_key, endpoint_url, callback_url, success_url, failed_url, json_data, status) FROM stdin;
\.


--
-- TOC entry 5059 (class 0 OID 16969)
-- Dependencies: 235
-- Data for Name: admin_master; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_master (admin_id, username, password, full_name, status, "timestamp", role) FROM stdin;
1	admin@itio.in	$2a$10$kMys61K42ej08DCSdgGx9.urboozh1Ngb6Ndz.YdKyZVqSAzvVwOe	Admin ITIO	1	2024-07-30 16:29:45.378008+05:30	Admin
\.


--
-- TOC entry 5078 (class 0 OID 17467)
-- Dependencies: 254
-- Data for Name: client_api; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_api (id, client_id, apikey, status, "timestamp") FROM stdin;
10	190	76419b7b23017e61	1	2024-09-26 07:48:50+05:30
\.


--
-- TOC entry 5043 (class 0 OID 16562)
-- Dependencies: 219
-- Data for Name: client_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_details (client_id, title, gender, birth_date, country_code, mobile, address_line1, address_line2, city, state, country, pincode, add_date, json_log_history, id) FROM stdin;
197	\N	M	2024-10-01	994	09555555555	Noida Sec 65	ggggg	\N	\N	\N	\N	\N	\N	68
190	\N	M	1982-02-05	91	09555555555	Noida Sec 65	Delhi - 92	Delhi	Delhi	India	110092	\N	\N	61
198	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	69
\.


--
-- TOC entry 5072 (class 0 OID 17382)
-- Dependencies: 248
-- Data for Name: client_fees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_fees (fee_id, min_amount_fee, amount_fee_in_percent, client_id) FROM stdin;
11	10	2	190
\.


--
-- TOC entry 5039 (class 0 OID 16485)
-- Dependencies: 215
-- Data for Name: client_master; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_master (client_id, username, password, full_name, status, "timestamp", totp_secret, user_agent, totp_status) FROM stdin;
190	vikashg@itio.in	$2a$10$p16U78kVhBrIyuZm5yumdOuXtGQf4UX08EeO/bN8CiBEJhm8xslIi	Vikash Kumar Gupta	1	2024-09-26 10:07:04.50658+05:30	\N	\N	0
197	sowime1666@jofuso.com	$2a$10$G1whpnurMMxAZNFJ3yvXauGWUA1FicjdmUoZPAzrIQ1UVRz/IQPJa	jofuso	1	2024-10-03 11:03:54.266462+05:30	\N	\N	0
198	nebidos921@scarden.com	$2a$10$0NX7BKkZIxT8hLwu.0cRzetJhy1fk7p4.ytooYt.aFoXfq9Csm56C	scarden	1	2024-10-04 10:30:25.845225+05:30	\N	\N	0
\.


--
-- TOC entry 5076 (class 0 OID 17433)
-- Dependencies: 252
-- Data for Name: client_wallet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_wallet (wallet_id, client_id, crypto_code, crypto_title, crypto_network, crypto_address, status, assetid) FROM stdin;
23	190	usdt	Tether	TRC-20	dfdgfhgjhgjhgj	1	17
\.


--
-- TOC entry 5068 (class 0 OID 17360)
-- Dependencies: 244
-- Data for Name: coin_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coin_address (address_id, coin, address, status, lastupdate, coin_id, token_details) FROM stdin;
29	ltc	ltc1qptgsuj56xhyacp5zaq9u8p40hzecwx5rvp9r5n	1	2024-09-18 14:35:03.391979	30	{}
32	btc	bc1quumcvdachn27hh22qt0rdzsrhnjxk5q9la89hs	2	2024-10-03 15:13:30.219726	12	{}
31	btc	bc1qq5a0xtd3hzvp5ywmueaz8pkrlt49a7q2znyh8h	2	2024-10-03 15:13:37.565402	12	{}
20	btc	bc1qh22j0eaakdef3x3443u9d984hp20xch8m7xutk	2	2024-10-03 15:14:05.249745	12	{}
23	usdt	0x9b6e7C447B81c97433271813b153C488085d5766	1	2024-09-18 14:41:46.759693	27	{}
34	eth	0x9b6e7C447B81c97433271813b153C488085d5766	2	2024-09-30 10:39:46.547529	32	{}
33	eth	0xae9cB013843c748969D35D55bd355aFa75eb79d7	2	2024-09-30 10:39:58.037603	32	{}
24	doge	DRtCfxadyjdzCQ7KdZy8iWBHrC8UmQLYHE	1	2024-09-18 14:34:52.407448	25	{}
36	sol	CpBCKM8Zncuapz9HagPjwpSqbwqBB8uc9JRLCNZHcnK1	1	2024-09-30 15:51:16.917945	29	{}
28	sol	6yzqAoc4qYG2kSgkBAbNJkuCktGXQ1bzryiiouXHM4Hv	2	2024-09-30 15:51:29.557317	29	{}
25	ada	addr1q86nww2uy4590v6p6qx6gy9clfd7maawjun7v0funxz26u50lryessgd4pd88j6l09n7pf5eq4g0eqmvh5d045c3g7zqng6xtg	2	2024-09-30 17:10:55.922701	28	{\r\n    "tokenId": "01f537395c256857b341d00da410b8fa5bedf7ae9727e63d3c9984ad728ff8c998410da85a73cb5f7967e0a6990550fc836cbd1afad3114784",\r\n    "tokenName": "ADA",\r\n    "tokenAbbr": "ADA",\r\n    "tokenCanShow": 1,\r\n    "tokenType": "ADA"\r\n}
26	ada	addr1q8fuwy9yt6ntk6ttmpuwqv6ljezsxfwkxx0k9ackukr9gjj0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsq8ruc3	2	2024-09-30 17:11:03.674483	28	{\r\n    "tokenId": "0120ef2a24a4c63730318b8774d002d91aa36fe5d4ba2340d4f303939c4f5de0819535fd164c87dd469305eb4b04a6434ae29dbe925dcdf1ef",\r\n    "tokenName": "ADA",\r\n    "tokenAbbr": "ADA",\r\n    "tokenCanShow": 1,\r\n    "tokenType": "ADA"\r\n}
37	ada	addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	1	2024-10-04 10:49:36.606327	28	{}
35	eth	0xae9cB013843c748969D35D55bd355aFa75eb79d7	1	2024-10-04 10:53:12.243503	32	{}
21	usdt	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	1	2024-10-04 10:56:51.759326	17	{\r\n    "tokenId": "TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t",\r\n    "tokenName": "Tether USD",\r\n    "tokenAbbr": "USDT",\r\n    "tokenCanShow": 1,\r\n    "tokenType": "trc20"\r\n}
38	btc	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	1	2024-10-04 11:01:38.352635	12	{}
\.


--
-- TOC entry 5048 (class 0 OID 16682)
-- Dependencies: 224
-- Data for Name: coin_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coin_list (coin_id, coin, icon, status, coin_title, coin_network, coin_status_url, coin_pay_url) FROM stdin;
28	ada	ada.png	1	Cardano	Cardano	https://cardanoscan.io/address/	-
17	usdt	usdt.png	1	Tether	TRC-20	https://tronscan.org/#/address/	trc20usdt
25	doge	doge.png	2	Dogecoin	Dogecoin	https://dogechain.info/api/v1/address/received/	0
27	usdt	tather.png	2	Tether	ERC-20	https://etherscan.io/address/	gdfgdfg
30	ltc	ltc.png	2	Litecoin	Litecoin	-	-
32	eth	eth.png	1	Ethereum	Ethereum	https://etherscan.io/address/	-
29	sol	sol.png	2	Solana	Solana	https://solscan.io/account/	-
12	btc	btc.png	1	Bitcoin	Bitcoin	https://www.blockchain.com/explorer/addresses/btc/	bitcoin
\.


--
-- TOC entry 5074 (class 0 OID 17426)
-- Dependencies: 250
-- Data for Name: crypto_currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.crypto_currency (crypto_id, crypto_code, crypto_title, crypto_network, status, crypto_network_short) FROM stdin;
22	DOT	Polkadot	Polkadot Mainnet	1	Polkadot
15	USDC	USD Coin	Stellar	1	Stellar
42	EGLD	Elrond	Elrond Mainnet	1	Elrond
44	EOS	EOS	EOS Mainnet	1	EOS
6	ETH	Ethereum	Polygon (MATIC) via Wrapped ETH (WETH)	1	MATIC
2	ETH	Ethereum	Ethereum Mainnet	1	Ethereum
3	ETH	Ethereum	Goerli Testnet	1	Goerli
4	ETH	Ethereum	Sepolia Testnet	1	Sepolia
5	ETH	Ethereum	Binance Smart Chain (BSC) via Wrapped ETH (WETH)	1	WETH
14	USDT	Tether	Ethereum (ERC-20)	1	ERC-20
24	XRP	Ripple	Ripple Mainnet (XRP Ledger)	1	XRP Ledger
25	ADA	Cardano	Cardano Mainnet	1	Cardano
13	USDT	Tether	Binance Smart Chain (BEP-20)	1	BEP-20
11	USDT	Tether	Solana	1	Solana
10	USDT	Tether	Avalanche	1	Avalanche
9	USDT	Tether	Algorand	1	Algorand
1	BTC	Bitcoin	Bitcoin Mainnet	1	Bitcoin
41	HBAR	Hedera	Hedera Hashgraph Mainnet	1	Hedera
29	LINK	Chainlink	Binance Smart Chain (BEP-20)	1	BEP-20
49	AAVE	Aave	Polygon (MATIC)	1	MATIC
48	AAVE	Aave	Avalanche (AVAX)	1	AVAX
27	MATIC	Polygon	Ethereum (ERC-20) via Wrapped MATIC	1	ERC-20
28	MATIC	Polygon	Polygon (Mainnet)	1	Polygon
26	MATIC	Polygon	Binance Smart Chain (BEP-20) via Wrapped MATIC	1	BEP-20
53	SUSHI	SushiSwap	Binance Smart Chain (BEP-20)	1	BEP-20
52	SUSHI	SushiSwap	Polygon (MATIC)	1	MATIC
54	SUSHI	SushiSwap	Ethereum (ERC-20)	1	ERC-20
20	USDC	USD Coin	Ethereum (ERC-20)	1	ERC-20
19	USDC	USD Coin	Binance Smart Chain (BEP-20)	1	BEP-20
18	USDC	USD Coin	TRON (TRC-20)	1	TRC-20
12	USDT	Tether	TRON (TRC-20)	1	TRC-20
50	AAVE	Aave	Ethereum (ERC-20)	1	ERC-20
45	XMR	Monero	Monero Mainnet	1	Monero
34	ALGO	Algorand	Algorand Mainnet	1	Algorand
32	AVAX	Avalanche	Avalanche C-Chain (Contract Chain)	1	C-Chain
35	ATOM	Cosmos	Cosmos Hub	1	Cosmos Hub
47	CAKE	PancakeSwap	Binance Smart Chain (BSC)	1	BSC
21	DOGE	Dogecoin	Dogecoin Mainnet	1	Dogecoin
30	LINK	Chainlink	Ethereum (ERC-20)	1	ERC-20
31	LTC	Litecoin	Litecoin Mainnet	1	Litecoin
43	MIOTA	IOTA	IOTA Mainnet	1	IOTA
40	NEO	NEO	NEO Mainnet	1	NEO
23	SOL	Solana	Solana Mainnet	1	Solana
51	SUSHI	SushiSwap	Avalanche (AVAX)	1	AVAX
39	TRX	TRON	TRON Mainnet	1	TRON
16	USDC	USD Coin	Algorand	1	Algorand
17	USDC	USD Coin	Solana	1	Solana
36	VET	VeChain	VeChainThor Mainnet	1	VeChainThor
38	XLM	Stellar	Stellar Mainnet	1	Stellar
46	ZEC	Zcash	Zcash Mainnet	1	Zcash
33	AVAX	Avalanche	Avalanche X-Chain (Exchange Chain)	1	X-Chain
7	BNB	Binance Coin	Binance Smart Chain (BSC)	1	BSC
8	BNB	Binance Coin	Binance Chain (BEP-2)	1	BEP-2
37	XTZ	Tezos	Tezos Mainnet	1	Tezos
\.


--
-- TOC entry 5062 (class 0 OID 17126)
-- Dependencies: 238
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (currency_id, currency_name, currency_code, currency_territory, currency_icon_bootstrap, status) FROM stdin;
1	dollar	USD	United States	fas fa-dollar-sign	1
2	Thai Bhatt	THB	Thailand	fa-solid fa-baht-sign	1
3	yen	JPY	Japan	fas fa-yen-sign	1
4	rupee	INR	India	fas fa-rupee-sign	1
5	sterling	GBP	United Kingdom	fas fa-pound-sign	1
6	EURO	EUR	European	fa-solid fa-euro-sign	1
7	yuan	CNY	China	fas fa-yen-sign	1
8	dollar	AUD	Australia	fas fa-dollar-sign	1
\.


--
-- TOC entry 5080 (class 0 OID 17494)
-- Dependencies: 256
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, customer_name, customer_email, customer_tid, "timestamp", client_id) FROM stdin;
94	Vikash Kumar Gupta	vikashg@itio.in	e90efd714ff196ea895d246aad8ef8e1	2024-09-26 12:53:03.071993	190
95	Vikash Kumar Gupta	vikashg@itio.in	3a560bfa542edf3463e15348c8075ccc	2024-09-26 13:00:37.0617	190
96	Vikash Kumar Gupta	vikashg@itio.in	5b03a09bd6d3425c2b7992f3cda4c5ba	2024-09-26 13:02:09.474393	190
97	Vikash Kumar Gupta	vikashg@itio.in	79e1e909cf73d1a7c00ab965979d274d	2024-09-26 13:03:02.561797	190
98	Vikash Kumar Gupta	vikashg@itio.in	c2836158cb2136424045a4f0cc22b05d	2024-09-26 14:43:06.108474	190
99	Vikash Kumar Gupta	vikashg@itio.in	8fbb4c11161b95382fbd50eb316f61cd	2024-09-26 15:05:33.698024	190
100	Vikash Kumar Gupta	vikashg@itio.in	feae3cbb0058a9b7ca81f9f13009543f	2024-09-26 15:08:54.900951	190
101	Vikash Kumar Gupta	vikashg@itio.in	e36d3b20b3dada7c7ef8201b1f9e26b7	2024-09-26 15:15:02.217983	190
102	Vikash Kumar Gupta	vikashg@itio.in	953968bd9b2f435b219044280602c1a8	2024-09-26 15:18:27.786916	190
103	Vikash Kumar Gupta	vikashg@itio.in	7cbf620e6425198df6002bb00f355e90	2024-09-26 15:23:33.256814	190
104	Vikash Kumar Gupta	vikashg@itio.in	bae94db75ff9dad9e6ca8aafd060ba7e	2024-09-26 15:33:41.471882	190
105	Vikash Kumar Gupta	vikashg@itio.in	84efdceabfa69104a210a85c9adc683c	2024-09-26 15:39:04.859515	190
106	Vikash Kumar Gupta	vikashg@itio.in	73d1baf2df5cbfc2afbf9060c6cec70a	2024-09-26 15:40:40.171729	190
107	Vikash Kumar Gupta	vikashg@itio.in	efc21536093fdede759d7371f9659f6e	2024-09-26 15:41:28.80217	190
108	Vikash Kumar Gupta	vikashg@itio.in	8301c220f0263fb90414d302533f7ed9	2024-09-26 15:44:46.732664	190
109	Vikash Kumar Gupta	vikashg@itio.in	d603fa8a0f51ac34b1909749c8f50a3a	2024-09-26 15:47:42.687118	190
110	Vikash Kumar Gupta	vikashg@itio.in	c6bcfe2db9a136b6db99449b9e2edf74	2024-09-26 15:55:24.989717	190
111	Vikash Kumar Gupta	vikashg@itio.in	122d6e615c19b0e7b60234b35123411e	2024-09-26 15:59:06.53407	190
112	Vikash Kumar Gupta	vikashg@itio.in	5d24f53c1dd49553b44cc5113dbc7ff7	2024-09-26 16:04:09.625739	190
113	Vikash Kumar Gupta	vikashg@itio.in	a09a8821544d8cf746890b5e10d36964	2024-09-26 16:12:03.978717	190
114	Vikash Kumar Gupta	vikashg@itio.in	fafdeb6f6522171daf1aae1a9922d868	2024-09-26 16:13:25.506887	190
115	Vikash Kumar Gupta	vikashg@itio.in	ff5bbb98f42d29a3d04c5cd3d93b047c	2024-09-26 16:14:27.544327	190
116	Vikash Kumar Gupta	vikashg@itio.in	2814fb62319ddb8114e4b7134c9d58bd	2024-09-26 16:15:35.556839	190
117	Vikash Kumar Gupta	vikashg@itio.in	bda70eba23671537711a7f63ae794b5a	2024-09-26 16:49:32.457379	190
118	Vikash Kumar Gupta	vikashg@itio.in	1f72bffd8b5fee2961e0646d566477b6	2024-09-26 16:51:41.108678	190
119	Vikash Kumar Gupta	vikashg@itio.in	162b4350523ca343a39fd6bcf31ed90f	2024-09-26 17:02:38.219695	190
120	Vikash Kumar Gupta	vikashg@itio.in	90e5b9d24a75c464e54234b94fcdd717	2024-09-26 17:10:36.711219	190
121	Vikash Kumar Gupta	vikashg@itio.in	9fc31f0bd619fcfb0521c28a41d0915c	2024-09-26 17:11:27.867242	190
122	Vikash Kumar Gupta	vikashg@itio.in	8a866662cfa7488b069608c17505bdfb	2024-09-26 17:12:43.735558	190
123	Vikash Kumar Gupta	vikashg@itio.in	c0f7fa07cdc8376660e450a59a1bb44a	2024-09-26 17:13:35.671845	190
124	Vikash Kumar Gupta	vikashg@itio.in	8227d674af755ce4abb2f85d7c59a317	2024-09-26 17:16:08.738477	190
125	Vikash Kumar Gupta	vikashg@itio.in	9f5ab8f8dbe28b1a82daed585a33636d	2024-09-26 17:19:36.193406	190
126	Vikash Kumar Gupta	vikashg@itio.in	597b672674cd74ba054c68d8e77dccfc	2024-09-26 17:20:31.715656	190
127	Vikash Kumar Gupta	vikashg@itio.in	dd7d4541dae1478e90911bee4511990f	2024-09-26 17:23:38.636686	190
128	Vikash Kumar Gupta	vikashg@itio.in	2f1e370817dc27a1f036a2dc64f5954b	2024-09-26 17:24:38.118882	190
129	Vikash Kumar Gupta	vikashg@itio.in	4a3fa6ff465e1f4ebb066f97e7fe4edb	2024-09-26 17:28:51.738741	190
130	Vikash Kumar Gupta	vikashg@itio.in	200acbc20bbe1cbe82bd76f64ed60f97	2024-09-26 19:06:50.928021	190
131	Vikash Kumar Gupta	vikashg@itio.in	d2e37302c660ce155e3899aca4407cfe	2024-09-30 13:11:20.475159	190
132	Vikash Kumar Gupta	vikashg@itio.in	7dae61944a53ff13ee8fa3166688e837	2024-09-30 13:20:35.626929	190
133	Vikash Kumar Gupta	vikashg@itio.in	ca10e23b936b8c6bea3a42f52d37f711	2024-09-30 13:53:40.877688	190
134	Vikash Kumar Gupta	vikashg@itio.in	dc8e7f7257890cf30751e0a5d9ef8c61	2024-09-30 14:03:40.280584	190
135	Vikash Kumar Gupta	vikashg@itio.in	8cf38b57dd0b688249d79c7d6c90eaf5	2024-09-30 14:11:32.37381	190
136	Vikash Kumar Gupta	vikashg@itio.in	d43ed66ef9b3de180c1ba78d5f144aa9	2024-09-30 14:15:46.421762	190
137	Vikash Kumar Gupta	vikashg@itio.in	8411c8e5cf44e88dda3110243c0f1b99	2024-09-30 14:26:39.944446	190
138	Vikash Kumar Gupta	vikashg@itio.in	253aa188f54239e1fbc01c1ebb7041c1	2024-09-30 14:31:25.198257	190
139	Vikash Kumar Gupta	vikashg@itio.in	216fbbe1891997fcfac204aff38b3d42	2024-09-30 14:33:32.528303	190
140	Vikash Kumar Gupta	vikashg@itio.in	2eb06c7cc70eb3321df01a0415282364	2024-09-30 14:42:48.245618	190
141	Vikash Kumar Gupta	vikashg@itio.in	712b744687a801e5156e7234e082696a	2024-09-30 14:52:25.281386	190
142	Vikash Kumar Gupta	vikashg@itio.in	b2d9e0af2f4109642da5c6e88d2dd870	2024-09-30 14:58:59.406429	190
143	Vikash Kumar Gupta	vikashg@itio.in	afc02cdd2f1caa145dd3e0f654699be2	2024-09-30 15:01:50.253676	190
144	Vikash Kumar Gupta	vikashg@itio.in	f47877bb1ab3e41acc7dbfcc3d86bfd0	2024-09-30 15:01:54.120268	190
145	Vikash Kumar Gupta	vikashg@itio.in	66d6043363b399de5e6878c37e845dff	2024-09-30 15:11:29.257379	190
146	Vikash Kumar Gupta	vikashg@itio.in	2f61f9162a5db5a3ddb0f60780ceed74	2024-09-30 15:18:57.418391	190
147	Vikash Kumar Gupta	vikashg@itio.in	624595b74d4466e34aff403acd122177	2024-09-30 15:24:59.995636	190
148	Vikash Kumar Gupta	vikashg@itio.in	c97185d31da70de754fd5455a0cbeb72	2024-09-30 15:30:04.07103	190
149	Vikash Kumar Gupta	vikashg@itio.in	57dbb27fcd66b4690bc5a738d594c725	2024-09-30 15:34:42.579195	190
150	Vikash Kumar Gupta	vikashg@itio.in	984ceee27a9904acaf8f3b16c1c6b566	2024-09-30 15:44:40.289291	190
151	Vikash Kumar Gupta	vikashg@itio.in	405c2403944e02239c6602cf7ee950eb	2024-09-30 15:55:13.283789	190
152	Vikash Kumar Gupta	vikashg@itio.in	0ed9d532e483e133f8b47797fd2fa4d1	2024-09-30 15:58:26.805188	190
153	Vikash Kumar Gupta	vikashg@itio.in	29c460839bbc2b94a61314386000f8b4	2024-09-30 16:00:20.486963	190
154	Vikash Kumar Gupta	vikashg@itio.in	2c3c11b14b4d2e6ed784e575cde741f9	2024-09-30 19:41:58.051912	190
155	Vikash Kumar Gupta	vikashg@itio.in	d4b657917fb8e057e52c0f773ab9264d	2024-09-30 19:52:06.738317	190
156	Vikash Kumar Gupta	vikashg@itio.in	a448db1371ee521d334d7b64dc12f08a	2024-09-30 19:55:24.100516	190
157	Vikash Kumar Gupta	vikashg@itio.in	d18c4b3113dfd9804a9f1d4288b5de40	2024-10-01 15:40:57.393148	190
158	Vikash Kumar Gupta	vikashg@itio.in	d3743938c9e8849a856c7f14b2aa24f1	2024-10-01 20:09:21.967722	190
159	Vikash Kumar Gupta44	vikashg@itio.in	530ccc2e37f73195d3402d1e37680fb1	2024-10-01 20:13:17.515131	190
160	Vikash Kumar Gupta	vikashg@itio.in	e354592521c258f2ac436cf228b4771f	2024-10-01 20:20:09.1296	190
161	Vikash Kumar Gupta	vikashg@itio.in	8944311c248a8b54fd1c2ede3ac17861	2024-10-03 14:29:45.523338	190
162	Vikash Kumar Gupta	vikashg@itio.in	42c95bbbfb51278740306af61ef924a2	2024-10-03 14:32:49.333207	190
163	Vikash Kumar Gupta	vikashg@itio.in	70be0d8cff3eed5daffd4ad943ae4a6e	2024-10-03 14:36:48.624359	190
164	Vikash Kumar Gupta	vikashg@itio.in	dd5046244693fe1ae8418857205d42e0	2024-10-03 18:10:35.424406	190
165	Vikash Kumar Gupta	vikashg@itio.in	21e90ca2d4d15809a823ca89dab0c288	2024-10-03 18:25:02.44559	190
166	Vikash Kumar Gupta	vikashg@itio.in	11a241e8d4bf93230c0307fc5202f671	2024-10-03 18:31:58.330987	190
167	Vikash Kumar Gupta	vikashg@itio.in	0a2ad351dfbc67a473846afdbb4290ba	2024-10-03 18:51:34.145671	190
168	Vikash Kumar Gupta	johnd@itio.in	6a0ecf55f9400ed3ea15adf9d81e3a93	2024-10-03 18:53:54.554861	190
169	Vikash Kumar Gupta	vikashg@itio.in	4f6214bab4a549f98d7283b44b472698	2024-10-03 18:58:03.697669	190
170	Vikash Kumar Gupta	vikashg@itio.in	9e2e6fb741654565805b7b87f686a487	2024-10-03 19:04:22.857919	190
171	Vikash Kumar Gupta	vikashg@itio.in	1786bad37a0b324e280fea2b9b85b476	2024-10-03 19:14:49.389518	190
172	Vikash Kumar Gupta	vikashg@itio.in	f5db10911b3da1bfcaf47a13be5de518	2024-10-03 19:17:00.830921	190
173	Vikash Kumar Gupta	vikashg@itio.in	c2e66171751b25667c295af57a4f8bfe	2024-10-03 19:20:24.333761	190
174	Vikash Kumar Gupta	vikashg@itio.in	2df5845f723054b5c5597be3bdbed101	2024-10-03 19:23:47.679007	190
175	Vikash Kumar Gupta	vikashg@itio.in	9f0a031f8cda339f9f678a2328d2ba47	2024-10-03 19:25:11.088607	190
176	Vikash Kumar Gupta	vikashg@itio.in	9566a40e8835a5254f29e7e57e52d2ed	2024-10-03 19:37:24.687485	190
177	Vikash Kumar Gupta	vikashg@itio.in	a44234e834a024c2ca82572114248182	2024-10-03 19:39:49.763224	190
178	Vikash Kumar Gupta	vikashg@itio.in	f01ec517ea8c13d6bd73ea8532f3a7ac	2024-10-03 19:55:05.410501	190
179	Vikash Kumar Gupta	vikashg@itio.in	6bd4875ef76657992012252e79327a7d	2024-10-03 19:57:32.839344	190
180	Vikash Kumar Gupta	vikashg@itio.in	02288df4baa6c8a10f7a6fb5ccfbd68e	2024-10-03 19:59:59.162337	190
181	Vikash Kumar Gupta	vikashg@itio.in	eacefa19107cf1cddfdd531f741683c0	2024-10-03 20:01:17.673672	190
182	Vikash Kumar Gupta	vikashg@itio.in	9216815c52e6e648c428437a02f202ea	2024-10-03 20:08:07.296681	190
183	Vikash Kumar Gupta	vikashg@itio.in	1c4e07e5186462dcbd7146452f20c082	2024-10-03 20:09:10.31077	190
184	Vikash Kumar Gupta	vikashg@itio.in	ccc43418557cbbdf1452dfbcd09f7229	2024-10-03 20:30:52.174111	190
185	Vikash Kumar Gupta	vikashg@itio.in	dd499f70417fd7bdb6605e2b4947eba2	2024-10-03 20:34:32.085914	190
186	Vikash Kumar Gupta	vikashg@itio.in	51371104f57b19149cc8a30383b26fe3	2024-10-03 20:39:27.341321	190
187	Vikash Kumar Gupta	vikashg@itio.in	a98c8645666f27be48474200a577a58b	2024-10-03 20:40:06.97874	190
188	Vikash Kumar Gupta	vikashg@itio.in	7581b0f707d77c83ed97e8bfc0c40857	2024-10-03 20:43:08.192819	190
189	Vikash Kumar Gupta	vikashg@itio.in	e4ec54b47777260249b28a29a7c95851	2024-10-03 20:44:00.217189	190
190	Vikash Kumar Gupta	vikashg@itio.in	57d3fddcbeaaea76efff9d9a5e0e8212	2024-10-03 20:44:23.010565	190
191	Vikash Kumar Gupta	vikashg@itio.in	780db721f1c5a384510280833d5cb6b2	2024-10-03 20:47:28.82175	190
192	Vikash Kumar Gupta	vikashg@itio.in	bf693b8ab794176166febb69496f57c4	2024-10-03 20:49:19.807124	190
193	Vikash Kumar Gupta	vikashg@itio.in	c94682e79dc4eab821ba67aed897ab45	2024-10-04 12:26:04.164779	190
194	Vikash Kumar Gupta	vikashg@itio.in	c207daca863fa93ea51aed312236c862	2024-10-04 13:19:36.594852	190
195	Vikash Kumar Gupta	vikashg@itio.in	d4b926599176b5c9859c5a189d3b8885	2024-10-04 13:21:58.666238	190
196	Vikash Kumar Gupta	vikashg@itio.in	da11ad6447a285ac6f7dba53e79ad81e	2024-10-04 13:23:12.233906	190
197	Vikash Kumar Gupta	vikashg@itio.in	081f4cf53f2891b3a8b4b9dbab4176cb	2024-10-04 13:26:51.754491	190
198	Vikash Kumar Gupta	vikashg@itio.in	c169a1a36871ee0cd0089dfe74da7c01	2024-10-04 13:31:38.28572	190
\.


--
-- TOC entry 5052 (class 0 OID 16706)
-- Dependencies: 228
-- Data for Name: email_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_template (template_id, template_code, template_subject, template_desc, status) FROM stdin;
8	PAYMENT-STATUS	Payment Status [status] With [sitename]	<p>Hi  <b>[fullname]&nbsp;</b>&nbsp;</p><p>Payment Status <b>[status]</b>  with <b>[sitename]</b></p><p>Requested Amount are <b>[amount] [crypto]</b></p><p>Transaction ID -  <b>[transid]</b></p><p>HashCode - <b>[hashCode]</b></p><p><span style="font-weight: bolder;">Cheers,</span></p><p><b>[sitename2]</b></p>	1
9	2FA-STATUS	2FA Status Activate With [sitename]	<p>Hello [fullname],</p><p><br></p><p>Welcome to [sitename]! We are pleased to inform that your 2FA Status Activate.</p><p><br></p><p>2FA Details for Your Account:</p><p>---</p><p>Setup Key: [hashCode]</p><p>Scan QR Code:</p><p> [invoiceurl]</p><p><br></p><p><br></p><p>Cheers,</p><p>[sitename2]</p><p><br></p><p><br></p>	1
6	RESTORE-PASSWORD	Your [sitename] Password for [username]	Dear&nbsp;<span style="font-weight: bolder;">[fullname]</span>,<p><br></p><p>This is an e-mail from [sitename] containing your password, which was requested by you.</p><p>Your [sitename] account (<span style="font-weight: bolder;">[username]</span>) password is:&nbsp;<span style="font-weight: bolder;">[password]</span></p><p><br></p><p><span style="font-weight: bolder;">Cheers,</span></p><p> [sitename1] </p>	1
1	SIGNUP-TO-MEMBER	Member Account With [sitename]	<p>Hello [fullname],</p><p><br></p><p>Welcome to [sitename]! We are pleased to inform that your account has been created.</p><p><br></p><p>Login Details for Your Account:</p><p>---</p><p>Username: [username]</p><p>Password: [password]</p><p><br></p><p>Kindly login to your account and complete the Profile, Business Profile and Bank Profile. Once done. Please email us back for review.</p><p><br></p><p><br></p><p>Cheers,</p><p>[sitename2]</p><p><br></p><p><br></p>	1
3	REQUEST-MONEY	Request Money [fullname] With [sitename]	<p>Hi&nbsp;&nbsp;[fullname]&nbsp; Sent Request for Money with&nbsp;[sitename]</p><p>Requested Amount are [amount]</p><p>Order No.- [invoiceid]</p><p>[invoiceurl]</p><p><span style="font-weight: bolder;">Cheers,</span></p><p>[sitename2]</p>	1
4	INVOICE-PAYMENT	Request Payment [fullname] With [sitename]	<p>Hi&nbsp;&nbsp;[fullname]&nbsp; Sent Payment Request with&nbsp;[sitename]</p><p>Requested Amount are [amount]</p><p>Payment ID - [invoiceid]</p><p>[invoiceurl]</p><p><span style="font-weight: bolder;">Cheers,</span></p><p>[sitename2]</p>	1
\.


--
-- TOC entry 5058 (class 0 OID 16826)
-- Dependencies: 234
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice (invoice_id, client_id, name, email, description, requestedamount, requestedcurrency, status, createdate, ip, trackid, product_name, invoice_type) FROM stdin;
146	190	\N	\N	Laptop SL28525G	740	USD	1	2024-09-26 12:50:24.149781	127.0.0.1	24ab0916935939fcaf0d902fbd0b0698	Laptop	1
147	190	\N	\N	Mobile S25MG	760	USD	1	2024-09-26 12:50:53.60006	127.0.0.1	2b5816d7bdf26028bf531259797f0379	Mobile	1
148	190	\N	\N	Smart TV V45MG5	780	USD	1	2024-09-26 12:51:26.099551	127.0.0.1	065ddd52dc3332d29bd822d352a42a01	TV	1
149	190	Vikash Gupta	vikash4eindia@gmail.com	Test Amount	750	USD	1	2024-09-26 12:52:19.682158	127.0.0.1	5f56d95e4b508339cfee9e5e48600b6d	Pay Request	2
150	190	\N	\N	test2	3.91	USD	1	2024-09-26 16:09:24.308834	127.0.0.1	1bf95abf895ea74413decba5bd2177fd	test1	1
151	190	\N	\N	test2	3.83	USD	1	2024-09-26 16:09:37.751517	127.0.0.1	54384b7834ad56c3ec428732f25f856e	test2	1
152	190	\N	\N	test3	3.94	USD	1	2024-09-26 16:09:49.787747	127.0.0.1	8b504189565b36b5f575f82aacc97353	test3	1
153	190	\N	\N	test4	2	USD	1	2024-09-26 16:10:33.426504	127.0.0.1	2b341d17cf7b9c8a632e3db0e74d70c4	test4	1
154	190	\N	\N	Test 750	750	USD	1	2024-09-26 17:20:22.911457	127.0.0.1	d68962d167266de8eaac2dda9d2e229a	Test 750	1
155	190	\N	\N	Test Desc	47.52	USD	1	2024-09-30 15:32:42.711393	127.0.0.1	e5c4ca6789688297e1d251a120574dc5	ETH Coin	1
\.


--
-- TOC entry 5041 (class 0 OID 16537)
-- Dependencies: 217
-- Data for Name: login_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login_history (token_id, client_id, login_time, logout_time, login_ip, login_type) FROM stdin;
3885	1	2024-09-26 09:52:41.106569+05:30	2024-09-26 09:52:41.106569+05:30	127.0.0.1	2
3886	190	2024-09-26 10:08:03.238627+05:30	2024-09-26 10:08:03.238627+05:30	127.0.0.1	1
3887	190	2024-09-26 10:08:29.668763+05:30	2024-09-26 10:08:29.668763+05:30	127.0.0.1	1
3888	190	2024-09-26 10:14:56.968605+05:30	2024-09-26 10:14:56.968605+05:30	127.0.0.1	1
3889	190	2024-09-26 10:19:22.641615+05:30	2024-09-26 10:19:22.641615+05:30	127.0.0.1	1
3890	190	2024-09-26 10:19:49.1671+05:30	2024-09-26 10:19:49.1671+05:30	127.0.0.1	1
3891	190	2024-09-26 10:29:42.850564+05:30	2024-09-26 10:29:42.850564+05:30	127.0.0.1	1
3892	190	2024-09-26 11:08:22.519953+05:30	2024-09-26 11:08:22.519953+05:30	127.0.0.1	1
3893	190	2024-09-26 11:09:41.722565+05:30	2024-09-26 11:09:41.722565+05:30	127.0.0.1	1
3894	190	2024-09-26 11:11:32.584011+05:30	2024-09-26 11:11:32.584011+05:30	127.0.0.1	1
3895	190	2024-09-26 11:19:20.247384+05:30	2024-09-26 11:19:20.247384+05:30	127.0.0.1	1
3896	190	2024-09-26 11:22:23.271604+05:30	2024-09-26 11:22:23.271604+05:30	127.0.0.1	1
3897	190	2024-09-26 11:23:00.498409+05:30	2024-09-26 11:23:00.498409+05:30	127.0.0.1	1
3898	190	2024-09-26 11:30:24.409666+05:30	2024-09-26 11:30:24.409666+05:30	127.0.0.1	1
3899	190	2024-09-26 11:38:00.435505+05:30	2024-09-26 11:38:00.435505+05:30	127.0.0.1	1
3900	190	2024-09-26 11:44:19.625824+05:30	2024-09-26 11:44:19.625824+05:30	127.0.0.1	1
3901	190	2024-09-26 11:45:11.088955+05:30	2024-09-26 11:45:11.088955+05:30	127.0.0.1	1
3902	190	2024-09-26 11:47:15.986341+05:30	2024-09-26 11:47:15.986341+05:30	127.0.0.1	1
3903	190	2024-09-26 11:57:03.451319+05:30	2024-09-26 11:57:03.451319+05:30	127.0.0.1	1
3904	190	2024-09-26 12:00:54.561938+05:30	2024-09-26 12:00:54.561938+05:30	127.0.0.1	1
3905	190	2024-09-26 12:03:09.286924+05:30	2024-09-26 12:03:09.286924+05:30	127.0.0.1	1
3906	190	2024-09-26 12:05:10.349488+05:30	2024-09-26 12:05:10.349488+05:30	127.0.0.1	1
3907	190	2024-09-26 12:11:53.561075+05:30	2024-09-26 12:11:53.561075+05:30	127.0.0.1	1
3908	190	2024-09-26 12:12:54.262281+05:30	2024-09-26 12:12:54.262281+05:30	127.0.0.1	1
3909	190	2024-09-26 12:35:07.89697+05:30	2024-09-26 12:35:07.89697+05:30	127.0.0.1	1
3910	190	2024-09-26 12:38:41.066177+05:30	2024-09-26 12:38:41.066177+05:30	127.0.0.1	1
3911	190	2024-09-26 12:44:45.336389+05:30	2024-09-26 12:44:45.336389+05:30	127.0.0.1	1
3912	190	2024-09-26 12:48:18.320808+05:30	2024-09-26 12:48:18.320808+05:30	127.0.0.1	1
3913	190	2024-09-26 12:53:23.866187+05:30	2024-09-26 12:53:23.866187+05:30	127.0.0.1	1
3914	1	2024-09-26 13:06:05.192399+05:30	2024-09-26 13:06:05.192399+05:30	127.0.0.1	2
3915	190	2024-09-26 13:08:46.943654+05:30	2024-09-26 13:08:46.943654+05:30	127.0.0.1	1
3916	190	2024-09-26 13:10:29.04836+05:30	2024-09-26 13:10:29.04836+05:30	127.0.0.1	1
3917	190	2024-09-26 13:14:35.447252+05:30	2024-09-26 13:14:35.447252+05:30	127.0.0.1	1
3918	190	2024-09-26 13:16:07.047032+05:30	2024-09-26 13:16:07.047032+05:30	127.0.0.1	1
3919	190	2024-09-26 13:17:30.940179+05:30	2024-09-26 13:17:30.940179+05:30	127.0.0.1	1
3920	190	2024-09-26 13:18:23.065079+05:30	2024-09-26 13:18:23.065079+05:30	127.0.0.1	1
3921	190	2024-09-26 13:25:16.068242+05:30	2024-09-26 13:25:16.068242+05:30	127.0.0.1	1
3922	190	2024-09-26 13:26:05.857323+05:30	2024-09-26 13:26:05.857323+05:30	127.0.0.1	1
3923	190	2024-09-26 13:28:56.334445+05:30	2024-09-26 13:28:56.334445+05:30	127.0.0.1	1
3924	190	2024-09-26 13:29:50.341037+05:30	2024-09-26 13:29:50.341037+05:30	127.0.0.1	1
3925	190	2024-09-26 13:33:25.864653+05:30	2024-09-26 13:33:25.864653+05:30	127.0.0.1	1
3926	190	2024-09-26 13:33:30.438991+05:30	2024-09-26 13:33:30.438991+05:30	127.0.0.1	1
3927	190	2024-09-26 13:33:50.247745+05:30	2024-09-26 13:33:50.247745+05:30	127.0.0.1	1
3928	190	2024-09-26 13:38:56.268344+05:30	2024-09-26 13:38:56.268344+05:30	127.0.0.1	1
3929	190	2024-09-26 13:41:47.059516+05:30	2024-09-26 13:41:47.059516+05:30	127.0.0.1	1
3930	190	2024-09-26 14:19:12.014325+05:30	2024-09-26 14:19:12.014325+05:30	127.0.0.1	1
3931	190	2024-09-26 14:21:32.931244+05:30	2024-09-26 14:21:32.931244+05:30	127.0.0.1	1
3932	190	2024-09-26 14:26:19.370646+05:30	2024-09-26 14:26:19.370646+05:30	127.0.0.1	1
3933	190	2024-09-26 14:32:24.297313+05:30	2024-09-26 14:32:24.297313+05:30	127.0.0.1	1
3934	190	2024-09-26 14:36:21.294768+05:30	2024-09-26 14:36:21.294768+05:30	127.0.0.1	1
3935	190	2024-09-26 14:36:46.333789+05:30	2024-09-26 14:36:46.333789+05:30	127.0.0.1	1
3936	190	2024-09-26 14:45:46.553872+05:30	2024-09-26 14:45:46.553872+05:30	127.0.0.1	1
3937	190	2024-09-26 14:58:37.082123+05:30	2024-09-26 14:58:37.082123+05:30	127.0.0.1	1
3938	190	2024-09-26 15:06:51.402467+05:30	2024-09-26 15:06:51.402467+05:30	127.0.0.1	1
3939	190	2024-09-26 15:08:25.409122+05:30	2024-09-26 15:08:25.409122+05:30	127.0.0.1	1
3940	190	2024-09-26 15:09:49.698225+05:30	2024-09-26 15:09:49.698225+05:30	127.0.0.1	1
3941	190	2024-09-26 15:12:30.197625+05:30	2024-09-26 15:12:30.197625+05:30	127.0.0.1	1
3942	190	2024-09-26 15:13:58.030244+05:30	2024-09-26 15:13:58.030244+05:30	127.0.0.1	1
3943	190	2024-09-26 15:15:57.364774+05:30	2024-09-26 15:15:57.364774+05:30	127.0.0.1	1
3944	190	2024-09-26 15:16:44.550006+05:30	2024-09-26 15:16:44.550006+05:30	127.0.0.1	1
3945	190	2024-09-26 15:18:01.371173+05:30	2024-09-26 15:18:01.371173+05:30	127.0.0.1	1
3946	190	2024-09-26 15:32:50.147877+05:30	2024-09-26 15:32:50.147877+05:30	127.0.0.1	1
3947	1	2024-09-26 15:33:58.309557+05:30	2024-09-26 15:33:58.309557+05:30	127.0.0.1	2
3948	190	2024-09-26 15:41:19.617683+05:30	2024-09-26 15:41:19.617683+05:30	127.0.0.1	1
3949	1	2024-09-26 15:45:40.558541+05:30	2024-09-26 15:45:40.558541+05:30	127.0.0.1	2
3950	1	2024-09-26 15:47:53.801483+05:30	2024-09-26 15:47:53.801483+05:30	127.0.0.1	2
3951	1	2024-09-26 15:53:46.93644+05:30	2024-09-26 15:53:46.93644+05:30	127.0.0.1	2
3952	1	2024-09-26 15:55:08.267386+05:30	2024-09-26 15:55:08.267386+05:30	127.0.0.1	2
3953	1	2024-09-26 15:56:22.381755+05:30	2024-09-26 15:56:22.381755+05:30	127.0.0.1	2
3954	190	2024-09-26 15:57:29.885304+05:30	2024-09-26 15:57:29.885304+05:30	127.0.0.1	1
3955	1	2024-09-26 16:03:25.083868+05:30	2024-09-26 16:03:25.083868+05:30	127.0.0.1	2
3956	1	2024-09-26 16:08:08.023128+05:30	2024-09-26 16:08:08.023128+05:30	127.0.0.1	2
3957	1	2024-09-26 16:09:40.15574+05:30	2024-09-26 16:09:40.15574+05:30	127.0.0.1	2
3958	190	2024-09-26 16:09:53.822848+05:30	2024-09-26 16:09:53.822848+05:30	127.0.0.1	1
3959	1	2024-09-26 16:14:24.990817+05:30	2024-09-26 16:14:24.990817+05:30	127.0.0.1	2
3960	1	2024-09-26 16:16:18.633123+05:30	2024-09-26 16:16:18.633123+05:30	127.0.0.1	2
3961	1	2024-09-26 16:24:17.277384+05:30	2024-09-26 16:24:17.277384+05:30	127.0.0.1	2
3962	1	2024-09-26 16:30:47.522321+05:30	2024-09-26 16:30:47.522321+05:30	127.0.0.1	2
3963	190	2024-09-26 16:34:54.172516+05:30	2024-09-26 16:34:54.172516+05:30	127.0.0.1	1
3964	190	2024-09-26 16:34:59.853087+05:30	2024-09-26 16:34:59.853087+05:30	127.0.0.1	1
3965	190	2024-09-26 16:36:33.840515+05:30	2024-09-26 16:36:33.840515+05:30	127.0.0.1	1
3966	1	2024-09-26 16:39:42.189664+05:30	2024-09-26 16:39:42.189664+05:30	127.0.0.1	2
3967	190	2024-09-26 16:54:36.748271+05:30	2024-09-26 16:54:36.748271+05:30	127.0.0.1	1
3968	1	2024-09-26 16:54:51.680121+05:30	2024-09-26 16:54:51.680121+05:30	127.0.0.1	2
3969	1	2024-09-26 16:59:46.429449+05:30	2024-09-26 16:59:46.429449+05:30	127.0.0.1	2
3970	190	2024-09-26 17:15:29.356964+05:30	2024-09-26 17:15:29.356964+05:30	127.0.0.1	1
3971	1	2024-09-26 17:18:53.284905+05:30	2024-09-26 17:18:53.284905+05:30	127.0.0.1	2
3972	190	2024-09-27 09:44:04.684056+05:30	2024-09-27 09:44:04.684056+05:30	127.0.0.1	1
3973	190	2024-09-30 09:41:55.970959+05:30	2024-09-30 09:41:55.970959+05:30	127.0.0.1	1
3974	190	2024-09-30 09:51:29.839881+05:30	2024-09-30 09:51:29.839881+05:30	127.0.0.1	1
3975	1	2024-09-30 10:04:59.156018+05:30	2024-09-30 10:04:59.156018+05:30	127.0.0.1	2
3976	190	2024-09-30 11:23:23.33252+05:30	2024-09-30 11:23:23.33252+05:30	127.0.0.1	1
3977	190	2024-09-30 12:07:00.759655+05:30	2024-09-30 12:07:00.759655+05:30	127.0.0.1	1
3978	190	2024-09-30 12:12:36.247887+05:30	2024-09-30 12:12:36.247887+05:30	127.0.0.1	1
3979	190	2024-09-30 12:40:55.391027+05:30	2024-09-30 12:40:55.391027+05:30	127.0.0.1	1
3980	190	2024-09-30 12:48:45.145551+05:30	2024-09-30 12:48:45.145551+05:30	127.0.0.1	1
3981	190	2024-09-30 13:01:52.097376+05:30	2024-09-30 13:01:52.097376+05:30	127.0.0.1	1
3982	190	2024-09-30 13:05:24.274323+05:30	2024-09-30 13:05:24.274323+05:30	127.0.0.1	1
3983	1	2024-09-30 13:11:03.801664+05:30	2024-09-30 13:11:03.801664+05:30	127.0.0.1	2
3984	190	2024-09-30 13:14:03.517936+05:30	2024-09-30 13:14:03.517936+05:30	127.0.0.1	1
3985	190	2024-09-30 13:14:07.491383+05:30	2024-09-30 13:14:07.491383+05:30	127.0.0.1	1
3986	1	2024-09-30 13:37:44.516722+05:30	2024-09-30 13:37:44.516722+05:30	127.0.0.1	2
3987	190	2024-09-30 16:59:35.788803+05:30	2024-09-30 16:59:35.788803+05:30	127.0.0.1	1
3988	190	2024-09-30 17:11:17.457929+05:30	2024-09-30 17:11:17.457929+05:30	127.0.0.1	1
3989	190	2024-09-30 17:11:33.764535+05:30	2024-09-30 17:11:33.764535+05:30	127.0.0.1	1
3990	1	2024-09-30 17:26:59.415112+05:30	2024-09-30 17:26:59.415112+05:30	127.0.0.1	2
3991	190	2024-09-30 18:21:58.877473+05:30	2024-09-30 18:21:58.877473+05:30	127.0.0.1	1
3992	1	2024-10-01 09:50:26.90482+05:30	2024-10-01 09:50:26.90482+05:30	127.0.0.1	2
3993	190	2024-10-01 10:11:35.635213+05:30	2024-10-01 10:11:35.635213+05:30	127.0.0.1	1
3994	190	2024-10-01 10:13:24.594143+05:30	2024-10-01 10:13:24.594143+05:30	127.0.0.1	1
3995	190	2024-10-01 10:15:26.003422+05:30	2024-10-01 10:15:26.003422+05:30	127.0.0.1	1
3996	190	2024-10-01 10:18:50.304986+05:30	2024-10-01 10:18:50.304986+05:30	127.0.0.1	1
3997	190	2024-10-01 10:25:22.494636+05:30	2024-10-01 10:25:22.494636+05:30	127.0.0.1	1
3998	190	2024-10-01 10:29:45.179372+05:30	2024-10-01 10:29:45.179372+05:30	127.0.0.1	1
3999	190	2024-10-01 10:51:17.325152+05:30	2024-10-01 10:51:17.325152+05:30	127.0.0.1	1
4000	190	2024-10-01 10:52:57.723086+05:30	2024-10-01 10:52:57.723086+05:30	127.0.0.1	1
4001	190	2024-10-01 10:54:42.857842+05:30	2024-10-01 10:54:42.857842+05:30	127.0.0.1	1
4002	190	2024-10-01 10:55:09.842036+05:30	2024-10-01 10:55:09.842036+05:30	127.0.0.1	1
4003	190	2024-10-01 11:13:58.459099+05:30	2024-10-01 11:13:58.459099+05:30	127.0.0.1	1
4004	190	2024-10-01 11:15:00.873924+05:30	2024-10-01 11:15:00.873924+05:30	127.0.0.1	1
4005	190	2024-10-01 11:17:04.545297+05:30	2024-10-01 11:17:04.545297+05:30	127.0.0.1	1
4006	190	2024-10-01 11:20:37.964233+05:30	2024-10-01 11:20:37.964233+05:30	127.0.0.1	1
4007	190	2024-10-01 11:33:33.671371+05:30	2024-10-01 11:33:33.671371+05:30	127.0.0.1	1
4008	190	2024-10-01 11:39:27.074358+05:30	2024-10-01 11:39:27.074358+05:30	127.0.0.1	1
4009	190	2024-10-01 11:51:04.348366+05:30	2024-10-01 11:51:04.348366+05:30	127.0.0.1	1
4010	190	2024-10-01 12:54:02.644232+05:30	2024-10-01 12:54:02.644232+05:30	127.0.0.1	1
4011	190	2024-10-01 13:10:36.341896+05:30	2024-10-01 13:10:36.341896+05:30	127.0.0.1	1
4012	190	2024-10-01 13:21:00.893243+05:30	2024-10-01 13:21:00.893243+05:30	127.0.0.1	1
4013	1	2024-10-01 13:22:39.883004+05:30	2024-10-01 13:22:39.883004+05:30	127.0.0.1	2
4014	190	2024-10-01 13:39:06.76819+05:30	2024-10-01 13:39:06.76819+05:30	127.0.0.1	1
4015	190	2024-10-01 14:34:10.425717+05:30	2024-10-01 14:34:10.425717+05:30	127.0.0.1	1
4016	1	2024-10-01 14:37:17.504078+05:30	2024-10-01 14:37:17.504078+05:30	127.0.0.1	2
4017	1	2024-10-01 14:44:59.677558+05:30	2024-10-01 14:44:59.677558+05:30	127.0.0.1	2
4018	1	2024-10-01 14:46:30.120594+05:30	2024-10-01 14:46:30.120594+05:30	127.0.0.1	2
4019	1	2024-10-01 14:47:38.516676+05:30	2024-10-01 14:47:38.516676+05:30	127.0.0.1	2
4020	190	2024-10-01 15:05:51.079778+05:30	2024-10-01 15:05:51.079778+05:30	127.0.0.1	1
4021	1	2024-10-01 15:18:06.867695+05:30	2024-10-01 15:18:06.867695+05:30	127.0.0.1	2
4022	1	2024-10-01 15:28:30.630185+05:30	2024-10-01 15:28:30.630185+05:30	127.0.0.1	2
4023	1	2024-10-01 15:41:05.873663+05:30	2024-10-01 15:41:05.873663+05:30	127.0.0.1	2
4024	1	2024-10-01 15:49:20.864554+05:30	2024-10-01 15:49:20.864554+05:30	127.0.0.1	2
4025	1	2024-10-01 16:01:13.364421+05:30	2024-10-01 16:01:13.364421+05:30	127.0.0.1	2
4026	190	2024-10-01 16:06:02.148106+05:30	2024-10-01 16:06:02.148106+05:30	127.0.0.1	1
4027	1	2024-10-01 16:13:05.548025+05:30	2024-10-01 16:13:05.548025+05:30	127.0.0.1	2
4028	190	2024-10-01 16:45:47.857224+05:30	2024-10-01 16:45:47.857224+05:30	127.0.0.1	1
4029	190	2024-10-01 17:05:58.986037+05:30	2024-10-01 17:05:58.986037+05:30	127.0.0.1	1
4030	190	2024-10-01 17:07:31.656459+05:30	2024-10-01 17:07:31.656459+05:30	127.0.0.1	1
4031	190	2024-10-01 17:08:55.130929+05:30	2024-10-01 17:08:55.130929+05:30	127.0.0.1	1
4032	190	2024-10-01 17:13:05.602678+05:30	2024-10-01 17:13:05.602678+05:30	127.0.0.1	1
4033	190	2024-10-01 17:14:18.271265+05:30	2024-10-01 17:14:18.271265+05:30	127.0.0.1	1
4034	190	2024-10-01 17:16:57.774406+05:30	2024-10-01 17:16:57.774406+05:30	127.0.0.1	1
4035	190	2024-10-01 17:17:06.632641+05:30	2024-10-01 17:17:06.632641+05:30	127.0.0.1	1
4036	190	2024-10-01 17:17:20.820157+05:30	2024-10-01 17:17:20.820157+05:30	127.0.0.1	1
4037	190	2024-10-01 17:22:04.188496+05:30	2024-10-01 17:22:04.188496+05:30	127.0.0.1	1
4038	190	2024-10-01 17:22:56.157299+05:30	2024-10-01 17:22:56.157299+05:30	127.0.0.1	1
4039	190	2024-10-01 17:26:05.551264+05:30	2024-10-01 17:26:05.551264+05:30	127.0.0.1	1
4040	190	2024-10-01 17:27:51.208051+05:30	2024-10-01 17:27:51.208051+05:30	127.0.0.1	1
4041	190	2024-10-01 17:28:30.890464+05:30	2024-10-01 17:28:30.890464+05:30	127.0.0.1	1
4042	190	2024-10-01 17:29:40.774779+05:30	2024-10-01 17:29:40.774779+05:30	127.0.0.1	1
4043	190	2024-10-01 17:30:03.332349+05:30	2024-10-01 17:30:03.332349+05:30	127.0.0.1	1
4044	190	2024-10-01 17:32:45.611906+05:30	2024-10-01 17:32:45.611906+05:30	127.0.0.1	1
4045	190	2024-10-01 17:33:20.002634+05:30	2024-10-01 17:33:20.002634+05:30	127.0.0.1	1
4046	190	2024-10-01 17:34:05.004604+05:30	2024-10-01 17:34:05.004604+05:30	127.0.0.1	1
4047	190	2024-10-01 17:49:56.415679+05:30	2024-10-01 17:49:56.415679+05:30	127.0.0.1	1
4048	190	2024-10-03 09:40:58.760372+05:30	2024-10-03 09:40:58.760372+05:30	127.0.0.1	1
4049	190	2024-10-03 10:11:57.079485+05:30	2024-10-03 10:11:57.079485+05:30	127.0.0.1	1
4050	190	2024-10-03 10:20:35.240306+05:30	2024-10-03 10:20:35.240306+05:30	127.0.0.1	1
4051	191	2024-10-03 10:27:45.486389+05:30	2024-10-03 10:27:45.486389+05:30	127.0.0.1	1
4052	190	2024-10-03 10:30:31.344591+05:30	2024-10-03 10:30:31.344591+05:30	127.0.0.1	1
4053	196	2024-10-03 11:01:10.781577+05:30	2024-10-03 11:01:10.781577+05:30	127.0.0.1	1
4054	190	2024-10-03 11:05:41.944133+05:30	2024-10-03 11:05:41.944133+05:30	127.0.0.1	1
4055	190	2024-10-03 11:34:33.131495+05:30	2024-10-03 11:34:33.131495+05:30	127.0.0.1	1
4056	190	2024-10-03 11:36:30.126544+05:30	2024-10-03 11:36:30.126544+05:30	127.0.0.1	1
4057	190	2024-10-03 11:37:45.781455+05:30	2024-10-03 11:37:45.781455+05:30	127.0.0.1	1
4058	190	2024-10-03 11:50:24.06529+05:30	2024-10-03 11:50:24.06529+05:30	127.0.0.1	1
4059	190	2024-10-03 11:50:29.696336+05:30	2024-10-03 11:50:29.696336+05:30	127.0.0.1	1
4060	190	2024-10-03 11:50:51.273256+05:30	2024-10-03 11:50:51.273256+05:30	127.0.0.1	1
4061	1	2024-10-03 12:10:51.486537+05:30	2024-10-03 12:10:51.486537+05:30	127.0.0.1	2
4062	1	2024-10-03 12:14:25.178784+05:30	2024-10-03 12:14:25.178784+05:30	127.0.0.1	2
4063	190	2024-10-03 12:18:40.315007+05:30	2024-10-03 12:18:40.315007+05:30	127.0.0.1	1
4064	190	2024-10-03 12:19:20.393204+05:30	2024-10-03 12:19:20.393204+05:30	127.0.0.1	1
4065	190	2024-10-03 12:20:54.204495+05:30	2024-10-03 12:20:54.204495+05:30	127.0.0.1	1
4066	190	2024-10-03 12:21:59.734125+05:30	2024-10-03 12:21:59.734125+05:30	127.0.0.1	1
4067	190	2024-10-03 12:26:22.099707+05:30	2024-10-03 12:26:22.099707+05:30	127.0.0.1	1
4068	190	2024-10-03 12:27:27.520013+05:30	2024-10-03 12:27:27.520013+05:30	127.0.0.1	1
4069	190	2024-10-03 12:28:21.654827+05:30	2024-10-03 12:28:21.654827+05:30	127.0.0.1	1
4070	190	2024-10-03 12:29:48.812878+05:30	2024-10-03 12:29:48.812878+05:30	127.0.0.1	1
4071	190	2024-10-03 12:31:39.331298+05:30	2024-10-03 12:31:39.331298+05:30	127.0.0.1	1
4072	190	2024-10-03 12:35:06.33589+05:30	2024-10-03 12:35:06.33589+05:30	127.0.0.1	1
4073	190	2024-10-03 12:38:09.645328+05:30	2024-10-03 12:38:09.645328+05:30	127.0.0.1	1
4074	190	2024-10-03 12:39:17.635594+05:30	2024-10-03 12:39:17.635594+05:30	127.0.0.1	1
4075	190	2024-10-03 12:40:16.428974+05:30	2024-10-03 12:40:16.428974+05:30	127.0.0.1	1
4076	190	2024-10-03 12:42:09.286391+05:30	2024-10-03 12:42:09.286391+05:30	127.0.0.1	1
4077	190	2024-10-03 12:42:35.754696+05:30	2024-10-03 12:42:35.754696+05:30	127.0.0.1	1
4078	190	2024-10-03 12:43:24.393934+05:30	2024-10-03 12:43:24.393934+05:30	127.0.0.1	1
4079	190	2024-10-03 13:01:23.005415+05:30	2024-10-03 13:01:23.005415+05:30	127.0.0.1	1
4080	190	2024-10-03 13:18:43.01963+05:30	2024-10-03 13:18:43.01963+05:30	127.0.0.1	1
4081	190	2024-10-03 13:20:23.044386+05:30	2024-10-03 13:20:23.044386+05:30	127.0.0.1	1
4082	190	2024-10-03 13:27:29.209029+05:30	2024-10-03 13:27:29.209029+05:30	127.0.0.1	1
4083	190	2024-10-03 13:28:49.412274+05:30	2024-10-03 13:28:49.412274+05:30	127.0.0.1	1
4084	190	2024-10-03 13:35:09.551022+05:30	2024-10-03 13:35:09.551022+05:30	127.0.0.1	1
4085	190	2024-10-03 13:38:50.57515+05:30	2024-10-03 13:38:50.57515+05:30	127.0.0.1	1
4086	190	2024-10-03 13:44:31.450847+05:30	2024-10-03 13:44:31.450847+05:30	127.0.0.1	1
4087	190	2024-10-03 14:17:02.22567+05:30	2024-10-03 14:17:02.22567+05:30	127.0.0.1	1
4088	190	2024-10-03 14:17:51.316228+05:30	2024-10-03 14:17:51.316228+05:30	127.0.0.1	1
4089	1	2024-10-03 14:53:19.319426+05:30	2024-10-03 14:53:19.319426+05:30	127.0.0.1	2
4090	190	2024-10-03 15:39:26.501583+05:30	2024-10-03 15:39:26.501583+05:30	127.0.0.1	1
4091	1	2024-10-03 15:39:52.010124+05:30	2024-10-03 15:39:52.010124+05:30	127.0.0.1	2
4092	190	2024-10-03 15:54:51.940903+05:30	2024-10-03 15:54:51.940903+05:30	127.0.0.1	1
4093	190	2024-10-03 16:21:21.12485+05:30	2024-10-03 16:21:21.12485+05:30	127.0.0.1	1
4094	190	2024-10-03 16:27:48.606229+05:30	2024-10-03 16:27:48.606229+05:30	127.0.0.1	1
4095	190	2024-10-03 16:56:02.350936+05:30	2024-10-03 16:56:02.350936+05:30	127.0.0.1	1
4096	190	2024-10-03 16:56:31.971732+05:30	2024-10-03 16:56:31.971732+05:30	127.0.0.1	1
4097	190	2024-10-03 17:07:09.93259+05:30	2024-10-03 17:07:09.93259+05:30	127.0.0.1	1
4098	190	2024-10-03 17:30:37.814759+05:30	2024-10-03 17:30:37.814759+05:30	127.0.0.1	1
4099	190	2024-10-03 17:50:07.504061+05:30	2024-10-03 17:50:07.504061+05:30	127.0.0.1	1
4100	190	2024-10-03 18:00:41.772878+05:30	2024-10-03 18:00:41.772878+05:30	127.0.0.1	1
4101	190	2024-10-03 18:09:10.611443+05:30	2024-10-03 18:09:10.611443+05:30	127.0.0.1	1
4102	190	2024-10-03 18:14:35.626115+05:30	2024-10-03 18:14:35.626115+05:30	127.0.0.1	1
4103	190	2024-10-03 18:16:56.743619+05:30	2024-10-03 18:16:56.743619+05:30	127.0.0.1	1
4104	190	2024-10-03 18:17:00.08926+05:30	2024-10-03 18:17:00.08926+05:30	127.0.0.1	1
4105	190	2024-10-03 18:17:16.428337+05:30	2024-10-03 18:17:16.428337+05:30	127.0.0.1	1
4106	190	2024-10-03 18:19:10.459752+05:30	2024-10-03 18:19:10.459752+05:30	127.0.0.1	1
4107	190	2024-10-04 09:55:54.793674+05:30	2024-10-04 09:55:54.793674+05:30	127.0.0.1	1
4108	190	2024-10-04 10:19:02.962519+05:30	2024-10-04 10:19:02.962519+05:30	127.0.0.1	1
4109	190	2024-10-04 10:28:19.665481+05:30	2024-10-04 10:28:19.665481+05:30	127.0.0.1	1
4110	190	2024-10-04 10:35:00.524299+05:30	2024-10-04 10:35:00.524299+05:30	127.0.0.1	1
4111	1	2024-10-04 10:36:11.071583+05:30	2024-10-04 10:36:11.071583+05:30	127.0.0.1	2
4112	190	2024-10-04 10:49:19.661032+05:30	2024-10-04 10:49:19.661032+05:30	127.0.0.1	1
4113	190	2024-10-04 11:01:30.032604+05:30	2024-10-04 11:01:30.032604+05:30	127.0.0.1	1
4114	1	2024-10-04 11:03:37.309295+05:30	2024-10-04 11:03:37.309295+05:30	127.0.0.1	2
4115	1	2024-10-04 11:12:56.402727+05:30	2024-10-04 11:12:56.402727+05:30	127.0.0.1	2
4116	1	2024-10-04 11:17:26.418386+05:30	2024-10-04 11:17:26.418386+05:30	127.0.0.1	2
4117	1	2024-10-04 11:30:51.721439+05:30	2024-10-04 11:30:51.721439+05:30	127.0.0.1	2
4118	1	2024-10-04 11:41:16.33639+05:30	2024-10-04 11:41:16.33639+05:30	127.0.0.1	2
4119	1	2024-10-04 11:45:46.592034+05:30	2024-10-04 11:45:46.592034+05:30	127.0.0.1	2
4120	1	2024-10-04 11:47:57.091169+05:30	2024-10-04 11:47:57.091169+05:30	127.0.0.1	2
4121	1	2024-10-04 12:00:08.69115+05:30	2024-10-04 12:00:08.69115+05:30	127.0.0.1	2
4122	1	2024-10-04 12:04:20.651967+05:30	2024-10-04 12:04:20.651967+05:30	127.0.0.1	2
4123	1	2024-10-04 12:06:27.867005+05:30	2024-10-04 12:06:27.867005+05:30	127.0.0.1	2
\.


--
-- TOC entry 5064 (class 0 OID 17133)
-- Dependencies: 240
-- Data for Name: support-ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."support-ticket" (ticket_id, client_id, ticket_subject, ticket_desc, status, "timestamp") FROM stdin;
12	190	Transaction List Not Found	Transaction List Not Found	1	2024-09-26 12:41:22.545183
\.


--
-- TOC entry 5065 (class 0 OID 17340)
-- Dependencies: 241
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction (id, transaction_id, client_id, assetid, transaction_type, requestedamount, requestedcurrency, convertedamount, convertedcurrency, receivedamount, receivedcurrency, status, substatus, customerrefid, note, createdate, destinationaddress, ip, approved_by, approver_id, approver_comment, approved_date, response_hash, response_from, response_to, response_timestamp, response_json) FROM stdin;
7	597b672674cd74ba054c68d8e77dccfc	190	17	TRANSFER	750	usd	750	usdt	750	usdt	SUCCESS	1	d68962d167266de8eaac2dda9d2e229a	Sending usdt to Addresses - TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	2024-09-26 14:50:31	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	127.0.0.1	\N	\N	\N	\N	68da2ba93b59ef381ef3ee2a0642a01f2dc092cd14acd8ba67e8843eb657886d	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	TU7BbAsb8t371eMijQeiGXsiLvY1vZbsFs	2024-09-21 18:18:36	{"contractMap":{"TU7BbAsb8t371eMijQeiGXsiLvY1vZbsFs":false,"THPvaUhoh2Qn2y9THCZML3H815hhFhn5YC":false,"TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9":false},"tokenInfo":{"tokenId":"TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t","tokenAbbr":"USDT","tokenName":"Tether USD","tokenDecimal":6,"tokenCanShow":1,"tokenType":"trc20","tokenLogo":"https://static.tronscan.org/production/logo/usdtlogo.png","tokenLevel":"2","issuerAddr":"THPvaUhoh2Qn2y9THCZML3H815hhFhn5YC","vip":true},"page_size":1,"code":200,"data":[{"amount":"750000000","status":0,"approval_amount":"0","block_timestamp":1726922916000,"block":65424900,"from":"TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9","to":"TU7BbAsb8t371eMijQeiGXsiLvY1vZbsFs","hash":"68da2ba93b59ef381ef3ee2a0642a01f2dc092cd14acd8ba67e8843eb657886d","contract_address":"TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t","confirmed":1,"contract_type":"TriggerSmartContract","contractType":31,"revert":0,"contract_ret":"SUCCESS","final_result":"SUCCESS","event_type":"Transfer","issue_address":"THPvaUhoh2Qn2y9THCZML3H815hhFhn5YC","decimals":6,"token_name":"TetherToken","id":"TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t","direction":1}]}\n
1	90e5b9d24a75c464e54234b94fcdd717	190	28	TRANSFER	2	usd	5.070544	ada	9.830583	ada	FAILED	9	2b341d17cf7b9c8a632e3db0e74d70c4	Sending ada to Addresses - addr1q86nww2uy4590v6p6qx6gy9clfd7maawjun7v0funxz26u50lryessgd4pd88j6l09n7pf5eq4g0eqmvh5d045c3g7zqng6xtg	2024-09-26 14:40:36	addr1q86nww2uy4590v6p6qx6gy9clfd7maawjun7v0funxz26u50lryessgd4pd88j6l09n7pf5eq4g0eqmvh5d045c3g7zqng6xtg	127.0.0.1	\N	\N	\N	\N	6cf88fd0c54e553b60096733683fea7ad65a14390c7b34072f00f3a9d2a6d47a	01f537395c256857b341d00da410b8fa5bedf7ae9727e63d3c9984ad728ff8c998410da85a73cb5f7967e0a6990550fc836cbd1afad3114784	01d3c710a45ea6bb696bd878e0335f96450325d6319f62f716e586544a4f5de0819535fd164c87dd469305eb4b04a6434ae29dbe925dcdf1ef	2024-09-26 14:41:04.095281	{"pageNo":1,"limit":1,"transactions":[{"hash":"6cf88fd0c54e553b60096733683fea7ad65a14390c7b34072f00f3a9d2a6d47a","blockHash":"6088b464bd05153a200624bdef0db5dafef4a592c71cf16ed7435c382353f785","fees":"169417","slot":134126,"epoch":492,"blockHeight":10470014,"absSlot":127314926,"timestamp":"2024-06-20T11:00:17.000Z","index":0,"inputs":[{"address":"01d3c710a45ea6bb696bd878e0335f96450325d6319f62f716e586544a4f5de0819535fd164c87dd469305eb4b04a6434ae29dbe925dcdf1ef","index":0,"txId":"ac1f21a9b730c2a34c75a5a4facf9efdb32e6ea6b7e3bd3bc314781d01f30a18","value":"20000000"}],"outputs":[{"address":"01f537395c256857b341d00da410b8fa5bedf7ae9727e63d3c9984ad728ff8c998410da85a73cb5f7967e0a6990550fc836cbd1afad3114784","value":"10000000"},{"address":"01d3c710a45ea6bb696bd878e0335f96450325d6319f62f716e586544a4f5de0819535fd164c87dd469305eb4b04a6434ae29dbe925dcdf1ef","value":"9830583"}],"certificate":{},"status":true,"ttl":{"slot":127321917,"timestamp":"2024-06-20T12:56:48.000Z"}}],"count":1}
2	9fc31f0bd619fcfb0521c28a41d0915c	190	28	TRANSFER	3.94	usd	9.988972	ada	9.830583	ada	SUCCESS	3	8b504189565b36b5f575f82aacc97353	Sending ada to Addresses - addr1q86nww2uy4590v6p6qx6gy9clfd7maawjun7v0funxz26u50lryessgd4pd88j6l09n7pf5eq4g0eqmvh5d045c3g7zqng6xtg	2024-09-26 14:41:27	addr1q86nww2uy4590v6p6qx6gy9clfd7maawjun7v0funxz26u50lryessgd4pd88j6l09n7pf5eq4g0eqmvh5d045c3g7zqng6xtg	127.0.0.1	\N	\N	\N	\N	6cf88fd0c54e553b60096733683fea7ad65a14390c7b34072f00f3a9d2a6d47a	01f537395c256857b341d00da410b8fa5bedf7ae9727e63d3c9984ad728ff8c998410da85a73cb5f7967e0a6990550fc836cbd1afad3114784	01d3c710a45ea6bb696bd878e0335f96450325d6319f62f716e586544a4f5de0819535fd164c87dd469305eb4b04a6434ae29dbe925dcdf1ef	2024-06-20 11:00:17	{"pageNo":1,"limit":1,"transactions":[{"hash":"6cf88fd0c54e553b60096733683fea7ad65a14390c7b34072f00f3a9d2a6d47a","blockHash":"6088b464bd05153a200624bdef0db5dafef4a592c71cf16ed7435c382353f785","fees":"169417","slot":134126,"epoch":492,"blockHeight":10470014,"absSlot":127314926,"timestamp":"2024-06-20T11:00:17.000Z","index":0,"inputs":[{"address":"01d3c710a45ea6bb696bd878e0335f96450325d6319f62f716e586544a4f5de0819535fd164c87dd469305eb4b04a6434ae29dbe925dcdf1ef","index":0,"txId":"ac1f21a9b730c2a34c75a5a4facf9efdb32e6ea6b7e3bd3bc314781d01f30a18","value":"20000000"}],"outputs":[{"address":"01f537395c256857b341d00da410b8fa5bedf7ae9727e63d3c9984ad728ff8c998410da85a73cb5f7967e0a6990550fc836cbd1afad3114784","value":"10000000"},{"address":"01d3c710a45ea6bb696bd878e0335f96450325d6319f62f716e586544a4f5de0819535fd164c87dd469305eb4b04a6434ae29dbe925dcdf1ef","value":"9830583"}],"certificate":{},"status":true,"ttl":{"slot":127321917,"timestamp":"2024-06-20T12:56:48.000Z"}}],"count":1}
8	dd7d4541dae1478e90911bee4511990f	190	17	TRANSFER	760	usd	760	usdt	750	usdt	SUCCESS	3	2b5816d7bdf26028bf531259797f0379	Sending usdt to Addresses - TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	2024-09-26 14:53:38	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	127.0.0.1	\N	\N	\N	\N	68da2ba93b59ef381ef3ee2a0642a01f2dc092cd14acd8ba67e8843eb657886d	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	TU7BbAsb8t371eMijQeiGXsiLvY1vZbsFs	2024-09-21 18:18:36	{"contractMap":{"TU7BbAsb8t371eMijQeiGXsiLvY1vZbsFs":false,"THPvaUhoh2Qn2y9THCZML3H815hhFhn5YC":false,"TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9":false},"tokenInfo":{"tokenId":"TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t","tokenAbbr":"USDT","tokenName":"Tether USD","tokenDecimal":6,"tokenCanShow":1,"tokenType":"trc20","tokenLogo":"https://static.tronscan.org/production/logo/usdtlogo.png","tokenLevel":"2","issuerAddr":"THPvaUhoh2Qn2y9THCZML3H815hhFhn5YC","vip":true},"page_size":1,"code":200,"data":[{"amount":"750000000","status":0,"approval_amount":"0","block_timestamp":1726922916000,"block":65424900,"from":"TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9","to":"TU7BbAsb8t371eMijQeiGXsiLvY1vZbsFs","hash":"68da2ba93b59ef381ef3ee2a0642a01f2dc092cd14acd8ba67e8843eb657886d","contract_address":"TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t","confirmed":1,"contract_type":"TriggerSmartContract","contractType":31,"revert":0,"contract_ret":"SUCCESS","final_result":"SUCCESS","event_type":"Transfer","issue_address":"THPvaUhoh2Qn2y9THCZML3H815hhFhn5YC","decimals":6,"token_name":"TetherToken","id":"TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t","direction":1}]}\n
30	624595b74d4466e34aff403acd122177	190	32	TRANSFER	750	usd	0.284094	eth	0	eth	FAILED	8	d68962d167266de8eaac2dda9d2e229a	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 12:54:59	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 12:56:40.90869	\N
33	984ceee27a9904acaf8f3b16c1c6b566	190	32	TRANSFER	47.52	usd	0.018019	eth	0	eth	FAILED	8	e5c4ca6789688297e1d251a120574dc5	Sending eth to Addresses - 0xae9cB013843c748969D35D55bd355aFa75eb79d7	2024-09-30 13:14:40	0xae9cB013843c748969D35D55bd355aFa75eb79d7	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 13:25:00.45007	\N
34	405c2403944e02239c6602cf7ee950eb	190	32	TRANSFER	47.52	usd	0.018019	eth	0	eth	PROCESS	0	e5c4ca6789688297e1d251a120574dc5	Sending eth to Addresses - 0xae9cB013843c748969D35D55bd355aFa75eb79d7	2024-09-30 13:25:13	0xae9cB013843c748969D35D55bd355aFa75eb79d7	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	8a866662cfa7488b069608c17505bdfb	190	28	TRANSFER	3.83	usd	9.710092	ada	9.830583	ada	SUCCESS	2	54384b7834ad56c3ec428732f25f856e	Sending ada to Addresses - addr1q86nww2uy4590v6p6qx6gy9clfd7maawjun7v0funxz26u50lryessgd4pd88j6l09n7pf5eq4g0eqmvh5d045c3g7zqng6xtg	2024-09-26 14:42:43	addr1q86nww2uy4590v6p6qx6gy9clfd7maawjun7v0funxz26u50lryessgd4pd88j6l09n7pf5eq4g0eqmvh5d045c3g7zqng6xtg	127.0.0.1	\N	\N	\N	\N	6cf88fd0c54e553b60096733683fea7ad65a14390c7b34072f00f3a9d2a6d47a	01f537395c256857b341d00da410b8fa5bedf7ae9727e63d3c9984ad728ff8c998410da85a73cb5f7967e0a6990550fc836cbd1afad3114784	01d3c710a45ea6bb696bd878e0335f96450325d6319f62f716e586544a4f5de0819535fd164c87dd469305eb4b04a6434ae29dbe925dcdf1ef	2024-06-20 11:00:17	{"pageNo":1,"limit":1,"transactions":[{"hash":"6cf88fd0c54e553b60096733683fea7ad65a14390c7b34072f00f3a9d2a6d47a","blockHash":"6088b464bd05153a200624bdef0db5dafef4a592c71cf16ed7435c382353f785","fees":"169417","slot":134126,"epoch":492,"blockHeight":10470014,"absSlot":127314926,"timestamp":"2024-06-20T11:00:17.000Z","index":0,"inputs":[{"address":"01d3c710a45ea6bb696bd878e0335f96450325d6319f62f716e586544a4f5de0819535fd164c87dd469305eb4b04a6434ae29dbe925dcdf1ef","index":0,"txId":"ac1f21a9b730c2a34c75a5a4facf9efdb32e6ea6b7e3bd3bc314781d01f30a18","value":"20000000"}],"outputs":[{"address":"01f537395c256857b341d00da410b8fa5bedf7ae9727e63d3c9984ad728ff8c998410da85a73cb5f7967e0a6990550fc836cbd1afad3114784","value":"10000000"},{"address":"01d3c710a45ea6bb696bd878e0335f96450325d6319f62f716e586544a4f5de0819535fd164c87dd469305eb4b04a6434ae29dbe925dcdf1ef","value":"9830583"}],"certificate":{},"status":true,"ttl":{"slot":127321917,"timestamp":"2024-06-20T12:56:48.000Z"}}],"count":1}
4	c0f7fa07cdc8376660e450a59a1bb44a	190	28	TRANSFER	3.91	usd	9.912913	ada	9.830583	ada	SUCCESS	3	1bf95abf895ea74413decba5bd2177fd	Sending ada to Addresses - addr1q86nww2uy4590v6p6qx6gy9clfd7maawjun7v0funxz26u50lryessgd4pd88j6l09n7pf5eq4g0eqmvh5d045c3g7zqng6xtg	2024-09-26 14:43:35	addr1q86nww2uy4590v6p6qx6gy9clfd7maawjun7v0funxz26u50lryessgd4pd88j6l09n7pf5eq4g0eqmvh5d045c3g7zqng6xtg	127.0.0.1	\N	\N	\N	\N	6cf88fd0c54e553b60096733683fea7ad65a14390c7b34072f00f3a9d2a6d47a	01f537395c256857b341d00da410b8fa5bedf7ae9727e63d3c9984ad728ff8c998410da85a73cb5f7967e0a6990550fc836cbd1afad3114784	01d3c710a45ea6bb696bd878e0335f96450325d6319f62f716e586544a4f5de0819535fd164c87dd469305eb4b04a6434ae29dbe925dcdf1ef	2024-06-20 11:00:17	{"pageNo":1,"limit":1,"transactions":[{"hash":"6cf88fd0c54e553b60096733683fea7ad65a14390c7b34072f00f3a9d2a6d47a","blockHash":"6088b464bd05153a200624bdef0db5dafef4a592c71cf16ed7435c382353f785","fees":"169417","slot":134126,"epoch":492,"blockHeight":10470014,"absSlot":127314926,"timestamp":"2024-06-20T11:00:17.000Z","index":0,"inputs":[{"address":"01d3c710a45ea6bb696bd878e0335f96450325d6319f62f716e586544a4f5de0819535fd164c87dd469305eb4b04a6434ae29dbe925dcdf1ef","index":0,"txId":"ac1f21a9b730c2a34c75a5a4facf9efdb32e6ea6b7e3bd3bc314781d01f30a18","value":"20000000"}],"outputs":[{"address":"01f537395c256857b341d00da410b8fa5bedf7ae9727e63d3c9984ad728ff8c998410da85a73cb5f7967e0a6990550fc836cbd1afad3114784","value":"10000000"},{"address":"01d3c710a45ea6bb696bd878e0335f96450325d6319f62f716e586544a4f5de0819535fd164c87dd469305eb4b04a6434ae29dbe925dcdf1ef","value":"9830583"}],"certificate":{},"status":true,"ttl":{"slot":127321917,"timestamp":"2024-06-20T12:56:48.000Z"}}],"count":1}
31	c97185d31da70de754fd5455a0cbeb72	190	32	TRANSFER	750	usd	0.28398	eth	0.018	eth	FAILED	9	d68962d167266de8eaac2dda9d2e229a	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 13:00:04	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	0x0f5b7beb67b5bfecf1838e3a41bd6ece45a47e62e0fa385d43f9dd84c1ec67f6	0x8c8d7c46219d9205f056f28fee5950ad564d7465	0xb9588dac899318f2e452e40eb2ee3192cc784db6	2024-09-30 13:00:32.300663	{"status":"1","message":"OK","result":[{"blockNumber":"20860366","timeStamp":"1727661959","hash":"0x0f5b7beb67b5bfecf1838e3a41bd6ece45a47e62e0fa385d43f9dd84c1ec67f6","nonce":"1403468","blockHash":"0xf7ebb576e41e6a71084eef2c04d8640e96e442d6a3a96af865e19de68f4946ed","transactionIndex":"91","from":"0x8c8d7c46219d9205f056f28fee5950ad564d7465","to":"0xb9588dac899318f2e452e40eb2ee3192cc784db6","value":"18000000000000000","gas":"21000","gasPrice":"5275376471","isError":"0","txreceipt_status":"1","input":"0x","contractAddress":"","cumulativeGasUsed":"10554580","gasUsed":"21000","confirmations":"1617","methodId":"0x","functionName":""}]}
6	9f5ab8f8dbe28b1a82daed585a33636d	190	17	TRANSFER	740	usd	740	usdt	750	usdt	SUCCESS	2	24ab0916935939fcaf0d902fbd0b0698	Sending usdt to Addresses - TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	2024-09-26 14:49:36	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	127.0.0.1	\N	\N	\N	\N	68da2ba93b59ef381ef3ee2a0642a01f2dc092cd14acd8ba67e8843eb657886d	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	TU7BbAsb8t371eMijQeiGXsiLvY1vZbsFs	2024-09-21 18:18:36	{"contractMap":{"TU7BbAsb8t371eMijQeiGXsiLvY1vZbsFs":false,"THPvaUhoh2Qn2y9THCZML3H815hhFhn5YC":false,"TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9":false},"tokenInfo":{"tokenId":"TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t","tokenAbbr":"USDT","tokenName":"Tether USD","tokenDecimal":6,"tokenCanShow":1,"tokenType":"trc20","tokenLogo":"https://static.tronscan.org/production/logo/usdtlogo.png","tokenLevel":"2","issuerAddr":"THPvaUhoh2Qn2y9THCZML3H815hhFhn5YC","vip":true},"page_size":1,"code":200,"data":[{"amount":"750000000","status":0,"approval_amount":"0","block_timestamp":1726922916000,"block":65424900,"from":"TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9","to":"TU7BbAsb8t371eMijQeiGXsiLvY1vZbsFs","hash":"68da2ba93b59ef381ef3ee2a0642a01f2dc092cd14acd8ba67e8843eb657886d","contract_address":"TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t","confirmed":1,"contract_type":"TriggerSmartContract","contractType":31,"revert":0,"contract_ret":"SUCCESS","final_result":"SUCCESS","event_type":"Transfer","issue_address":"THPvaUhoh2Qn2y9THCZML3H815hhFhn5YC","decimals":6,"token_name":"TetherToken","id":"TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t","direction":1}]}\n
5	8227d674af755ce4abb2f85d7c59a317	190	28	TRANSFER	2	usd	5.088864	ada	0	ada	FAILED	8	2b341d17cf7b9c8a632e3db0e74d70c4	Sending ada to Addresses - addr1q86nww2uy4590v6p6qx6gy9clfd7maawjun7v0funxz26u50lryessgd4pd88j6l09n7pf5eq4g0eqmvh5d045c3g7zqng6xtg	2024-09-26 14:46:08	addr1q86nww2uy4590v6p6qx6gy9clfd7maawjun7v0funxz26u50lryessgd4pd88j6l09n7pf5eq4g0eqmvh5d045c3g7zqng6xtg	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 09:51:43.739942	\N
29	2f61f9162a5db5a3ddb0f60780ceed74	190	32	TRANSFER	750	usd	0.284166	eth	0	eth	FAILED	8	d68962d167266de8eaac2dda9d2e229a	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 12:48:57	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 12:50:37.893916	\N
32	57dbb27fcd66b4690bc5a738d594c725	190	32	TRANSFER	47.52	usd	0.017993	eth	0.018	eth	SUCCESS	2	e5c4ca6789688297e1d251a120574dc5	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 13:04:42	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	0x0f5b7beb67b5bfecf1838e3a41bd6ece45a47e62e0fa385d43f9dd84c1ec67f6	0x8c8d7c46219d9205f056f28fee5950ad564d7465	0xb9588dac899318f2e452e40eb2ee3192cc784db6	2024-09-30 07:35:59	{"status":"1","message":"OK","result":[{"blockNumber":"20860366","blockHash":"0xf7ebb576e41e6a71084eef2c04d8640e96e442d6a3a96af865e19de68f4946ed","timeStamp":"1727661959","hash":"0x0f5b7beb67b5bfecf1838e3a41bd6ece45a47e62e0fa385d43f9dd84c1ec67f6","nonce":"1403468","transactionIndex":"91","from":"0x8c8d7c46219d9205f056f28fee5950ad564d7465","to":"0xb9588dac899318f2e452e40eb2ee3192cc784db6","value":"18000000000000000","gas":"21000","gasPrice":"5275376471","input":"0x","methodId":"0x","functionName":"","contractAddress":"","cumulativeGasUsed":"10554580","txreceipt_status":"1","gasUsed":"21000","confirmations":"1640","isError":"0"}]}
9	2f1e370817dc27a1f036a2dc64f5954b	190	17	TRANSFER	780	usd	780	usdt	750	usdt	FAILED	9	065ddd52dc3332d29bd822d352a42a01	Sending usdt to Addresses - TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	2024-09-26 14:54:38	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	127.0.0.1	\N	\N	\N	\N	68da2ba93b59ef381ef3ee2a0642a01f2dc092cd14acd8ba67e8843eb657886d	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	TU7BbAsb8t371eMijQeiGXsiLvY1vZbsFs	2024-09-26 14:55:04.697811	{"contractMap":{"TU7BbAsb8t371eMijQeiGXsiLvY1vZbsFs":false,"THPvaUhoh2Qn2y9THCZML3H815hhFhn5YC":false,"TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9":false},"tokenInfo":{"tokenId":"TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t","tokenAbbr":"USDT","tokenName":"Tether USD","tokenDecimal":6,"tokenCanShow":1,"tokenType":"trc20","tokenLogo":"https://static.tronscan.org/production/logo/usdtlogo.png","tokenLevel":"2","issuerAddr":"THPvaUhoh2Qn2y9THCZML3H815hhFhn5YC","vip":true},"page_size":1,"code":200,"data":[{"amount":"750000000","status":0,"approval_amount":"0","block_timestamp":1726922916000,"block":65424900,"from":"TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9","to":"TU7BbAsb8t371eMijQeiGXsiLvY1vZbsFs","hash":"68da2ba93b59ef381ef3ee2a0642a01f2dc092cd14acd8ba67e8843eb657886d","contract_address":"TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t","confirmed":1,"contract_type":"TriggerSmartContract","contractType":31,"revert":0,"contract_ret":"SUCCESS","final_result":"SUCCESS","event_type":"Transfer","issue_address":"THPvaUhoh2Qn2y9THCZML3H815hhFhn5YC","decimals":6,"token_name":"TetherToken","id":"TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t","direction":1}]}\n
16	ca10e23b936b8c6bea3a42f52d37f711	190	32	TRANSFER	780	usd	0.296508	eth	0	eth	FAILED	8	065ddd52dc3332d29bd822d352a42a01	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 11:23:40	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 11:28:16.231511	\N
17	dc8e7f7257890cf30751e0a5d9ef8c61	190	32	TRANSFER	760	usd	0.288058	eth	0	eth	FAILED	8	2b5816d7bdf26028bf531259797f0379	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 11:33:40	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 11:35:21.23549	\N
10	4a3fa6ff465e1f4ebb066f97e7fe4edb	190	17	TRANSFER	750	usd	750	usdt	200	usdt	Hi	3	d68962d167266de8eaac2dda9d2e229a	Sending usdt to Addresses - TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	2024-09-26 14:58:51	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	127.0.0.1	Admin ITIO	1	dasfsfdsf	2024-09-26 16:55:15	sdfghjdfgsadfghmghdsfae	\N	\N	2024-09-26 15:00:32.081366	\N
13	200acbc20bbe1cbe82bd76f64ed60f97	190	17	TRANSFER	750	usd	750	usdt	750	usdt	SUCCESS	1	d68962d167266de8eaac2dda9d2e229a	Sending usdt to Addresses - TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	2024-09-26 16:36:50	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	127.0.0.1	Admin ITIO	1	TESTTT	2024-09-26 17:08:01	FDGHJFDGTSRDFGJNBJGFDSFDHG	\N	\N	2024-09-26 16:38:30.974615	\N
11	b29aed96a719ce11c5a97c0529b3cdec	190	17	WITHDRAW	100	usdt	100	usdt	-100	usdt	SUCCESS	1	\N	Sending usdt to Addresses - dfdgfhgjhgjhgj	2024-09-26 15:35:32	dfdgfhgjhgjhgj	127.0.0.1	Admin ITIO	1	RDGDTJYTITUMRNTB	2024-09-26 17:08:42	100	\N	\N	\N	\N
12	94e80b66a2db4f762f8d3a671a2c042f	190	17	FEE	10	usdt	10	usdt	5	usdt	SUCCESS	1	b29aed96a719ce11c5a97c0529b3cdec	Withdraw Fees	2024-09-26 15:35:32		127.0.0.1	Admin ITIO	1	RDGDTJYTITUMRNTB	2024-09-26 17:08:42	sdfgdfhfghgfhdfsfADSA	\N	\N	\N	\N
14	d2e37302c660ce155e3899aca4407cfe	190	32	TRANSFER	750	usd	0.285211	eth	0	eth	FAILED	8	d68962d167266de8eaac2dda9d2e229a	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 10:41:20	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 10:43:05.968516	\N
15	7dae61944a53ff13ee8fa3166688e837	190	32	TRANSFER	750	usd	0.28521	eth	0	eth	PROCESS	0	d68962d167266de8eaac2dda9d2e229a	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 10:50:35	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	8cf38b57dd0b688249d79c7d6c90eaf5	190	32	TRANSFER	780	usd	0.29506	eth	0	eth	FAILED	8	065ddd52dc3332d29bd822d352a42a01	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 11:41:32	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 11:43:24.910371	\N
19	d43ed66ef9b3de180c1ba78d5f144aa9	190	32	TRANSFER	760	usd	0.287494	eth	0	eth	FAILED	8	2b5816d7bdf26028bf531259797f0379	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 11:45:46	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 11:47:26.914448	\N
20	8411c8e5cf44e88dda3110243c0f1b99	190	17	TRANSFER	3.91	usd	3.912257	usdt	0	usdt	FAILED	8	1bf95abf895ea74413decba5bd2177fd	Sending usdt to Addresses - TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	2024-09-30 11:56:39	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 11:58:26.913228	\N
21	253aa188f54239e1fbc01c1ebb7041c1	190	32	TRANSFER	740	usd	0.280581	eth	0	eth	FAILED	8	24ab0916935939fcaf0d902fbd0b0698	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 12:01:25	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 12:03:05.255077	\N
22	216fbbe1891997fcfac204aff38b3d42	190	32	TRANSFER	780	usd	0.295748	eth	0	eth	FAILED	8	065ddd52dc3332d29bd822d352a42a01	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 12:03:32	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 12:05:38.900403	\N
23	2eb06c7cc70eb3321df01a0415282364	190	32	TRANSFER	750	usd	0.284594	eth	0	eth	FAILED	8	d68962d167266de8eaac2dda9d2e229a	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 12:12:48	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 12:14:29.218071	\N
24	712b744687a801e5156e7234e082696a	190	32	TRANSFER	750	usd	0.284834	eth	0	eth	FAILED	8	d68962d167266de8eaac2dda9d2e229a	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 12:22:25	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 12:24:05.31574	\N
25	b2d9e0af2f4109642da5c6e88d2dd870	190	32	TRANSFER	750	usd	0.285193	eth	0	eth	FAILED	8	d68962d167266de8eaac2dda9d2e229a	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 12:28:59	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 12:30:39.922008	\N
26	afc02cdd2f1caa145dd3e0f654699be2	190	32	TRANSFER	780	usd	0.296601	eth	0	eth	PROCESS	0	065ddd52dc3332d29bd822d352a42a01	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 12:31:50	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	f47877bb1ab3e41acc7dbfcc3d86bfd0	190	32	TRANSFER	780	usd	0.296601	eth	0	eth	PROCESS	0	065ddd52dc3332d29bd822d352a42a01	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 12:31:54	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	66d6043363b399de5e6878c37e845dff	190	32	TRANSFER	740	usd	0.281107	eth	0	eth	FAILED	8	24ab0916935939fcaf0d902fbd0b0698	Sending eth to Addresses - 0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	2024-09-30 12:41:29	0xb9588DAc899318F2E452E40EB2ee3192CC784Db6	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 12:43:38.218775	\N
35	0ed9d532e483e133f8b47797fd2fa4d1	190	32	TRANSFER	47.52	usd	0.018019	eth	0	eth	PROCESS	0	e5c4ca6789688297e1d251a120574dc5	Sending eth to Addresses - 0xae9cB013843c748969D35D55bd355aFa75eb79d7	2024-09-30 13:28:26	0xae9cB013843c748969D35D55bd355aFa75eb79d7	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	29c460839bbc2b94a61314386000f8b4	190	32	TRANSFER	47.52	usd	0.018007	eth	0	eth	FAILED	8	e5c4ca6789688297e1d251a120574dc5	Sending eth to Addresses - 0xae9cB013843c748969D35D55bd355aFa75eb79d7	2024-09-30 13:30:20	0xae9cB013843c748969D35D55bd355aFa75eb79d7	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 13:32:00.914945	\N
37	2c3c11b14b4d2e6ed784e575cde741f9	190	28	TRANSFER	750	usd	1950.661274	ada	0	ada	PROCESS	0	d68962d167266de8eaac2dda9d2e229a	Sending ada to Addresses - addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	2024-09-30 17:11:58	addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	8944311c248a8b54fd1c2ede3ac17861	190	28	TRANSFER	47.52	usd	137.223647	ada	0	ada	FAILED	8	e5c4ca6789688297e1d251a120574dc5	Sending ada to Addresses - addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	2024-10-03 11:59:45	addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-03 12:01:57.311571	\N
38	d4b657917fb8e057e52c0f773ab9264d	190	28	TRANSFER	47.52	usd	123.5759	ada	200.5759	ada	SUCCESS	2	e5c4ca6789688297e1d251a120574dc5	Sending ada to Addresses - addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	2024-09-30 17:22:06	addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	127.0.0.1	Admin ITIO	1	gdffdgf	2024-09-30 18:08:14	sdfsdfdsfds	\N	\N	\N	\N
45	42c95bbbfb51278740306af61ef924a2	190	32	TRANSFER	750	usd	0.31412	eth	0	eth	FAILED	8	d68962d167266de8eaac2dda9d2e229a	Sending eth to Addresses - 0xae9cB013843c748969D35D55bd355aFa75eb79d7	2024-10-03 12:02:49	0xae9cB013843c748969D35D55bd355aFa75eb79d7	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-03 12:04:30.362391	\N
39	a448db1371ee521d334d7b64dc12f08a	190	28	TRANSFER	47.52	usd	123.5759	ada	0	ada	FAILED	9	e5c4ca6789688297e1d251a120574dc5	Sending ada to Addresses - addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	2024-09-30 17:25:24	addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-09-30 18:23:00.674673	\N
40	d18c4b3113dfd9804a9f1d4288b5de40	190	32	TRANSFER	47.52	usd	0.017954	eth	0	eth	FAILED	8	e5c4ca6789688297e1d251a120574dc5	Sending eth to Addresses - 0xae9cB013843c748969D35D55bd355aFa75eb79d7	2024-10-01 13:10:57	0xae9cB013843c748969D35D55bd355aFa75eb79d7	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-01 13:12:38.029332	\N
41	d3743938c9e8849a856c7f14b2aa24f1	190	28	TRANSFER	47.52	usd	123.609973	ada	0	ada	FAILED	8	e5c4ca6789688297e1d251a120574dc5	Sending ada to Addresses - addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	2024-10-01 17:39:21	addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-01 17:41:02.020739	\N
42	530ccc2e37f73195d3402d1e37680fb1	190	17	TRANSFER	2	usd	2	usdt	0	usdt	FAILED	8	2b341d17cf7b9c8a632e3db0e74d70c4	Sending usdt to Addresses - TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	2024-10-01 17:43:17	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-01 17:44:58.042355	\N
43	e354592521c258f2ac436cf228b4771f	190	28	TRANSFER	47.52	usd	123.505241	ada	0	ada	FAILED	8	e5c4ca6789688297e1d251a120574dc5	Sending ada to Addresses - addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	2024-10-01 17:50:09	addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-01 17:51:55.340581	\N
46	70be0d8cff3eed5daffd4ad943ae4a6e	190	17	TRANSFER	3.94	usd	3.941174	usdt	0	usdt	FAILED	8	8b504189565b36b5f575f82aacc97353	Sending usdt to Addresses - TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	2024-10-03 12:06:48	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-03 12:08:28.649423	\N
47	dd5046244693fe1ae8418857205d42e0	190	12	TRANSFER	47.52	usd	0.000783	btc	0	btc	FAILED	8	e5c4ca6789688297e1d251a120574dc5	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 15:40:35	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-03 15:42:19.312691	\N
48	21e90ca2d4d15809a823ca89dab0c288	190	12	TRANSFER	2	usd	3.3e-05	btc	0	btc	FAILED	8	2b341d17cf7b9c8a632e3db0e74d70c4	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 15:55:02	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-03 15:58:38.655457	\N
49	11a241e8d4bf93230c0307fc5202f671	190	12	TRANSFER	760	usd	0.012512	btc	0	btc	FAILED	8	2b5816d7bdf26028bf531259797f0379	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 16:01:58	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-03 16:04:34.310891	\N
50	0a2ad351dfbc67a473846afdbb4290ba	190	12	TRANSFER	750	usd	0.012314	btc	0	btc	FAILED	8	d68962d167266de8eaac2dda9d2e229a	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 16:21:34	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-03 16:23:14.319815	\N
51	6a0ecf55f9400ed3ea15adf9d81e3a93	190	12	TRANSFER	780	usd	0.012807	btc	0	btc	FAILED	8	065ddd52dc3332d29bd822d352a42a01	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 16:23:54	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-03 16:28:02.323546	\N
52	4f6214bab4a549f98d7283b44b472698	190	12	TRANSFER	750	usd	0.012311	btc	0	btc	FAILED	8	d68962d167266de8eaac2dda9d2e229a	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 16:28:03	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-03 16:29:44.319836	\N
53	9e2e6fb741654565805b7b87f686a487	190	12	TRANSFER	740	usd	0.012134	btc	0	btc	FAILED	8	24ab0916935939fcaf0d902fbd0b0698	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 16:34:22	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-03 16:36:04.316378	\N
54	1786bad37a0b324e280fea2b9b85b476	190	12	TRANSFER	760	usd	0.012451	btc	0	btc	FAILED	8	2b5816d7bdf26028bf531259797f0379	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 16:44:49	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-03 16:46:49.012506	\N
55	f5db10911b3da1bfcaf47a13be5de518	190	12	TRANSFER	780	usd	0.012784	btc	0	btc	FAILED	8	065ddd52dc3332d29bd822d352a42a01	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 16:47:00	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-03 16:50:14.195713	\N
56	c2e66171751b25667c295af57a4f8bfe	190	12	TRANSFER	3.91	usd	6.4e-05	btc	0	btc	FAILED	8	1bf95abf895ea74413decba5bd2177fd	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 16:50:24	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-03 16:52:05.303808	\N
57	2df5845f723054b5c5597be3bdbed101	190	12	TRANSFER	740	usd	0.012159	btc	0.000507	btc	FAILED	9	24ab0916935939fcaf0d902fbd0b0698	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 16:53:47	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54	bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 16:54:14.855309	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":139,"n_unredeemed":3,"total_received":7569174,"total_sent":7454771,"final_balance":114403,"txs":[{"hash":"f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54","ver":2,"vin_sz":1,"vout_sz":1,"size":191,"weight":437,"fee":1430,"relayed_by":"0.0.0.0","lock_time":0,"tx_index":2989875543450801,"double_spend":false,"time":1727477998,"block_index":863139,"block_height":863139,"inputs":[{"sequence":4294967293,"witness":"0247304402207e1124151fbf21b7c23c26d2f31226fcad52a17cdd8b65dd2b6734c28d74f8d602205ec596484f47ccbbffc58c57cbe7aa32254cce2ac2e3b17e320ffce5cb0573fb0121036c726705bb32c7e30c08535f5f818673ec9bcce5c97da3ccffd878694b007f1a","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":52103,"spending_outpoints":[{"tx_index":2989875543450801,"n":0}],"n":1,"tx_index":7437229016133164,"script":"0014384ff64ef3df965b2596313fa421c2810e4ed09a","addr":"bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq"}}],"out":[{"type":0,"spent":false,"value":50673,"spending_outpoints":[],"n":0,"tx_index":2989875543450801,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"}],"result":50673,"balance":114403}]}
58	9f0a031f8cda339f9f678a2328d2ba47	190	12	TRANSFER	3.91	usd	6.4e-05	btc	0.000507	btc	FAILED	9	1bf95abf895ea74413decba5bd2177fd	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 16:55:11	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54	bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 16:55:37.890563	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":139,"n_unredeemed":3,"total_received":7569174,"total_sent":7454771,"final_balance":114403,"txs":[{"hash":"f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54","ver":2,"vin_sz":1,"vout_sz":1,"size":191,"weight":437,"fee":1430,"relayed_by":"0.0.0.0","lock_time":0,"tx_index":2989875543450801,"double_spend":false,"time":1727477999,"block_index":863139,"block_height":863139,"inputs":[{"sequence":4294967293,"witness":"0247304402207e1124151fbf21b7c23c26d2f31226fcad52a17cdd8b65dd2b6734c28d74f8d602205ec596484f47ccbbffc58c57cbe7aa32254cce2ac2e3b17e320ffce5cb0573fb0121036c726705bb32c7e30c08535f5f818673ec9bcce5c97da3ccffd878694b007f1a","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":52103,"spending_outpoints":[{"tx_index":2989875543450801,"n":0}],"n":1,"tx_index":7437229016133164,"script":"0014384ff64ef3df965b2596313fa421c2810e4ed09a","addr":"bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq"}}],"out":[{"type":0,"spent":false,"value":50673,"spending_outpoints":[],"n":0,"tx_index":2989875543450801,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"}],"result":50673,"balance":114403}]}
59	9566a40e8835a5254f29e7e57e52d2ed	190	12	TRANSFER	3.91	usd	6.4e-05	btc	0.000507	btc	FAILED	9	1bf95abf895ea74413decba5bd2177fd	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:07:24	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54	bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:07:51.96154	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":139,"n_unredeemed":3,"total_received":7569174,"total_sent":7454771,"final_balance":114403,"txs":[{"hash":"f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54","ver":2,"vin_sz":1,"vout_sz":1,"size":191,"weight":437,"fee":1430,"relayed_by":"0.0.0.0","lock_time":0,"tx_index":2989875543450801,"double_spend":false,"time":1727478000,"block_index":863139,"block_height":863139,"inputs":[{"sequence":4294967293,"witness":"0247304402207e1124151fbf21b7c23c26d2f31226fcad52a17cdd8b65dd2b6734c28d74f8d602205ec596484f47ccbbffc58c57cbe7aa32254cce2ac2e3b17e320ffce5cb0573fb0121036c726705bb32c7e30c08535f5f818673ec9bcce5c97da3ccffd878694b007f1a","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":52103,"spending_outpoints":[{"tx_index":2989875543450801,"n":0}],"n":1,"tx_index":7437229016133164,"script":"0014384ff64ef3df965b2596313fa421c2810e4ed09a","addr":"bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq"}}],"out":[{"type":0,"spent":false,"value":50673,"spending_outpoints":[],"n":0,"tx_index":2989875543450801,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"}],"result":50673,"balance":114403}]}
60	a44234e834a024c2ca82572114248182	190	12	TRANSFER	3.91	usd	6.4e-05	btc	0.000507	btc	FAILED	9	1bf95abf895ea74413decba5bd2177fd	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:09:49	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54	bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:10:16.838037	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":139,"n_unredeemed":3,"total_received":7569174,"total_sent":7454771,"final_balance":114403,"txs":[{"hash":"f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54","ver":2,"vin_sz":1,"vout_sz":1,"size":191,"weight":437,"fee":1430,"relayed_by":"0.0.0.0","lock_time":0,"tx_index":2989875543450801,"double_spend":false,"time":1727477998,"block_index":863139,"block_height":863139,"inputs":[{"sequence":4294967293,"witness":"0247304402207e1124151fbf21b7c23c26d2f31226fcad52a17cdd8b65dd2b6734c28d74f8d602205ec596484f47ccbbffc58c57cbe7aa32254cce2ac2e3b17e320ffce5cb0573fb0121036c726705bb32c7e30c08535f5f818673ec9bcce5c97da3ccffd878694b007f1a","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":52103,"spending_outpoints":[{"tx_index":2989875543450801,"n":0}],"n":1,"tx_index":7437229016133164,"script":"0014384ff64ef3df965b2596313fa421c2810e4ed09a","addr":"bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq"}}],"out":[{"type":0,"spent":false,"value":50673,"spending_outpoints":[],"n":0,"tx_index":2989875543450801,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"}],"result":50673,"balance":114403}]}
62	6bd4875ef76657992012252e79327a7d	190	12	TRANSFER	3.91	usd	6.4e-05	btc	0.000507	btc	FAILED	9	1bf95abf895ea74413decba5bd2177fd	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:27:32	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54	bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:27:59.845595	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":139,"n_unredeemed":3,"total_received":7569174,"total_sent":7454771,"final_balance":114403,"txs":[{"hash":"f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54","ver":2,"vin_sz":1,"vout_sz":1,"size":191,"weight":437,"fee":1430,"relayed_by":"0.0.0.0","lock_time":0,"tx_index":2989875543450801,"double_spend":false,"time":1727477999,"block_index":863139,"block_height":863139,"inputs":[{"sequence":4294967293,"witness":"0247304402207e1124151fbf21b7c23c26d2f31226fcad52a17cdd8b65dd2b6734c28d74f8d602205ec596484f47ccbbffc58c57cbe7aa32254cce2ac2e3b17e320ffce5cb0573fb0121036c726705bb32c7e30c08535f5f818673ec9bcce5c97da3ccffd878694b007f1a","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":52103,"spending_outpoints":[{"tx_index":2989875543450801,"n":0}],"n":1,"tx_index":7437229016133164,"script":"0014384ff64ef3df965b2596313fa421c2810e4ed09a","addr":"bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq"}}],"out":[{"type":0,"spent":false,"value":50673,"spending_outpoints":[],"n":0,"tx_index":2989875543450801,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"}],"result":50673,"balance":114403}]}
61	f01ec517ea8c13d6bd73ea8532f3a7ac	190	12	TRANSFER	3.91	usd	6.4e-05	btc	0.000507	btc	FAILED	9	1bf95abf895ea74413decba5bd2177fd	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:25:05	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54	bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:25:32.797421	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":139,"n_unredeemed":3,"total_received":7569174,"total_sent":7454771,"final_balance":114403,"txs":[{"hash":"f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54","ver":2,"vin_sz":1,"vout_sz":1,"size":191,"weight":437,"fee":1430,"relayed_by":"0.0.0.0","lock_time":0,"tx_index":2989875543450801,"double_spend":false,"time":1727477998,"block_index":863139,"block_height":863139,"inputs":[{"sequence":4294967293,"witness":"0247304402207e1124151fbf21b7c23c26d2f31226fcad52a17cdd8b65dd2b6734c28d74f8d602205ec596484f47ccbbffc58c57cbe7aa32254cce2ac2e3b17e320ffce5cb0573fb0121036c726705bb32c7e30c08535f5f818673ec9bcce5c97da3ccffd878694b007f1a","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":52103,"spending_outpoints":[{"tx_index":2989875543450801,"n":0}],"n":1,"tx_index":7437229016133164,"script":"0014384ff64ef3df965b2596313fa421c2810e4ed09a","addr":"bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq"}}],"out":[{"type":0,"spent":false,"value":50673,"spending_outpoints":[],"n":0,"tx_index":2989875543450801,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"}],"result":50673,"balance":114403}]}
63	02288df4baa6c8a10f7a6fb5ccfbd68e	190	12	TRANSFER	740	usd	0.01217	btc	0.000507	btc	FAILED	9	24ab0916935939fcaf0d902fbd0b0698	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:29:59	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54	bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:30:25.881322	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":139,"n_unredeemed":3,"total_received":7569174,"total_sent":7454771,"final_balance":114403,"txs":[{"hash":"f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54","ver":2,"vin_sz":1,"vout_sz":1,"size":191,"weight":437,"fee":1430,"relayed_by":"0.0.0.0","lock_time":0,"tx_index":2989875543450801,"double_spend":false,"time":1727478000,"block_index":863139,"block_height":863139,"inputs":[{"sequence":4294967293,"witness":"0247304402207e1124151fbf21b7c23c26d2f31226fcad52a17cdd8b65dd2b6734c28d74f8d602205ec596484f47ccbbffc58c57cbe7aa32254cce2ac2e3b17e320ffce5cb0573fb0121036c726705bb32c7e30c08535f5f818673ec9bcce5c97da3ccffd878694b007f1a","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":52103,"spending_outpoints":[{"tx_index":2989875543450801,"n":0}],"n":1,"tx_index":7437229016133164,"script":"0014384ff64ef3df965b2596313fa421c2810e4ed09a","addr":"bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq"}}],"out":[{"type":0,"spent":false,"value":50673,"spending_outpoints":[],"n":0,"tx_index":2989875543450801,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"}],"result":50673,"balance":114403}]}
66	1c4e07e5186462dcbd7146452f20c082	190	12	TRANSFER	3.91	usd	6.5e-05	btc	0.000507	btc	FAILED	9	1bf95abf895ea74413decba5bd2177fd	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:39:10	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54	bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:39:47.953271	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":139,"n_unredeemed":3,"total_received":7569174,"total_sent":7454771,"final_balance":114403,"txs":[{"hash":"f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54","ver":2,"vin_sz":1,"vout_sz":1,"size":191,"weight":437,"fee":1430,"relayed_by":"0.0.0.0","lock_time":0,"tx_index":2989875543450801,"double_spend":false,"time":1727478000,"block_index":863139,"block_height":863139,"inputs":[{"sequence":4294967293,"witness":"0247304402207e1124151fbf21b7c23c26d2f31226fcad52a17cdd8b65dd2b6734c28d74f8d602205ec596484f47ccbbffc58c57cbe7aa32254cce2ac2e3b17e320ffce5cb0573fb0121036c726705bb32c7e30c08535f5f818673ec9bcce5c97da3ccffd878694b007f1a","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":52103,"spending_outpoints":[{"tx_index":2989875543450801,"n":0}],"n":1,"tx_index":7437229016133164,"script":"0014384ff64ef3df965b2596313fa421c2810e4ed09a","addr":"bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq"}}],"out":[{"type":0,"spent":false,"value":50673,"spending_outpoints":[],"n":0,"tx_index":2989875543450801,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"}],"result":50673,"balance":114403}]}
64	eacefa19107cf1cddfdd531f741683c0	190	12	TRANSFER	3.91	usd	6.4e-05	btc	0.000507	btc	FAILED	9	1bf95abf895ea74413decba5bd2177fd	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:31:17	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54	bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:31:44.511727	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":139,"n_unredeemed":3,"total_received":7569174,"total_sent":7454771,"final_balance":114403,"txs":[{"hash":"f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54","ver":2,"vin_sz":1,"vout_sz":1,"size":191,"weight":437,"fee":1430,"relayed_by":"0.0.0.0","lock_time":0,"tx_index":2989875543450801,"double_spend":false,"time":1727477998,"block_index":863139,"block_height":863139,"inputs":[{"sequence":4294967293,"witness":"0247304402207e1124151fbf21b7c23c26d2f31226fcad52a17cdd8b65dd2b6734c28d74f8d602205ec596484f47ccbbffc58c57cbe7aa32254cce2ac2e3b17e320ffce5cb0573fb0121036c726705bb32c7e30c08535f5f818673ec9bcce5c97da3ccffd878694b007f1a","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":52103,"spending_outpoints":[{"tx_index":2989875543450801,"n":0}],"n":1,"tx_index":7437229016133164,"script":"0014384ff64ef3df965b2596313fa421c2810e4ed09a","addr":"bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq"}}],"out":[{"type":0,"spent":false,"value":50673,"spending_outpoints":[],"n":0,"tx_index":2989875543450801,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"}],"result":50673,"balance":114403}]}
65	9216815c52e6e648c428437a02f202ea	190	12	TRANSFER	3.91	usd	6.5e-05	btc	0	btc	PROCESS	0	1bf95abf895ea74413decba5bd2177fd	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 17:38:07	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	\N	\N
67	ccc43418557cbbdf1452dfbcd09f7229	190	12	TRANSFER	3.91	usd	6.5e-05	btc	0.000507	btc	FAILED	9	1bf95abf895ea74413decba5bd2177fd	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 18:00:52	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54	bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 18:01:18.544739	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":139,"n_unredeemed":3,"total_received":7569174,"total_sent":7454771,"final_balance":114403,"txs":[{"hash":"f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54","ver":2,"vin_sz":1,"vout_sz":1,"size":191,"weight":437,"fee":1430,"relayed_by":"0.0.0.0","lock_time":0,"tx_index":2989875543450801,"double_spend":false,"time":1727477999,"block_index":863139,"block_height":863139,"inputs":[{"sequence":4294967293,"witness":"0247304402207e1124151fbf21b7c23c26d2f31226fcad52a17cdd8b65dd2b6734c28d74f8d602205ec596484f47ccbbffc58c57cbe7aa32254cce2ac2e3b17e320ffce5cb0573fb0121036c726705bb32c7e30c08535f5f818673ec9bcce5c97da3ccffd878694b007f1a","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":52103,"spending_outpoints":[{"tx_index":2989875543450801,"n":0}],"n":1,"tx_index":7437229016133164,"script":"0014384ff64ef3df965b2596313fa421c2810e4ed09a","addr":"bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq"}}],"out":[{"type":0,"spent":false,"value":50673,"spending_outpoints":[],"n":0,"tx_index":2989875543450801,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"}],"result":50673,"balance":114403}]}
68	dd499f70417fd7bdb6605e2b4947eba2	190	12	TRANSFER	3.91	usd	6.5e-05	btc	0.000507	btc	FAILED	9	1bf95abf895ea74413decba5bd2177fd	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 18:04:32	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54	bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 18:04:58.67679	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":139,"n_unredeemed":3,"total_received":7569174,"total_sent":7454771,"final_balance":114403,"txs":[{"hash":"f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54","ver":2,"vin_sz":1,"vout_sz":1,"size":191,"weight":437,"fee":1430,"relayed_by":"0.0.0.0","lock_time":0,"tx_index":2989875543450801,"double_spend":false,"time":1727478000,"block_index":863139,"block_height":863139,"inputs":[{"sequence":4294967293,"witness":"0247304402207e1124151fbf21b7c23c26d2f31226fcad52a17cdd8b65dd2b6734c28d74f8d602205ec596484f47ccbbffc58c57cbe7aa32254cce2ac2e3b17e320ffce5cb0573fb0121036c726705bb32c7e30c08535f5f818673ec9bcce5c97da3ccffd878694b007f1a","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":52103,"spending_outpoints":[{"tx_index":2989875543450801,"n":0}],"n":1,"tx_index":7437229016133164,"script":"0014384ff64ef3df965b2596313fa421c2810e4ed09a","addr":"bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq"}}],"out":[{"type":0,"spent":false,"value":50673,"spending_outpoints":[],"n":0,"tx_index":2989875543450801,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"}],"result":50673,"balance":114403}]}
69	51371104f57b19149cc8a30383b26fe3	190	12	TRANSFER	750	usd	0	btc	0	btc	PROCESS	0	d68962d167266de8eaac2dda9d2e229a	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 18:09:27	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	a98c8645666f27be48474200a577a58b	190	12	TRANSFER	3.91	usd	0	btc	0	btc	PROCESS	0	1bf95abf895ea74413decba5bd2177fd	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 18:10:06	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	7581b0f707d77c83ed97e8bfc0c40857	190	12	TRANSFER	750	usd	0	btc	0	btc	PROCESS	0	d68962d167266de8eaac2dda9d2e229a	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 18:13:08	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	\N	\N
72	e4ec54b47777260249b28a29a7c95851	190	12	TRANSFER	750	usd	0.012378	btc	0	btc	PROCESS	0	d68962d167266de8eaac2dda9d2e229a	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 18:14:00	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	57d3fddcbeaaea76efff9d9a5e0e8212	190	12	TRANSFER	3.94	usd	6.5e-05	btc	0.000507	btc	FAILED	9	8b504189565b36b5f575f82aacc97353	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 18:14:23	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54	bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 18:14:49.874246	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":139,"n_unredeemed":3,"total_received":7569174,"total_sent":7454771,"final_balance":114403,"txs":[{"hash":"f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54","ver":2,"vin_sz":1,"vout_sz":1,"size":191,"weight":437,"fee":1430,"relayed_by":"0.0.0.0","lock_time":0,"tx_index":2989875543450801,"double_spend":false,"time":1727477998,"block_index":863139,"block_height":863139,"inputs":[{"sequence":4294967293,"witness":"0247304402207e1124151fbf21b7c23c26d2f31226fcad52a17cdd8b65dd2b6734c28d74f8d602205ec596484f47ccbbffc58c57cbe7aa32254cce2ac2e3b17e320ffce5cb0573fb0121036c726705bb32c7e30c08535f5f818673ec9bcce5c97da3ccffd878694b007f1a","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":52103,"spending_outpoints":[{"tx_index":2989875543450801,"n":0}],"n":1,"tx_index":7437229016133164,"script":"0014384ff64ef3df965b2596313fa421c2810e4ed09a","addr":"bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq"}}],"out":[{"type":0,"spent":false,"value":50673,"spending_outpoints":[],"n":0,"tx_index":2989875543450801,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"}],"result":50673,"balance":114403}]}
74	780db721f1c5a384510280833d5cb6b2	190	12	TRANSFER	3.91	usd	6.5e-05	btc	0.000507	btc	FAILED	9	1bf95abf895ea74413decba5bd2177fd	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 18:17:28	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54	bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 18:17:55.874428	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":139,"n_unredeemed":3,"total_received":7569174,"total_sent":7454771,"final_balance":114403,"txs":[{"hash":"f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54","ver":2,"vin_sz":1,"vout_sz":1,"size":191,"weight":437,"fee":1430,"relayed_by":"0.0.0.0","lock_time":0,"tx_index":2989875543450801,"double_spend":false,"time":1727477998,"block_index":863139,"block_height":863139,"inputs":[{"sequence":4294967293,"witness":"0247304402207e1124151fbf21b7c23c26d2f31226fcad52a17cdd8b65dd2b6734c28d74f8d602205ec596484f47ccbbffc58c57cbe7aa32254cce2ac2e3b17e320ffce5cb0573fb0121036c726705bb32c7e30c08535f5f818673ec9bcce5c97da3ccffd878694b007f1a","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":52103,"spending_outpoints":[{"tx_index":2989875543450801,"n":0}],"n":1,"tx_index":7437229016133164,"script":"0014384ff64ef3df965b2596313fa421c2810e4ed09a","addr":"bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq"}}],"out":[{"type":0,"spent":false,"value":50673,"spending_outpoints":[],"n":0,"tx_index":2989875543450801,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"}],"result":50673,"balance":114403}]}
75	bf693b8ab794176166febb69496f57c4	190	12	TRANSFER	3.91	usd	6.5e-05	btc	0.000507	btc	FAILED	9	1bf95abf895ea74413decba5bd2177fd	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 18:19:19	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54	bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-03 18:19:47.192934	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":139,"n_unredeemed":3,"total_received":7569174,"total_sent":7454771,"final_balance":114403,"txs":[{"hash":"f5696c6b5c0abf8819b1d4bac547a80e0b1b4c460be101c68b8f25852d35fa54","ver":2,"vin_sz":1,"vout_sz":1,"size":191,"weight":437,"fee":1430,"relayed_by":"0.0.0.0","lock_time":0,"tx_index":2989875543450801,"double_spend":false,"time":1727477999,"block_index":863139,"block_height":863139,"inputs":[{"sequence":4294967293,"witness":"0247304402207e1124151fbf21b7c23c26d2f31226fcad52a17cdd8b65dd2b6734c28d74f8d602205ec596484f47ccbbffc58c57cbe7aa32254cce2ac2e3b17e320ffce5cb0573fb0121036c726705bb32c7e30c08535f5f818673ec9bcce5c97da3ccffd878694b007f1a","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":52103,"spending_outpoints":[{"tx_index":2989875543450801,"n":0}],"n":1,"tx_index":7437229016133164,"script":"0014384ff64ef3df965b2596313fa421c2810e4ed09a","addr":"bc1q8p8lvnhnm7t9kfvkxyl6ggwzsy8ya5y6uc90zq"}}],"out":[{"type":0,"spent":false,"value":50673,"spending_outpoints":[],"n":0,"tx_index":2989875543450801,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"}],"result":50673,"balance":114403}]}
76	c94682e79dc4eab821ba67aed897ab45	190	12	TRANSFER	47.52	usd	0.000779	btc	7e-06	btc	FAILED	9	e5c4ca6789688297e1d251a120574dc5	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-04 09:56:04	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	1ae5a093d6fece38344786cc79dd5c49b7a87186d95e2aaa9937fe58f55785ca	bc1q0d5ya8cf3m5k7889dvzzfxgm7wx04nx8v8l0u6	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-04 10:48:02.563734	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":140,"n_unredeemed":4,"total_received":7569874,"total_sent":7454771,"final_balance":115103,"txs":[{"hash":"1ae5a093d6fece38344786cc79dd5c49b7a87186d95e2aaa9937fe58f55785ca","ver":2,"vin_sz":1,"vout_sz":2,"size":222,"weight":561,"fee":350,"relayed_by":"0.0.0.0","lock_time":863982,"tx_index":7125569765056454,"double_spend":false,"time":1727973665,"block_index":863986,"block_height":863986,"inputs":[{"sequence":4294967293,"witness":"02473044022043375a6aa0cbf2ce2404ecacc47b9c32bc4c4e7762b0731199bf9d385da7e95202206e75e5c319cd22353742681a38ab2312b13443e073feef0789accf15d33f5171012102103a8a004007c2ea45a707f0f40b6322482739d278aca52ebffc413647c53042","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":111950,"spending_outpoints":[{"tx_index":7125569765056454,"n":0}],"n":0,"tx_index":2747381722009312,"script":"00147b684e9f098ee96f1ce56b0424991bf38cfaccc7","addr":"bc1q0d5ya8cf3m5k7889dvzzfxgm7wx04nx8v8l0u6"}}],"out":[{"type":0,"spent":false,"value":700,"spending_outpoints":[],"n":0,"tx_index":7125569765056454,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"},{"type":0,"spent":false,"value":110900,"spending_outpoints":[],"n":1,"tx_index":7125569765056454,"script":"001429e0d10f016e5ebe062e4ba794037b992c7b7d1c","addr":"bc1q98sdzrcpde0tup3wfwnegqmmnyk8klgu0chray"}],"result":700,"balance":115103}]}
77	c207daca863fa93ea51aed312236c862	190	28	TRANSFER	47.52	usd	136.391425	ada	0	ada	FAILED	8	e5c4ca6789688297e1d251a120574dc5	Sending ada to Addresses - addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	2024-10-04 10:49:36	addr1qysw723y5nrrwvp33wrhf5qzmyd2xml96jazxsx57vpe88z0thsgr9f4l5tyep7ag6fst66tqjnyxjhznklfyhwd78hsnkku22	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-04 10:51:17.054896	\N
78	d4b926599176b5c9859c5a189d3b8885	190	12	TRANSFER	750	usd	0.012267	btc	7e-06	btc	FAILED	9	d68962d167266de8eaac2dda9d2e229a	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-04 10:51:58	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	1ae5a093d6fece38344786cc79dd5c49b7a87186d95e2aaa9937fe58f55785ca	bc1q0d5ya8cf3m5k7889dvzzfxgm7wx04nx8v8l0u6	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-04 10:52:26.308748	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":140,"n_unredeemed":4,"total_received":7569874,"total_sent":7454771,"final_balance":115103,"txs":[{"hash":"1ae5a093d6fece38344786cc79dd5c49b7a87186d95e2aaa9937fe58f55785ca","ver":2,"vin_sz":1,"vout_sz":2,"size":222,"weight":561,"fee":350,"relayed_by":"0.0.0.0","lock_time":863982,"tx_index":7125569765056454,"double_spend":false,"time":1727973657,"block_index":863986,"block_height":863986,"inputs":[{"sequence":4294967293,"witness":"02473044022043375a6aa0cbf2ce2404ecacc47b9c32bc4c4e7762b0731199bf9d385da7e95202206e75e5c319cd22353742681a38ab2312b13443e073feef0789accf15d33f5171012102103a8a004007c2ea45a707f0f40b6322482739d278aca52ebffc413647c53042","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":111950,"spending_outpoints":[{"tx_index":7125569765056454,"n":0}],"n":0,"tx_index":2747381722009312,"script":"00147b684e9f098ee96f1ce56b0424991bf38cfaccc7","addr":"bc1q0d5ya8cf3m5k7889dvzzfxgm7wx04nx8v8l0u6"}}],"out":[{"type":0,"spent":false,"value":700,"spending_outpoints":[],"n":0,"tx_index":7125569765056454,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"},{"type":0,"spent":false,"value":110900,"spending_outpoints":[],"n":1,"tx_index":7125569765056454,"script":"001429e0d10f016e5ebe062e4ba794037b992c7b7d1c","addr":"bc1q98sdzrcpde0tup3wfwnegqmmnyk8klgu0chray"}],"result":700,"balance":115103}]}
79	da11ad6447a285ac6f7dba53e79ad81e	190	32	TRANSFER	750	usd	0.315308	eth	0	eth	FAILED	8	d68962d167266de8eaac2dda9d2e229a	Sending eth to Addresses - 0xae9cB013843c748969D35D55bd355aFa75eb79d7	2024-10-04 10:53:12	0xae9cB013843c748969D35D55bd355aFa75eb79d7	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-04 10:56:07.082854	\N
80	081f4cf53f2891b3a8b4b9dbab4176cb	190	17	TRANSFER	750	usd	750	usdt	0	usdt	FAILED	8	d68962d167266de8eaac2dda9d2e229a	Sending usdt to Addresses - TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	2024-10-04 10:56:51	TEbLGvnekWFQtkS82ektwj4sX3JHaAKpA9	127.0.0.1	\N	\N	\N	\N	\N	\N	\N	2024-10-04 10:58:32.120188	\N
81	c169a1a36871ee0cd0089dfe74da7c01	190	12	TRANSFER	47.52	usd	0.000777	btc	7e-06	btc	FAILED	9	e5c4ca6789688297e1d251a120574dc5	Sending btc to Addresses - bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-04 11:01:38	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	127.0.0.1	\N	\N	\N	\N	1ae5a093d6fece38344786cc79dd5c49b7a87186d95e2aaa9937fe58f55785ca	bc1q0d5ya8cf3m5k7889dvzzfxgm7wx04nx8v8l0u6	bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h	2024-10-04 11:02:05.097364	{"hash160":"347959c81c93f86d45f178eb3eacfd7007fdbcca","address":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h","n_tx":140,"n_unredeemed":4,"total_received":7569874,"total_sent":7454771,"final_balance":115103,"txs":[{"hash":"1ae5a093d6fece38344786cc79dd5c49b7a87186d95e2aaa9937fe58f55785ca","ver":2,"vin_sz":1,"vout_sz":2,"size":222,"weight":561,"fee":350,"relayed_by":"0.0.0.0","lock_time":863982,"tx_index":7125569765056454,"double_spend":false,"time":1727973659,"block_index":863986,"block_height":863986,"inputs":[{"sequence":4294967293,"witness":"02473044022043375a6aa0cbf2ce2404ecacc47b9c32bc4c4e7762b0731199bf9d385da7e95202206e75e5c319cd22353742681a38ab2312b13443e073feef0789accf15d33f5171012102103a8a004007c2ea45a707f0f40b6322482739d278aca52ebffc413647c53042","script":"","index":0,"prev_out":{"type":0,"spent":true,"value":111950,"spending_outpoints":[{"tx_index":7125569765056454,"n":0}],"n":0,"tx_index":2747381722009312,"script":"00147b684e9f098ee96f1ce56b0424991bf38cfaccc7","addr":"bc1q0d5ya8cf3m5k7889dvzzfxgm7wx04nx8v8l0u6"}}],"out":[{"type":0,"spent":false,"value":700,"spending_outpoints":[],"n":0,"tx_index":7125569765056454,"script":"0014347959c81c93f86d45f178eb3eacfd7007fdbcca","addr":"bc1qx3u4njquj0ux63030r4nat8awqrlm0x2zlt96h"},{"type":0,"spent":false,"value":110900,"spending_outpoints":[],"n":1,"tx_index":7125569765056454,"script":"001429e0d10f016e5ebe062e4ba794037b992c7b7d1c","addr":"bc1q98sdzrcpde0tup3wfwnegqmmnyk8klgu0chray"}],"result":700,"balance":115103}]}
\.


--
-- TOC entry 5054 (class 0 OID 16716)
-- Dependencies: 230
-- Data for Name: transaction_master; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_master (id, transaction_id, client_id, volt_id, assetid, transaction_type, requestedamount, amount, netamount, amountusd, fee, networkfee, status, substatus, txhash, operation, customerrefid, ip, source, destination555, note, createdate, lastupdated, destinationaddress, createdby) FROM stdin;
10	d389e8a5-fd76-4ba2-ae30-a6318affdbb1	72	1	BTC_TEST	EXTERNAL	0	0.0018	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	32dd44c802a571033cceb31d4673f9e6	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
11	b291a536-3b16-43c3-a624-2fcfa4102d71	72	1	BTC_TEST	INTERNAL	0	0.0015	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	567a0e3be4c24766a865cf4aec978208	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
12	abdbe7aa-39f3-46c7-b154-7af4f0f0e155	72	1	BTC_TEST	INTERNAL	0	0.0015	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	53205a2ba676ee9849ab5f1e1b4c1ba4	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
13	755072a8-7e48-4d23-8652-6cce8c09fc17	72	1	BTC_TEST	EXTERNAL	0	0.0016	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	5a704ff6c94277e8123b914b70e66ff5	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
14	bcaae8f6-2314-49d5-81bd-ed18871a0190	72	1	BTC_TEST	INTERNAL	0	0.00113	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	ec4286421b74128a8b54294dd9d5b27d	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
15	41f41b50-ed94-4b99-a9c9-0db8a6e2cbe2	72	1	BTC_TEST	INTERNAL	0	0.00113	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	fd183c7acbadf58e78e08e0138e73207	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
16	e0ae1bd7-98e7-4702-be63-205566a97f7a	72	1	BTC_TEST	EXTERNAL	0	0.00125	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	a612e65e9ca8148156fea0cdb4ba510b	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
6	d1cb33cf-bc2b-4d57-b966-7b84fe63011f	72	1	BTC_TEST	INTERNAL	0	0.0013	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	73358db3ae26686703339f7cde79aedd	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
7	2f0d1513-bada-44f1-8e7e-afa7b9eb89a0	72	1	SOL_TEST	INTERNAL	0	0.0014	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	f938cc74b48a863276e56838add56f97	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
8	7a8c898b-b26c-477d-8105-4328ac4fef57	72	1	BTC_TEST	INTERNAL	0	0.0016	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	585fbf84f8d2fc75038a6f7ec5d53d5d	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
9	e8868a00-19e1-4ecd-b8e5-a38f7d74fdfa	72	1	BTC_TEST	INTERNAL	0	0.0017	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	d98e91bb929fc8f3dbaeb3262708bfa7	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
17	69f5967b-16aa-452a-bcb9-8e07dd19c4ab	72	1	BTC_TEST	INTERNAL	0	0.001	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	e9a98fb3408b72e81e2658f37260323c	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
18	3e8985fb-75b1-4ebe-a147-5069f49f6f7d	72	1	DASH_TEST	INTERNAL	0	0.001	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	2c440d0b4548e449c6dd47eeab31e8f9	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
19	bcc9ebbc-70c5-4502-ae79-86134ad696d3	72	1	BTC_TEST	INTERNAL	0	0.001	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	3230cba7c6f331376611ad61123ff869	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
20	0503c09b-0130-4683-b81b-a57cda926dbf	72	1	BTC_TEST	INTERNAL	0	0.0015	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	5bf4d676c9416500337cf2d4ddc5e67c	\N	\N	\N	\N	2024-07-18 15:09:08.839627	2024-07-18 15:10:19.168586	\N	\N
21	580ca09f-8d4b-4dc4-9601-c195b2667115	166	4	BTC_TEST	INTERNAL	0	0.0019	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	b617a065b2a276d69b6092d5f99bc061	\N	\N	\N	\N	2024-07-18 20:53:14.305512	2024-07-18 20:53:14.305512	\N	\N
22	f3af8521-9d13-42fc-8dc9-658ef08f1f35	166	4	BTC_TEST	EXTERNAL	0	0.0014	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	263ee10742bfc150d0852b149c4c1861	\N	\N	\N	\N	2024-07-18 20:57:55.302899	2024-07-18 20:57:55.302899	\N	\N
24	29d09054-872b-4db0-a510-177a05439c79	72	1	BTC_TEST	INTERNAL	0	0.00103	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	5482d075087fb4205cc1562b691170c1	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 15:02:49.018239	2024-07-19 15:02:49.018239	\N	\N
25	0439f74f-ad42-4c4a-9525-8545534cd800	72	1	BTC_TEST	INTERNAL	0	0.00106	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	838d99dfe5962cf98d4633136243f72c	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 15:19:03.632473	2024-07-19 15:19:03.632473	\N	\N
26	afd04e6e-f49f-4736-bf3c-53722e3dc840	72	1	BTC_TEST	INTERNAL	0	0.00106	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	08614ba9ff14ed24ece03dadb2915a76	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 15:19:03.743291	2024-07-19 15:19:03.743291	\N	\N
27	d67d2b2c-0b87-42a6-8752-84d69832f9fb	72	1	BTC_TEST	INTERNAL	0	0.001	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	445bbdb25ad2b4150f92c24611b30057	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 15:28:00.713519	2024-07-19 15:28:00.713519	\N	\N
28	58620d9c-17e2-4ae1-add0-7f314188425d	72	1	BTC_TEST	INTERNAL	0	0.00105	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	932e6dbe4b0839bea347f38cb5a07577	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 15:39:15.364896	2024-07-19 15:39:15.364896	\N	\N
29	93a76dc9-ae61-43c6-a556-0c908c14f569	72	1	BTC_TEST	INTERNAL	0	0.00101	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	1b56f17953f0dcd474414ac335fe24fb	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 15:44:31.104527	2024-07-19 15:44:31.104527	\N	\N
30	8cb4bf6a-3e2c-4581-96bf-b69120a2e71f	72	1	BTC_TEST	INTERNAL	0	0.001	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	5675d6dc55bb5db3ba9a3b0df35834f7	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 15:46:07.025126	2024-07-19 15:46:07.025126	\N	\N
31	ba3cf4da-5a79-423f-b670-f739580d14e9	72	1	BTC_TEST	INTERNAL	0	0.001	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	0d6a6dd5c1eeebb645862da84fbc73ba	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 15:47:07.675395	2024-07-19 15:47:07.675395	\N	\N
32	4edfd9ad-79cb-4e67-95ef-a68db0c27e9b	72	1	BTC_TEST	INTERNAL	0	0.00109	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	b0154b63d137acfd525458971a926028	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 15:48:22.967271	2024-07-19 15:48:22.967271	\N	\N
33	9deae539-fd3c-43d1-96d1-f3c5e2b343fe	72	1	BTC_TEST	INTERNAL	0	0.00111	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	e3e09622098265b48b9a5572bbf38a12	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 15:50:05.58668	2024-07-19 15:50:05.58668	\N	\N
34	21cbe262-d92b-467b-ab80-cb5edaab60cc	72	1	BTC_TEST	INTERNAL	0	0.001	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	7605f5c17ed4504145026b9f00891f89	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 15:56:12.949623	2024-07-19 15:56:12.949623	\N	\N
35	9c393ba0-35e4-4ebb-91ad-fb613b72a388	72	1	BTC_TEST	INTERNAL	0	0.00112	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	3c2d2e262bd160e90040e57132e45ac7	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 15:57:01.422002	2024-07-19 15:57:01.422002	\N	\N
36	815d07ba-bdb3-442e-bcf2-afb3f57db81f	72	1	BTC_TEST	INTERNAL	0	0.00106	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	c78a2c114832eeab63b099dd152cae64	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 16:03:14.97786	2024-07-19 16:03:14.97786	\N	\N
37	ea07ff30-81cf-408e-ab0a-f498f3c9028e	72	1	BTC_TEST	INTERNAL	0	0.001003	0	0	0	0	SUBMITTED	\N	\N	TRANSFER	7e79a2faaafd18a369c9a14631e12105	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 16:11:42.715677	2024-07-19 16:11:42.715677	\N	\N
23	5212235a-47d5-48cc-840c-8bc45e975763	72	1	SOL_TEST	EXTERNAL	0.001003	0.00109	-1	63.91	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	01eedc3a0c482f1f665495c2f93f6018	127.0.0.1	vikashg@itio.in	\N	Sending SOL_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 14:47:44.284054	2024-07-19 14:47:44.284054	\N	\N
38	e00aaaee-d448-4637-8441-d04312a80bd2	72	1	BTC_TEST	INTERNAL	0.0013	0.0013	-1	82.83	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	824a62692cc0741afe9dacfa5b98e498	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 16:12:47.107654	2024-07-19 16:12:47.107654	\N	\N
39	fa396a7d-28de-4667-9979-cd551e85e6aa	72	1	BTC_TEST	INTERNAL	0.001	0.001	-1	63.5	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	f118ece729bb29edd4a08bf7a91c913a	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 16:54:28.117323	2024-07-19 16:54:28.117323	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	abdb1385-da35-44e9-b66c-e21feae3745f
40	dd2ec4a7-5474-4411-8084-6bb423dadc4e	72	1	BTC_TEST	INTERNAL	0.00115	0.00115	-1	73.36	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	3c6a569501a3fd09515b9967d95ea496	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 17:02:16.524445	2024-07-19 17:02:16.524445	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	abdb1385-da35-44e9-b66c-e21feae3745f
41	8eca2e77-b158-4e45-a982-8dfc8eaeaee5	72	1	BTC_TEST	INTERNAL	0.001	0.001	-1	63.9	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	44d25e4e10960eec58dde4b70b748dbb	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 17:43:36.837858	2024-07-19 17:43:36.837858	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	abdb1385-da35-44e9-b66c-e21feae3745f
42	7ac8fb0c-f2b2-46d7-bfff-2845b5bf8a2b	72	1	BTC_TEST	INTERNAL	0.001	0.001	-1	63.9	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	61bfc40a8480643a4537115b761db59a	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 17:45:30.866085	2024-07-19 17:45:30.866085	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	abdb1385-da35-44e9-b66c-e21feae3745f
43	57c196cf-a413-40dc-9c11-c0a125f4f7fd	72	1	BTC_TEST	INTERNAL	0.001	0.001	-1	63.9	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	442d250ab22e75f3142a17bed36c3db0	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 17:47:28.98276	2024-07-19 17:47:28.98276	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	abdb1385-da35-44e9-b66c-e21feae3745f
44	27514a1e-83a5-4d3d-a60f-081a892b98e5	72	1	BTC_TEST	INTERNAL	0.001	0.001	-1	63.9	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	ef2b10829adf15b3bda53ce1fafc17b6	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 17:47:59.613076	2024-07-19 17:47:59.613076	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	abdb1385-da35-44e9-b66c-e21feae3745f
45	014c5c15-1aaa-43a1-8aa6-1b41875fef6e	72	1	BTC_TEST	INTERNAL	0.001	0.001	-1	63.9	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	1ad2ec5932ebf7155b2345a4c917e9f8	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 17:48:55.950805	2024-07-19 17:48:55.950805	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	abdb1385-da35-44e9-b66c-e21feae3745f
46	b7168fa4-df2b-4534-8561-152e22882e25	72	1	BTC_TEST	INTERNAL	0.00123	0.00123	-1	78.35	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	931b3453c48ed0ff9927296a89224f60	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 18:14:29.743264	2024-07-19 18:14:29.743264	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	abdb1385-da35-44e9-b66c-e21feae3745f
47	cd603c13-a1c8-491f-af83-a370a8a48307	72	1	BTC_TEST	INTERNAL	0.0015	0.0015	-1	95.55	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	289319e2b8d6f3e392f2156aabda8d1f	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-19 18:22:25.144584	2024-07-19 18:22:25.144584	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	abdb1385-da35-44e9-b66c-e21feae3745f
48	529553bd-0b0d-43c4-a39b-5a41dd8f6671	72	1	BTC_TEST	INTERNAL	0.0017	0.0017	-1	115.5	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	54dedeeb56df8d8ebb6bfd4b00321907	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-22 12:40:51.963119	2024-07-22 12:40:51.963119	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	abdb1385-da35-44e9-b66c-e21feae3745f
49	080b0048-fcaf-4ee3-a670-41a17d7cc96e	72	1	BTC_TEST	INTERNAL	0.001	0.001	-1	67.94	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	6976f756fbe37177b4d04bc53b4b1003	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-22 12:43:33.016185	2024-07-22 12:43:33.016185	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	abdb1385-da35-44e9-b66c-e21feae3745f
50	44b1102b-d858-4cf1-b0b2-f82c91eda322	72	1	BTC_TEST	INTERNAL	0.001	0.001	-1	67.53	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	0c134e8086719d6df80a43db5a8291fd	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-22 20:17:43.910587	2024-07-22 20:17:43.910587	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	abdb1385-da35-44e9-b66c-e21feae3745f
51	ea67e751-688a-40e4-a8c1-3034c23df7be	72	1	BTC_TEST	INTERNAL	0.001	0.001	-1	66.96	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	2a26dbcfe4b4b4a7b2c56e40d31b5e7a	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-07-23 18:24:44.445909	2024-07-23 18:24:44.445909	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	abdb1385-da35-44e9-b66c-e21feae3745f
52	f7e2cff5-e86c-492e-9ba9-a133aa209df1	72	1	BTC_TEST	INTERNAL	0.001	0.001	-1	55.69	-1	-1	FAILED	INSUFFICIENT_FUNDS		TRANSFER	8bd5ae75070e174f3d192b4823468389	127.0.0.1	vikashg@itio.in	\N	Sending BTC_TEST to Addresses - ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	2024-08-06 12:28:03.348646	2024-08-06 12:28:03.348646	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD	abdb1385-da35-44e9-b66c-e21feae3745f
\.


--
-- TOC entry 5056 (class 0 OID 16776)
-- Dependencies: 232
-- Data for Name: transaction_master_nowpayments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_master_nowpayments (tid, payment_id, payment_status, pay_address, price_amount, pay_amount, amount_received, price_currency, pay_currency, order_id, order_description, client_id, created_at, updated_at, ip, invoice_id, token_id, invoice_url, request_json) FROM stdin;
1	5486776776	waiting	3NDM6RjMYyPNr6aYiVCPBZX1Bs4a2csenT	0.00370343	0	0.0036824	usd	btc	65144119145484e25a0f26d1d8c0ec1b	Shirt	72	2024-07-22 11:01:01.498	2024-07-22 11:01:01.498	127.0.0.1	\N	\N	\N	\N
2	5962713870	waiting	3C5DUjfcyxfi6sQXNXGE7NeZ2mBjYXCkHV	0.00444912	0	0.0044281	usd	btc	51e9025b0eb4ccd93264d7226516bb99	Test	72	2024-07-22 11:13:43.309	2024-07-22 11:13:43.309	127.0.0.1	\N	\N	\N	\N
3	5567675752	waiting	34HKurdF3333m6rbQRpENwkcupstMeDSp7	555	0.00822661	0.0082056	usd	btc	299ae9e390bb991fbbd6363da763a304	tesr77	72	2024-07-22 11:16:55.922	2024-07-22 11:16:55.922	127.0.0.1	\N	\N	\N	\N
4	5225026857	waiting	327wVanvEgYErxLG1SmueUCt7TZXCHhV8t	620	0.00919363	0.0091726	usd	btc	36fa21af35b664c5589a97587d21af8e	hiiiii	72	2024-07-22 11:19:02.896	2024-07-22 11:19:02.896	127.0.0.1	\N	\N	\N	\N
5	5118540630	waiting	35MZ92mFET2HXVPSrvXZPkMxFj9Qu7JrJi	50	0.00074121	0.0007217	usd	btc	fef0469801d56429ba7ec7c68ee16cba	Cofee	72	2024-07-22 11:20:57.604	2024-07-22 11:20:57.604	127.0.0.1	\N	\N	\N	\N
6	4551007957	waiting	3Lbiw8HKsGyutFbCUoNcRW8jeHYxnK2eNb	40	0.00059651	0.00058	usd	btc	7163967a3d8dac11a06c224de81f3725	Test Desc	72	2024-07-23 05:03:37.826	2024-07-23 05:03:37.826	127.0.0.1	\N	\N	\N	\N
7	5626452405	waiting	3CNVvHR9AnAsLDZdcn5EYJ3uvZ2Gos2fmn	100	0.00149272	0.0014777	usd	btc	c8ebeaaffa18976fa8974ef2ff52bfd4	test	72	2024-07-23 05:15:00.735	2024-07-23 05:15:00.735	127.0.0.1	\N	\N	\N	\N
8	5593598194	waiting	3GwbCVG1ULHzwPq4BJsHjfmN3KRsfR59Be	50	0.00074663	0.0007316	usd	btc	9396cd763dcdfd0cb63e3a9a9324ba37	test	72	2024-07-23 05:16:25.636	2024-07-23 05:16:25.636	127.0.0.1	\N	\N	\N	\N
9	5954384939	waiting	39yHPN5tdxpETawARnTecAgjA5vh5XbQJr	504	0.007536	0.0075195	usd	btc	314d71d5cfa709d2f2f96cd61b1ef558	sadsds	72	2024-07-23 06:14:23.073	2024-07-23 06:14:23.073	127.0.0.1	\N	\N	\N	\N
10	\N	\N	\N	0	\N	\N	USD	\N	71c4c18b528d41f4b6339ef8d12fbc95	dsfdf	72	2024-07-23 06:16:48.401	2024-07-23 06:16:48.401	127.0.0.1	\N	\N	\N	\N
11	6407494896	waiting	3JFWmSVVFhStaqJ8VnmmGVuwnddmpPLeHi	260	0.00389828	0.0038817	usd	btc	12d14748bf1744c6e655f37f823d440e	Test	72	2024-07-23 06:34:46.745	2024-07-23 06:34:46.745	127.0.0.1	\N	\N	\N	\N
12	\N	\N	\N	105	\N	\N	USD	\N	ade88d7765dcbf368a0c1c49551153ba	test	72	2024-07-23 06:35:03.833	2024-07-23 06:35:03.833	127.0.0.1	\N	\N	\N	\N
13	\N	\N	\N	105.5	\N	\N	USD	\N	bb6f7349733134830e36e9973021b91a	frr	72	2024-07-23 06:37:55.348	2024-07-23 06:37:55.348	127.0.0.1	\N	\N	\N	\N
14	\N	\N	\N	0	\N	\N	USD	\N	b75c0e619063b64901ba961cb8958157	tesaxsAS	72	2024-07-23 06:39:53.218	2024-07-23 06:39:53.218	127.0.0.1	\N	\N	\N	\N
15	\N	waiting	\N	0	\N	\N	USD	\N	7f678e50d137773e7248a713a7ef9c14	Test	72	2024-07-23 06:46:52.333	2024-07-23 06:46:52.333	127.0.0.1	\N	\N	\N	\N
16	\N	waiting	\N	0	\N	\N	USD	\N	e7053e00309b88f98bcbedd86bb040ab	testtt	72	2024-07-23 06:52:41.561	2024-07-23 06:52:41.561	127.0.0.1	\N	\N	\N	\N
17	5947504714	waiting	3JtxDqLqnZEwRUe65MX3Xka5VsKjqj7b1j	55	0.00082435	0.0008078	usd	btc	025f56e418d410105834c5ef657a0f0a	gyhf	72	2024-07-23 06:55:19.556	2024-07-23 06:55:19.556	127.0.0.1	\N	\N	\N	\N
18	\N	waiting	\N	55.5	\N	\N	USD	\N	fad0e23fc290cdccaa3a3a78de54a9d5	csdsd	72	2024-07-23 06:58:35.439	2024-07-23 06:58:35.439	127.0.0.1	\N	\N	\N	\N
19	\N	waiting	\N	450.62	\N	\N	USD	\N	c834bf2020d199bd02f50af682db6839	dsfdsfds	72	2024-07-23 07:14:23.244	2024-07-23 07:14:23.244	127.0.0.1		6159431993	https://sandbox.nowpayments.io/payment/?iid=5977018974	
20	\N	waiting	\N	58	\N	\N	USD	\N	3874fe132cc454a92b75ded0eacee717	dsfdsf	72	2024-07-23 07:19:31.248	2024-07-23 07:19:31.248	127.0.0.1	5865949906	6159431993	https://sandbox.nowpayments.io/payment/?iid=5865949906	{"id":"5865949906","token_id":"6159431993","order_id":"3874fe132cc454a92b75ded0eacee717","order_description":"dsfdsf","price_amount":"58","price_currency":"USD","pay_currency":null,"ipn_callback_url":"https://itio.in/nowpayments/callback.php","invoice_url":"https://sandbox.nowpayments.io/payment/?iid=5865949906","success_url":"https://itio.in/nowpayments/responce.php","cancel_url":"https://itio.in/nowpayments/responce.php","partially_paid_url":null,"payout_currency":null,"created_at":"2024-07-23T07:19:31.248Z","updated_at":"2024-07-23T07:19:31.248Z","is_fixed_rate":false,"is_fee_paid_by_user":false}
21	5876268961	waiting	38r4znVBYTxS8WhSLaQqGKKkwcHXMjRRzQ	250	0.00375257	0.003736	usd	btc	f72a213894926fec5a9e72815a0123f5	sdsds	72	2024-07-23 07:37:27.253	2024-07-23 07:37:27.253	127.0.0.1	\N	\N	\N	\N
22	\N	waiting	\N	520	\N	\N	USD	\N	c9c01c25b6190882059e8e0183ffba0c	test	72	2024-07-23 07:44:56.283	2024-07-23 07:44:56.283	127.0.0.1	5633161246	6159431993	https://sandbox.nowpayments.io/payment/?iid=5633161246	{"id":"5633161246","token_id":"6159431993","order_id":"c9c01c25b6190882059e8e0183ffba0c","order_description":"test","price_amount":"520","price_currency":"USD","pay_currency":null,"ipn_callback_url":"https://itio.in/nowpayments/callback.php","invoice_url":"https://sandbox.nowpayments.io/payment/?iid=5633161246","success_url":"https://itio.in/nowpayments/responce.php","cancel_url":"https://itio.in/nowpayments/responce.php","partially_paid_url":null,"payout_currency":null,"created_at":"2024-07-23T07:44:56.283Z","updated_at":"2024-07-23T07:44:56.283Z","is_fixed_rate":false,"is_fee_paid_by_user":false}
23	4644713944	waiting	3Jzr7BoCmMqGnNCF8HicJS2nCxDnbRcyw8	66	0.00099	0.0009735	usd	btc	54387e921b8355a7ef50a2b515aa1403	646	72	2024-07-23 07:46:22.522	2024-07-23 07:46:22.522	127.0.0.1	\N	\N	\N	\N
24	4521035030	waiting	383CzKnBK9b9spkwG4vgn1DRQfr5P13Knk	100	0.00163165	0.0016151	eur	btc	9d37180e2b0af8c906157f48cd613e84	test	72	2024-07-23 07:57:51.208	2024-07-23 07:57:51.208	127.0.0.1	\N	\N	\N	\N
25	\N	waiting	\N	500	\N	\N	USD	\N	ba1b80b1b03fb1af67eee788ae91b5f9	test	72	2024-07-23 08:12:58.326	2024-07-23 08:12:58.326	127.0.0.1	6300263104	6159431993	https://sandbox.nowpayments.io/payment/?iid=6300263104	{"id":"6300263104","token_id":"6159431993","order_id":"ba1b80b1b03fb1af67eee788ae91b5f9","order_description":"test","price_amount":"500","price_currency":"USD","pay_currency":null,"ipn_callback_url":"https://itio.in/nowpayments/callback.php","invoice_url":"https://sandbox.nowpayments.io/payment/?iid=6300263104","success_url":"https://itio.in/nowpayments/responce.php","cancel_url":"https://itio.in/nowpayments/responce.php","partially_paid_url":null,"payout_currency":null,"created_at":"2024-07-23T08:12:58.326Z","updated_at":"2024-07-23T08:12:58.326Z","is_fixed_rate":false,"is_fee_paid_by_user":false}
26	\N	waiting	\N	500	\N	\N	USD	\N	2bfc733979fee58d78875475d810b9ea	test	72	2024-07-23 09:13:23.573	2024-07-23 09:13:23.573	127.0.0.1	5263091965	6159431993	https://sandbox.nowpayments.io/payment/?iid=5263091965	{"id":"5263091965","token_id":"6159431993","order_id":"2bfc733979fee58d78875475d810b9ea","order_description":"test","price_amount":"500","price_currency":"USD","pay_currency":null,"ipn_callback_url":"https://itio.in/nowpayments/callback.php","invoice_url":"https://sandbox.nowpayments.io/payment/?iid=5263091965","success_url":"https://itio.in/nowpayments/responce.php","cancel_url":"https://itio.in/nowpayments/responce.php","partially_paid_url":null,"payout_currency":null,"created_at":"2024-07-23T09:13:23.573Z","updated_at":"2024-07-23T09:13:23.573Z","is_fixed_rate":false,"is_fee_paid_by_user":false}
27	\N	waiting	\N	100	\N	\N	USD	\N	78aaf8afc34867745bbba5da5dde629f	test	72	2024-07-23 09:16:57.689	2024-07-23 09:16:57.689	127.0.0.1	4606332952	6159431993	https://sandbox.nowpayments.io/payment/?iid=4606332952	{"id":"4606332952","token_id":"6159431993","order_id":"78aaf8afc34867745bbba5da5dde629f","order_description":"test","price_amount":"100","price_currency":"USD","pay_currency":null,"ipn_callback_url":"https://itio.in/nowpayments/callback.php","invoice_url":"https://sandbox.nowpayments.io/payment/?iid=4606332952","success_url":"https://itio.in/nowpayments/responce.php","cancel_url":"https://itio.in/nowpayments/responce.php","partially_paid_url":null,"payout_currency":null,"created_at":"2024-07-23T09:16:57.689Z","updated_at":"2024-07-23T09:16:57.689Z","is_fixed_rate":false,"is_fee_paid_by_user":false}
28	5053805946	waiting	3Bn9rtJL2ceGdG69mfGLTXiBx59sRVWSDp	500	0.00743871	0.0074177	usd	btc	03e0e2a9ab75880b8251cdbf83ae5df2	trfyugu	72	2024-07-23 09:35:47.619	2024-07-23 09:35:47.619	127.0.0.1	\N	\N	\N	\N
29	\N	waiting	\N	250	\N	\N	EUR	\N	cfd9e5a2dfae77eede3ab29f51a5b7b8	test	72	2024-07-23 09:39:27.716	2024-07-23 09:39:27.716	127.0.0.1	6141268580	6159431993	https://sandbox.nowpayments.io/payment/?iid=6141268580	{"id":"6141268580","token_id":"6159431993","order_id":"cfd9e5a2dfae77eede3ab29f51a5b7b8","order_description":"test","price_amount":"250","price_currency":"EUR","pay_currency":null,"ipn_callback_url":"https://itio.in/nowpayments/callback.php","invoice_url":"https://sandbox.nowpayments.io/payment/?iid=6141268580","success_url":"https://itio.in/nowpayments/responce.php","cancel_url":"https://itio.in/nowpayments/responce.php","partially_paid_url":null,"payout_currency":null,"created_at":"2024-07-23T09:39:27.716Z","updated_at":"2024-07-23T09:39:27.716Z","is_fixed_rate":false,"is_fee_paid_by_user":false}
30	4541691759	waiting	37EMX7eLyo7VuFFeJhg2GiKCjKYf7HmhuY	562	0.00837406	0.0083575	usd	btc	08deed82b9300434989083029ea5b58f	yttt	72	2024-07-23 10:01:13.583	2024-07-23 10:01:13.583	127.0.0.1	\N	\N	\N	\N
31	5094367135	waiting	3Qwbz29e1A8WoYzy5qAxq9W1DTbGJgzHzx	100	0.00155565	0.0015301	usd	btc	eeb300fa02d6caf21e7fabacfd5b3beb	yyy	72	2024-07-25 11:06:40.036	2024-07-25 11:06:40.036	127.0.0.1	\N	\N	\N	\N
32	5123770551	waiting	372sZmCGS3FbLnYoZmzYQ4S9SbsuQjMUYY	44	0.00063053	0.0006155	usd	btc	fdcfee94280fdeb2ef9169fbd352c832	ff	72	2024-07-29 11:58:52.827	2024-07-29 11:58:52.827	127.0.0.1	\N	\N	\N	\N
33	5103481785	waiting	323CyNJhYBxPuaE2i6XHptEUYf6dEjhDL8	100	0.00150982	0.0014948	usd	btc	c7ad40a2423bc628065388b4d8685d45	fdgfdg	72	2024-07-31 11:20:55.969	2024-07-31 11:20:55.969	127.0.0.1	\N	\N	\N	\N
34	\N	waiting	\N	200	\N	\N	EUR	\N	26fc6154f8acdd887d55c8199a45c8fe	testtt	72	2024-07-31 11:21:35.217	2024-07-31 11:21:35.217	127.0.0.1	4450740018	6159431993	https://sandbox.nowpayments.io/payment/?iid=4450740018	{"id":"4450740018","token_id":"6159431993","order_id":"26fc6154f8acdd887d55c8199a45c8fe","order_description":"testtt","price_amount":"200","price_currency":"EUR","pay_currency":null,"ipn_callback_url":"https://itio.in/nowpayments/callback.php","invoice_url":"https://sandbox.nowpayments.io/payment/?iid=4450740018","success_url":"https://itio.in/nowpayments/responce.php","cancel_url":"https://itio.in/nowpayments/responce.php","partially_paid_url":null,"payout_currency":null,"created_at":"2024-07-31T11:21:35.217Z","updated_at":"2024-07-31T11:21:35.217Z","is_fixed_rate":false,"is_fee_paid_by_user":false}
35	\N	waiting	\N	500	\N	\N	USD	\N	0480c514a9876977cbe9518b488975f9	zxczdfs	72	2024-07-31 11:23:21.372	2024-07-31 11:23:21.372	127.0.0.1	6020368119	6159431993	https://sandbox.nowpayments.io/payment/?iid=6020368119	{"id":"6020368119","token_id":"6159431993","order_id":"0480c514a9876977cbe9518b488975f9","order_description":"zxczdfs","price_amount":"500","price_currency":"USD","pay_currency":null,"ipn_callback_url":"https://itio.in/nowpayments/callback.php","invoice_url":"https://sandbox.nowpayments.io/payment/?iid=6020368119","success_url":"https://itio.in/nowpayments/responce.php","cancel_url":"https://itio.in/nowpayments/responce.php","partially_paid_url":null,"payout_currency":null,"created_at":"2024-07-31T11:23:21.372Z","updated_at":"2024-07-31T11:23:21.372Z","is_fixed_rate":false,"is_fee_paid_by_user":false}
36	5427321787	waiting	33RDHG8TLQYS2xrZVEZU9QzuEpL4aCZwkU	500	0.00897142	0.0089568	eur	btc	ae52950c2715712292f949b392c0d677	500	72	2024-08-14 12:35:59.427	2024-08-14 12:35:59.427	127.0.0.1	\N	\N	\N	\N
37	\N	waiting	\N	200	\N	\N	USD	\N	93239682b4e9e9c73cb951f1bf5fd561	testtt	72	2024-08-14 12:36:39.28	2024-08-14 12:36:39.28	127.0.0.1	5426547692	6159431993	https://sandbox.nowpayments.io/payment/?iid=5426547692	{"id":"5426547692","token_id":"6159431993","order_id":"93239682b4e9e9c73cb951f1bf5fd561","order_description":"testtt","price_amount":"200","price_currency":"USD","pay_currency":null,"ipn_callback_url":"https://itio.in/nowpayments/callback.php","invoice_url":"https://sandbox.nowpayments.io/payment/?iid=5426547692","success_url":"https://itio.in/nowpayments/responce.php","cancel_url":"https://itio.in/nowpayments/responce.php","partially_paid_url":null,"payout_currency":null,"created_at":"2024-08-14T12:36:39.280Z","updated_at":"2024-08-14T12:36:39.280Z","is_fixed_rate":false,"is_fee_paid_by_user":false}
38	5238447278	waiting	3HbTGZr7odhCpKsKHNgzgxdDzm4qydATJJ	500	0.0082203	0.0082075	usd	btc	04f63436a25045f8b475404723701db6	test	72	2024-08-22 07:14:29.55	2024-08-22 07:14:29.55	127.0.0.1	\N	\N	\N	\N
39	6043276453	waiting	3A5MqrUAokusTJKxhA6WYJ2RLQdUVXgJGr	500	0.00915132	0.0091385	eur	btc	46da4a27ac5f542315d28a9ddf7fc9fe	hgfjhgjlk;	72	2024-08-23 04:26:39.597	2024-08-23 04:26:39.597	127.0.0.1	\N	\N	\N	\N
\.


--
-- TOC entry 5050 (class 0 OID 16699)
-- Dependencies: 226
-- Data for Name: transactions-for deleted; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."transactions-for deleted" (transactionid, client_id, walletid, transactiontype, amount, transaction_hash, status, "timestamp") FROM stdin;
12	72	5	Deposit	100.00	lkjdlfkjeajdpqwdq	Pending	12:23:31.874621+05:30
29	72	5	Deposit	100.00	lkjdlfkjeajdpqwdq	Pending	12:48:09.323344+05:30
\.


--
-- TOC entry 5046 (class 0 OID 16666)
-- Dependencies: 222
-- Data for Name: wallet_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet_list (wallet_id, volt_id, coin, address, legacyaddress, tag, total, available, pending, frozen, lockedamount, status, "timestamp") FROM stdin;
27	1	DASH_TEST	yc8U3eQkdZuaB7zDFRsKBdo4wEMSzyo925			0	0	0	0	0	2	13:34:59.038759+08
28	1	SOL_TEST	ABeSYbGV6j8SBkshAAzMG8n6gTjbHVVx37doMF9RKsHD			0	0	0	0	0	2	13:41:08.202717+08
29	1	BSV_TEST	mwKyVVmQ3LUATYwhYGD57zuFgbt6Qx3Rcc			\N	\N	\N	\N	\N	2	13:56:08.471123+08
31	1	OSMO_TEST	osmo144hxlwrquzjgw4w4lk0lxe2cc9kftchafa0ndc		4AFDA455715152DD4526	0	0	0	0	0	2	11:30:23.350329+05:30
33	3	BTC_TEST	tb1qe26t5z7hmtd6kpzf2zfr0due9dw2cjs7a0l0lf	myzmHvCVPtDD7kC1kJpxjRrdxV3hiUxtkT		\N	\N	\N	\N	\N	2	12:58:54.219265+08
32	1	XLM_TEST	GCEHGUYPIYCWWOKJ4SOYRWAKWT6R3KMTECKMJRSMLC2455UWRKUYJQ2W		3388069420	0	0	0	0	0	2	11:30:23.350329+05:30
34	4	BTC_TEST	tb1q7dazk463l6y2lyc7a6vhefwvu06mrzfyxhrlvj	n3iLr97U46gwV1ZemrPTmrXJRyNh2kBNBd		\N	\N	\N	\N	\N	2	20:52:41.739191+08
35	4	SOL_TEST	E9yeJFt2fpgKs6JrXgDpU1cDaxuwk8ktJxFFxG3jvhej			\N	\N	\N	\N	\N	2	20:52:50.936157+08
36	1	NEAR_TEST	8873530f46056b3949e49d88d80ab4fd1da9932094c4c64c58b5cef6968aa984			\N	\N	\N	\N	\N	2	20:17:23.835141+08
30	1	BTC_TEST	tb1q44hxlwrquzjgw4w4lk0lxe2cc9kftchaa6emy5	mwKyVVmQ3LUATYwhYGD57zuFgbt6Qx3Rcc		0	0	0	0	0	2	11:30:23.350329+05:30
37	5	BTC_TEST	tb1qjl5l2n6c4q7j0jsk36jqc552gvp45d7e9fc3c7	muNCbiwxFX93bpLWJKGkuW1cSsPDiQNksT		\N	\N	\N	\N	\N	2	20:00:11.688705+08
\.


--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 245
-- Name: acquirer_acquirer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.acquirer_acquirer_seq', 3, true);


--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 236
-- Name: admin_master_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_master_admin_id_seq', 5, true);


--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 229
-- Name: c_master_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.c_master_id_seq', 52, true);


--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 253
-- Name: client_api_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_api_id_seq', 10, true);


--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 220
-- Name: client_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_details_id_seq', 69, true);


--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 247
-- Name: client_fees_fee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_fees_fee_id_seq', 11, true);


--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 216
-- Name: client_master_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_master_client_id_seq', 198, true);


--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 251
-- Name: client_wallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_wallet_id_seq', 23, true);


--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 243
-- Name: coin_address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coin_address_address_id_seq', 38, true);


--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 223
-- Name: coin_list_coin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coin_list_coin_id_seq', 32, true);


--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 249
-- Name: crypto_currency_crypto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.crypto_currency_crypto_id_seq', 54, true);


--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 237
-- Name: currency_currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currency_currency_id_seq', 16, true);


--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 255
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 198, true);


--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 227
-- Name: email_template_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.email_template_template_id_seq', 9, true);


--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 233
-- Name: invoice_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoice_invoice_id_seq', 155, true);


--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 218
-- Name: login_history_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_history_token_id_seq', 4123, true);


--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 239
-- Name: support-ticket_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."support-ticket_ticket_id_seq"', 12, true);


--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 242
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_id_seq', 81, true);


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 231
-- Name: transaction_master_nowpayments_tid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_master_nowpayments_tid_seq', 39, true);


--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 225
-- Name: transactions_transactionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_transactionid_seq', 29, true);


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 221
-- Name: wallet_list_wallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_list_wallet_id_seq', 37, true);


--
-- TOC entry 4885 (class 2606 OID 17378)
-- Name: acquirer acquirer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acquirer
    ADD CONSTRAINT acquirer_pkey PRIMARY KEY (acquirer_id);


--
-- TOC entry 4875 (class 2606 OID 16977)
-- Name: admin_master admin_master_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_master
    ADD CONSTRAINT admin_master_pkey PRIMARY KEY (admin_id);


--
-- TOC entry 4869 (class 2606 OID 16720)
-- Name: transaction_master c_master_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_master
    ADD CONSTRAINT c_master_pkey PRIMARY KEY (id);


--
-- TOC entry 4893 (class 2606 OID 17473)
-- Name: client_api client_api_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_api
    ADD CONSTRAINT client_api_pkey PRIMARY KEY (id);


--
-- TOC entry 4857 (class 2606 OID 16648)
-- Name: client_details client_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_details
    ADD CONSTRAINT client_details_pkey PRIMARY KEY (id);


--
-- TOC entry 4887 (class 2606 OID 17386)
-- Name: client_fees client_fees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_fees
    ADD CONSTRAINT client_fees_pkey PRIMARY KEY (fee_id);


--
-- TOC entry 4849 (class 2606 OID 16515)
-- Name: client_master client_master_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_master
    ADD CONSTRAINT client_master_client_id_key UNIQUE (client_id);


--
-- TOC entry 4851 (class 2606 OID 16508)
-- Name: client_master client_master_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_master
    ADD CONSTRAINT client_master_pkey PRIMARY KEY (client_id);


--
-- TOC entry 4853 (class 2606 OID 16525)
-- Name: client_master client_master_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_master
    ADD CONSTRAINT client_master_username_key UNIQUE (username);


--
-- TOC entry 4891 (class 2606 OID 17437)
-- Name: client_wallet client_wallet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_wallet
    ADD CONSTRAINT client_wallet_pkey PRIMARY KEY (wallet_id);


--
-- TOC entry 4883 (class 2606 OID 17365)
-- Name: coin_address coin_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_address
    ADD CONSTRAINT coin_address_pkey PRIMARY KEY (address_id);


--
-- TOC entry 4863 (class 2606 OID 16687)
-- Name: coin_list coin_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coin_list
    ADD CONSTRAINT coin_list_pkey PRIMARY KEY (coin_id);


--
-- TOC entry 4859 (class 2606 OID 16637)
-- Name: client_details constraint_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_details
    ADD CONSTRAINT constraint_name UNIQUE (client_id);


--
-- TOC entry 4889 (class 2606 OID 17431)
-- Name: crypto_currency crypto_currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crypto_currency
    ADD CONSTRAINT crypto_currency_pkey PRIMARY KEY (crypto_id);


--
-- TOC entry 4877 (class 2606 OID 17131)
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (currency_id);


--
-- TOC entry 4895 (class 2606 OID 17499)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4867 (class 2606 OID 16713)
-- Name: email_template email_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_template
    ADD CONSTRAINT email_template_pkey PRIMARY KEY (template_id);


--
-- TOC entry 4873 (class 2606 OID 16832)
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (invoice_id);


--
-- TOC entry 4855 (class 2606 OID 16558)
-- Name: login_history login_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_history
    ADD CONSTRAINT login_history_pkey PRIMARY KEY (token_id);


--
-- TOC entry 4879 (class 2606 OID 17141)
-- Name: support-ticket support-ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."support-ticket"
    ADD CONSTRAINT "support-ticket_pkey" PRIMARY KEY (ticket_id);


--
-- TOC entry 4871 (class 2606 OID 16780)
-- Name: transaction_master_nowpayments transaction_master_nowpayments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_master_nowpayments
    ADD CONSTRAINT transaction_master_nowpayments_pkey PRIMARY KEY (tid);


--
-- TOC entry 4881 (class 2606 OID 17355)
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- TOC entry 4865 (class 2606 OID 16703)
-- Name: transactions-for deleted transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."transactions-for deleted"
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transactionid);


--
-- TOC entry 4861 (class 2606 OID 16671)
-- Name: wallet_list wallet_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet_list
    ADD CONSTRAINT wallet_list_pkey PRIMARY KEY (wallet_id);


-- Completed on 2024-10-04 12:19:01

--
-- PostgreSQL database dump complete
--

