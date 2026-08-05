--
-- PostgreSQL database dump
--

\restrict VPlJeQALJWshdcIVhbtPCk6ehfODawVMQQoqKIBsYevBsgvCF5CG6JOdyA0tFiM

-- Dumped from database version 14.22
-- Dumped by pg_dump version 18.3

-- Started on 2026-08-05 10:25:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 41610)
-- Name: account_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_type (
    account_type_id integer NOT NULL,
    account_type_name character varying(50) NOT NULL,
    minimum_balance numeric(12,2) NOT NULL,
    interest_rate numeric(5,2) NOT NULL,
    effective_date date NOT NULL,
    CONSTRAINT account_type_interest_rate_check CHECK ((interest_rate >= (0)::numeric)),
    CONSTRAINT account_type_minimum_balance_check CHECK ((minimum_balance >= (0)::numeric))
);


ALTER TABLE public.account_type OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 41609)
-- Name: account_type_account_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_type_account_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.account_type_account_type_id_seq OWNER TO postgres;

--
-- TOC entry 3564 (class 0 OID 0)
-- Dependencies: 213
-- Name: account_type_account_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_type_account_type_id_seq OWNED BY public.account_type.account_type_id;


--
-- TOC entry 222 (class 1259 OID 41654)
-- Name: bank_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank_account (
    account_id integer NOT NULL,
    customer_id integer NOT NULL,
    account_type_id integer NOT NULL,
    branch_id integer NOT NULL,
    opening_date date NOT NULL
);


ALTER TABLE public.bank_account OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 41653)
-- Name: bank_account_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_account_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bank_account_account_id_seq OWNER TO postgres;

--
-- TOC entry 3565 (class 0 OID 0)
-- Dependencies: 221
-- Name: bank_account_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_account_account_id_seq OWNED BY public.bank_account.account_id;


--
-- TOC entry 212 (class 1259 OID 41601)
-- Name: bank_branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank_branch (
    branch_id integer NOT NULL,
    branch_name character varying(100) NOT NULL,
    district_name character varying(50) NOT NULL,
    branch_manager character varying(100) NOT NULL,
    opening_date date NOT NULL
);


ALTER TABLE public.bank_branch OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 41600)
-- Name: bank_branch_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_branch_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bank_branch_branch_id_seq OWNER TO postgres;

--
-- TOC entry 3566 (class 0 OID 0)
-- Dependencies: 211
-- Name: bank_branch_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_branch_branch_id_seq OWNED BY public.bank_branch.branch_id;


--
-- TOC entry 236 (class 1259 OID 41779)
-- Name: bank_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank_card (
    card_id integer NOT NULL,
    account_id integer NOT NULL,
    card_number character varying(20) NOT NULL,
    card_type character varying(20) NOT NULL,
    issue_date date NOT NULL,
    CONSTRAINT bank_card_card_type_check CHECK (((card_type)::text = ANY ((ARRAY['Debit'::character varying, 'Credit'::character varying])::text[])))
);


ALTER TABLE public.bank_card OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 41778)
-- Name: bank_card_card_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_card_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bank_card_card_id_seq OWNER TO postgres;

--
-- TOC entry 3567 (class 0 OID 0)
-- Dependencies: 235
-- Name: bank_card_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_card_card_id_seq OWNED BY public.bank_card.card_id;


--
-- TOC entry 220 (class 1259 OID 41642)
-- Name: bank_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank_employee (
    employee_id integer NOT NULL,
    branch_id integer NOT NULL,
    employee_name character varying(100) NOT NULL,
    employee_position character varying(50) NOT NULL,
    employment_date date NOT NULL
);


ALTER TABLE public.bank_employee OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 41641)
-- Name: bank_employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_employee_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bank_employee_employee_id_seq OWNER TO postgres;

--
-- TOC entry 3568 (class 0 OID 0)
-- Dependencies: 219
-- Name: bank_employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_employee_employee_id_seq OWNED BY public.bank_employee.employee_id;


--
-- TOC entry 240 (class 1259 OID 41813)
-- Name: beneficiary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beneficiary (
    beneficiary_id integer NOT NULL,
    customer_id integer NOT NULL,
    beneficiary_name character varying(100) NOT NULL,
    beneficiary_account character varying(30) NOT NULL,
    registration_date date NOT NULL
);


ALTER TABLE public.beneficiary OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 41812)
-- Name: beneficiary_beneficiary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beneficiary_beneficiary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.beneficiary_beneficiary_id_seq OWNER TO postgres;

--
-- TOC entry 3569 (class 0 OID 0)
-- Dependencies: 239
-- Name: beneficiary_beneficiary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beneficiary_beneficiary_id_seq OWNED BY public.beneficiary.beneficiary_id;


--
-- TOC entry 248 (class 1259 OID 41879)
-- Name: branch_target; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch_target (
    target_id integer NOT NULL,
    branch_id integer NOT NULL,
    account_type_id integer NOT NULL,
    target_year integer NOT NULL,
    target_amount numeric(15,2) NOT NULL,
    CONSTRAINT branch_target_target_amount_check CHECK ((target_amount > (0)::numeric)),
    CONSTRAINT branch_target_target_year_check CHECK ((target_year >= 2020))
);


ALTER TABLE public.branch_target OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 41878)
-- Name: branch_target_target_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branch_target_target_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.branch_target_target_id_seq OWNER TO postgres;

--
-- TOC entry 3570 (class 0 OID 0)
-- Dependencies: 247
-- Name: branch_target_target_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branch_target_target_id_seq OWNED BY public.branch_target.target_id;


--
-- TOC entry 234 (class 1259 OID 41766)
-- Name: collateral; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collateral (
    collateral_id integer NOT NULL,
    loan_id integer NOT NULL,
    collateral_type character varying(100) NOT NULL,
    collateral_value numeric(15,2) NOT NULL,
    registration_date date NOT NULL,
    CONSTRAINT collateral_collateral_value_check CHECK ((collateral_value > (0)::numeric))
);


ALTER TABLE public.collateral OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 41765)
-- Name: collateral_collateral_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collateral_collateral_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.collateral_collateral_id_seq OWNER TO postgres;

--
-- TOC entry 3571 (class 0 OID 0)
-- Dependencies: 233
-- Name: collateral_collateral_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collateral_collateral_id_seq OWNED BY public.collateral.collateral_id;


--
-- TOC entry 216 (class 1259 OID 41621)
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    currency_id integer NOT NULL,
    currency_code character varying(20) NOT NULL,
    currency_name character varying(50) NOT NULL,
    exchange_rate numeric(12,2) NOT NULL,
    effective_date date NOT NULL,
    CONSTRAINT currency_exchange_rate_check CHECK ((exchange_rate > (0)::numeric))
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 41620)
-- Name: currency_currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currency_currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.currency_currency_id_seq OWNER TO postgres;

--
-- TOC entry 3572 (class 0 OID 0)
-- Dependencies: 215
-- Name: currency_currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currency_currency_id_seq OWNED BY public.currency.currency_id;


--
-- TOC entry 210 (class 1259 OID 41590)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    national_id character varying(16) NOT NULL,
    customer_name character varying(100) NOT NULL,
    customer_type character varying(20) NOT NULL,
    registration_date date DEFAULT CURRENT_DATE NOT NULL,
    CONSTRAINT customer_customer_type_check CHECK (((customer_type)::text = ANY ((ARRAY['Individual'::character varying, 'Company'::character varying])::text[])))
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 41861)
-- Name: customer_complaint; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_complaint (
    complaint_id integer NOT NULL,
    customer_id integer NOT NULL,
    employee_id integer NOT NULL,
    complaint_date date NOT NULL,
    complaint_status character varying(20) NOT NULL,
    CONSTRAINT customer_complaint_complaint_status_check CHECK (((complaint_status)::text = ANY ((ARRAY['Pending'::character varying, 'In Progress'::character varying, 'Resolved'::character varying, 'Closed'::character varying])::text[])))
);


ALTER TABLE public.customer_complaint OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 41860)
-- Name: customer_complaint_complaint_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_complaint_complaint_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_complaint_complaint_id_seq OWNER TO postgres;

--
-- TOC entry 3573 (class 0 OID 0)
-- Dependencies: 245
-- Name: customer_complaint_complaint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_complaint_complaint_id_seq OWNED BY public.customer_complaint.complaint_id;


--
-- TOC entry 209 (class 1259 OID 41589)
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_customer_id_seq OWNER TO postgres;

--
-- TOC entry 3574 (class 0 OID 0)
-- Dependencies: 209
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- TOC entry 224 (class 1259 OID 41676)
-- Name: deposit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deposit (
    deposit_id integer NOT NULL,
    account_id integer NOT NULL,
    currency_id integer NOT NULL,
    deposit_date date NOT NULL,
    deposit_amount numeric(15,2) NOT NULL,
    CONSTRAINT deposit_deposit_amount_check CHECK ((deposit_amount > (0)::numeric))
);


ALTER TABLE public.deposit OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 41675)
-- Name: deposit_deposit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deposit_deposit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deposit_deposit_id_seq OWNER TO postgres;

--
-- TOC entry 3575 (class 0 OID 0)
-- Dependencies: 223
-- Name: deposit_deposit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deposit_deposit_id_seq OWNED BY public.deposit.deposit_id;


--
-- TOC entry 242 (class 1259 OID 41825)
-- Name: fixed_deposit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fixed_deposit (
    fixed_deposit_id integer NOT NULL,
    account_id integer NOT NULL,
    currency_id integer NOT NULL,
    principal_amount numeric(15,2) NOT NULL,
    maturity_date date NOT NULL,
    CONSTRAINT fixed_deposit_principal_amount_check CHECK ((principal_amount > (0)::numeric))
);


ALTER TABLE public.fixed_deposit OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 41824)
-- Name: fixed_deposit_fixed_deposit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fixed_deposit_fixed_deposit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fixed_deposit_fixed_deposit_id_seq OWNER TO postgres;

--
-- TOC entry 3576 (class 0 OID 0)
-- Dependencies: 241
-- Name: fixed_deposit_fixed_deposit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fixed_deposit_fixed_deposit_id_seq OWNED BY public.fixed_deposit.fixed_deposit_id;


--
-- TOC entry 232 (class 1259 OID 41753)
-- Name: guarantor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guarantor (
    guarantor_id integer NOT NULL,
    loan_id integer NOT NULL,
    guarantor_name character varying(100) NOT NULL,
    guarantor_phone character varying(15) NOT NULL,
    guaranteed_amount numeric(15,2) NOT NULL,
    CONSTRAINT guarantor_guaranteed_amount_check CHECK ((guaranteed_amount > (0)::numeric))
);


ALTER TABLE public.guarantor OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 41752)
-- Name: guarantor_guarantor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guarantor_guarantor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.guarantor_guarantor_id_seq OWNER TO postgres;

--
-- TOC entry 3577 (class 0 OID 0)
-- Dependencies: 231
-- Name: guarantor_guarantor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guarantor_guarantor_id_seq OWNED BY public.guarantor.guarantor_id;


--
-- TOC entry 244 (class 1259 OID 41843)
-- Name: insurance_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insurance_policy (
    policy_id integer NOT NULL,
    customer_id integer NOT NULL,
    loan_id integer,
    policy_type character varying(100) NOT NULL,
    premium_amount numeric(15,2) NOT NULL,
    CONSTRAINT insurance_policy_premium_amount_check CHECK ((premium_amount > (0)::numeric))
);


ALTER TABLE public.insurance_policy OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 41842)
-- Name: insurance_policy_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insurance_policy_policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.insurance_policy_policy_id_seq OWNER TO postgres;

--
-- TOC entry 3578 (class 0 OID 0)
-- Dependencies: 243
-- Name: insurance_policy_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insurance_policy_policy_id_seq OWNED BY public.insurance_policy.policy_id;


--
-- TOC entry 228 (class 1259 OID 41712)
-- Name: loan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loan (
    loan_id integer NOT NULL,
    customer_id integer NOT NULL,
    loan_type_id integer NOT NULL,
    employee_id integer NOT NULL,
    loan_amount numeric(15,2) NOT NULL,
    CONSTRAINT loan_loan_amount_check CHECK ((loan_amount > (0)::numeric))
);


ALTER TABLE public.loan OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 41711)
-- Name: loan_loan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loan_loan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loan_loan_id_seq OWNER TO postgres;

--
-- TOC entry 3579 (class 0 OID 0)
-- Dependencies: 227
-- Name: loan_loan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loan_loan_id_seq OWNED BY public.loan.loan_id;


--
-- TOC entry 230 (class 1259 OID 41735)
-- Name: loan_repayment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loan_repayment (
    repayment_id integer NOT NULL,
    loan_id integer NOT NULL,
    account_id integer NOT NULL,
    repayment_date date NOT NULL,
    repayment_amount numeric(15,2) NOT NULL,
    CONSTRAINT loan_repayment_repayment_amount_check CHECK ((repayment_amount > (0)::numeric))
);


ALTER TABLE public.loan_repayment OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 41734)
-- Name: loan_repayment_repayment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loan_repayment_repayment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loan_repayment_repayment_id_seq OWNER TO postgres;

--
-- TOC entry 3580 (class 0 OID 0)
-- Dependencies: 229
-- Name: loan_repayment_repayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loan_repayment_repayment_id_seq OWNED BY public.loan_repayment.repayment_id;


--
-- TOC entry 218 (class 1259 OID 41631)
-- Name: loan_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loan_type (
    loan_type_id integer NOT NULL,
    loan_type_name character varying(100) NOT NULL,
    interest_rate numeric(5,2) NOT NULL,
    maximum_period_months integer NOT NULL,
    effective_date date NOT NULL,
    CONSTRAINT loan_type_interest_rate_check CHECK ((interest_rate >= (0)::numeric)),
    CONSTRAINT loan_type_maximum_period_months_check CHECK ((maximum_period_months > 0))
);


ALTER TABLE public.loan_type OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 41630)
-- Name: loan_type_loan_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loan_type_loan_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loan_type_loan_type_id_seq OWNER TO postgres;

--
-- TOC entry 3581 (class 0 OID 0)
-- Dependencies: 217
-- Name: loan_type_loan_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loan_type_loan_type_id_seq OWNED BY public.loan_type.loan_type_id;


--
-- TOC entry 238 (class 1259 OID 41794)
-- Name: mobile_banking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mobile_banking (
    mobile_banking_id integer NOT NULL,
    customer_id integer NOT NULL,
    account_id integer NOT NULL,
    phone_number character varying(15) NOT NULL,
    registration_date date NOT NULL
);


ALTER TABLE public.mobile_banking OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 41793)
-- Name: mobile_banking_mobile_banking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mobile_banking_mobile_banking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mobile_banking_mobile_banking_id_seq OWNER TO postgres;

--
-- TOC entry 3582 (class 0 OID 0)
-- Dependencies: 237
-- Name: mobile_banking_mobile_banking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mobile_banking_mobile_banking_id_seq OWNED BY public.mobile_banking.mobile_banking_id;


--
-- TOC entry 226 (class 1259 OID 41694)
-- Name: withdrawal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.withdrawal (
    withdrawal_id integer NOT NULL,
    account_id integer NOT NULL,
    employee_id integer NOT NULL,
    withdrawal_date date NOT NULL,
    withdrawal_amount numeric(15,2) NOT NULL,
    CONSTRAINT withdrawal_withdrawal_amount_check CHECK ((withdrawal_amount > (0)::numeric))
);


ALTER TABLE public.withdrawal OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 41693)
-- Name: withdrawal_withdrawal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.withdrawal_withdrawal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.withdrawal_withdrawal_id_seq OWNER TO postgres;

--
-- TOC entry 3583 (class 0 OID 0)
-- Dependencies: 225
-- Name: withdrawal_withdrawal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.withdrawal_withdrawal_id_seq OWNED BY public.withdrawal.withdrawal_id;


--
-- TOC entry 3262 (class 2604 OID 41613)
-- Name: account_type account_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type ALTER COLUMN account_type_id SET DEFAULT nextval('public.account_type_account_type_id_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 41657)
-- Name: bank_account account_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_account ALTER COLUMN account_id SET DEFAULT nextval('public.bank_account_account_id_seq'::regclass);


--
-- TOC entry 3261 (class 2604 OID 41604)
-- Name: bank_branch branch_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_branch ALTER COLUMN branch_id SET DEFAULT nextval('public.bank_branch_branch_id_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 41782)
-- Name: bank_card card_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_card ALTER COLUMN card_id SET DEFAULT nextval('public.bank_card_card_id_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 41645)
-- Name: bank_employee employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_employee ALTER COLUMN employee_id SET DEFAULT nextval('public.bank_employee_employee_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 41816)
-- Name: beneficiary beneficiary_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficiary ALTER COLUMN beneficiary_id SET DEFAULT nextval('public.beneficiary_beneficiary_id_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 41882)
-- Name: branch_target target_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_target ALTER COLUMN target_id SET DEFAULT nextval('public.branch_target_target_id_seq'::regclass);


--
-- TOC entry 3272 (class 2604 OID 41769)
-- Name: collateral collateral_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collateral ALTER COLUMN collateral_id SET DEFAULT nextval('public.collateral_collateral_id_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 41624)
-- Name: currency currency_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency ALTER COLUMN currency_id SET DEFAULT nextval('public.currency_currency_id_seq'::regclass);


--
-- TOC entry 3259 (class 2604 OID 41593)
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- TOC entry 3278 (class 2604 OID 41864)
-- Name: customer_complaint complaint_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_complaint ALTER COLUMN complaint_id SET DEFAULT nextval('public.customer_complaint_complaint_id_seq'::regclass);


--
-- TOC entry 3267 (class 2604 OID 41679)
-- Name: deposit deposit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit ALTER COLUMN deposit_id SET DEFAULT nextval('public.deposit_deposit_id_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 41828)
-- Name: fixed_deposit fixed_deposit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fixed_deposit ALTER COLUMN fixed_deposit_id SET DEFAULT nextval('public.fixed_deposit_fixed_deposit_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 41756)
-- Name: guarantor guarantor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guarantor ALTER COLUMN guarantor_id SET DEFAULT nextval('public.guarantor_guarantor_id_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 41846)
-- Name: insurance_policy policy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_policy ALTER COLUMN policy_id SET DEFAULT nextval('public.insurance_policy_policy_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 41715)
-- Name: loan loan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan ALTER COLUMN loan_id SET DEFAULT nextval('public.loan_loan_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 41738)
-- Name: loan_repayment repayment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_repayment ALTER COLUMN repayment_id SET DEFAULT nextval('public.loan_repayment_repayment_id_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 41634)
-- Name: loan_type loan_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_type ALTER COLUMN loan_type_id SET DEFAULT nextval('public.loan_type_loan_type_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 41797)
-- Name: mobile_banking mobile_banking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobile_banking ALTER COLUMN mobile_banking_id SET DEFAULT nextval('public.mobile_banking_mobile_banking_id_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 41697)
-- Name: withdrawal withdrawal_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.withdrawal ALTER COLUMN withdrawal_id SET DEFAULT nextval('public.withdrawal_withdrawal_id_seq'::regclass);


--
-- TOC entry 3523 (class 0 OID 41610)
-- Dependencies: 214
-- Data for Name: account_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_type (account_type_id, account_type_name, minimum_balance, interest_rate, effective_date) FROM stdin;
1	Savings Account	5000.00	2.50	2020-01-01
2	Current Account	10000.00	0.50	2020-01-10
3	Business Account	50000.00	3.00	2020-02-01
4	Student Account	1000.00	1.50	2020-03-01
5	Premium Account	100000.00	4.00	2020-04-01
6	Salary Account	5000.00	2.00	2020-05-01
7	Youth Account	500.00	1.75	2020-06-01
8	Corporate Account	200000.00	5.00	2020-07-01
9	Investment Account	500000.00	6.00	2020-08-01
10	Foreign Currency Account	10000.00	2.25	2020-09-01
11	Gold Savings Account	25000.00	3.50	2021-01-01
12	Silver Savings Account	15000.00	3.00	2021-02-01
13	Diamond Account	1000000.00	7.00	2021-03-01
14	Family Account	10000.00	2.20	2021-04-01
15	Children Savings Account	500.00	1.20	2021-05-01
16	Education Savings Account	5000.00	2.80	2021-06-01
17	Health Savings Account	5000.00	2.90	2021-07-01
18	Agriculture Account	20000.00	3.60	2021-08-01
19	Merchant Account	30000.00	3.40	2021-09-01
20	SME Account	50000.00	4.20	2021-10-01
21	Savings Account RWF	5000.00	2.50	2021-01-15
22	Savings Account USD	50.00	1.50	2021-02-15
23	Savings Account EUR	50.00	1.40	2021-03-15
24	Current Account RWF	10000.00	0.50	2021-04-15
25	Current Account USD	100.00	0.30	2021-05-15
26	Current Account EUR	100.00	0.40	2021-06-15
27	Business Account Basic	25000.00	3.00	2021-07-01
28	Business Account Plus	75000.00	4.00	2021-08-01
29	Business Account Premium	150000.00	5.00	2021-09-01
30	Business Account Enterprise	500000.00	6.00	2021-10-01
31	SME Account Basic	30000.00	3.20	2022-01-01
32	SME Account Standard	50000.00	3.50	2022-02-01
33	SME Account Premium	100000.00	4.50	2022-03-01
34	Corporate Account Silver	200000.00	5.00	2022-04-01
35	Corporate Account Gold	500000.00	6.00	2022-05-01
36	Corporate Account Platinum	1000000.00	7.00	2022-06-01
37	Youth Account Plus	1000.00	2.00	2022-07-01
38	Youth Account Premium	2000.00	2.50	2022-08-01
39	Student Account RWF	500.00	1.50	2022-09-01
40	Student Account USD	50.00	1.00	2022-10-01
41	Family Savings Basic	5000.00	2.20	2023-01-01
42	Family Savings Plus	15000.00	3.00	2023-02-01
43	Family Savings Premium	50000.00	4.00	2023-03-01
44	Women Enterprise Account	20000.00	3.80	2023-04-01
45	Women Business Plus	50000.00	4.50	2023-05-01
46	Agriculture Basic Account	10000.00	3.20	2023-06-01
47	Agriculture Premium Account	50000.00	4.80	2023-07-01
48	Farmer Support Account	25000.00	3.70	2023-08-01
49	Merchant Basic Account	15000.00	3.00	2023-09-01
50	Merchant Premium Account	75000.00	4.50	2023-10-01
51	Investment RWF Account	100000.00	5.50	2024-01-01
52	Investment USD Account	500.00	5.00	2024-02-01
53	Investment EUR Account	500.00	5.00	2024-03-01
54	Fixed Savings Basic	25000.00	4.00	2024-04-01
55	Fixed Savings Premium	100000.00	6.00	2024-05-01
56	Long Term Savings Account	200000.00	6.50	2024-06-01
57	Education Fund Account	10000.00	3.00	2024-07-01
58	Medical Savings Account	15000.00	3.20	2024-08-01
59	Travel Savings Account	10000.00	2.80	2024-09-01
60	Holiday Savings Account	5000.00	2.50	2024-10-01
61	Digital Savings Account	1000.00	2.75	2025-01-01
62	Mobile Banking Account	500.00	2.25	2025-02-01
63	Online Business Account	50000.00	4.25	2025-03-01
64	Online Merchant Account	30000.00	3.75	2025-04-01
65	Premium Digital Account	100000.00	5.25	2025-05-01
66	Diaspora Account RWF	50000.00	4.00	2025-06-01
67	Diaspora Account USD	1000.00	4.50	2025-07-01
68	Diaspora Account EUR	1000.00	4.50	2025-08-01
69	International Account	500000.00	6.50	2025-09-01
70	Community Savings Account	5000.00	2.30	2025-10-01
71	Group Savings Account	10000.00	2.60	2025-11-01
72	Cooperative Account	25000.00	3.50	2025-12-01
73	NGO Account	100000.00	5.00	2026-01-01
74	Government Account	500000.00	6.00	2026-02-01
75	Staff Savings Account	1000.00	3.00	2026-03-01
76	Staff Premium Account	50000.00	4.50	2026-04-01
77	VIP Account	1000000.00	7.50	2026-05-01
78	Executive Account	2000000.00	8.00	2026-06-01
79	Gold Investment Account	500000.00	6.50	2026-07-01
80	Silver Investment Account	250000.00	5.50	2026-08-01
81	Diamond Investment Account	2000000.00	8.50	2026-09-01
82	Enterprise Growth Account	1000000.00	7.00	2026-10-01
83	Small Trader Account	10000.00	3.00	2026-11-01
84	Medium Trader Account	50000.00	4.00	2026-12-01
85	Large Trader Account	200000.00	5.00	2027-01-01
86	Retail Business Account	75000.00	4.25	2027-02-01
87	Wholesale Business Account	300000.00	5.50	2027-03-01
88	Emergency Savings Account	5000.00	2.75	2027-04-01
89	Future Savings Account	10000.00	3.25	2027-05-01
90	Secure Savings Account	25000.00	3.75	2027-06-01
91	Smart Saver Account	50000.00	4.25	2027-07-01
92	Advanced Saver Account	100000.00	5.25	2027-08-01
109	Equity Special Account 1	51000.00	3.60	2026-07-19
110	Equity Special Account 2	52000.00	3.70	2026-07-19
111	Equity Special Account 3	53000.00	3.80	2026-07-19
112	Equity Special Account 4	54000.00	3.90	2026-07-19
113	Equity Special Account 5	55000.00	4.00	2026-07-19
114	Equity Special Account 6	56000.00	4.10	2026-07-19
115	Equity Special Account 7	57000.00	4.20	2026-07-19
116	Equity Special Account 8	58000.00	4.30	2026-07-19
\.


--
-- TOC entry 3531 (class 0 OID 41654)
-- Dependencies: 222
-- Data for Name: bank_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_account (account_id, customer_id, account_type_id, branch_id, opening_date) FROM stdin;
501	1	1	1	2020-01-11
502	2	2	2	2020-01-21
503	3	3	3	2020-01-31
504	4	4	4	2020-02-10
505	5	5	5	2020-02-20
506	6	6	6	2020-03-01
507	7	7	7	2020-03-11
508	8	8	8	2020-03-21
509	9	9	9	2020-03-31
510	10	10	10	2020-04-10
511	11	11	11	2020-04-20
512	12	12	12	2020-04-30
513	13	13	13	2020-05-10
514	14	14	14	2020-05-20
515	15	15	15	2020-05-30
516	16	16	16	2020-06-09
517	17	17	17	2020-06-19
518	18	18	18	2020-06-29
519	19	19	19	2020-07-09
520	20	20	20	2020-07-19
521	21	21	21	2020-07-29
522	22	22	22	2020-08-08
523	23	23	23	2020-08-18
524	24	24	24	2020-08-28
525	25	25	25	2020-09-07
526	26	26	26	2020-09-17
527	27	27	27	2020-09-27
528	28	28	28	2020-10-07
529	29	29	29	2020-10-17
530	30	30	30	2020-10-27
531	31	31	31	2020-11-06
532	32	32	32	2020-11-16
533	33	33	33	2020-11-26
534	34	34	34	2020-12-06
535	35	35	35	2020-12-16
536	36	36	36	2020-12-26
537	37	37	37	2021-01-05
538	38	38	38	2021-01-15
539	39	39	39	2021-01-25
540	40	40	40	2021-02-04
541	41	41	41	2021-02-14
542	42	42	42	2021-02-24
543	43	43	43	2021-03-06
544	44	44	44	2021-03-16
545	45	45	45	2021-03-26
546	46	46	46	2021-04-05
547	47	47	47	2021-04-15
548	48	48	48	2021-04-25
549	49	49	49	2021-05-05
550	50	50	50	2021-05-15
551	51	51	51	2021-05-25
552	52	52	52	2021-06-04
553	53	53	53	2021-06-14
554	54	54	54	2021-06-24
555	55	55	55	2021-07-04
556	56	56	56	2021-07-14
557	57	57	57	2021-07-24
558	58	58	58	2021-08-03
559	59	59	59	2021-08-13
560	60	60	60	2021-08-23
561	61	61	61	2021-09-02
562	62	62	62	2021-09-12
563	63	63	63	2021-09-22
564	64	64	64	2021-10-02
565	65	65	65	2021-10-12
566	66	66	66	2021-10-22
567	67	67	67	2021-11-01
568	68	68	68	2021-11-11
569	69	69	69	2021-11-21
570	70	70	70	2021-12-01
571	71	71	71	2021-12-11
572	72	72	72	2021-12-21
573	73	73	73	2021-12-31
574	74	74	74	2022-01-10
575	75	75	75	2022-01-20
576	76	76	76	2022-01-30
577	77	77	77	2022-02-09
578	78	78	78	2022-02-19
579	79	79	79	2022-03-01
580	80	80	80	2022-03-11
581	81	81	81	2022-03-21
582	82	82	82	2022-03-31
583	83	83	83	2022-04-10
584	84	84	84	2022-04-20
585	85	85	85	2022-04-30
586	86	86	86	2022-05-10
587	87	87	87	2022-05-20
588	88	88	88	2022-05-30
589	89	89	89	2022-06-09
590	90	90	90	2022-06-19
591	91	91	91	2022-06-29
592	92	92	92	2022-07-09
593	93	109	93	2022-07-19
594	94	110	94	2022-07-29
595	95	111	95	2022-08-08
596	96	112	96	2022-08-18
597	97	113	97	2022-08-28
598	98	114	98	2022-09-07
599	99	115	99	2022-09-17
600	100	116	100	2022-09-27
\.


--
-- TOC entry 3521 (class 0 OID 41601)
-- Dependencies: 212
-- Data for Name: bank_branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_branch (branch_id, branch_name, district_name, branch_manager, opening_date) FROM stdin;
1	Kigali Main Branch	Nyarugenge	Jean Claude Habimana	2015-01-15
2	Kicukiro Branch	Kicukiro	Diane Uwase	2016-02-10
3	Gasabo Branch	Gasabo	Eric Mugisha	2016-05-20
4	Remera Branch	Gasabo	Alice Nishimwe	2017-01-12
5	Nyamirambo Branch	Nyarugenge	Patrick Habimana	2017-03-18
6	Muhanga Branch	Muhanga	Chantal Mukamana	2017-06-05
7	Huye Branch	Huye	Samuel Ndayisenga	2018-01-15
8	Musanze Branch	Musanze	Kevin Irakoze	2018-04-10
9	Rubavu Branch	Rubavu	Grace Uwimana	2018-08-22
10	Rwamagana Branch	Rwamagana	David Kamanzi	2019-01-05
11	Nyagatare Branch	Nyagatare	Aline Mutesi	2019-03-10
12	Kayonza Branch	Kayonza	Claude Bizimana	2019-05-15
13	Gicumbi Branch	Gicumbi	Solange Uwimana	2019-07-20
14	Karongi Branch	Karongi	Eric Niyitegeka	2020-01-10
15	Rusizi Branch	Rusizi	Olive Mukeshimana	2020-03-12
16	Nyanza Branch	Nyanza	Bosco Hakizimana	2020-05-18
17	Gisagara Branch	Gisagara	Fiona Uwera	2020-07-25
18	Nyamagabe Branch	Nyamagabe	Alain Rukundo	2020-09-30
19	Bugesera Branch	Bugesera	Diane Kayitesi	2021-01-15
20	Kirehe Branch	Kirehe	Emmanuel Niyonzima	2021-03-20
21	Ruhengeri Branch	Musanze	Grace Kayitesi	2021-05-10
22	Kigali City Branch	Gasabo	Hillary Keza	2021-06-15
23	Airport Branch	Kicukiro	Marie Uwitonze	2021-07-20
24	University Branch	Gasabo	Eric Habineza	2021-08-25
25	Market Branch	Nyarugenge	Alice Uwamahoro	2021-09-30
26	Industrial Area Branch	Kicukiro	Patrick Tuyisenge	2022-01-05
27	Downtown Branch	Nyarugenge	Samuel Nkurunziza	2022-02-15
28	Eastern Province Branch	Rwamagana	Bella Umutoni	2022-03-20
29	Northern Province Branch	Musanze	Jean Pierre Habimana	2022-04-25
30	Western Province Branch	Rubavu	Clarisse Mukamana	2022-05-30
31	Kigali Heights Branch	Gasabo	Kevin Twahirwa	2022-06-10
32	Kimihurura Branch	Gasabo	Alice Uwase	2022-07-15
33	Gisozi Branch	Gasabo	Claude Irakoze	2022-08-20
34	Kimironko Branch	Gasabo	Sarah Uwase	2022-09-25
35	Kacyiru Branch	Gasabo	David Mugabo	2022-10-30
36	Kanombe Branch	Kicukiro	Eric Habimana	2023-01-05
37	Masaka Branch	Kicukiro	Grace Nishimwe	2023-02-10
38	Kigarama Branch	Kicukiro	Patrick Mugisha	2023-03-15
39	Nyamata Branch	Bugesera	Alice Keza	2023-04-20
40	Rilima Branch	Bugesera	Diane Uwera	2023-05-25
41	Mukarange Branch	Kayonza	Jean Claude	2023-06-10
42	Ngoma Branch	Ngoma	Samuel Eric	2023-07-15
43	Kibungo Branch	Ngoma	Aline Grace	2023-08-20
44	Kaduha Branch	Nyamagabe	Patrick Claude	2023-09-25
45	Muko Branch	Gicumbi	Alice Diane	2023-10-30
46	Byumba Branch	Gicumbi	Eric David	2024-01-05
47	Bungwe Branch	Burera	Grace Alice	2024-02-10
48	Kinyababa Branch	Burera	Kevin Patrick	2024-03-15
49	Rugarama Branch	Burera	Chantal Uwase	2024-04-20
50	Kivumu Branch	Rutsiro	David Eric	2024-05-25
51	Mukarange II Branch	Kayonza	Alice Mutesi	2024-06-10
52	Kabarondo Branch	Kayonza	Claude Mugisha	2024-07-15
53	Rukara Branch	Kayonza	Diane Uwase	2024-08-20
54	Gahini Branch	Kayonza	Eric Habimana	2024-09-25
55	Kabarondo East Branch	Kayonza	Patrick Uwimana	2024-10-30
56	Mageragere Branch	Nyarugenge	Grace Uwase	2025-01-05
57	Jali Branch	Gasabo	Kevin Mugisha	2025-02-10
58	Bumbogo Branch	Gasabo	Alice Patrick	2025-03-15
59	Kinyinya Branch	Gasabo	David Uwase	2025-04-20
60	Rutunga Branch	Gasabo	Chantal Eric	2025-05-25
61	Kanzenze Branch	Rubavu	Samuel Alice	2025-06-10
62	Gisenyi Branch	Rubavu	Patrick David	2025-07-15
63	Nyundo Branch	Rubavu	Grace Claude	2025-08-20
64	Gihundwe Branch	Rusizi	Alice Uwimana	2025-09-25
65	Kamembe Branch	Rusizi	Eric Mugabo	2025-10-30
66	Bwishyura Branch	Karongi	Diane Keza	2025-11-05
67	Rubengera Branch	Karongi	Kevin Uwase	2025-12-10
68	Busasamana Branch	Nyanza	Patrick Alice	2025-12-15
69	Mukingo Branch	Nyanza	Claude Diane	2025-12-20
70	Kibilizi Branch	Gisagara	Eric Grace	2025-12-25
71	Save Branch	Gisagara	Alice David	2026-01-05
72	Huye South Branch	Huye	Patrick Uwase	2026-01-10
73	Tumba Branch	Huye	Grace Mugisha	2026-01-15
74	Ngororero Branch	Ngororero	David Alice	2026-01-20
75	Kabaya Branch	Ngororero	Eric Claude	2026-01-25
76	Gatumba Branch	Ngororero	Diane Patrick	2026-02-01
77	Rutsiro Branch	Rutsiro	Alice Eric	2026-02-05
78	Mushubati Branch	Rutsiro	Kevin Grace	2026-02-10
79	Nyabihu Branch	Nyabihu	Patrick David	2026-02-15
80	Jenda Branch	Nyabihu	Claude Alice	2026-02-20
81	Mukarange III Branch	Kayonza	Eric Diane	2026-03-01
82	Kibagabaga Branch	Gasabo	Grace Patrick	2026-03-05
83	Kagugu Branch	Gasabo	Alice Claude	2026-03-10
84	Kibagabaga East Branch	Gasabo	David Grace	2026-03-15
85	Rebero Branch	Kicukiro	Patrick Eric	2026-03-20
86	Gahanga Branch	Kicukiro	Diane Alice	2026-03-25
87	Nyarugunga Branch	Kicukiro	Claude Patrick	2026-04-01
88	Kagarama Branch	Kicukiro	Eric Uwase	2026-04-05
89	Kansanga Branch	Kicukiro	Grace Diane	2026-04-10
90	Nyamata East Branch	Bugesera	Alice Mugisha	2026-04-15
91	Equity Bank Kacyiru Branch	Gasabo	Jean Bosco Niyonzima	2025-01-15
92	Equity Bank Kimihurura Branch	Gasabo	Aline Mukamana	2025-02-10
93	Equity Bank Nyamirambo Branch	Nyarugenge	Patrick Habimana	2025-03-05
94	Equity Bank Biryogo Branch	Nyarugenge	Diane Uwase	2025-04-12
95	Equity Bank Gisozi Branch	Gasabo	Eric Mugisha	2025-05-20
96	Equity Bank Rebero Branch	Kicukiro	Alice Uwamahoro	2025-06-15
97	Equity Bank Kanzenze Branch	Bugesera	Samuel Nkurunziza	2025-07-10
98	Equity Bank Rwamagana Branch	Rwamagana	Grace Uwimana	2025-08-05
99	Equity Bank Musanze Branch	Musanze	Kevin Irakoze	2025-09-15
100	Equity Bank Rubavu Branch	Rubavu	Claude Bizimana	2025-10-20
\.


--
-- TOC entry 3545 (class 0 OID 41779)
-- Dependencies: 236
-- Data for Name: bank_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_card (card_id, account_id, card_number, card_type, issue_date) FROM stdin;
1	501	4589000000000501	Credit	2026-05-17
2	502	4589000000000502	Debit	2026-05-18
3	503	4589000000000503	Credit	2026-05-19
4	504	4589000000000504	Debit	2026-05-20
5	505	4589000000000505	Credit	2026-05-21
6	506	4589000000000506	Debit	2026-05-22
7	507	4589000000000507	Credit	2026-05-23
8	508	4589000000000508	Debit	2026-05-24
9	509	4589000000000509	Credit	2026-05-25
10	510	4589000000000510	Debit	2026-05-26
11	511	4589000000000511	Credit	2026-05-27
12	512	4589000000000512	Debit	2026-05-28
13	513	4589000000000513	Credit	2026-05-29
14	514	4589000000000514	Debit	2026-05-30
15	515	4589000000000515	Credit	2026-05-31
16	516	4589000000000516	Debit	2026-06-01
17	517	4589000000000517	Credit	2026-06-02
18	518	4589000000000518	Debit	2026-06-03
19	519	4589000000000519	Credit	2026-06-04
20	520	4589000000000520	Debit	2026-06-05
21	521	4589000000000521	Credit	2026-06-06
22	522	4589000000000522	Debit	2026-06-07
23	523	4589000000000523	Credit	2026-06-08
24	524	4589000000000524	Debit	2026-06-09
25	525	4589000000000525	Credit	2026-06-10
26	526	4589000000000526	Debit	2026-06-11
27	527	4589000000000527	Credit	2026-06-12
28	528	4589000000000528	Debit	2026-06-13
29	529	4589000000000529	Credit	2026-06-14
30	530	4589000000000530	Debit	2026-06-15
31	531	4589000000000531	Credit	2026-06-16
32	532	4589000000000532	Debit	2026-06-17
33	533	4589000000000533	Credit	2026-06-18
34	534	4589000000000534	Debit	2026-06-19
35	535	4589000000000535	Credit	2026-06-20
36	536	4589000000000536	Debit	2026-06-21
37	537	4589000000000537	Credit	2026-06-22
38	538	4589000000000538	Debit	2026-06-23
39	539	4589000000000539	Credit	2026-06-24
40	540	4589000000000540	Debit	2026-06-25
41	541	4589000000000541	Credit	2026-06-26
42	542	4589000000000542	Debit	2026-06-27
43	543	4589000000000543	Credit	2026-06-28
44	544	4589000000000544	Debit	2026-06-29
45	545	4589000000000545	Credit	2026-06-30
46	546	4589000000000546	Debit	2026-07-01
47	547	4589000000000547	Credit	2026-07-02
48	548	4589000000000548	Debit	2026-07-03
49	549	4589000000000549	Credit	2026-07-04
50	550	4589000000000550	Debit	2026-07-05
51	551	4589000000000551	Credit	2026-07-06
52	552	4589000000000552	Debit	2026-07-07
53	553	4589000000000553	Credit	2026-07-08
54	554	4589000000000554	Debit	2026-07-09
55	555	4589000000000555	Credit	2026-07-10
56	556	4589000000000556	Debit	2026-07-11
57	557	4589000000000557	Credit	2026-07-12
58	558	4589000000000558	Debit	2026-07-13
59	559	4589000000000559	Credit	2026-07-14
60	560	4589000000000560	Debit	2026-07-15
61	561	4589000000000561	Credit	2026-07-16
62	562	4589000000000562	Debit	2026-07-17
63	563	4589000000000563	Credit	2026-07-18
64	564	4589000000000564	Debit	2026-07-19
65	565	4589000000000565	Credit	2026-07-20
66	566	4589000000000566	Debit	2026-07-21
67	567	4589000000000567	Credit	2026-07-22
68	568	4589000000000568	Debit	2026-07-23
69	569	4589000000000569	Credit	2026-07-24
70	570	4589000000000570	Debit	2026-07-25
71	571	4589000000000571	Credit	2026-07-26
72	572	4589000000000572	Debit	2026-07-27
73	573	4589000000000573	Credit	2026-07-28
74	574	4589000000000574	Debit	2026-07-29
75	575	4589000000000575	Credit	2026-07-30
76	576	4589000000000576	Debit	2026-07-31
77	577	4589000000000577	Credit	2026-08-01
78	578	4589000000000578	Debit	2026-08-02
79	579	4589000000000579	Credit	2026-08-03
80	580	4589000000000580	Debit	2026-08-04
81	581	4589000000000581	Credit	2026-08-05
82	582	4589000000000582	Debit	2026-08-06
83	583	4589000000000583	Credit	2026-08-07
84	584	4589000000000584	Debit	2026-08-08
85	585	4589000000000585	Credit	2026-08-09
86	586	4589000000000586	Debit	2026-08-10
87	587	4589000000000587	Credit	2026-08-11
88	588	4589000000000588	Debit	2026-08-12
89	589	4589000000000589	Credit	2026-08-13
90	590	4589000000000590	Debit	2026-08-14
91	591	4589000000000591	Credit	2026-08-15
92	592	4589000000000592	Debit	2026-08-16
93	593	4589000000000593	Credit	2026-08-17
94	594	4589000000000594	Debit	2026-08-18
95	595	4589000000000595	Credit	2026-08-19
96	596	4589000000000596	Debit	2026-08-20
97	597	4589000000000597	Credit	2026-08-21
98	598	4589000000000598	Debit	2026-08-22
99	599	4589000000000599	Credit	2026-08-23
100	600	4589000000000600	Debit	2026-08-24
\.


--
-- TOC entry 3529 (class 0 OID 41642)
-- Dependencies: 220
-- Data for Name: bank_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_employee (employee_id, branch_id, employee_name, employee_position, employment_date) FROM stdin;
101	1	Jean Claude Habimana	Branch Manager	2018-01-15
102	2	Diane Uwase	Customer Service Officer	2019-02-10
103	3	Eric Mugisha	Loan Officer	2020-03-05
104	4	Alice Nishimwe	Account Officer	2021-04-12
105	5	Patrick Habimana	Cashier	2021-05-20
106	6	Chantal Mukamana	Credit Analyst	2022-01-10
107	7	Samuel Ndayisenga	Loan Officer	2022-02-15
108	8	Kevin Irakoze	Customer Service Officer	2022-03-20
109	9	Grace Uwimana	Cashier	2022-04-25
110	10	David Kamanzi	Branch Manager	2019-06-15
111	11	Aline Mutesi	Account Officer	2020-07-01
112	12	Claude Bizimana	Loan Officer	2021-08-10
113	13	Solange Uwimana	Customer Service Officer	2022-09-15
114	14	Eric Niyitegeka	Credit Analyst	2023-01-20
115	15	Olive Mukeshimana	Cashier	2023-02-25
116	16	Bosco Hakizimana	Loan Officer	2023-03-10
117	17	Fiona Uwera	Account Officer	2023-04-15
118	18	Alain Rukundo	Customer Service Officer	2023-05-20
119	19	Diane Kayitesi	Branch Manager	2023-06-25
120	20	Emmanuel Niyonzima	Loan Officer	2023-07-30
121	21	Grace Kayitesi	Cashier	2024-01-05
122	22	Hillary Keza	Account Officer	2024-02-10
123	23	Marie Uwitonze	Customer Service Officer	2024-03-15
124	24	Eric Habineza	Loan Officer	2024-04-20
125	25	Alice Uwamahoro	Credit Analyst	2024-05-25
126	26	Patrick Tuyisenge	Cashier	2024-06-10
127	27	Samuel Nkurunziza	Account Officer	2024-07-15
128	28	Bella Umutoni	Loan Officer	2024-08-20
129	29	Jean Pierre Habimana	Customer Service Officer	2024-09-25
130	30	Clarisse Mukamana	Branch Manager	2024-10-30
131	31	Kevin Twahirwa	Loan Officer	2020-01-05
132	32	Alice Uwase	Cashier	2020-02-10
133	33	Claude Irakoze	Account Officer	2020-03-15
134	34	Sarah Uwase	Customer Service Officer	2020-04-20
135	35	David Mugabo	Credit Analyst	2020-05-25
136	36	Eric Habimana	Loan Officer	2020-06-10
137	37	Grace Nishimwe	Account Officer	2020-07-15
138	38	Patrick Mugisha	Cashier	2020-08-20
139	39	Alice Keza	Customer Service Officer	2020-09-25
140	40	Diane Uwera	Loan Officer	2020-10-30
141	41	Jean Claude Nkurunziza	Branch Manager	2021-01-05
142	42	Samuel Eric	Account Officer	2021-02-10
143	43	Aline Grace	Loan Officer	2021-03-15
144	44	Patrick Claude	Cashier	2021-04-20
145	45	Alice Diane	Customer Service Officer	2021-05-25
146	46	Eric David	Credit Analyst	2021-06-10
147	47	Grace Alice	Loan Officer	2021-07-15
148	48	Kevin Patrick	Account Officer	2021-08-20
149	49	Chantal Uwase	Cashier	2021-09-25
150	50	David Eric	Customer Service Officer	2021-10-30
151	51	Alice Mutesi	Loan Officer	2022-01-05
152	52	Claude Mugisha	Account Officer	2022-02-10
153	53	Diane Uwase	Cashier	2022-03-15
154	54	Eric Habimana	Credit Analyst	2022-04-20
155	55	Patrick Uwimana	Loan Officer	2022-05-25
156	56	Grace Uwase	Customer Service Officer	2022-06-10
157	57	Kevin Mugisha	Account Officer	2022-07-15
158	58	Alice Patrick	Cashier	2022-08-20
159	59	David Uwase	Loan Officer	2022-09-25
160	60	Chantal Eric	Branch Manager	2022-10-30
161	61	Samuel Alice	Customer Service Officer	2023-01-05
162	62	Patrick David	Loan Officer	2023-02-10
163	63	Grace Claude	Account Officer	2023-03-15
164	64	Alice Uwimana	Cashier	2023-04-20
165	65	Eric Mugabo	Credit Analyst	2023-05-25
166	66	Diane Keza	Loan Officer	2023-06-10
167	67	Kevin Uwase	Account Officer	2023-07-15
168	68	Patrick Alice	Customer Service Officer	2023-08-20
169	69	Claude Diane	Cashier	2023-09-25
170	70	Eric Grace	Branch Manager	2023-10-30
171	71	Alice David	Loan Officer	2024-01-05
172	72	Patrick Uwase	Account Officer	2024-02-10
173	73	Grace Mugisha	Cashier	2024-03-15
174	74	David Alice	Customer Service Officer	2024-04-20
175	75	Eric Claude	Credit Analyst	2024-05-25
176	76	Diane Patrick	Loan Officer	2024-06-10
177	77	Alice Eric	Account Officer	2024-07-15
178	78	Kevin Grace	Cashier	2024-08-20
179	79	Patrick David	Customer Service Officer	2024-09-25
180	80	Claude Alice	Branch Manager	2024-10-30
181	81	Eric Diane	Loan Officer	2025-01-05
182	82	Grace Patrick	Account Officer	2025-02-10
183	83	Alice Claude	Cashier	2025-03-15
184	84	David Grace	Customer Service Officer	2025-04-20
185	85	Patrick Eric	Credit Analyst	2025-05-25
186	86	Diane Alice	Loan Officer	2025-06-10
187	87	Claude Patrick	Account Officer	2025-07-15
188	88	Eric Uwase	Cashier	2025-08-20
189	89	Grace Diane	Customer Service Officer	2025-09-25
190	90	Alice Mugisha	Loan Officer	2025-10-30
191	91	Jean Bosco	Branch Manager	2026-01-05
192	92	Marie Claire	Account Officer	2026-02-10
193	93	Emmanuel Patrick	Loan Officer	2026-03-15
194	94	Sarah Diane	Cashier	2026-04-20
195	95	Kevin Alice	Customer Service Officer	2026-05-25
196	96	Claude Eric	Credit Analyst	2026-06-10
197	97	Grace Alice	Loan Officer	2026-07-15
198	98	David Patrick	Account Officer	2026-08-20
199	99	Alice Grace	Cashier	2026-09-25
200	100	Patrick Kevin	Customer Service Officer	2026-10-30
\.


--
-- TOC entry 3549 (class 0 OID 41813)
-- Dependencies: 240
-- Data for Name: beneficiary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beneficiary (beneficiary_id, customer_id, beneficiary_name, beneficiary_account, registration_date) FROM stdin;
1	1	Beneficiary 1	EQB000000000001	2025-03-02
2	2	Beneficiary 2	EQB000000000002	2025-03-03
3	3	Beneficiary 3	EQB000000000003	2025-03-04
4	4	Beneficiary 4	EQB000000000004	2025-03-05
5	5	Beneficiary 5	EQB000000000005	2025-03-06
6	6	Beneficiary 6	EQB000000000006	2025-03-07
7	7	Beneficiary 7	EQB000000000007	2025-03-08
8	8	Beneficiary 8	EQB000000000008	2025-03-09
9	9	Beneficiary 9	EQB000000000009	2025-03-10
10	10	Beneficiary 10	EQB000000000010	2025-03-11
11	11	Beneficiary 11	EQB000000000011	2025-03-12
12	12	Beneficiary 12	EQB000000000012	2025-03-13
13	13	Beneficiary 13	EQB000000000013	2025-03-14
14	14	Beneficiary 14	EQB000000000014	2025-03-15
15	15	Beneficiary 15	EQB000000000015	2025-03-16
16	16	Beneficiary 16	EQB000000000016	2025-03-17
17	17	Beneficiary 17	EQB000000000017	2025-03-18
18	18	Beneficiary 18	EQB000000000018	2025-03-19
19	19	Beneficiary 19	EQB000000000019	2025-03-20
20	20	Beneficiary 20	EQB000000000020	2025-03-21
21	21	Beneficiary 21	EQB000000000021	2025-03-22
22	22	Beneficiary 22	EQB000000000022	2025-03-23
23	23	Beneficiary 23	EQB000000000023	2025-03-24
24	24	Beneficiary 24	EQB000000000024	2025-03-25
25	25	Beneficiary 25	EQB000000000025	2025-03-26
26	26	Beneficiary 26	EQB000000000026	2025-03-27
27	27	Beneficiary 27	EQB000000000027	2025-03-28
28	28	Beneficiary 28	EQB000000000028	2025-03-29
29	29	Beneficiary 29	EQB000000000029	2025-03-30
30	30	Beneficiary 30	EQB000000000030	2025-03-31
31	31	Beneficiary 31	EQB000000000031	2025-04-01
32	32	Beneficiary 32	EQB000000000032	2025-04-02
33	33	Beneficiary 33	EQB000000000033	2025-04-03
34	34	Beneficiary 34	EQB000000000034	2025-04-04
35	35	Beneficiary 35	EQB000000000035	2025-04-05
36	36	Beneficiary 36	EQB000000000036	2025-04-06
37	37	Beneficiary 37	EQB000000000037	2025-04-07
38	38	Beneficiary 38	EQB000000000038	2025-04-08
39	39	Beneficiary 39	EQB000000000039	2025-04-09
40	40	Beneficiary 40	EQB000000000040	2025-04-10
41	41	Beneficiary 41	EQB000000000041	2025-04-11
42	42	Beneficiary 42	EQB000000000042	2025-04-12
43	43	Beneficiary 43	EQB000000000043	2025-04-13
44	44	Beneficiary 44	EQB000000000044	2025-04-14
45	45	Beneficiary 45	EQB000000000045	2025-04-15
46	46	Beneficiary 46	EQB000000000046	2025-04-16
47	47	Beneficiary 47	EQB000000000047	2025-04-17
48	48	Beneficiary 48	EQB000000000048	2025-04-18
49	49	Beneficiary 49	EQB000000000049	2025-04-19
50	50	Beneficiary 50	EQB000000000050	2025-04-20
51	51	Beneficiary 51	EQB000000000051	2025-04-21
52	52	Beneficiary 52	EQB000000000052	2025-04-22
53	53	Beneficiary 53	EQB000000000053	2025-04-23
54	54	Beneficiary 54	EQB000000000054	2025-04-24
55	55	Beneficiary 55	EQB000000000055	2025-04-25
56	56	Beneficiary 56	EQB000000000056	2025-04-26
57	57	Beneficiary 57	EQB000000000057	2025-04-27
58	58	Beneficiary 58	EQB000000000058	2025-04-28
59	59	Beneficiary 59	EQB000000000059	2025-04-29
60	60	Beneficiary 60	EQB000000000060	2025-04-30
61	61	Beneficiary 61	EQB000000000061	2025-05-01
62	62	Beneficiary 62	EQB000000000062	2025-05-02
63	63	Beneficiary 63	EQB000000000063	2025-05-03
64	64	Beneficiary 64	EQB000000000064	2025-05-04
65	65	Beneficiary 65	EQB000000000065	2025-05-05
66	66	Beneficiary 66	EQB000000000066	2025-05-06
67	67	Beneficiary 67	EQB000000000067	2025-05-07
68	68	Beneficiary 68	EQB000000000068	2025-05-08
69	69	Beneficiary 69	EQB000000000069	2025-05-09
70	70	Beneficiary 70	EQB000000000070	2025-05-10
71	71	Beneficiary 71	EQB000000000071	2025-05-11
72	72	Beneficiary 72	EQB000000000072	2025-05-12
73	73	Beneficiary 73	EQB000000000073	2025-05-13
74	74	Beneficiary 74	EQB000000000074	2025-05-14
75	75	Beneficiary 75	EQB000000000075	2025-05-15
76	76	Beneficiary 76	EQB000000000076	2025-05-16
77	77	Beneficiary 77	EQB000000000077	2025-05-17
78	78	Beneficiary 78	EQB000000000078	2025-05-18
79	79	Beneficiary 79	EQB000000000079	2025-05-19
80	80	Beneficiary 80	EQB000000000080	2025-05-20
81	81	Beneficiary 81	EQB000000000081	2025-05-21
82	82	Beneficiary 82	EQB000000000082	2025-05-22
83	83	Beneficiary 83	EQB000000000083	2025-05-23
84	84	Beneficiary 84	EQB000000000084	2025-05-24
85	85	Beneficiary 85	EQB000000000085	2025-05-25
86	86	Beneficiary 86	EQB000000000086	2025-05-26
87	87	Beneficiary 87	EQB000000000087	2025-05-27
88	88	Beneficiary 88	EQB000000000088	2025-05-28
89	89	Beneficiary 89	EQB000000000089	2025-05-29
90	90	Beneficiary 90	EQB000000000090	2025-05-30
91	91	Beneficiary 91	EQB000000000091	2025-05-31
92	92	Beneficiary 92	EQB000000000092	2025-06-01
93	93	Beneficiary 93	EQB000000000093	2025-06-02
94	94	Beneficiary 94	EQB000000000094	2025-06-03
95	95	Beneficiary 95	EQB000000000095	2025-06-04
96	96	Beneficiary 96	EQB000000000096	2025-06-05
97	97	Beneficiary 97	EQB000000000097	2025-06-06
98	98	Beneficiary 98	EQB000000000098	2025-06-07
99	99	Beneficiary 99	EQB000000000099	2025-06-08
100	100	Beneficiary 100	EQB000000000100	2025-06-09
\.


--
-- TOC entry 3557 (class 0 OID 41879)
-- Dependencies: 248
-- Data for Name: branch_target; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch_target (target_id, branch_id, account_type_id, target_year, target_amount) FROM stdin;
1	1	1	2026	6000000.00
2	2	2	2026	7000000.00
3	3	3	2026	8000000.00
4	4	4	2026	9000000.00
5	5	5	2026	10000000.00
6	6	6	2026	11000000.00
7	7	7	2026	12000000.00
8	8	8	2026	13000000.00
9	9	9	2026	14000000.00
10	10	10	2026	15000000.00
11	11	11	2026	16000000.00
12	12	12	2026	17000000.00
13	13	13	2026	18000000.00
14	14	14	2026	19000000.00
15	15	15	2026	20000000.00
16	16	16	2026	21000000.00
17	17	17	2026	22000000.00
18	18	18	2026	23000000.00
19	19	19	2026	24000000.00
20	20	20	2026	25000000.00
21	21	21	2026	26000000.00
22	22	22	2026	27000000.00
23	23	23	2026	28000000.00
24	24	24	2026	29000000.00
25	25	25	2026	30000000.00
26	26	26	2026	31000000.00
27	27	27	2026	32000000.00
28	28	28	2026	33000000.00
29	29	29	2026	34000000.00
30	30	30	2026	35000000.00
31	31	31	2026	36000000.00
32	32	32	2026	37000000.00
33	33	33	2026	38000000.00
34	34	34	2026	39000000.00
35	35	35	2026	40000000.00
36	36	36	2026	41000000.00
37	37	37	2026	42000000.00
38	38	38	2026	43000000.00
39	39	39	2026	44000000.00
40	40	40	2026	45000000.00
41	41	41	2026	46000000.00
42	42	42	2026	47000000.00
43	43	43	2026	48000000.00
44	44	44	2026	49000000.00
45	45	45	2026	50000000.00
46	46	46	2026	51000000.00
47	47	47	2026	52000000.00
48	48	48	2026	53000000.00
49	49	49	2026	54000000.00
50	50	50	2026	55000000.00
51	51	51	2026	56000000.00
52	52	52	2026	57000000.00
53	53	53	2026	58000000.00
54	54	54	2026	59000000.00
55	55	55	2026	60000000.00
56	56	56	2026	61000000.00
57	57	57	2026	62000000.00
58	58	58	2026	63000000.00
59	59	59	2026	64000000.00
60	60	60	2026	65000000.00
61	61	61	2026	66000000.00
62	62	62	2026	67000000.00
63	63	63	2026	68000000.00
64	64	64	2026	69000000.00
65	65	65	2026	70000000.00
66	66	66	2026	71000000.00
67	67	67	2026	72000000.00
68	68	68	2026	73000000.00
69	69	69	2026	74000000.00
70	70	70	2026	75000000.00
71	71	71	2026	76000000.00
72	72	72	2026	77000000.00
73	73	73	2026	78000000.00
74	74	74	2026	79000000.00
75	75	75	2026	80000000.00
76	76	76	2026	81000000.00
77	77	77	2026	82000000.00
78	78	78	2026	83000000.00
79	79	79	2026	84000000.00
80	80	80	2026	85000000.00
81	81	81	2026	86000000.00
82	82	82	2026	87000000.00
83	83	83	2026	88000000.00
84	84	84	2026	89000000.00
85	85	85	2026	90000000.00
86	86	86	2026	91000000.00
87	87	87	2026	92000000.00
88	88	88	2026	93000000.00
89	89	89	2026	94000000.00
90	90	90	2026	95000000.00
91	91	91	2026	96000000.00
92	92	92	2026	97000000.00
93	93	109	2026	98000000.00
94	94	110	2026	99000000.00
95	95	111	2026	100000000.00
96	96	112	2026	101000000.00
97	97	113	2026	102000000.00
98	98	114	2026	103000000.00
99	99	115	2026	104000000.00
100	100	116	2026	105000000.00
\.


--
-- TOC entry 3543 (class 0 OID 41766)
-- Dependencies: 234
-- Data for Name: collateral; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collateral (collateral_id, loan_id, collateral_type, collateral_value, registration_date) FROM stdin;
1	101	House Property	900000.00	2025-04-12
2	102	Land Title	1050000.00	2025-04-13
3	103	Vehicle	1200000.00	2025-04-14
4	104	House Property	1350000.00	2025-04-15
5	105	Land Title	1500000.00	2025-04-16
6	106	Vehicle	1650000.00	2025-04-17
7	107	House Property	1800000.00	2025-04-18
8	108	Land Title	1950000.00	2025-04-19
9	109	Vehicle	2100000.00	2025-04-20
10	110	House Property	2250000.00	2025-04-21
11	111	Land Title	2400000.00	2025-04-22
12	112	Vehicle	2550000.00	2025-04-23
13	113	House Property	2700000.00	2025-04-24
14	114	Land Title	2850000.00	2025-04-25
15	115	Vehicle	3000000.00	2025-04-26
16	116	House Property	3150000.00	2025-04-27
17	117	Land Title	3300000.00	2025-04-28
18	118	Vehicle	3450000.00	2025-04-29
19	119	House Property	3600000.00	2025-04-30
20	120	Land Title	3750000.00	2025-05-01
21	121	Vehicle	3900000.00	2025-05-02
22	122	House Property	4050000.00	2025-05-03
23	123	Land Title	4200000.00	2025-05-04
24	124	Vehicle	4350000.00	2025-05-05
25	125	House Property	4500000.00	2025-05-06
26	126	Land Title	4650000.00	2025-05-07
27	127	Vehicle	4800000.00	2025-05-08
28	128	House Property	4950000.00	2025-05-09
29	129	Land Title	5100000.00	2025-05-10
30	130	Vehicle	5250000.00	2025-05-11
31	131	House Property	5400000.00	2025-05-12
32	132	Land Title	5550000.00	2025-05-13
33	133	Vehicle	5700000.00	2025-05-14
34	134	House Property	5850000.00	2025-05-15
35	135	Land Title	6000000.00	2025-05-16
36	136	Vehicle	6150000.00	2025-05-17
37	137	House Property	6300000.00	2025-05-18
38	138	Land Title	6450000.00	2025-05-19
39	139	Vehicle	6600000.00	2025-05-20
40	140	House Property	6750000.00	2025-05-21
41	141	Land Title	6900000.00	2025-05-22
42	142	Vehicle	7050000.00	2025-05-23
43	143	House Property	7200000.00	2025-05-24
44	144	Land Title	7350000.00	2025-05-25
45	145	Vehicle	7500000.00	2025-05-26
46	146	House Property	7650000.00	2025-05-27
47	147	Land Title	7800000.00	2025-05-28
48	148	Vehicle	7950000.00	2025-05-29
49	149	House Property	8100000.00	2025-05-30
50	150	Land Title	8250000.00	2025-05-31
51	151	Vehicle	8400000.00	2025-06-01
52	152	House Property	8550000.00	2025-06-02
53	153	Land Title	8700000.00	2025-06-03
54	154	Vehicle	8850000.00	2025-06-04
55	155	House Property	9000000.00	2025-06-05
56	156	Land Title	9150000.00	2025-06-06
57	157	Vehicle	9300000.00	2025-06-07
58	158	House Property	9450000.00	2025-06-08
59	159	Land Title	9600000.00	2025-06-09
60	160	Vehicle	9750000.00	2025-06-10
61	161	House Property	9900000.00	2025-06-11
62	162	Land Title	10050000.00	2025-06-12
63	163	Vehicle	10200000.00	2025-06-13
64	164	House Property	10350000.00	2025-06-14
65	165	Land Title	10500000.00	2025-06-15
66	166	Vehicle	10650000.00	2025-06-16
67	167	House Property	10800000.00	2025-06-17
68	168	Land Title	10950000.00	2025-06-18
69	169	Vehicle	11100000.00	2025-06-19
70	170	House Property	11250000.00	2025-06-20
71	171	Land Title	11400000.00	2025-06-21
72	172	Vehicle	11550000.00	2025-06-22
73	173	House Property	11700000.00	2025-06-23
74	174	Land Title	11850000.00	2025-06-24
75	175	Vehicle	12000000.00	2025-06-25
76	176	House Property	12150000.00	2025-06-26
77	177	Land Title	12300000.00	2025-06-27
78	178	Vehicle	12450000.00	2025-06-28
79	179	House Property	12600000.00	2025-06-29
80	180	Land Title	12750000.00	2025-06-30
81	181	Vehicle	12900000.00	2025-07-01
82	182	House Property	13050000.00	2025-07-02
83	183	Land Title	13200000.00	2025-07-03
84	184	Vehicle	13350000.00	2025-07-04
85	185	House Property	13500000.00	2025-07-05
86	186	Land Title	13650000.00	2025-07-06
87	187	Vehicle	13800000.00	2025-07-07
88	188	House Property	13950000.00	2025-07-08
89	189	Land Title	14100000.00	2025-07-09
90	190	Vehicle	14250000.00	2025-07-10
91	191	House Property	14400000.00	2025-07-11
92	192	Land Title	14550000.00	2025-07-12
93	193	Vehicle	14700000.00	2025-07-13
94	194	House Property	14850000.00	2025-07-14
95	195	Land Title	15000000.00	2025-07-15
\.


--
-- TOC entry 3525 (class 0 OID 41621)
-- Dependencies: 216
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (currency_id, currency_code, currency_name, exchange_rate, effective_date) FROM stdin;
1	RWF	Rwandan Franc	1.00	2024-01-01
2	USD	US Dollar	1300.00	2024-01-01
3	EUR	Euro	1400.00	2024-01-01
4	GBP	British Pound	1650.00	2024-01-01
5	KES	Kenyan Shilling	10.20	2024-01-01
6	UGX	Ugandan Shilling	0.35	2024-01-01
7	TZS	Tanzanian Shilling	0.50	2024-01-01
8	ZAR	South African Rand	70.00	2024-01-01
9	CNY	Chinese Yuan	180.00	2024-01-01
10	JPY	Japanese Yen	9.00	2024-01-01
11	RWF_JAN	Rwandan Franc Jan Rate	1.00	2024-02-01
12	USD_FEB	US Dollar Feb Rate	1315.00	2024-02-01
13	EUR_FEB	Euro Feb Rate	1420.00	2024-02-01
14	GBP_FEB	British Pound Feb Rate	1670.00	2024-02-01
15	KES_FEB	Kenyan Shilling Feb Rate	10.30	2024-02-01
16	RWF_MAR	Rwandan Franc March Rate	1.00	2024-03-01
17	USD_MAR	US Dollar March Rate	1325.00	2024-03-01
18	EUR_MAR	Euro March Rate	1435.00	2024-03-01
19	GBP_MAR	British Pound March Rate	1680.00	2024-03-01
20	UGX_MAR	Ugandan Shilling March Rate	0.36	2024-03-01
21	RWF_APR	Rwandan Franc April Rate	1.00	2024-04-01
22	USD_APR	US Dollar April Rate	1340.00	2024-04-01
23	EUR_APR	Euro April Rate	1450.00	2024-04-01
24	GBP_APR	British Pound April Rate	1700.00	2024-04-01
25	KES_APR	Kenyan Shilling April Rate	10.40	2024-04-01
26	RWF_MAY	Rwandan Franc May Rate	1.00	2024-05-01
27	USD_MAY	US Dollar May Rate	1350.00	2024-05-01
28	EUR_MAY	Euro May Rate	1465.00	2024-05-01
29	GBP_MAY	British Pound May Rate	1720.00	2024-05-01
30	TZS_MAY	Tanzanian Shilling May Rate	0.52	2024-05-01
31	RWF_JUN	Rwandan Franc June Rate	1.00	2024-06-01
32	USD_JUN	US Dollar June Rate	1360.00	2024-06-01
33	EUR_JUN	Euro June Rate	1480.00	2024-06-01
34	GBP_JUN	British Pound June Rate	1735.00	2024-06-01
35	ZAR_JUN	South African Rand June Rate	72.00	2024-06-01
36	RWF_JUL	Rwandan Franc July Rate	1.00	2024-07-01
37	USD_JUL	US Dollar July Rate	1375.00	2024-07-01
38	EUR_JUL	Euro July Rate	1495.00	2024-07-01
39	GBP_JUL	British Pound July Rate	1750.00	2024-07-01
40	CNY_JUL	Chinese Yuan July Rate	185.00	2024-07-01
41	RWF_AUG	Rwandan Franc August Rate	1.00	2024-08-01
42	USD_AUG	US Dollar August Rate	1385.00	2024-08-01
43	EUR_AUG	Euro August Rate	1510.00	2024-08-01
44	GBP_AUG	British Pound August Rate	1770.00	2024-08-01
45	KES_AUG	Kenyan Shilling August Rate	10.60	2024-08-01
46	RWF_SEP	Rwandan Franc September Rate	1.00	2024-09-01
47	USD_SEP	US Dollar September Rate	1395.00	2024-09-01
48	EUR_SEP	Euro September Rate	1525.00	2024-09-01
49	GBP_SEP	British Pound September Rate	1790.00	2024-09-01
50	UGX_SEP	Ugandan Shilling September Rate	0.37	2024-09-01
51	RWF_OCT	Rwandan Franc October Rate	1.00	2024-10-01
52	USD_OCT	US Dollar October Rate	1405.00	2024-10-01
53	EUR_OCT	Euro October Rate	1540.00	2024-10-01
54	GBP_OCT	British Pound October Rate	1800.00	2024-10-01
55	TZS_OCT	Tanzanian Shilling October Rate	0.54	2024-10-01
56	RWF_NOV	Rwandan Franc November Rate	1.00	2024-11-01
57	USD_NOV	US Dollar November Rate	1415.00	2024-11-01
58	EUR_NOV	Euro November Rate	1555.00	2024-11-01
59	GBP_NOV	British Pound November Rate	1820.00	2024-11-01
60	KES_NOV	Kenyan Shilling November Rate	10.70	2024-11-01
61	RWF_DEC	Rwandan Franc December Rate	1.00	2024-12-01
62	USD_DEC	US Dollar December Rate	1425.00	2024-12-01
63	EUR_DEC	Euro December Rate	1570.00	2024-12-01
64	GBP_DEC	British Pound December Rate	1840.00	2024-12-01
65	ZAR_DEC	South African Rand December Rate	75.00	2024-12-01
66	USD_2025	US Dollar 2025	1450.00	2025-01-01
67	EUR_2025	Euro 2025	1600.00	2025-01-01
68	GBP_2025	British Pound 2025	1870.00	2025-01-01
69	KES_2025	Kenyan Shilling 2025	11.00	2025-01-01
70	UGX_2025	Ugandan Shilling 2025	0.38	2025-01-01
71	USD_Q2_2025	US Dollar Q2 2025	1465.00	2025-04-01
72	EUR_Q2_2025	Euro Q2 2025	1620.00	2025-04-01
73	GBP_Q2_2025	British Pound Q2 2025	1900.00	2025-04-01
74	KES_Q2_2025	Kenyan Shilling Q2 2025	11.20	2025-04-01
75	CNY_Q2_2025	Chinese Yuan Q2 2025	190.00	2025-04-01
76	USD_Q3_2025	US Dollar Q3 2025	1480.00	2025-07-01
77	EUR_Q3_2025	Euro Q3 2025	1640.00	2025-07-01
78	GBP_Q3_2025	British Pound Q3 2025	1930.00	2025-07-01
79	KES_Q3_2025	Kenyan Shilling Q3 2025	11.40	2025-07-01
80	ZAR_Q3_2025	Rand Q3 2025	78.00	2025-07-01
81	USD_Q4_2025	US Dollar Q4 2025	1500.00	2025-10-01
82	EUR_Q4_2025	Euro Q4 2025	1660.00	2025-10-01
83	GBP_Q4_2025	British Pound Q4 2025	1950.00	2025-10-01
84	KES_Q4_2025	Kenyan Shilling Q4 2025	11.50	2025-10-01
85	JPY_2025	Japanese Yen 2025	10.00	2025-10-01
86	USD_2026	US Dollar 2026	1520.00	2026-01-01
87	EUR_2026	Euro 2026	1680.00	2026-01-01
88	GBP_2026	British Pound 2026	1980.00	2026-01-01
89	KES_2026	Kenyan Shilling 2026	11.70	2026-01-01
90	CNY_2026	Chinese Yuan 2026	200.00	2026-01-01
95	AED26	UAE Dirham 2026	380.50	2026-01-01
96	SAR26	Saudi Riyal 2026	390.20	2026-01-01
97	INR26	Indian Rupee 2026	14.20	2026-01-01
98	ZAR26	South African Rand 2026	80.50	2026-01-01
99	NGN26	Nigerian Naira 2026	1.20	2026-01-01
100	TZS26	Tanzanian Shilling 2026	0.35	2026-01-01
101	UGX26	Ugandan Shilling 2026	0.25	2026-01-01
102	BIF26	Burundian Franc 2026	0.15	2026-01-01
103	CAD26	Canadian Dollar 2026	900.00	2026-01-01
104	AUD26	Australian Dollar 2026	850.00	2026-01-01
\.


--
-- TOC entry 3519 (class 0 OID 41590)
-- Dependencies: 210
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, national_id, customer_name, customer_type, registration_date) FROM stdin;
1	1199080012345671	Keza Hillary	Individual	2024-01-15
2	1199080012345672	Uwase Diane	Individual	2024-02-10
3	1199080012345673	Mugisha Eric	Individual	2024-03-05
4	1199080012345674	Irakoze Jean Claude	Individual	2024-03-20
5	1199080012345675	Mukamana Chantal	Individual	2024-04-12
6	1199080012345676	Habimana Patrick	Individual	2024-05-01
7	1199080012345677	Nishimwe Alice	Individual	2024-05-15
8	1199080012345678	Niyonzima Emmanuel	Individual	2024-06-02
9	1199080012345679	Umutoni Grace	Individual	2024-06-18
10	1199080012345680	Kayitesi Diane	Individual	2024-07-01
11	1199080012345681	Rwanda Tech Solutions Ltd	Company	2024-01-20
12	1199080012345682	Kigali Business Group Ltd	Company	2024-02-15
13	1199080012345683	Imanzi Construction Ltd	Company	2024-03-10
14	1199080012345684	Bright Future Ltd	Company	2024-04-05
15	1199080012345685	Green Africa Enterprise	Company	2024-05-12
16	1199080012345686	Mutesi Aline	Individual	2024-07-10
17	1199080012345687	Bizimana Claude	Individual	2024-07-15
18	1199080012345688	Uwimana Solange	Individual	2024-07-20
19	1199080012345689	Twagirayezu Kevin	Individual	2024-08-01
20	1199080012345690	Mukeshimana Olive	Individual	2024-08-10
21	1199080012345691	Hakizimana Bosco	Individual	2024-08-15
22	1199080012345692	Nyirangarama Alice	Individual	2024-08-20
23	1199080012345693	Manzi Fabrice	Individual	2024-09-01
24	1199080012345694	Uwase Claudine	Individual	2024-09-05
25	1199080012345695	Ndayisenga Samuel	Individual	2024-09-10
26	1199080012345696	Kamanzi David	Individual	2024-09-15
27	1199080012345697	Mukamana Esther	Individual	2024-09-20
28	1199080012345698	Rukundo Alain	Individual	2024-10-01
29	1199080012345699	Uwera Fiona	Individual	2024-10-05
30	1199080012345700	Munyaneza Patrick	Individual	2024-10-10
31	1199080012345701	Alpha Trading Ltd	Company	2024-10-15
32	1199080012345702	Kigali Foods Ltd	Company	2024-10-20
33	1199080012345703	Smart Agriculture Ltd	Company	2024-11-01
34	1199080012345704	Future Transport Ltd	Company	2024-11-05
35	1199080012345705	East Africa Supplies Ltd	Company	2024-11-10
36	1199080012345706	Uwitonze Marie	Individual	2024-11-15
37	1199080012345707	Nsengiyumva Eric	Individual	2024-11-20
38	1199080012345708	Mugabo Alex	Individual	2024-12-01
39	1199080012345709	Ishimwe Bella	Individual	2024-12-05
40	1199080012345710	Uwase Liliane	Individual	2024-12-10
41	1199080012345711	Jean Pierre Habineza	Individual	2025-01-05
42	1199080012345712	Clarisse Mukamana	Individual	2025-01-10
43	1199080012345713	Samuel Nkurunziza	Individual	2025-01-15
44	1199080012345714	Alice Uwamahoro	Individual	2025-01-20
45	1199080012345715	Patrick Tuyisenge	Individual	2025-02-01
46	1199080012345716	Diane Mukamana	Individual	2025-02-05
47	1199080012345717	Eric Niyitegeka	Individual	2025-02-10
48	1199080012345718	Grace Uwimana	Individual	2025-02-15
49	1199080012345719	Kevin Irakoze	Individual	2025-02-20
50	1199080012345720	Alice Nishimwe	Individual	2025-03-01
51	1199080012345721	Kigali Medical Center Ltd	Company	2025-03-05
52	1199080012345722	Vision Developers Ltd	Company	2025-03-10
53	1199080012345723	Rwanda Logistics Ltd	Company	2025-03-15
54	1199080012345724	Prime Hotels Rwanda	Company	2025-03-20
55	1199080012345725	Lake View Resort Ltd	Company	2025-04-01
56	1199080012345726	Mugisha Emmanuel	Individual	2025-04-05
57	1199080012345727	Umutoni Bella	Individual	2025-04-10
58	1199080012345728	Habimana Eric	Individual	2025-04-15
59	1199080012345729	Uwase Alice	Individual	2025-04-20
60	1199080012345730	Niyonzima Claude	Individual	2025-05-01
61	1199080012345731	Mutesi Diane	Individual	2025-05-05
62	1199080012345732	Twahirwa Kevin	Individual	2025-05-10
63	1199080012345733	Uwera Alice	Individual	2025-05-15
64	1199080012345734	Rukundo David	Individual	2025-05-20
65	1199080012345735	Mukamana Aline	Individual	2025-06-01
66	1199080012345736	Niyigena Claude	Individual	2025-06-05
67	1199080012345737	Munyakazi Patrick	Individual	2025-06-10
68	1199080012345738	Iradukunda Grace	Individual	2025-06-15
69	1199080012345739	Uwimana Eric	Individual	2025-06-20
70	1199080012345740	Mugenzi Alice	Individual	2025-07-01
71	1199080012345741	Digital Rwanda Ltd	Company	2025-07-05
72	1199080012345742	Agro Solutions Ltd	Company	2025-07-10
73	1199080012345743	Safe Transport Ltd	Company	2025-07-15
74	1199080012345744	Kigali Fashion Ltd	Company	2025-07-20
75	1199080012345745	Modern Builders Ltd	Company	2025-08-01
76	1199080012345746	Uwase Sarah	Individual	2025-08-05
77	1199080012345747	Mugabo Jean	Individual	2025-08-10
78	1199080012345748	Nshimiyimana Eric	Individual	2025-08-15
79	1199080012345749	Uwamariya Alice	Individual	2025-08-20
80	1199080012345750	Habiyaremye David	Individual	2025-09-01
81	1199080012345751	Rwanda Energy Ltd	Company	2025-09-05
82	1199080012345752	Kivu Investments Ltd	Company	2025-09-10
83	1199080012345753	Hope Enterprises Ltd	Company	2025-09-15
84	1199080012345754	Golden Farms Ltd	Company	2025-09-20
85	1199080012345755	Mountain View Ltd	Company	2025-10-01
86	1199080012345756	Chantal Uwase	Individual	2025-10-05
87	1199080012345757	Patrick Mugisha	Individual	2025-10-10
88	1199080012345758	Diane Uwera	Individual	2025-10-15
89	1199080012345759	Eric Habimana	Individual	2025-10-20
90	1199080012345760	Alice Keza	Individual	2025-11-01
91	119908000101001	Patrick Niyonzima	Individual	2025-01-10
92	119908000101002	Marie Claire Uwimana	Individual	2025-02-15
93	119908000101003	Eric Habineza	Individual	2025-03-20
94	119908000101004	Aline Mukamana	Individual	2025-04-25
95	119908000101005	David Tuyisenge	Individual	2025-05-30
96	119908000101006	Grace Uwera	Individual	2025-06-05
97	119908000101007	Claude Nkurunziza	Company	2025-07-10
98	119908000101008	Alice Mutesi	Individual	2025-08-15
99	119908000101009	Samuel Hakizimana	Company	2025-09-20
100	119908000101010	Diane Irakoze	Individual	2025-10-25
\.


--
-- TOC entry 3555 (class 0 OID 41861)
-- Dependencies: 246
-- Data for Name: customer_complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_complaint (complaint_id, customer_id, employee_id, complaint_date, complaint_status) FROM stdin;
1	1	101	2025-04-02	Pending
2	2	102	2025-04-03	In Progress
3	3	103	2025-04-04	Resolved
4	4	104	2025-04-05	Pending
5	5	105	2025-04-06	In Progress
6	6	106	2025-04-07	Resolved
7	7	107	2025-04-08	Pending
8	8	108	2025-04-09	In Progress
9	9	109	2025-04-10	Resolved
10	10	110	2025-04-11	Pending
11	11	111	2025-04-12	In Progress
12	12	112	2025-04-13	Resolved
13	13	113	2025-04-14	Pending
14	14	114	2025-04-15	In Progress
15	15	115	2025-04-16	Resolved
16	16	116	2025-04-17	Pending
17	17	117	2025-04-18	In Progress
18	18	118	2025-04-19	Resolved
19	19	119	2025-04-20	Pending
20	20	120	2025-04-21	In Progress
21	21	121	2025-04-22	Resolved
22	22	122	2025-04-23	Pending
23	23	123	2025-04-24	In Progress
24	24	124	2025-04-25	Resolved
25	25	125	2025-04-26	Pending
26	26	126	2025-04-27	In Progress
27	27	127	2025-04-28	Resolved
28	28	128	2025-04-29	Pending
29	29	129	2025-04-30	In Progress
30	30	130	2025-05-01	Resolved
31	31	131	2025-05-02	Pending
32	32	132	2025-05-03	In Progress
33	33	133	2025-05-04	Resolved
34	34	134	2025-05-05	Pending
35	35	135	2025-05-06	In Progress
36	36	136	2025-05-07	Resolved
37	37	137	2025-05-08	Pending
38	38	138	2025-05-09	In Progress
39	39	139	2025-05-10	Resolved
40	40	140	2025-05-11	Pending
41	41	141	2025-05-12	In Progress
42	42	142	2025-05-13	Resolved
43	43	143	2025-05-14	Pending
44	44	144	2025-05-15	In Progress
45	45	145	2025-05-16	Resolved
46	46	146	2025-05-17	Pending
47	47	147	2025-05-18	In Progress
48	48	148	2025-05-19	Resolved
49	49	149	2025-05-20	Pending
50	50	150	2025-05-21	In Progress
51	51	151	2025-05-22	Resolved
52	52	152	2025-05-23	Pending
53	53	153	2025-05-24	In Progress
54	54	154	2025-05-25	Resolved
55	55	155	2025-05-26	Pending
56	56	156	2025-05-27	In Progress
57	57	157	2025-05-28	Resolved
58	58	158	2025-05-29	Pending
59	59	159	2025-05-30	In Progress
60	60	160	2025-05-31	Resolved
61	61	161	2025-06-01	Pending
62	62	162	2025-06-02	In Progress
63	63	163	2025-06-03	Resolved
64	64	164	2025-06-04	Pending
65	65	165	2025-06-05	In Progress
66	66	166	2025-06-06	Resolved
67	67	167	2025-06-07	Pending
68	68	168	2025-06-08	In Progress
69	69	169	2025-06-09	Resolved
70	70	170	2025-06-10	Pending
71	71	171	2025-06-11	In Progress
72	72	172	2025-06-12	Resolved
73	73	173	2025-06-13	Pending
74	74	174	2025-06-14	In Progress
75	75	175	2025-06-15	Resolved
76	76	176	2025-06-16	Pending
77	77	177	2025-06-17	In Progress
78	78	178	2025-06-18	Resolved
79	79	179	2025-06-19	Pending
80	80	180	2025-06-20	In Progress
81	81	181	2025-06-21	Resolved
82	82	182	2025-06-22	Pending
83	83	183	2025-06-23	In Progress
84	84	184	2025-06-24	Resolved
85	85	185	2025-06-25	Pending
86	86	186	2025-06-26	In Progress
87	87	187	2025-06-27	Resolved
88	88	188	2025-06-28	Pending
89	89	189	2025-06-29	In Progress
90	90	190	2025-06-30	Resolved
91	91	191	2025-07-01	Pending
92	92	192	2025-07-02	In Progress
93	93	193	2025-07-03	Resolved
94	94	194	2025-07-04	Pending
95	95	195	2025-07-05	In Progress
96	96	196	2025-07-06	Resolved
97	97	197	2025-07-07	Pending
98	98	198	2025-07-08	In Progress
99	99	199	2025-07-09	Resolved
100	100	200	2025-07-10	Pending
\.


--
-- TOC entry 3533 (class 0 OID 41676)
-- Dependencies: 224
-- Data for Name: deposit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deposit (deposit_id, account_id, currency_id, deposit_date, deposit_amount) FROM stdin;
\.


--
-- TOC entry 3551 (class 0 OID 41825)
-- Dependencies: 242
-- Data for Name: fixed_deposit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fixed_deposit (fixed_deposit_id, account_id, currency_id, principal_amount, maturity_date) FROM stdin;
101	501	1	50600000.00	2026-01-11
102	502	2	50700000.00	2026-01-21
103	503	3	50800000.00	2026-01-31
104	504	4	50900000.00	2026-02-10
105	505	5	51000000.00	2026-02-20
106	506	6	51100000.00	2026-03-02
107	507	7	51200000.00	2026-03-12
108	508	8	51300000.00	2026-03-22
109	509	9	51400000.00	2026-04-01
110	510	10	51500000.00	2026-04-11
111	511	11	51600000.00	2026-04-21
112	512	12	51700000.00	2026-05-01
113	513	13	51800000.00	2026-05-11
114	514	14	51900000.00	2026-05-21
115	515	15	52000000.00	2026-05-31
116	516	16	52100000.00	2026-06-10
117	517	17	52200000.00	2026-06-20
118	518	18	52300000.00	2026-06-30
119	519	19	52400000.00	2026-07-10
120	520	20	52500000.00	2026-07-20
121	521	21	52600000.00	2026-07-30
122	522	22	52700000.00	2026-08-09
123	523	23	52800000.00	2026-08-19
124	524	24	52900000.00	2026-08-29
125	525	25	53000000.00	2026-09-08
126	526	26	53100000.00	2026-09-18
127	527	27	53200000.00	2026-09-28
128	528	28	53300000.00	2026-10-08
129	529	29	53400000.00	2026-10-18
130	530	30	53500000.00	2026-10-28
131	531	31	53600000.00	2026-11-07
132	532	32	53700000.00	2026-11-17
133	533	33	53800000.00	2026-11-27
134	534	34	53900000.00	2026-12-07
135	535	35	54000000.00	2026-12-17
136	536	36	54100000.00	2026-12-27
137	537	37	54200000.00	2027-01-06
138	538	38	54300000.00	2027-01-16
139	539	39	54400000.00	2027-01-26
140	540	40	54500000.00	2027-02-05
141	541	41	54600000.00	2027-02-15
142	542	42	54700000.00	2027-02-25
143	543	43	54800000.00	2027-03-07
144	544	44	54900000.00	2027-03-17
145	545	45	55000000.00	2027-03-27
146	546	46	55100000.00	2027-04-06
147	547	47	55200000.00	2027-04-16
148	548	48	55300000.00	2027-04-26
149	549	49	55400000.00	2027-05-06
150	550	50	55500000.00	2027-05-16
151	551	51	55600000.00	2027-05-26
152	552	52	55700000.00	2027-06-05
153	553	53	55800000.00	2027-06-15
154	554	54	55900000.00	2027-06-25
155	555	55	56000000.00	2027-07-05
156	556	56	56100000.00	2027-07-15
157	557	57	56200000.00	2027-07-25
158	558	58	56300000.00	2027-08-04
159	559	59	56400000.00	2027-08-14
160	560	60	56500000.00	2027-08-24
161	561	61	56600000.00	2027-09-03
162	562	62	56700000.00	2027-09-13
163	563	63	56800000.00	2027-09-23
164	564	64	56900000.00	2027-10-03
165	565	65	57000000.00	2027-10-13
166	566	66	57100000.00	2027-10-23
167	567	67	57200000.00	2027-11-02
168	568	68	57300000.00	2027-11-12
169	569	69	57400000.00	2027-11-22
170	570	70	57500000.00	2027-12-02
171	571	71	57600000.00	2027-12-12
172	572	72	57700000.00	2027-12-22
173	573	73	57800000.00	2028-01-01
174	574	74	57900000.00	2028-01-11
175	575	75	58000000.00	2028-01-21
176	576	76	58100000.00	2028-01-31
177	577	77	58200000.00	2028-02-10
178	578	78	58300000.00	2028-02-20
179	579	79	58400000.00	2028-03-01
180	580	80	58500000.00	2028-03-11
181	581	81	58600000.00	2028-03-21
182	582	82	58700000.00	2028-03-31
183	583	83	58800000.00	2028-04-10
184	584	84	58900000.00	2028-04-20
185	585	85	59000000.00	2028-04-30
186	586	86	59100000.00	2028-05-10
187	587	87	59200000.00	2028-05-20
188	588	88	59300000.00	2028-05-30
189	589	89	59400000.00	2028-06-09
190	590	90	59500000.00	2028-06-19
191	591	95	59600000.00	2028-06-29
192	592	96	59700000.00	2028-07-09
193	593	97	59800000.00	2028-07-19
194	594	98	59900000.00	2028-07-29
195	595	99	60000000.00	2028-08-08
196	596	100	60100000.00	2028-08-18
197	597	101	60200000.00	2028-08-28
198	598	102	60300000.00	2028-09-07
199	599	103	60400000.00	2028-09-17
200	600	104	60500000.00	2028-09-27
\.


--
-- TOC entry 3541 (class 0 OID 41753)
-- Dependencies: 232
-- Data for Name: guarantor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guarantor (guarantor_id, loan_id, guarantor_name, guarantor_phone, guaranteed_amount) FROM stdin;
1	101	Guarantor 101	+25078000101	300000.00
2	102	Guarantor 102	+25078000102	350000.00
3	103	Guarantor 103	+25078000103	400000.00
4	104	Guarantor 104	+25078000104	450000.00
5	105	Guarantor 105	+25078000105	500000.00
6	106	Guarantor 106	+25078000106	550000.00
7	107	Guarantor 107	+25078000107	600000.00
8	108	Guarantor 108	+25078000108	650000.00
9	109	Guarantor 109	+25078000109	700000.00
10	110	Guarantor 110	+25078000110	750000.00
11	111	Guarantor 111	+25078000111	800000.00
12	112	Guarantor 112	+25078000112	850000.00
13	113	Guarantor 113	+25078000113	900000.00
14	114	Guarantor 114	+25078000114	950000.00
15	115	Guarantor 115	+25078000115	1000000.00
16	116	Guarantor 116	+25078000116	1050000.00
17	117	Guarantor 117	+25078000117	1100000.00
18	118	Guarantor 118	+25078000118	1150000.00
19	119	Guarantor 119	+25078000119	1200000.00
20	120	Guarantor 120	+25078000120	1250000.00
21	121	Guarantor 121	+25078000121	1300000.00
22	122	Guarantor 122	+25078000122	1350000.00
23	123	Guarantor 123	+25078000123	1400000.00
24	124	Guarantor 124	+25078000124	1450000.00
25	125	Guarantor 125	+25078000125	1500000.00
26	126	Guarantor 126	+25078000126	1550000.00
27	127	Guarantor 127	+25078000127	1600000.00
28	128	Guarantor 128	+25078000128	1650000.00
29	129	Guarantor 129	+25078000129	1700000.00
30	130	Guarantor 130	+25078000130	1750000.00
31	131	Guarantor 131	+25078000131	1800000.00
32	132	Guarantor 132	+25078000132	1850000.00
33	133	Guarantor 133	+25078000133	1900000.00
34	134	Guarantor 134	+25078000134	1950000.00
35	135	Guarantor 135	+25078000135	2000000.00
36	136	Guarantor 136	+25078000136	2050000.00
37	137	Guarantor 137	+25078000137	2100000.00
38	138	Guarantor 138	+25078000138	2150000.00
39	139	Guarantor 139	+25078000139	2200000.00
40	140	Guarantor 140	+25078000140	2250000.00
41	141	Guarantor 141	+25078000141	2300000.00
42	142	Guarantor 142	+25078000142	2350000.00
43	143	Guarantor 143	+25078000143	2400000.00
44	144	Guarantor 144	+25078000144	2450000.00
45	145	Guarantor 145	+25078000145	2500000.00
46	146	Guarantor 146	+25078000146	2550000.00
47	147	Guarantor 147	+25078000147	2600000.00
48	148	Guarantor 148	+25078000148	2650000.00
49	149	Guarantor 149	+25078000149	2700000.00
50	150	Guarantor 150	+25078000150	2750000.00
51	151	Guarantor 151	+25078000151	2800000.00
52	152	Guarantor 152	+25078000152	2850000.00
53	153	Guarantor 153	+25078000153	2900000.00
54	154	Guarantor 154	+25078000154	2950000.00
55	155	Guarantor 155	+25078000155	3000000.00
56	156	Guarantor 156	+25078000156	3050000.00
57	157	Guarantor 157	+25078000157	3100000.00
58	158	Guarantor 158	+25078000158	3150000.00
59	159	Guarantor 159	+25078000159	3200000.00
60	160	Guarantor 160	+25078000160	3250000.00
61	161	Guarantor 161	+25078000161	3300000.00
62	162	Guarantor 162	+25078000162	3350000.00
63	163	Guarantor 163	+25078000163	3400000.00
64	164	Guarantor 164	+25078000164	3450000.00
65	165	Guarantor 165	+25078000165	3500000.00
66	166	Guarantor 166	+25078000166	3550000.00
67	167	Guarantor 167	+25078000167	3600000.00
68	168	Guarantor 168	+25078000168	3650000.00
69	169	Guarantor 169	+25078000169	3700000.00
70	170	Guarantor 170	+25078000170	3750000.00
71	171	Guarantor 171	+25078000171	3800000.00
72	172	Guarantor 172	+25078000172	3850000.00
73	173	Guarantor 173	+25078000173	3900000.00
74	174	Guarantor 174	+25078000174	3950000.00
75	175	Guarantor 175	+25078000175	4000000.00
76	176	Guarantor 176	+25078000176	4050000.00
77	177	Guarantor 177	+25078000177	4100000.00
78	178	Guarantor 178	+25078000178	4150000.00
79	179	Guarantor 179	+25078000179	4200000.00
80	180	Guarantor 180	+25078000180	4250000.00
81	181	Guarantor 181	+25078000181	4300000.00
82	182	Guarantor 182	+25078000182	4350000.00
83	183	Guarantor 183	+25078000183	4400000.00
84	184	Guarantor 184	+25078000184	4450000.00
85	185	Guarantor 185	+25078000185	4500000.00
86	186	Guarantor 186	+25078000186	4550000.00
87	187	Guarantor 187	+25078000187	4600000.00
88	188	Guarantor 188	+25078000188	4650000.00
89	189	Guarantor 189	+25078000189	4700000.00
90	190	Guarantor 190	+25078000190	4750000.00
91	191	Guarantor 191	+25078000191	4800000.00
92	192	Guarantor 192	+25078000192	4850000.00
93	193	Guarantor 193	+25078000193	4900000.00
94	194	Guarantor 194	+25078000194	4950000.00
95	195	Guarantor 195	+25078000195	5000000.00
\.


--
-- TOC entry 3553 (class 0 OID 41843)
-- Dependencies: 244
-- Data for Name: insurance_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insurance_policy (policy_id, customer_id, loan_id, policy_type, premium_amount) FROM stdin;
1	1	101	Health Insurance	12000.00
2	2	102	Life Insurance	14000.00
3	3	103	Loan Protection Insurance	16000.00
4	4	104	Health Insurance	18000.00
5	5	105	Life Insurance	20000.00
6	6	106	Loan Protection Insurance	22000.00
7	7	107	Health Insurance	24000.00
8	8	108	Life Insurance	26000.00
9	9	109	Loan Protection Insurance	28000.00
10	10	110	Health Insurance	30000.00
11	11	111	Life Insurance	32000.00
12	12	112	Loan Protection Insurance	34000.00
13	13	113	Health Insurance	36000.00
14	14	114	Life Insurance	38000.00
15	15	115	Loan Protection Insurance	40000.00
16	16	116	Health Insurance	42000.00
17	17	117	Life Insurance	44000.00
18	18	118	Loan Protection Insurance	46000.00
19	19	119	Health Insurance	48000.00
20	20	120	Life Insurance	50000.00
21	21	121	Loan Protection Insurance	52000.00
22	22	122	Health Insurance	54000.00
23	23	123	Life Insurance	56000.00
24	24	124	Loan Protection Insurance	58000.00
25	25	125	Health Insurance	60000.00
26	26	126	Life Insurance	62000.00
27	27	127	Loan Protection Insurance	64000.00
28	28	128	Health Insurance	66000.00
29	29	129	Life Insurance	68000.00
30	30	130	Loan Protection Insurance	70000.00
31	31	131	Health Insurance	72000.00
32	32	132	Life Insurance	74000.00
33	33	133	Loan Protection Insurance	76000.00
34	34	134	Health Insurance	78000.00
35	35	135	Life Insurance	80000.00
36	36	136	Loan Protection Insurance	82000.00
37	37	137	Health Insurance	84000.00
38	38	138	Life Insurance	86000.00
39	39	139	Loan Protection Insurance	88000.00
40	40	140	Health Insurance	90000.00
41	41	141	Life Insurance	92000.00
42	42	142	Loan Protection Insurance	94000.00
43	43	143	Health Insurance	96000.00
44	44	144	Life Insurance	98000.00
45	45	145	Loan Protection Insurance	100000.00
46	46	146	Health Insurance	102000.00
47	47	147	Life Insurance	104000.00
48	48	148	Loan Protection Insurance	106000.00
49	49	149	Health Insurance	108000.00
50	50	150	Life Insurance	110000.00
51	51	151	Loan Protection Insurance	112000.00
52	52	152	Health Insurance	114000.00
53	53	153	Life Insurance	116000.00
54	54	154	Loan Protection Insurance	118000.00
55	55	155	Health Insurance	120000.00
56	56	156	Life Insurance	122000.00
57	57	157	Loan Protection Insurance	124000.00
58	58	158	Health Insurance	126000.00
59	59	159	Life Insurance	128000.00
60	60	160	Loan Protection Insurance	130000.00
61	61	161	Health Insurance	132000.00
62	62	162	Life Insurance	134000.00
63	63	163	Loan Protection Insurance	136000.00
64	64	164	Health Insurance	138000.00
65	65	165	Life Insurance	140000.00
66	66	166	Loan Protection Insurance	142000.00
67	67	167	Health Insurance	144000.00
68	68	168	Life Insurance	146000.00
69	69	169	Loan Protection Insurance	148000.00
70	70	170	Health Insurance	150000.00
71	71	171	Life Insurance	152000.00
72	72	172	Loan Protection Insurance	154000.00
73	73	173	Health Insurance	156000.00
74	74	174	Life Insurance	158000.00
75	75	175	Loan Protection Insurance	160000.00
76	76	176	Health Insurance	162000.00
77	77	177	Life Insurance	164000.00
78	78	178	Loan Protection Insurance	166000.00
79	79	179	Health Insurance	168000.00
80	80	180	Life Insurance	170000.00
81	81	181	Loan Protection Insurance	172000.00
82	82	182	Health Insurance	174000.00
83	83	183	Life Insurance	176000.00
84	84	184	Loan Protection Insurance	178000.00
85	85	185	Health Insurance	180000.00
86	86	186	Life Insurance	182000.00
87	87	187	Loan Protection Insurance	184000.00
88	88	188	Health Insurance	186000.00
89	89	189	Life Insurance	188000.00
90	90	190	Loan Protection Insurance	190000.00
91	91	191	Health Insurance	192000.00
92	92	192	Life Insurance	194000.00
93	93	193	Loan Protection Insurance	196000.00
94	94	194	Health Insurance	198000.00
95	95	195	Life Insurance	200000.00
\.


--
-- TOC entry 3537 (class 0 OID 41712)
-- Dependencies: 228
-- Data for Name: loan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loan (loan_id, customer_id, loan_type_id, employee_id, loan_amount) FROM stdin;
101	1	1	101	600000.00
102	2	2	102	700000.00
103	3	3	103	800000.00
104	4	4	104	900000.00
105	5	5	105	1000000.00
106	6	6	106	1100000.00
107	7	7	107	1200000.00
108	8	8	108	1300000.00
109	9	9	109	1400000.00
110	10	10	110	1500000.00
111	11	11	111	1600000.00
112	12	12	112	1700000.00
113	13	13	113	1800000.00
114	14	14	114	1900000.00
115	15	15	115	2000000.00
116	16	16	116	2100000.00
117	17	17	117	2200000.00
118	18	18	118	2300000.00
119	19	19	119	2400000.00
120	20	20	120	2500000.00
121	21	21	121	2600000.00
122	22	22	122	2700000.00
123	23	23	123	2800000.00
124	24	24	124	2900000.00
125	25	25	125	3000000.00
126	26	26	126	3100000.00
127	27	27	127	3200000.00
128	28	28	128	3300000.00
129	29	29	129	3400000.00
130	30	30	130	3500000.00
131	31	31	131	3600000.00
132	32	32	132	3700000.00
133	33	33	133	3800000.00
134	34	34	134	3900000.00
135	35	35	135	4000000.00
136	36	36	136	4100000.00
137	37	37	137	4200000.00
138	38	38	138	4300000.00
139	39	39	139	4400000.00
140	40	40	140	4500000.00
141	41	41	141	4600000.00
142	42	42	142	4700000.00
143	43	43	143	4800000.00
144	44	44	144	4900000.00
145	45	45	145	5000000.00
146	46	46	146	5100000.00
147	47	47	147	5200000.00
148	48	48	148	5300000.00
149	49	49	149	5400000.00
150	50	50	150	5500000.00
151	51	51	151	5600000.00
152	52	52	152	5700000.00
153	53	53	153	5800000.00
154	54	54	154	5900000.00
155	55	55	155	6000000.00
156	56	56	156	6100000.00
157	57	57	157	6200000.00
158	58	58	158	6300000.00
159	59	59	159	6400000.00
160	60	60	160	6500000.00
161	61	61	161	6600000.00
162	62	62	162	6700000.00
163	63	63	163	6800000.00
164	64	64	164	6900000.00
165	65	65	165	7000000.00
166	66	66	166	7100000.00
167	67	67	167	7200000.00
168	68	68	168	7300000.00
169	69	69	169	7400000.00
170	70	70	170	7500000.00
171	71	71	171	7600000.00
172	72	72	172	7700000.00
173	73	73	173	7800000.00
174	74	74	174	7900000.00
175	75	75	175	8000000.00
176	76	76	176	8100000.00
177	77	77	177	8200000.00
178	78	78	178	8300000.00
179	79	79	179	8400000.00
180	80	80	180	8500000.00
181	81	81	181	8600000.00
182	82	82	182	8700000.00
183	83	83	183	8800000.00
184	84	84	184	8900000.00
185	85	85	185	9000000.00
186	86	86	186	9100000.00
187	87	87	187	9200000.00
188	88	88	188	9300000.00
189	89	89	189	9400000.00
190	90	90	190	9500000.00
191	91	91	191	9600000.00
192	92	92	192	9700000.00
193	93	93	193	9800000.00
194	94	94	194	9900000.00
195	95	95	195	10000000.00
\.


--
-- TOC entry 3539 (class 0 OID 41735)
-- Dependencies: 230
-- Data for Name: loan_repayment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loan_repayment (repayment_id, loan_id, account_id, repayment_date, repayment_amount) FROM stdin;
1	101	501	2025-01-06	60000.00
2	102	502	2025-01-11	70000.00
3	103	503	2025-01-16	80000.00
4	104	504	2025-01-21	90000.00
5	105	505	2025-01-26	100000.00
6	106	506	2025-01-31	110000.00
7	107	507	2025-02-05	120000.00
8	108	508	2025-02-10	130000.00
9	109	509	2025-02-15	140000.00
10	110	510	2025-02-20	150000.00
11	111	511	2025-02-25	160000.00
12	112	512	2025-03-02	170000.00
13	113	513	2025-03-07	180000.00
14	114	514	2025-03-12	190000.00
15	115	515	2025-03-17	200000.00
16	116	516	2025-03-22	210000.00
17	117	517	2025-03-27	220000.00
18	118	518	2025-04-01	230000.00
19	119	519	2025-04-06	240000.00
20	120	520	2025-04-11	250000.00
21	121	521	2025-04-16	260000.00
22	122	522	2025-04-21	270000.00
23	123	523	2025-04-26	280000.00
24	124	524	2025-05-01	290000.00
25	125	525	2025-05-06	300000.00
26	126	526	2025-05-11	310000.00
27	127	527	2025-05-16	320000.00
28	128	528	2025-05-21	330000.00
29	129	529	2025-05-26	340000.00
30	130	530	2025-05-31	350000.00
31	131	531	2025-06-05	360000.00
32	132	532	2025-06-10	370000.00
33	133	533	2025-06-15	380000.00
34	134	534	2025-06-20	390000.00
35	135	535	2025-06-25	400000.00
36	136	536	2025-06-30	410000.00
37	137	537	2025-07-05	420000.00
38	138	538	2025-07-10	430000.00
39	139	539	2025-07-15	440000.00
40	140	540	2025-07-20	450000.00
41	141	541	2025-07-25	460000.00
42	142	542	2025-07-30	470000.00
43	143	543	2025-08-04	480000.00
44	144	544	2025-08-09	490000.00
45	145	545	2025-08-14	500000.00
46	146	546	2025-08-19	510000.00
47	147	547	2025-08-24	520000.00
48	148	548	2025-08-29	530000.00
49	149	549	2025-09-03	540000.00
50	150	550	2025-09-08	550000.00
51	151	551	2025-09-13	560000.00
52	152	552	2025-09-18	570000.00
53	153	553	2025-09-23	580000.00
54	154	554	2025-09-28	590000.00
55	155	555	2025-10-03	600000.00
56	156	556	2025-10-08	610000.00
57	157	557	2025-10-13	620000.00
58	158	558	2025-10-18	630000.00
59	159	559	2025-10-23	640000.00
60	160	560	2025-10-28	650000.00
61	161	561	2025-11-02	660000.00
62	162	562	2025-11-07	670000.00
63	163	563	2025-11-12	680000.00
64	164	564	2025-11-17	690000.00
65	165	565	2025-11-22	700000.00
66	166	566	2025-11-27	710000.00
67	167	567	2025-12-02	720000.00
68	168	568	2025-12-07	730000.00
69	169	569	2025-12-12	740000.00
70	170	570	2025-12-17	750000.00
71	171	571	2025-12-22	760000.00
72	172	572	2025-12-27	770000.00
73	173	573	2026-01-01	780000.00
74	174	574	2026-01-06	790000.00
75	175	575	2026-01-11	800000.00
76	176	576	2026-01-16	810000.00
77	177	577	2026-01-21	820000.00
78	178	578	2026-01-26	830000.00
79	179	579	2026-01-31	840000.00
80	180	580	2026-02-05	850000.00
81	181	581	2026-02-10	860000.00
82	182	582	2026-02-15	870000.00
83	183	583	2026-02-20	880000.00
84	184	584	2026-02-25	890000.00
85	185	585	2026-03-02	900000.00
86	186	586	2026-03-07	910000.00
87	187	587	2026-03-12	920000.00
88	188	588	2026-03-17	930000.00
89	189	589	2026-03-22	940000.00
90	190	590	2026-03-27	950000.00
91	191	591	2026-04-01	960000.00
92	192	592	2026-04-06	970000.00
93	193	593	2026-04-11	980000.00
94	194	594	2026-04-16	990000.00
95	195	595	2026-04-21	1000000.00
\.


--
-- TOC entry 3527 (class 0 OID 41631)
-- Dependencies: 218
-- Data for Name: loan_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loan_type (loan_type_id, loan_type_name, interest_rate, maximum_period_months, effective_date) FROM stdin;
1	Personal Loan Basic	12.50	24	2020-01-01
2	Personal Loan Premium	11.50	36	2020-02-01
3	Salary Loan	10.50	18	2020-03-01
4	Emergency Loan	14.00	12	2020-04-01
5	Education Loan	9.50	60	2020-05-01
6	Student Loan	8.50	48	2020-06-01
7	Business Startup Loan	13.50	48	2020-07-01
8	SME Growth Loan	12.00	60	2020-08-01
9	Corporate Loan	10.00	84	2020-09-01
10	Enterprise Loan	9.00	120	2020-10-01
11	Agriculture Loan Basic	11.50	48	2021-01-01
12	Agriculture Equipment Loan	10.50	60	2021-02-01
13	Farmer Support Loan	12.50	36	2021-03-01
14	Livestock Loan	13.00	48	2021-04-01
15	Crop Production Loan	11.00	24	2021-05-01
16	Mortgage Loan Basic	8.50	120	2021-06-01
17	Mortgage Loan Premium	7.50	240	2021-07-01
18	Home Construction Loan	9.00	180	2021-08-01
19	Home Improvement Loan	10.00	84	2021-09-01
20	Housing Development Loan	8.00	240	2021-10-01
21	Vehicle Loan Basic	11.00	60	2022-01-01
22	Vehicle Loan Premium	9.50	72	2022-02-01
23	Motorcycle Loan	13.50	36	2022-03-01
24	Transport Business Loan	12.00	60	2022-04-01
25	Taxi Loan	12.50	48	2022-05-01
26	Women Business Loan	10.50	60	2022-06-01
27	Youth Entrepreneurship Loan	9.50	48	2022-07-01
28	Small Trader Loan	13.00	36	2022-08-01
29	Market Vendor Loan	14.00	24	2022-09-01
30	Retail Business Loan	12.00	48	2022-10-01
31	Technology Loan	10.00	60	2023-01-01
32	Digital Business Loan	11.00	48	2023-02-01
33	Innovation Loan	9.50	72	2023-03-01
34	Equipment Financing Loan	10.50	84	2023-04-01
35	Industrial Loan	8.50	120	2023-05-01
36	Medical Loan	11.50	36	2023-06-01
37	Health Emergency Loan	13.50	24	2023-07-01
38	Hospital Support Loan	10.00	60	2023-08-01
39	Insurance Premium Loan	12.00	36	2023-09-01
40	Family Support Loan	13.00	24	2023-10-01
41	Travel Loan	14.00	24	2024-01-01
42	Holiday Loan	13.00	18	2024-02-01
43	Wedding Loan	12.50	36	2024-03-01
44	Consumer Loan	14.50	48	2024-04-01
45	Household Loan	13.50	36	2024-05-01
46	Gold Investment Loan	9.50	120	2024-06-01
47	Investment Loan	8.50	180	2024-07-01
48	Fixed Deposit Loan	7.50	60	2024-08-01
49	Savings Secured Loan	8.00	48	2024-09-01
50	Collateral Loan	10.00	72	2024-10-01
51	Government Employee Loan	9.00	84	2025-01-01
52	Teacher Loan	10.50	60	2025-02-01
53	Healthcare Worker Loan	10.00	60	2025-03-01
54	Civil Servant Loan	9.50	72	2025-04-01
55	Police Service Loan	9.00	84	2025-05-01
56	Microfinance Loan	15.00	24	2025-06-01
57	Group Loan	14.00	36	2025-07-01
58	Community Loan	13.00	48	2025-08-01
59	Cooperative Loan	12.50	60	2025-09-01
60	Village Loan	15.50	24	2025-10-01
61	Green Energy Loan	9.50	72	2026-01-01
62	Solar Equipment Loan	10.00	60	2026-02-01
63	Environmental Loan	8.50	84	2026-03-01
64	Renewable Energy Loan	9.00	120	2026-04-01
65	Climate Support Loan	10.50	72	2026-05-01
66	Import Financing Loan	11.00	60	2026-06-01
67	Export Financing Loan	10.00	72	2026-07-01
68	Trade Finance Loan	9.50	84	2026-08-01
69	Supplier Loan	12.00	48	2026-09-01
70	Inventory Loan	11.50	36	2026-10-01
71	Short Term Loan	14.00	12	2026-11-01
72	Medium Term Loan	12.00	48	2026-12-01
73	Long Term Loan	9.00	120	2027-01-01
74	Premium Customer Loan	8.50	96	2027-02-01
75	VIP Customer Loan	7.50	120	2027-03-01
76	Digital Credit Loan	15.00	12	2027-04-01
77	Mobile Loan	16.00	6	2027-05-01
78	Instant Loan	17.00	3	2027-06-01
79	Online Loan	14.50	18	2027-07-01
80	Smart Loan	13.50	24	2027-08-01
81	Special Business Loan	10.00	72	2027-09-01
82	Large Enterprise Loan	8.00	120	2027-10-01
83	International Business Loan	9.50	96	2027-11-01
84	Tourism Loan	11.50	60	2027-12-01
85	Hotel Development Loan	8.50	180	2028-01-01
86	Restaurant Loan	12.00	60	2028-02-01
87	Food Production Loan	11.00	72	2028-03-01
88	Construction Loan	9.50	120	2028-04-01
89	Real Estate Loan	8.00	180	2028-05-01
90	Development Loan	9.00	120	2028-06-01
91	Employee Personal Loan	11.00	36	2028-07-01
92	Premium Salary Loan	10.00	48	2028-08-01
93	Executive Loan	8.50	84	2028-09-01
94	Private Banking Loan	7.50	120	2028-10-01
95	Elite Customer Loan	7.00	120	2028-11-01
\.


--
-- TOC entry 3547 (class 0 OID 41794)
-- Dependencies: 238
-- Data for Name: mobile_banking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mobile_banking (mobile_banking_id, customer_id, account_id, phone_number, registration_date) FROM stdin;
1	1	501	+25078000001	2025-02-02
2	2	502	+25078000002	2025-02-03
3	3	503	+25078000003	2025-02-04
4	4	504	+25078000004	2025-02-05
5	5	505	+25078000005	2025-02-06
6	6	506	+25078000006	2025-02-07
7	7	507	+25078000007	2025-02-08
8	8	508	+25078000008	2025-02-09
9	9	509	+25078000009	2025-02-10
10	10	510	+25078000010	2025-02-11
11	11	511	+25078000011	2025-02-12
12	12	512	+25078000012	2025-02-13
13	13	513	+25078000013	2025-02-14
14	14	514	+25078000014	2025-02-15
15	15	515	+25078000015	2025-02-16
16	16	516	+25078000016	2025-02-17
17	17	517	+25078000017	2025-02-18
18	18	518	+25078000018	2025-02-19
19	19	519	+25078000019	2025-02-20
20	20	520	+25078000020	2025-02-21
21	21	521	+25078000021	2025-02-22
22	22	522	+25078000022	2025-02-23
23	23	523	+25078000023	2025-02-24
24	24	524	+25078000024	2025-02-25
25	25	525	+25078000025	2025-02-26
26	26	526	+25078000026	2025-02-27
27	27	527	+25078000027	2025-02-28
28	28	528	+25078000028	2025-03-01
29	29	529	+25078000029	2025-03-02
30	30	530	+25078000030	2025-03-03
31	31	531	+25078000031	2025-03-04
32	32	532	+25078000032	2025-03-05
33	33	533	+25078000033	2025-03-06
34	34	534	+25078000034	2025-03-07
35	35	535	+25078000035	2025-03-08
36	36	536	+25078000036	2025-03-09
37	37	537	+25078000037	2025-03-10
38	38	538	+25078000038	2025-03-11
39	39	539	+25078000039	2025-03-12
40	40	540	+25078000040	2025-03-13
41	41	541	+25078000041	2025-03-14
42	42	542	+25078000042	2025-03-15
43	43	543	+25078000043	2025-03-16
44	44	544	+25078000044	2025-03-17
45	45	545	+25078000045	2025-03-18
46	46	546	+25078000046	2025-03-19
47	47	547	+25078000047	2025-03-20
48	48	548	+25078000048	2025-03-21
49	49	549	+25078000049	2025-03-22
50	50	550	+25078000050	2025-03-23
51	51	551	+25078000051	2025-03-24
52	52	552	+25078000052	2025-03-25
53	53	553	+25078000053	2025-03-26
54	54	554	+25078000054	2025-03-27
55	55	555	+25078000055	2025-03-28
56	56	556	+25078000056	2025-03-29
57	57	557	+25078000057	2025-03-30
58	58	558	+25078000058	2025-03-31
59	59	559	+25078000059	2025-04-01
60	60	560	+25078000060	2025-04-02
61	61	561	+25078000061	2025-04-03
62	62	562	+25078000062	2025-04-04
63	63	563	+25078000063	2025-04-05
64	64	564	+25078000064	2025-04-06
65	65	565	+25078000065	2025-04-07
66	66	566	+25078000066	2025-04-08
67	67	567	+25078000067	2025-04-09
68	68	568	+25078000068	2025-04-10
69	69	569	+25078000069	2025-04-11
70	70	570	+25078000070	2025-04-12
71	71	571	+25078000071	2025-04-13
72	72	572	+25078000072	2025-04-14
73	73	573	+25078000073	2025-04-15
74	74	574	+25078000074	2025-04-16
75	75	575	+25078000075	2025-04-17
76	76	576	+25078000076	2025-04-18
77	77	577	+25078000077	2025-04-19
78	78	578	+25078000078	2025-04-20
79	79	579	+25078000079	2025-04-21
80	80	580	+25078000080	2025-04-22
81	81	581	+25078000081	2025-04-23
82	82	582	+25078000082	2025-04-24
83	83	583	+25078000083	2025-04-25
84	84	584	+25078000084	2025-04-26
85	85	585	+25078000085	2025-04-27
86	86	586	+25078000086	2025-04-28
87	87	587	+25078000087	2025-04-29
88	88	588	+25078000088	2025-04-30
89	89	589	+25078000089	2025-05-01
90	90	590	+25078000090	2025-05-02
91	91	591	+25078000091	2025-05-03
92	92	592	+25078000092	2025-05-04
93	93	593	+25078000093	2025-05-05
94	94	594	+25078000094	2025-05-06
95	95	595	+25078000095	2025-05-07
96	96	596	+25078000096	2025-05-08
97	97	597	+25078000097	2025-05-09
98	98	598	+25078000098	2025-05-10
99	99	599	+25078000099	2025-05-11
100	100	600	+25078000100	2025-05-12
\.


--
-- TOC entry 3535 (class 0 OID 41694)
-- Dependencies: 226
-- Data for Name: withdrawal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.withdrawal (withdrawal_id, account_id, employee_id, withdrawal_date, withdrawal_amount) FROM stdin;
\.


--
-- TOC entry 3584 (class 0 OID 0)
-- Dependencies: 213
-- Name: account_type_account_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_type_account_type_id_seq', 116, true);


--
-- TOC entry 3585 (class 0 OID 0)
-- Dependencies: 221
-- Name: bank_account_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_account_account_id_seq', 600, true);


--
-- TOC entry 3586 (class 0 OID 0)
-- Dependencies: 211
-- Name: bank_branch_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_branch_branch_id_seq', 100, true);


--
-- TOC entry 3587 (class 0 OID 0)
-- Dependencies: 235
-- Name: bank_card_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_card_card_id_seq', 100, true);


--
-- TOC entry 3588 (class 0 OID 0)
-- Dependencies: 219
-- Name: bank_employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_employee_employee_id_seq', 200, true);


--
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 239
-- Name: beneficiary_beneficiary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beneficiary_beneficiary_id_seq', 100, true);


--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 247
-- Name: branch_target_target_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branch_target_target_id_seq', 100, true);


--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 233
-- Name: collateral_collateral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collateral_collateral_id_seq', 95, true);


--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 215
-- Name: currency_currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currency_currency_id_seq', 104, true);


--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 245
-- Name: customer_complaint_complaint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_complaint_complaint_id_seq', 100, true);


--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 209
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 100, true);


--
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 223
-- Name: deposit_deposit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deposit_deposit_id_seq', 300, true);


--
-- TOC entry 3596 (class 0 OID 0)
-- Dependencies: 241
-- Name: fixed_deposit_fixed_deposit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fixed_deposit_fixed_deposit_id_seq', 200, true);


--
-- TOC entry 3597 (class 0 OID 0)
-- Dependencies: 231
-- Name: guarantor_guarantor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guarantor_guarantor_id_seq', 95, true);


--
-- TOC entry 3598 (class 0 OID 0)
-- Dependencies: 243
-- Name: insurance_policy_policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insurance_policy_policy_id_seq', 95, true);


--
-- TOC entry 3599 (class 0 OID 0)
-- Dependencies: 227
-- Name: loan_loan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loan_loan_id_seq', 195, true);


--
-- TOC entry 3600 (class 0 OID 0)
-- Dependencies: 229
-- Name: loan_repayment_repayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loan_repayment_repayment_id_seq', 95, true);


--
-- TOC entry 3601 (class 0 OID 0)
-- Dependencies: 217
-- Name: loan_type_loan_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loan_type_loan_type_id_seq', 95, true);


--
-- TOC entry 3602 (class 0 OID 0)
-- Dependencies: 237
-- Name: mobile_banking_mobile_banking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mobile_banking_mobile_banking_id_seq', 100, true);


--
-- TOC entry 3603 (class 0 OID 0)
-- Dependencies: 225
-- Name: withdrawal_withdrawal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.withdrawal_withdrawal_id_seq', 100, true);


--
-- TOC entry 3307 (class 2606 OID 41619)
-- Name: account_type account_type_account_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type
    ADD CONSTRAINT account_type_account_type_name_key UNIQUE (account_type_name);


--
-- TOC entry 3309 (class 2606 OID 41617)
-- Name: account_type account_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_type
    ADD CONSTRAINT account_type_pkey PRIMARY KEY (account_type_id);


--
-- TOC entry 3321 (class 2606 OID 41659)
-- Name: bank_account bank_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT bank_account_pkey PRIMARY KEY (account_id);


--
-- TOC entry 3303 (class 2606 OID 41608)
-- Name: bank_branch bank_branch_branch_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_branch
    ADD CONSTRAINT bank_branch_branch_name_key UNIQUE (branch_name);


--
-- TOC entry 3305 (class 2606 OID 41606)
-- Name: bank_branch bank_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_branch
    ADD CONSTRAINT bank_branch_pkey PRIMARY KEY (branch_id);


--
-- TOC entry 3335 (class 2606 OID 41787)
-- Name: bank_card bank_card_card_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_card
    ADD CONSTRAINT bank_card_card_number_key UNIQUE (card_number);


--
-- TOC entry 3337 (class 2606 OID 41785)
-- Name: bank_card bank_card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_card
    ADD CONSTRAINT bank_card_pkey PRIMARY KEY (card_id);


--
-- TOC entry 3319 (class 2606 OID 41647)
-- Name: bank_employee bank_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_employee
    ADD CONSTRAINT bank_employee_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 3343 (class 2606 OID 41818)
-- Name: beneficiary beneficiary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficiary
    ADD CONSTRAINT beneficiary_pkey PRIMARY KEY (beneficiary_id);


--
-- TOC entry 3351 (class 2606 OID 41886)
-- Name: branch_target branch_target_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_target
    ADD CONSTRAINT branch_target_pkey PRIMARY KEY (target_id);


--
-- TOC entry 3333 (class 2606 OID 41772)
-- Name: collateral collateral_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collateral
    ADD CONSTRAINT collateral_pkey PRIMARY KEY (collateral_id);


--
-- TOC entry 3311 (class 2606 OID 41899)
-- Name: currency currency_currency_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_currency_code_key UNIQUE (currency_code);


--
-- TOC entry 3313 (class 2606 OID 41627)
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (currency_id);


--
-- TOC entry 3349 (class 2606 OID 41867)
-- Name: customer_complaint customer_complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_complaint
    ADD CONSTRAINT customer_complaint_pkey PRIMARY KEY (complaint_id);


--
-- TOC entry 3299 (class 2606 OID 41599)
-- Name: customer customer_national_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_national_id_key UNIQUE (national_id);


--
-- TOC entry 3301 (class 2606 OID 41597)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 3323 (class 2606 OID 41682)
-- Name: deposit deposit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT deposit_pkey PRIMARY KEY (deposit_id);


--
-- TOC entry 3345 (class 2606 OID 41831)
-- Name: fixed_deposit fixed_deposit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fixed_deposit
    ADD CONSTRAINT fixed_deposit_pkey PRIMARY KEY (fixed_deposit_id);


--
-- TOC entry 3331 (class 2606 OID 41759)
-- Name: guarantor guarantor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guarantor
    ADD CONSTRAINT guarantor_pkey PRIMARY KEY (guarantor_id);


--
-- TOC entry 3347 (class 2606 OID 41849)
-- Name: insurance_policy insurance_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_policy
    ADD CONSTRAINT insurance_policy_pkey PRIMARY KEY (policy_id);


--
-- TOC entry 3327 (class 2606 OID 41718)
-- Name: loan loan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_pkey PRIMARY KEY (loan_id);


--
-- TOC entry 3329 (class 2606 OID 41741)
-- Name: loan_repayment loan_repayment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_repayment
    ADD CONSTRAINT loan_repayment_pkey PRIMARY KEY (repayment_id);


--
-- TOC entry 3315 (class 2606 OID 41640)
-- Name: loan_type loan_type_loan_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_type
    ADD CONSTRAINT loan_type_loan_type_name_key UNIQUE (loan_type_name);


--
-- TOC entry 3317 (class 2606 OID 41638)
-- Name: loan_type loan_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_type
    ADD CONSTRAINT loan_type_pkey PRIMARY KEY (loan_type_id);


--
-- TOC entry 3339 (class 2606 OID 41801)
-- Name: mobile_banking mobile_banking_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobile_banking
    ADD CONSTRAINT mobile_banking_phone_number_key UNIQUE (phone_number);


--
-- TOC entry 3341 (class 2606 OID 41799)
-- Name: mobile_banking mobile_banking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobile_banking
    ADD CONSTRAINT mobile_banking_pkey PRIMARY KEY (mobile_banking_id);


--
-- TOC entry 3325 (class 2606 OID 41700)
-- Name: withdrawal withdrawal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.withdrawal
    ADD CONSTRAINT withdrawal_pkey PRIMARY KEY (withdrawal_id);


--
-- TOC entry 3353 (class 2606 OID 41670)
-- Name: bank_account fk_account_branch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT fk_account_branch FOREIGN KEY (branch_id) REFERENCES public.bank_branch(branch_id);


--
-- TOC entry 3354 (class 2606 OID 41660)
-- Name: bank_account fk_account_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT fk_account_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- TOC entry 3355 (class 2606 OID 41665)
-- Name: bank_account fk_account_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT fk_account_type FOREIGN KEY (account_type_id) REFERENCES public.account_type(account_type_id);


--
-- TOC entry 3370 (class 2606 OID 41819)
-- Name: beneficiary fk_beneficiary_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beneficiary
    ADD CONSTRAINT fk_beneficiary_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- TOC entry 3367 (class 2606 OID 41788)
-- Name: bank_card fk_card_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_card
    ADD CONSTRAINT fk_card_account FOREIGN KEY (account_id) REFERENCES public.bank_account(account_id);


--
-- TOC entry 3366 (class 2606 OID 41773)
-- Name: collateral fk_collateral_loan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collateral
    ADD CONSTRAINT fk_collateral_loan FOREIGN KEY (loan_id) REFERENCES public.loan(loan_id);


--
-- TOC entry 3375 (class 2606 OID 41868)
-- Name: customer_complaint fk_complaint_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_complaint
    ADD CONSTRAINT fk_complaint_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- TOC entry 3376 (class 2606 OID 41873)
-- Name: customer_complaint fk_complaint_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_complaint
    ADD CONSTRAINT fk_complaint_employee FOREIGN KEY (employee_id) REFERENCES public.bank_employee(employee_id);


--
-- TOC entry 3356 (class 2606 OID 41683)
-- Name: deposit fk_deposit_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT fk_deposit_account FOREIGN KEY (account_id) REFERENCES public.bank_account(account_id);


--
-- TOC entry 3357 (class 2606 OID 41688)
-- Name: deposit fk_deposit_currency; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT fk_deposit_currency FOREIGN KEY (currency_id) REFERENCES public.currency(currency_id);


--
-- TOC entry 3352 (class 2606 OID 41648)
-- Name: bank_employee fk_employee_branch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_employee
    ADD CONSTRAINT fk_employee_branch FOREIGN KEY (branch_id) REFERENCES public.bank_branch(branch_id);


--
-- TOC entry 3371 (class 2606 OID 41832)
-- Name: fixed_deposit fk_fixed_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fixed_deposit
    ADD CONSTRAINT fk_fixed_account FOREIGN KEY (account_id) REFERENCES public.bank_account(account_id);


--
-- TOC entry 3372 (class 2606 OID 41837)
-- Name: fixed_deposit fk_fixed_currency; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fixed_deposit
    ADD CONSTRAINT fk_fixed_currency FOREIGN KEY (currency_id) REFERENCES public.currency(currency_id);


--
-- TOC entry 3365 (class 2606 OID 41760)
-- Name: guarantor fk_guarantor_loan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guarantor
    ADD CONSTRAINT fk_guarantor_loan FOREIGN KEY (loan_id) REFERENCES public.loan(loan_id);


--
-- TOC entry 3360 (class 2606 OID 41719)
-- Name: loan fk_loan_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT fk_loan_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- TOC entry 3361 (class 2606 OID 41729)
-- Name: loan fk_loan_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT fk_loan_employee FOREIGN KEY (employee_id) REFERENCES public.bank_employee(employee_id);


--
-- TOC entry 3362 (class 2606 OID 41724)
-- Name: loan fk_loan_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT fk_loan_type FOREIGN KEY (loan_type_id) REFERENCES public.loan_type(loan_type_id);


--
-- TOC entry 3368 (class 2606 OID 41807)
-- Name: mobile_banking fk_mobile_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobile_banking
    ADD CONSTRAINT fk_mobile_account FOREIGN KEY (account_id) REFERENCES public.bank_account(account_id);


--
-- TOC entry 3369 (class 2606 OID 41802)
-- Name: mobile_banking fk_mobile_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mobile_banking
    ADD CONSTRAINT fk_mobile_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- TOC entry 3373 (class 2606 OID 41850)
-- Name: insurance_policy fk_policy_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_policy
    ADD CONSTRAINT fk_policy_customer FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- TOC entry 3374 (class 2606 OID 41855)
-- Name: insurance_policy fk_policy_loan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insurance_policy
    ADD CONSTRAINT fk_policy_loan FOREIGN KEY (loan_id) REFERENCES public.loan(loan_id);


--
-- TOC entry 3363 (class 2606 OID 41747)
-- Name: loan_repayment fk_repayment_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_repayment
    ADD CONSTRAINT fk_repayment_account FOREIGN KEY (account_id) REFERENCES public.bank_account(account_id);


--
-- TOC entry 3364 (class 2606 OID 41742)
-- Name: loan_repayment fk_repayment_loan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_repayment
    ADD CONSTRAINT fk_repayment_loan FOREIGN KEY (loan_id) REFERENCES public.loan(loan_id);


--
-- TOC entry 3377 (class 2606 OID 41892)
-- Name: branch_target fk_target_account_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_target
    ADD CONSTRAINT fk_target_account_type FOREIGN KEY (account_type_id) REFERENCES public.account_type(account_type_id);


--
-- TOC entry 3378 (class 2606 OID 41887)
-- Name: branch_target fk_target_branch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_target
    ADD CONSTRAINT fk_target_branch FOREIGN KEY (branch_id) REFERENCES public.bank_branch(branch_id);


--
-- TOC entry 3358 (class 2606 OID 41701)
-- Name: withdrawal fk_withdrawal_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.withdrawal
    ADD CONSTRAINT fk_withdrawal_account FOREIGN KEY (account_id) REFERENCES public.bank_account(account_id);


--
-- TOC entry 3359 (class 2606 OID 41706)
-- Name: withdrawal fk_withdrawal_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.withdrawal
    ADD CONSTRAINT fk_withdrawal_employee FOREIGN KEY (employee_id) REFERENCES public.bank_employee(employee_id);


--
-- TOC entry 3563 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2026-08-05 10:25:32

--
-- PostgreSQL database dump complete
--

\unrestrict VPlJeQALJWshdcIVhbtPCk6ehfODawVMQQoqKIBsYevBsgvCF5CG6JOdyA0tFiM

