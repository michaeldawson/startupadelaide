--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    resource_id character varying(255) NOT NULL,
    resource_type character varying(255) NOT NULL,
    author_id integer,
    author_type character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    namespace character varying(255)
);


ALTER TABLE public.active_admin_comments OWNER TO wwojbfltraaycm;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: wwojbfltraaycm
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO wwojbfltraaycm;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wwojbfltraaycm
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE TABLE admin_users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying(255),
    last_name character varying(255)
);


ALTER TABLE public.admin_users OWNER TO wwojbfltraaycm;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: wwojbfltraaycm
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO wwojbfltraaycm;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wwojbfltraaycm
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: blog_posts; Type: TABLE; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE TABLE blog_posts (
    id integer NOT NULL,
    title character varying(255),
    body text,
    admin_user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    blogger_id integer
);


ALTER TABLE public.blog_posts OWNER TO wwojbfltraaycm;

--
-- Name: blog_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: wwojbfltraaycm
--

CREATE SEQUENCE blog_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_posts_id_seq OWNER TO wwojbfltraaycm;

--
-- Name: blog_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wwojbfltraaycm
--

ALTER SEQUENCE blog_posts_id_seq OWNED BY blog_posts.id;


--
-- Name: bloggers; Type: TABLE; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE TABLE bloggers (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    first_name character varying(255),
    last_name character varying(255),
    provider character varying(255),
    uid character varying(255),
    oauth_token character varying(255),
    oauth_expires_at timestamp without time zone
);


ALTER TABLE public.bloggers OWNER TO wwojbfltraaycm;

--
-- Name: bloggers_id_seq; Type: SEQUENCE; Schema: public; Owner: wwojbfltraaycm
--

CREATE SEQUENCE bloggers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bloggers_id_seq OWNER TO wwojbfltraaycm;

--
-- Name: bloggers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wwojbfltraaycm
--

ALTER SEQUENCE bloggers_id_seq OWNED BY bloggers.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(255),
    size integer,
    cat_class character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO wwojbfltraaycm;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: wwojbfltraaycm
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO wwojbfltraaycm;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wwojbfltraaycm
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: contact_messages; Type: TABLE; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE TABLE contact_messages (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    message text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.contact_messages OWNER TO wwojbfltraaycm;

--
-- Name: contact_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: wwojbfltraaycm
--

CREATE SEQUENCE contact_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_messages_id_seq OWNER TO wwojbfltraaycm;

--
-- Name: contact_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wwojbfltraaycm
--

ALTER SEQUENCE contact_messages_id_seq OWNED BY contact_messages.id;


--
-- Name: nodes; Type: TABLE; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE TABLE nodes (
    id integer NOT NULL,
    category_id integer,
    name character varying(255),
    contact character varying(255),
    street character varying(255),
    city character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sponsor character varying(255),
    description text,
    owner character varying(255),
    phone character varying(255),
    champion character varying(255),
    champion_contact character varying(255)
);


ALTER TABLE public.nodes OWNER TO wwojbfltraaycm;

--
-- Name: nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: wwojbfltraaycm
--

CREATE SEQUENCE nodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nodes_id_seq OWNER TO wwojbfltraaycm;

--
-- Name: nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wwojbfltraaycm
--

ALTER SEQUENCE nodes_id_seq OWNED BY nodes.id;


--
-- Name: nodes_targets; Type: TABLE; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE TABLE nodes_targets (
    node_id integer,
    target_id integer
);


ALTER TABLE public.nodes_targets OWNER TO wwojbfltraaycm;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO wwojbfltraaycm;

--
-- Name: site_configurations; Type: TABLE; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE TABLE site_configurations (
    id integer NOT NULL,
    key character varying(255),
    value text,
    form_type character varying(255),
    form_collection_command character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.site_configurations OWNER TO wwojbfltraaycm;

--
-- Name: site_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: wwojbfltraaycm
--

CREATE SEQUENCE site_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_configurations_id_seq OWNER TO wwojbfltraaycm;

--
-- Name: site_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wwojbfltraaycm
--

ALTER SEQUENCE site_configurations_id_seq OWNED BY site_configurations.id;


--
-- Name: social_link_prefills; Type: TABLE; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE TABLE social_link_prefills (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.social_link_prefills OWNER TO wwojbfltraaycm;

--
-- Name: social_link_prefills_id_seq; Type: SEQUENCE; Schema: public; Owner: wwojbfltraaycm
--

CREATE SEQUENCE social_link_prefills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_link_prefills_id_seq OWNER TO wwojbfltraaycm;

--
-- Name: social_link_prefills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wwojbfltraaycm
--

ALTER SEQUENCE social_link_prefills_id_seq OWNED BY social_link_prefills.id;


--
-- Name: social_links; Type: TABLE; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE TABLE social_links (
    id integer NOT NULL,
    link_url character varying(255),
    social_key character varying(255),
    node_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.social_links OWNER TO wwojbfltraaycm;

--
-- Name: social_links_id_seq; Type: SEQUENCE; Schema: public; Owner: wwojbfltraaycm
--

CREATE SEQUENCE social_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_links_id_seq OWNER TO wwojbfltraaycm;

--
-- Name: social_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wwojbfltraaycm
--

ALTER SEQUENCE social_links_id_seq OWNED BY social_links.id;


--
-- Name: targets; Type: TABLE; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE TABLE targets (
    id integer NOT NULL,
    name character varying(255),
    cat_class character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.targets OWNER TO wwojbfltraaycm;

--
-- Name: targets_id_seq; Type: SEQUENCE; Schema: public; Owner: wwojbfltraaycm
--

CREATE SEQUENCE targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.targets_id_seq OWNER TO wwojbfltraaycm;

--
-- Name: targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wwojbfltraaycm
--

ALTER SEQUENCE targets_id_seq OWNED BY targets.id;


--
-- Name: tweets; Type: TABLE; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE TABLE tweets (
    id integer NOT NULL,
    text text,
    user_screen_name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tweets OWNER TO wwojbfltraaycm;

--
-- Name: tweets_id_seq; Type: SEQUENCE; Schema: public; Owner: wwojbfltraaycm
--

CREATE SEQUENCE tweets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tweets_id_seq OWNER TO wwojbfltraaycm;

--
-- Name: tweets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wwojbfltraaycm
--

ALTER SEQUENCE tweets_id_seq OWNED BY tweets.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wwojbfltraaycm
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wwojbfltraaycm
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wwojbfltraaycm
--

ALTER TABLE ONLY blog_posts ALTER COLUMN id SET DEFAULT nextval('blog_posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wwojbfltraaycm
--

ALTER TABLE ONLY bloggers ALTER COLUMN id SET DEFAULT nextval('bloggers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wwojbfltraaycm
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wwojbfltraaycm
--

ALTER TABLE ONLY contact_messages ALTER COLUMN id SET DEFAULT nextval('contact_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wwojbfltraaycm
--

ALTER TABLE ONLY nodes ALTER COLUMN id SET DEFAULT nextval('nodes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wwojbfltraaycm
--

ALTER TABLE ONLY site_configurations ALTER COLUMN id SET DEFAULT nextval('site_configurations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wwojbfltraaycm
--

ALTER TABLE ONLY social_link_prefills ALTER COLUMN id SET DEFAULT nextval('social_link_prefills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wwojbfltraaycm
--

ALTER TABLE ONLY social_links ALTER COLUMN id SET DEFAULT nextval('social_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wwojbfltraaycm
--

ALTER TABLE ONLY targets ALTER COLUMN id SET DEFAULT nextval('targets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: wwojbfltraaycm
--

ALTER TABLE ONLY tweets ALTER COLUMN id SET DEFAULT nextval('tweets_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: wwojbfltraaycm
--

COPY active_admin_comments (id, resource_id, resource_type, author_id, author_type, body, created_at, updated_at, namespace) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wwojbfltraaycm
--

SELECT pg_catalog.setval('active_admin_comments_id_seq', 1, false);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: wwojbfltraaycm
--

COPY admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, first_name, last_name) FROM stdin;
2 chris@cirillohooper.com $2a$10$at.inB3G9eGssyu1Ray9yeZS1fIUajAgHdwjwO6fPqacLnH5/jzbm  4043795ba51220871c1bb80b01a13c5a70062b8d6913f4422297eb13449c6fe2014-06-02 04:57:24.59086  2014-02-17 22:16:38.951452  2 2014-02-17 22:16:39.015658  2013-11-27 02:37:29.296181  119.225.101.156 119.225.101.156 2013-11-27 02:23:15.912317  2014-06-02 04:57:24.59311 \N  \N
3 michael@brandycontent.com $2a$10$TKtG37XL6T964Q6mQpGEN.TtPGrFnp/Fk.llmWf6cy4QhsAVM2/sW  \N  \N  \N  4 2015-01-21 21:28:54.915881  2014-08-05 23:59:59.013594  139.216.99.68 202.58.203.82 2013-11-27 02:23:38.392532  2015-01-21 21:28:54.925161  \N  \N
4 pauldaly@internode.on.net $2a$10$StzAcur67u9VYUAHOR0aluCPFAM6oKzssj7REyOodYl/JGSI1W4Ri  \N  \N  \N  0 \N  \N  \N  \N  2013-11-27 02:24:00.665094  2013-11-27 02:24:00.665094  \N  \N
\.


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wwojbfltraaycm
--

SELECT pg_catalog.setval('admin_users_id_seq', 4, true);


--
-- Data for Name: blog_posts; Type: TABLE DATA; Schema: public; Owner: wwojbfltraaycm
--

COPY blog_posts (id, title, body, admin_user_id, created_at, updated_at, blogger_id) FROM stdin;
\.


--
-- Name: blog_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wwojbfltraaycm
--

SELECT pg_catalog.setval('blog_posts_id_seq', 1, false);


--
-- Data for Name: bloggers; Type: TABLE DATA; Schema: public; Owner: wwojbfltraaycm
--

COPY bloggers (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, first_name, last_name, provider, uid, oauth_token, oauth_expires_at) FROM stdin;
\.


--
-- Name: bloggers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wwojbfltraaycm
--

SELECT pg_catalog.setval('bloggers_id_seq', 1, false);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: wwojbfltraaycm
--

COPY categories (id, name, size, cat_class, created_at, updated_at) FROM stdin;
1 Networking  \N  networking  2013-09-10 01:26:21.397699  2013-09-10 01:26:21.397699
2 Industry education  \N  industry_education  2013-09-10 01:26:21.732738  2013-09-10 01:26:21.732738
3 Formal education  \N  formal_education  2013-09-10 01:26:21.782296  2013-09-10 01:26:21.782296
4 Incubator or Accelerator  \N  incubator_or_accelerator  2013-09-10 01:26:22.084927  2013-09-10 01:26:22.084927
5 Coworking space \N  coworking_space 2013-09-10 01:26:22.29363 2013-09-10 01:26:22.29363
6 Government funding  \N  government_funding  2013-09-10 01:26:22.423473  2013-09-10 01:26:22.423473
7 Equity Investor \N  equity_investor 2013-09-10 01:26:22.597625  2013-09-10 01:26:22.597625
8 Advisory service  \N  advisory_service  2013-09-10 01:26:23.201026  2013-09-10 01:26:23.201026
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wwojbfltraaycm
--

SELECT pg_catalog.setval('categories_id_seq', 8, true);


--
-- Data for Name: contact_messages; Type: TABLE DATA; Schema: public; Owner: wwojbfltraaycm
--

COPY contact_messages (id, name, email, message, created_at, updated_at) FROM stdin;
16  Andrea Mendiola andreamendiola@kickstartsalesforce.com  Good day! \r\n\r\nI wanted to check in on you to see if you are currently considering outsourced lead generation & appointment setting services for business development. \r\n\r\nHere at Kick Start, we provide telemarketing solutions that are specialized for your industry. What we do is contact a list of your targeted prospects (based on your criteria). Then, we pre-qualify interested potential clients, and set them an appointment with you to close business deals. \r\n\r\nDo you have a time this week for a quick chat to discuss further with our sales rep? I'll also understand if there's no current need. \r\nInterested to hear your thoughts.\r\n\r\n\r\nSincerely,\r\n\r\nAndrea Mendiola\r\n8883949722\r\nandreamendiola@kickstartsalesforce.com\r\n\r\n\r\n  2014-03-28 02:06:56.846807  2014-03-28 02:06:56.846807
2 Michael michael@brandycontent.com Testing message facility  2013-11-25 01:26:04.658782  2013-11-25 01:26:04.658782
3 Michael michael@brandycontent.com Test email  2013-11-25 05:27:37.743703  2013-11-25 05:27:37.743703
4 Tom Willis  tom.willis@gettyimages.com  Hi there,\r\n\r\nPlease to meet you, hoping you’re having a good day!\r\n\r\nI’d like to speak to somebody about promoting iStock & Thinkstock image offers to your members. We’d like to provide exclusive offers to add further value to your associated startups.\r\n\r\nIs this something that would be of interest? Please feel free to contact me on (02) 9004 2217 or email to discuss.\r\n\r\nThanks,\r\nTom  2013-12-12 06:37:49.972908  2013-12-12 06:37:49.972908
5 Scott scott@t2vc.com  great site for SA, I like the way you have visually displayed key actors in the SA ecosystem.  I your windows 8 gui.  2013-12-18 07:21:45.946572  2013-12-18 07:21:45.946572
6 Justin w  pjustin@gerullo.com Hey there, \r\n \r\nI was doing my regular online research and noticed your site www.startupadelaide.com.au isn't as high up in the rankings as it could be, plus it has some CSS/HTML errors. \r\n \r\nFixing these errors alone would increase your Google rankings a little. Here's a report of errors on your site: \r\n \r\nhttp://validator.w3.org/check?uri=www.startupadelaide.com.au \r\n \r\nI have been an SEO/Web Design expert for the past 5 years - based in Dallas, Texas and have started to provide services at a big discount at the moment to get my public portfolio together (in comparison to any downtown B2B SEO company which tends to be more glamour and glitter than any actual rankings or sales increase). If you're looking to grow in 2014 - I'm confident I can rank you page 1 for any keyword to increase visitors to your site, to increase your leads and sales significantly within 1-3 months and keep you there for years to come. \r\n \r\nHere are a few examples of google.com rankings in United States for your reference - all have been ranking for 6+ months now: \r\n \r\nhttp://serpbook.com/serp/?viewkey=78rn6c4&auth=297e5e235ce36fa5b2afe26b1034f3d9&client=1 \r\n \r\nhttp://serpbook.com/serp/?viewkey=zyn5i44&auth=f06789ae60466fbe309f3c1570204127&client=1 \r\n \r\nIf interested, please contact me back at justin@gerullo.com so we can set up a quick consultation of your website and your current search engine/keywords ranking goals! \r\n \r\nAll the best \r\nJustin Gerullo 2014-01-04 00:32:14.056649  2014-01-04 00:32:14.056649
7 Charlestire hettie.gallagher1@aol.com <img>http://i.imgur.com/rD8koPj.jpg</img> <a href=http://ordercheapestviagranow.com/#btflp>cheap viagra generic best price</a> - <a href=http://ordercheapestviagranow.com/#xnmdx >canadian pharmacy viagra</a> , http://ordercheapestviagranow.com/#ucnzn buy viagra online  2014-01-10 21:57:51.064047  2014-01-10 21:57:51.064047
8 Charlestire hettie.gallagher1@aol.com <img>http://i.imgur.com/rD8koPj.jpg</img> <a href=http://ordercheapestviagranow.com/#xztft>cheap viagra 50 mg</a> - <a href=http://ordercheapestviagranow.com/#kecgb >viagra 25 mg</a> , http://ordercheapestviagranow.com/#avzld cheap viagra generic best price 2014-01-10 22:08:28.991565  2014-01-10 22:08:28.991565
9 Faith Sy  faithsy@kickstartsalesforce.com Good day! \r\n\r\nI wanted to check in on you to see if you are currently considering outsourced lead generation & appointment setting services for business development. \r\n\r\nHere at Kick Start, we provide telemarketing solutions that are specialized for your industry. What we do is contact a list of your targeted prospects (based on your criteria). Then, we pre-qualify interested potential clients, and set them an appointment with you to close business deals. \r\n\r\nDo you have a time this week for a quick chat to discuss further with our sales rep? I'll also understand if there's no current need. \r\n\r\nInterested to hear your thoughts.   2014-01-14 01:04:32.207856  2014-01-14 01:04:32.207856
17  john@hotmail.com  6tdl0H http://www.QS3PE5ZGdxC9IoVKTAPT2DBYpPkMKqfz.com  6tdl0H http://www.QS3PE5ZGdxC9IoVKTAPT2DBYpPkMKqfz.com  2014-04-02 01:09:05.59583 2014-04-02 01:09:05.59583
18  john@hotmail.com  w029id http://www.QS3PE5ZGdxC9IoVKTAPT2DBYpPkMKqfz.com  w029id http://www.QS3PE5ZGdxC9IoVKTAPT2DBYpPkMKqfz.com  2014-04-02 02:50:15.76841 2014-04-02 02:50:15.76841
12  hotvfhpf@sukfmonq.com , <a href="http://stargatelegacy.net/">Play pokies online</a>,  %-(,  , <a href="http://stargatelegacy.net/">Play pokies online</a>,  %-(,  2014-02-12 11:27:35.140703  2014-02-12 11:27:35.140703
13  rmxmaphy@ucetmfta.com No, I'm not telling you what most of the investigations., <a href="http://paydayloansuk1.com/">UK Pay Day Loans</a>,  566,  No, I'm not telling you what most of the investigations., <a href="http://paydayloansuk1.com/">UK Pay Day Loans</a>,  566,  2014-02-13 21:00:38.957234  2014-02-13 21:00:38.957234
14  uoylhudf@iydboumt.com And that would ensue, surely if banks have merged, taken over and the Moon Landing., <a href="http://buyphen375australia.com">Phen375 Discount</a>,  4301, <a href="http://phen375doesitwork.net">Buy Phen375</a>,  :P,   And that would ensue, surely if banks have merged, taken over and the Moon Landing., <a href="http://buyphen375australia.com">Phen375 Discount</a>,  4301, <a href="http://phen375doesitwork.net">Buy Phen375</a>,  :P,   2014-02-16 16:02:33.034667  2014-02-16 16:02:33.034667
15  Matthew Greenrod  matthew@garagesalesinsa.com Looking forward to working more closely with Adelaide start up.   2014-02-17 04:42:46.317738  2014-02-17 04:42:46.317738
19  Amanda Wood amanda.wood@industry.gov.au Hi Chris\r\n\r\nIt was good to meet you last night and hear of your success as a mentor.  \r\n\r\nI've had a look at your website and am very impressed! A group in the Riverland is looking to do something similar to connect groups and resources in that region.\r\n\r\nI'd love to catch up some time and hear more about startupadelaide. Let me know if you're free for a coffee some time. (Week after next looks reasonable for me).\r\n\r\n(PS you may like to consider adding Enterprise Connect as one of the Government programs listed.)\r\nCheers\r\nAmanda  2014-04-03 20:03:34.378633  2014-04-03 20:03:34.378633
20  p---- axsiizo@gmail.com Hi there, i would like 2 join ur community & get sum gr8 ideas...\r\neach time i press on2 a link it sends a blocked page !\r\nKindest Regards. 2014-04-16 03:21:40.677132  2014-04-16 03:21:40.677132
21  Amy Griffiths amyg@talentinternational.com.au Hi,\r\n\r\nI am contacting you about our awards program targeted to entrepreneurs that may be of interest to you and contacts.\r\n\r\nWe are on the hunt for Start-Up entrepreneurs, innovators and leaders across Australia, New Zealand and Asia to enter the 2014 Talent Unleashed Awards. \r\n\r\nJudges include global icons such as; Sir Richard Branson, Founder of Virgin Group & Steve Wozniak, Co-founder of Apple Inc. \r\n\r\nWinners go to the Centre for Entrepreneurship in South Africa where they will learn about business innovation and entrepreneurship. \r\n\r\nI think it is a great program and I strongly believe it is very important to the future of the world's economy that we celebrate individuals and encourage/ inspire others to be entrepreneurial. \r\n\r\nI look forward to hearing from you. \r\n\r\nRegards \r\n\r\nAmy \r\namyg@talentinternational.com.au \r\n\r\nwww.talentunleashed.co\r\n  2014-04-23 05:46:53.638144  2014-04-23 05:46:53.638144
22  zahiqhajgn  uwafjgltso@zmfhwl.com fkohstubsuvqbefmbjef, <a href="http://www.dvmgueeifm.com/">dofeukvfcj</a> , [url=http://www.dlykktsrcr.com/]xfnhcgoxmq[/url], http://www.riiflhqkvv.com/ dofeukvfcj 2014-04-30 21:50:56.568709  2014-04-30 21:50:56.568709
23  npzxtsmgxr  uaxmlsrosr@dmryle.com gzmygtubsuvqbefmbjef, <a href="http://www.wxscxvnidm.com/">vyfegbtids</a>   2014-05-02 23:19:04.101935  2014-05-02 23:19:04.101935
24  wjopdhxnuj  meokeweike@hmcuny.com rfyowtubsuvqbefmbjef, <a href="http://www.bqulesdfhk.com/">zihzibkhqx</a>   2014-05-04 20:43:55.793537  2014-05-04 20:43:55.793537
25  Angela Green  agreen@team-expedite.com  To the Owner,\r\n\r\nI'm Angela of Team-Expedite, a lead generation and appointment setting company. I’d like to know if you’re looking to get more clients?\r\n\r\nOur campaigns involve cold calling (telemarketing) combined with email blasts and Linkedin networking. We can contact decision-makers that meet your criteria, introduce your services and prequalify them. Interested prospects are referred to you for a formal presentation by phone or face to face appointment.\r\n\r\nI can book a 15 min call with our sales rep so you can learn more about this. What’s a good day and time, and the number to reach you?\r\n\r\nSincerely,\r\n\r\nAngela Green\r\n\r\nMarketing Department\r\n\r\nagreen@team-expedite.com\r\n\r\nFor more information:\r\n\r\ncall me at 888.674.0139\r\n\r\nor book a call: www.team-expedite.com/contact-us  2014-05-05 03:16:29.184776  2014-05-05 03:16:29.184776
26  dhmxysuuve  duhgzqslda@truejk.com morortubsuvqbefmbjef, http://www.btqfmovaci.com/ aiojfxugmj   2014-05-05 16:53:54.611548  2014-05-05 16:53:54.611548
27  shane wescott shane_wescott@hotmail.com Hi Guys\r\n\r\nLove the idea of the site. I am hosting an event in Adelaide 15th may at the St Marks College Boardroom and wanted to get the word out to Entrepreneurs.\r\n\r\nIf you could let me know if that is possible through your contacts that would be excellent.\r\n\r\nRegards\r\n\r\nShane\r\n\r\n0413 578 587  2014-05-06 20:29:09.188261  2014-05-06 20:29:09.188261
28  Michael m.dawson@y7mail.com This is a test. 2015-01-20 00:38:05.341507  2015-01-20 00:38:05.341507
29  mrbyezjotw  crgbvifwuj@lptknt.com eymvgtubsuvqbefmbjef, <a href="http://www.zgrijybzhk.com/">obqnouskdj</a> , [url=http://www.chwtdtsekl.com/]uqtvdpvnrm[/url], http://www.qcvztlmcrx.com/ obqnouskdj 2015-01-22 04:09:14.210171  2015-01-22 04:09:14.210171
30  zewprhyxul  djvhxmvlgl@stgtwx.com alqbitubsuvqbefmbjef, <a href="http://www.oallwphlrl.com/">boebqdmajv</a> , [url=http://www.gnxtyeatut.com/]covhxmapkm[/url], http://www.gcdayegysx.com/ boebqdmajv 2015-01-24 13:07:58.439851  2015-01-24 13:07:58.439851
31  bptfhemsqi  nxeyxcosxs@qxvszi.com rbbfitubsuvqbefmbjef, <a href="http://www.mrskzfsuaa.com/">scwjariukf</a>   2015-01-27 02:40:52.843217  2015-01-27 02:40:52.843217
32  Tammy Johnston  Tammy.johnston@smvgroup.com.au  Hi there,\r\n\r\nI work for an advertising agency and my client Beyond Bank is looking at offering some Small business Grants out to eligible applicants and were wondering if you offer any advertising opportunities to do so?\r\n\r\nDo you have weekly newsletters/EDM's that are sent out listing these types of opportunities? \r\n\r\nIf someone can please get in touch with me with rates by 12pm 29/01/15 it would be greatly appreciated!!\r\n\r\nWarm regards,\r\n\r\nTammy 2015-01-28 05:58:55.568682  2015-01-28 05:58:55.568682
33  ksjcwoarnt  mlagdyodlz@dopwpy.com dnllztubsuvqbefmbjef, <a href="http://www.dswsuqfcwt.com/">mwcokdyroz</a>   2015-01-30 01:03:44.64954 2015-01-30 01:03:44.64954
34  ashok bondiliashok@gmail.com  I want to create start up 2015-01-30 20:23:23.907666  2015-01-30 20:23:23.907666
35  mbdbjiuvls  qafqbllokx@hsyrst.com zkjzktubsuvqbefmbjef, http://www.nuqgpvrqlf.com/ mciknuwxwb   2015-01-31 08:24:15.283057  2015-01-31 08:24:15.283057
36  Tara Wright tara@nviflinders.com.au Hello\r\n\r\nAre you able to please update our event listing for Entrepreneurs in Conversation - Frank Seeley. The listing currently has the dat as February 4. Due to circumstances beyond our control we need to change the date to February 10. \r\nThank you very much\r\nTara  2015-02-02 01:25:33.412247  2015-02-02 01:25:33.412247
37  aewibcxgng  aheaybzlsb@qtyjup.com rpxpptubsuvqbefmbjef, http://www.ikilzmnzhq.com/ jgryhbzkvy   2015-02-03 07:27:08.967767  2015-02-03 07:27:08.967767
38  Greg  greg@arabanastudio.com.au I am seeking business planning advice from a business advisor. Perhaps you could contact me on 0422234039.  2015-02-08 23:31:43.222975  2015-02-08 23:31:43.222975
39  Vincent Tarzia MP - Member for Hartley  Kerry.Kerr@parliament.sa.gov.au I wish to make an appointment for Vincent to visit your organisation (Startup Adelaide).\r\nI would appreciate if someone would contact me.\r\n\r\nKerry  8365 1341 2015-02-10 06:45:31.26546 2015-02-10 06:45:31.26546
40  Nicole DeVries  ndevries@salisbury.sa.gov.au  Hi,\r\nI am part of The Polaris Centre - Rob Chisholm was told last night at an event that we could get on your website. How can we do this? What information do you need?\r\nwww.polariscentre.com.au\r\n\r\nThanks  2015-02-11 05:59:29.982001  2015-02-11 05:59:29.982001
41  Arabella Gutierrez  gutierrezarabellab2b@gmail.com  Good Day , \r\n\r\nI've come across your LinkedIn profile and wanted to know if you are considering outsourced lead generation and appointment setting solutions for business development. \r\n\r\nWe bring you telemarketing solutions that are fine- tuned according to your needs. We have industry specific agents who have extensive experience prospecting for your industry. They reach to your targeted market and set appointments with interested prospects so it would be easy for your salespeople to close business deals. \r\n\r\nIf it makes sense to talk, how does your calendar work?Please let me know the best time to talk and your direct number, or you can book here: bit.ly/1sbnXpc\r\n\r\nAll the best, \r\n\r\n-Arabella Gutierrez\r\n-B2B Marketing Professional\r\n-gutierrezarabellab2b@gmail.com\r\n-B2B-Sales Prospects\r\n-310-807-0907\r\nhttp://b2bsalesprospects.com/ 2015-02-17 17:54:27.888103  2015-02-17 17:54:27.888103
42  ankit shah  ankit@visionsoftech.com Dear Chris, Orren,\r\n\r\nGood afternoon! And how are you doing today? :)\r\n\r\nI tried to contact just but you were away! Could you please confirm the receipt of my below company profile? Also, did you’ve good-time to go through that?\r\n\r\nThen please let us know, which type of any size-potential project you’ve like {website development, any CMS & software app.-design / mobile apps. development/ web design, re-design / SEO- SEM & flash- flex related work}?\r\n\r\nNote: We are not spammers and are against spamming of any kind. If you are not interested then you can reply with a simple \\"NO\\", We will never contact you again.\r\n 2015-02-27 02:11:54.612349  2015-02-27 02:11:54.612349
43  Douglas Fahlbusch drfahlbusch@perioperative.com.au  Interested in LEAN startup group\r\nGreat work on the site  2015-03-04 00:33:00.607455  2015-03-04 00:33:00.607455
44  viagrabelgiquefr@gmail.com  http://www.viagrabelgiquefr.com/  http://www.viagrabelgiquefr.com/  2015-03-24 11:48:20.222475  2015-03-24 11:48:20.222475
45  Glynn Jones marketing@brandsouthaustralia.com.au  Good Afternoon,\r\n\r\nI am from Brand South Australia. We are getting ready to launch a brand new blog called "Inside South Australia". The Blog aims to engage and inform local and ex-pat South Australian (citizens, entities, media, government) about their State, as well as to promote 'what's on' in South Australia to our visitors.\r\n\r\nThe Blog will be the positive voice of South Australia, highlighting our strengths, achievements, news and events across the State's key customer sectors. \r\n\r\nWe want to promote South Australia as the creative, innovative and industrious State that we already know we are. \r\n\r\nThe help us get ready for our launch we are looking for some interesting stories that might not have been told. If you have any great start up success stories we would love to hear them.\r\n\r\nThank you in advance for your time. I look forward to hearing from you soon. \r\n\r\nKind regards,\r\n\r\nGlynn  2015-03-25 04:59:12.449262  2015-03-25 04:59:12.449262
46  arexrs@ekcyum.com I8Yqkx  <a href="http://kxveyzslpeek.com/">kxveyzslpeek</a>, [url=http://fmlfftkdlzsp.com/]fmlfftkdlzsp[/url], [link=http://vspymmorifgx.com/]vspymmorifgx[/link], http://cuyuwruodukd.com/ I8Yqkx  <a href="http://kxveyzslpeek.com/">kxveyzslpeek</a>, [url=http://fmlfftkdlzsp.com/]fmlfftkdlzsp[/url], [link=http://vspymmorifgx.com/]vspymmorifgx[/link], http://cuyuwruodukd.com/ 2015-03-28 05:29:33.730441  2015-03-28 05:29:33.730441
47  Zuben Rustomjee zuben.rustomjee@impactinvestingaustralia.com  I firstly wanted to say this is very well done! \r\n\r\nMy name is Zuben and I am currently working with Impact Investment Australia on a project to map the current social entrepreneurial eco-system for Australia as a whole and was hoping to have a chat to someone about the work you have done. \r\n\r\nI would really appreciate someone to email me back so I can have a chat in greater detail.   2015-03-31 04:15:26.993313  2015-03-31 04:15:26.993313
48  Anthony apowell5976@yahoo.ca  I really recommend you check out ValuedVisits. They have traffic in over a hundred niches like music, books, dieting, politics and news, gardening, technology, everything! And you can choose from 45 countries that they have the traffic of those niches in. If it's not available - they refund you, but if it's not available, they don't have it on the order on their page in the first place. Look here: http://valuedvisits.com/ \r\n \r\nIf you want to quick-start your blog, get more viewers for your new song or short story - or just need more visitors that would want to read www.startupadelaide.com.au - use http://valuedvisits.com/ \r\n \r\nGive it a shot - trying one new thing per month to improve your site is how you make it huge by 2016!  2015-04-01 09:09:55.484846  2015-04-01 09:09:55.484846
49  Paul Heithersay Paul. Heithersay@sa.gov.au  Interested in seeing how the Department of State Development can help 2015-04-16 23:19:26.760879  2015-04-16 23:19:26.760879
50  klark2d4@gmail.com  dO2Hti http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com  dO2Hti http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com  2015-05-03 21:41:17.385229  2015-05-03 21:41:17.385229
51  klark2d4@gmail.com  xf2j6O http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com  xf2j6O http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com  2015-05-04 00:50:45.098773  2015-05-04 00:50:45.098773
52  abwlxglslf  bysxujprvf@irglot.com qgzsitubsuvqbefmbjef, <a href="http://www.chtpawdxvu.com/">cplcpxgubl</a> , [url=http://www.cseqkrlfvl.com/]lpmohwlrqy[/url], http://www.gfwdmtqyuk.com/ cplcpxgubl 2015-05-12 02:14:55.165121  2015-05-12 02:14:55.165121
53  yhxenjzvvm  bwfckfgpgd@mvaqlq.com nfoektubsuvqbefmbjef, <a href="http://www.jpkmvdfrog.com/">wbquqsvnlb</a> , [url=http://www.qqkzoywvls.com/]cqgyqckzdq[/url], http://www.ikrcojjicl.com/ wbquqsvnlb 2015-05-14 16:00:19.316948  2015-05-14 16:00:19.316948
54  sliemlzjmd  rscxpghvhk@yebogs.com jfnzitubsuvqbefmbjef, <a href="http://www.xycgpjxqti.com/">yklruvddzm</a> , [url=http://www.stqfenupvw.com/]megxczciiu[/url], http://www.yonulzyatg.com/ yklruvddzm 2015-05-17 05:07:59.718166  2015-05-17 05:07:59.718166
55  xlbzafhfwl  goxudoxrgk@dmmhuq.com lraevtubsuvqbefmbjef, <a href="http://www.chxmwfzhnb.com/">jxlmhsipii</a> , [url=http://www.xpwfgcwnvn.com/]flppllaisl[/url], http://www.qkkutcivvp.com/ jxlmhsipii 2015-05-19 14:11:10.665558  2015-05-19 14:11:10.665558
56  eqxweiibvi  kxptlmwldx@xcfrok.com mxysctubsuvqbefmbjef, <a href="http://www.ihfuzajjtp.com/">dqecsaqzoo</a>   2015-05-20 10:56:42.641013  2015-05-20 10:56:42.641013
57  htoajdcugl  zzxiqsstoi@wwfpsq.com hxzeqtubsuvqbefmbjef, http://www.ubozjysmwi.com/ yurirdwskr   2015-05-23 10:10:17.851647  2015-05-23 10:10:17.851647
58  rroxrjzshl  osqoyflesp@vrzsdr.com kbduptubsuvqbefmbjef, http://www.uydtjjsdnw.com/ antaiizzpw   2015-05-25 23:18:34.166871  2015-05-25 23:18:34.166871
59  htjpxzglew  hikscdljop@qrithl.com wufsjtubsuvqbefmbjef, http://www.dgonjlyvbn.com/ tiemhfoeos   2015-05-28 08:17:37.006773  2015-05-28 08:17:37.006773
60  mgkousqpqy  smkdyrcffp@hqtnbt.com kihywtubsuvqbefmbjef, http://www.qyyvnbfxhi.com/ adkaeioizw   2015-05-30 16:46:43.092763  2015-05-30 16:46:43.092763
61  qgokpxhqjw  vockknrbzl@awdqak.com innuutubsuvqbefmbjef, http://www.abmsyimcrh.com/ vmdmwyivov   2015-06-02 01:28:42.115472  2015-06-02 01:28:42.115472
62  cscvgvogwm  aqvdyiwzym@azrymi.com sdqbytubsuvqbefmbjef, http://www.qyvhjkkzwa.com/ gkafcuoizl   2015-06-04 10:55:38.583223  2015-06-04 10:55:38.583223
63  zqbjhzqypg  alrjthczct@tbggwr.com zvdettubsuvqbefmbjef, http://www.defoagepsq.com/ xfyzoiwbny   2015-06-06 19:22:58.045168  2015-06-06 19:22:58.045168
64  dncnewxdyt  sodwoiucyp@xmzpgj.com sgrjftubsuvqbefmbjef, http://www.acjwnzlppy.com/ jgynkzczse   2015-06-09 03:51:32.613022  2015-06-09 03:51:32.613022
65  Elane Johnson elane@kssalesforce.com  Hello there,\r\n\r\n\r\nI wanted to check in on you to see if you are currently considering lead generation & appointment setting services to help you win new clients.\r\n\r\nKick Start Sales Force can provide solutions for lead generation, stick with new business ventures, better market positioning and place a strong focus on quality leads.\r\n\r\nOur team of professional appointment setters would make calls to potential clients, qualify them and present your products and services to generate interest in your company and speed up sales growth.\r\n\r\nDo you have a time this week for a quick chat to discuss further with our sales rep? What would be the best number and time to reach you? I'll also understand if there's no current need.\r\n\r\nInterested to hear your thoughts.\r\n\r\nWarm Regards,\r\nElane Johnson | KSSF\r\nE: elane@kssalesforce.com\t\t\r\nTalk to our rep today! 888.394.9722  2015-06-11 02:35:31.968413  2015-06-11 02:35:31.968413
66  Harry Dubois  harrydubois22@gmail.com Dear Start Up Adelaide,\r\n\r\nI am writing to give you an update in regards to Innovyz. Can you please update your website to include our current information? We no longer run the ANZ InnovyzSTART program but instead offer a 9-month Innovyz incubator and accelerator program. Some key information about the program:\r\n\r\n•\tRuns for 9-months \r\n•\tIntakes occur every 3 months\r\n•\tEach intake focuses on a different industry, upcoming industries include advanced manufacturing, resources, energy, water, agri-business and applied technology\r\n•\tLocated at Tonsley and partnered/located with Co-Hab, a modern co-working space\r\n \r\n More information can be found on our website www.innovyz.com. Thank you so much for endorsing our program. \r\nIf you have any further questions on queries don’t hesitate to contact me at harrydubois22@gmail.com.  \r\n\r\nYours respectfully, \r\nHarry Dubois\r\n  2015-06-15 05:44:30.516539  2015-06-15 05:44:30.516539
67  Carla  Berner carlabrener@explainyourpitch.com  Hi! I was on your website, and I gotta say I was impressed. My company explainyourpitch.com helps companies explain their pitch and value proposition in under 90 seconds - via amazing homepage explainer videos, investor pitches, viral videos, and how-to explanations. Check out my site www.explainyourpitch.com or Email me at Carla@explainyourpitch.com. Have a great day! Thanks, Carla Berner  2015-06-27 05:03:56.114134  2015-06-27 05:03:56.114134
68  Jemma Smith   jemma.k.smith@gmail.com Hi, I am a recent law graduate and was looking at getting involved in the startup community in Adelaide. Do you have any need for volunteers generally or for specific start ups? I think this is a really exciting space with a lot of great ideas and businesses growing out of Adelaide, and I would love to help them. \r\n\r\nThanks\r\nJemma  2015-07-14 05:40:00.389045  2015-07-14 05:40:00.389045
69  Nicola Gage gage.nicola@abc.net.au  Hi there! My name is Nicola. I'm a TV reporter for ABC News in Adelaide. I was hoping someone from your organisation can give me call? Just wanted to pick your brain about start-up businesses in Adelaide. My contact is 83434707 or 0421469733. \r\nKind regards, \r\nNicola2015-07-16 00:03:26.606527 2015-07-16 00:03:26.606527
70  Adam Hussain  adamwhosane@gmail.com Hi startup adelaide,\r\n\r\nI was wondering if you guys have any internship opportunities during the summer holidays? (Dec 2015- Feb 2016)\r\nI'm really keen on joining. A reply would be much appreciated.\r\n\r\nThank you.  2015-07-19 08:07:11.622308  2015-07-19 08:07:11.622308
71  Matt Cleggett m.p.cleggett@gmail.com  Hi, I currently have a business in the Northern Suburbs of Adelaide., I'm looking for mentorship and/or a communitee where I can exchange and bounce ideas off/with others. Can startupadelaide help me with this?  2015-07-19 09:02:10.105974  2015-07-19 09:02:10.105974
72  manoj info@ranksindia.com HI Sir/Madam\t\r\nCan you outsource some SEO business to us? We will work according to you and \r\nyour clients and for a long term relationship we can start our SEO services in \r\nonly $99 per month per website.\r\nLooking forward for your positive reply\r\nThanks & regards\t\r\nmanoj\r\nPS:Humble request we are not spammers. We take hours to research on sites and \r\nkeywords to contact webmasters. If by sending this email we have made an offense \r\nto you or to your organization then we extremely apologize for the same. In \r\norder to stop receiving such emails from us in future please reply with “Remove \r\nor Not Interested” as subject line. Many thanks for having your kind look to our \r\nemail.\r\n 2015-08-06 07:29:04.830125  2015-08-06 07:29:04.830125
73  Reliana De Miza Reliana.DeMiza@dma-central.com  Hi there,\r\n\r\nBy any chance, are you interested in solutions for getting sales appointments and leads?\r\n\r\nDMA Central does so on multiple channels. Our package integrates phone, email and Linkedin marketing.\r\n\r\nThis results in a better chance of contacting prospects and setting up more meetings.\r\n\r\nYou get to work with dedicated lead generation experts, a vast contact database and an advanced CRM tool. All these combined expedite the lead generation process.\r\n\r\nOur Campaign Specialist can tell you more about how our solution works.\r\n\r\nIf you're open for a quick call to discuss, please send me the best day and time and your direct number.\r\n\r\nAlternatively, you can schedule a call online:\r\nhttp://www.dmacentral.com/schedule\r\n\r\n\r\nAll the best,\r\n\r\nReliana De Miza\r\nMarketing Executive\r\nReliana.DeMiza@dma-central.com\r\nDMA Central\r\nhttp://www.dmacentral.com\r\n866.920.5103\r\n 2015-08-14 04:17:01.646182  2015-08-14 04:17:01.646182
\.


--
-- Name: contact_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wwojbfltraaycm
--

SELECT pg_catalog.setval('contact_messages_id_seq', 136, true);


--
-- Data for Name: nodes; Type: TABLE DATA; Schema: public; Owner: wwojbfltraaycm
--

COPY nodes (id, category_id, name, contact, street, city, created_at, updated_at, sponsor, description, owner, phone, champion, champion_contact) FROM stdin;
97  1 Entrepreneurs Organisation  \N  \N  \N  2013-09-10 03:13:33.790836  2013-09-28 04:58:11.65558 \N  The Entrepreneurs' Organization (EO) - for entrepreneurs only - is a dynamic, global network of more than 9,500 business owners in 40 countries. EO is the catalyst that enables entrepreneurs to learn and grow from each other, leading to greater business success and an enriched personal life.  \N  +61 419 922 250 Tim Seymour-Smith \N
66  1 Silicon Beach Adelaide  \N  \N  \N  2013-09-10 03:13:30.899801  2013-09-28 05:10:15.968736  \N  Silicon Beach Adelaide is an informal group for anyone interested in entrepreneurship, the interwebs and technology. The active mailinglist is at http://groups.google.com/group/silicon-beach-australia. \r\n\r\nNOTE: This group is NOT about Affiliate/MLM/Avon Lady Marketing. If you turn up and start dropping that junk on us we'll punch you in the nose. \r\n\r\nMeetings are hosted at the Majoran Distillery. Let's build!!  Community \N  \N  \N
130 1 Women in global business  \N  \N  \N  2013-11-27 02:13:18.690262  2013-11-27 02:13:18.690262  \N  Women in Global Business is a joint Australian, State and Territory Governments initiative which supports more businesswomen to take their products and services to the world. The Women in Global Business program aims to increase female participation in international trade and deliver greater economic benefit and job creation. To women in business, it offers a central source of information and resources, support and connection. South Australian business women are encouraged to register as members to benefit from the range of practical services and connections the program offers.  \N  \N  \N  \N
131 1 Startup grind \N  \N  \N  2013-11-27 02:14:44.108575  2013-11-27 02:14:44.108575  \N  Startup Grind is an event series and website designed to help educate, inspire, and connect local entrepreneurs. Each month we welcome an amazing speaker who shares their story with our community and tells us what worked, what didn't, and what they'll do differently next time. It's an amazing opportunity to learn from the best, network with other members of the startup community, and improve your chances of entrepreneurial success. \N  \N  \N  \N
132 1 EO Accelerator  \N  \N  \N  2013-11-27 02:17:28.760581  2013-11-27 02:17:28.760581  \N  The Entrepreneurs Organisation is a dynamic, global network of more than 9,500 business owners in 40 countries. Founded in 1987 by a group of young entrepreneurs, EO is the catalyst that enables entrepreneurs to learn and grow from each other, leading to greater business success and an enriched personal life.  \N  \N  \N  \N
129 1 1625  \N  \N  \N  2013-11-27 02:11:49.242554  2013-11-27 02:34:28.875626  \N  Coming in 2014, 1625 will be an information and inspiration portal for aspiring entrepreneurs in the 16-25 age group. Follow along with InBusiness magazine to find out more. \N  \N  \N  \N
133 8 Enterprise Adelaide \N  \N  \N  2014-02-17 22:20:08.613504  2014-02-17 22:24:53.751374  \N  Enterprise Adelaide is a city council initiative providing advice to small businesses and startups. \N  \N  \N  \N
65  1 Adelaide CleanTech Network  \N  \N  \N  2013-09-10 03:13:30.708964  2013-09-10 03:13:30.88094 \N  The Adelaide CleanTech Network (ACN) has been developed by Australian CleanTech to provide a forum for investors, companies, government and academia to meet, learn about the sector and collaborate. \n\nThe ACN will not be a profit making venture but rather provide a forum for the organising partners to increase their industry profile whilst providing a useful forum for industry participants. \n\nThe ACN has evolved into the single connection point in South Australia for those interested in the cleantech sector.  Australian CleanTech  +61 419 826 372\n \N  \N
134 7 Fat Hen \N  \N  \N  2015-01-30 01:21:44.485549  2015-01-30 01:39:00.931314  \N  Fat Hen is Australia’s first Equity Crowdfunding platform for retail investors in Australia. We are a crowd-backed venture capital company that brings together retail and wholesale investors to invest between $250,000 and $2m into private companies. It means your fans and existing customers can pool their capital to raise the funds needed by your company. There is no limit to the number of investors who can invest into your company starting with as little as $100.  \N  \N  \N  \N
67  1 Startup Weekend Adelaide  \N  \N  \N  2013-09-10 03:13:30.923823  2013-09-10 03:13:30.981559  Flinders University, BDO, Piper Alderman, Adelaide City Council and ANZ Startup Weekend is an intense 54 hour event which focuses on building a web or mobile application which could form the basis of a credible business over the course of a weekend. The weekend brings together people with different skillsets â primarily software developers, graphics designers and business people â to build applications and develop a commercial case around them. Whether entrepreneurs found companies, find a cofounder, meet someone new, or learn a skill far outside their usual 9-to-5, everyone is guaranteed to leave the event better prepared to navigate the chaotic but fun world of startups.  Come share ideas, form teams, and launch startups  Community \N  \N  \N
68  1 The Startup Club  \N  \N  \N  2013-09-10 03:13:30.997844  2013-09-28 05:09:30.377112  \N  The Startup Club Adelaide has a wide range of members from web designers and marketing consultants, to big business CEOs, politicians and futurists!\r\n\r\nEveryone is welcome (no experience or background is required) and there is no set agenda. Just join The Startup Club facebook group, turn up to some events and meet some great people!\r\n\r\nMore than handshakes and business cards\r\nBuild relationships and teamwork skills at laser skirmish. Get feedback on your business pitch over a beer and burger. Climb Mt Lofty with top CEOs and attend business lectures in the middle of a vineyard. We hate boring, stale business networking events and so do you. That's why you'll love The Startup Club.\r\n  \N  408809754 \N  \N
69  1 Mobile Monday \N  \N  \N  2013-09-10 03:13:31.043751  2013-11-08 05:10:14.06422 AIMIA and MEGA  Mobile Monday (MoMo) is an open community platform of mobile industry visionaries, developers and influential individuals fostering brand neutral cooperation and cross-border P2P business opportunities through live networking events to demo products, share ideas and discuss trends from both local and global markets. Originating in Helsinki Finland, in 2000, activities are organised by some 300 dedicated volunteers from around the world and has become an industry leading mobile platform in over 140 cities worldwide . Mobile Monday Adelaide meets every third Monday (at the Seven Stars Hotel in Angus Street). Community \N  \N  \N
71  3 Entrepreneurship, Commercialisation and Innovation Centre (ECIC)  \N  \N  \N  2013-09-10 03:13:31.276344  2013-11-08 05:05:40.480837  \N  The ECIC fosters a flexible, productive and enthusiastic learning environment; our degrees and courses attract recent university graduates and experienced professionals from all discipline backgrounds.The ECIC offers coursework and research degrees in the areas of Innovation and Entrepreneurship, Commercialisation and Project Management.  Degrees are designed for busy professionals who want access to leading edge knowledge whilst being fully engaged in the process of entrepreneurship, project management and/or commercialisation.\r\n  University of Adelaide  +61 8 8313 7422 \N  \N
70  2 SA Young Entrepreneur Scheme (SAYES)  \N  \N  \N  2013-09-10 03:13:31.073114  2013-11-08 05:11:30.913355  Newmont Australia and University of SA  The South Australian Young Entrepreneur Scheme (SAYES) aims to provide young South Australians with the skills and confidence to develop and implement their business ideas. SAYES provides a series of workshops over the course of a year (one per month - evenings only) for participants to help build their business skills. Each workshop is presented by an expert in their field. A key component of the SAYES program is matching each participant with an experienced business mentor. These skilled business people volunteer their time to provide guidance through their own extensive business and professional expertise.\r\n  Business SA +61 8 8300 0271 \N  \N
73  2 MEGA  \N  \N  \N  2013-09-10 03:13:31.636565  2013-11-08 05:04:56.21435 Various digital media companies and the SA Government (DFEEST)  MEGA is for individuals and teams who would like to expand their creative, technical and business skills by creating new digital products and services for global markets. MEGA is an Entrepreneurship Masterclass series which takes participants from the mobile, digital content and ICT industries through an industry-driven development program in which participants form project teams and, guided by industry experts, develop and pitch new products and services to investors, buyers and business identities at a high profile Pitch Day.\r\n Industry/Community  +61 411 421 619 \N  \N
72  3 First Lego League \N  \N  \N  2013-09-10 03:13:31.392983  2013-09-10 03:13:31.555607  \N  Every September, FLL releases a Challenge, which is based on a real-world scientific topic. Each Challenge has two parts: the Robot Game and the Project.\n\nTeams of up to ten children (9-16 year olds), with one adult coach, participate in the Challenge by programming an autonomous robot to score points on a themed playing field (Robot Game) and developing a solution to a problem they have identified (Project).\n  An alliance between FIRST & The Lego Group  \N  \N  \N
74  2 The Social Enterprise Workshop  \N  \N  \N  2013-09-10 03:13:32.017789  2013-09-10 03:13:32.078988  \N  TSEW is a unique program for social entrepreneurs and innovators within the Not for Profit sector of Australia. TSEW is focused on enhancing and sustaining skills of participants by providing an experiential program based on effective business plans and projects being developed and presented to an audience. The program develops management and team-building skills which will impact on growth and development of both the participant and the participantâs organisation. \n\nThe Social Enterprise Workshop gives you access to:\n_\tLearn from Industry Leaders across a diverse range of NFP sectors\n_\tThe skills and knowledge to write your business or project plan\n_\tMentoring from industry experts\n_\tThe opportunity to present your idea to potential funding bodies and stakeholders\n CBB Community Consultin1300 284 364 \N  \N
75  3 ThincLab Commercialisation Accelerator  \N  \N  \N  2013-09-10 03:13:32.088468  2013-09-10 03:13:32.173532  \N  Are you nearing completion of your PhD or research Masterâs, have you thought about how you could commercialise your research and set up a viable entrepreneurial business that could make you money?\nOr are you a postgraduate student that has just finished working on a major assignment that you are proud of?  Have you thought about whether you could take what you have developed and turn this into a viable entrepreneurial business?\nCommercialise a Product, Service or Research\nThincLab Online Commercialisation Accelerator is a practical training initiative designed to equip budding entrepreneurs, interested in commercialising a product/service/research, with the skills and support to take their idea forward and develop it into a commercially viable business. \n  University of Adelaide  +61 8 8313 4159 \N  \N
76  3 Entrepreneurs' Challenge (eChallenge)   \N  Level 5, Nexus 10 Building, 10 Pulteney Street  Adelaide  2013-09-10 03:13:32.188455  2013-09-10 03:13:32.256802  \N  The Entrepreneursâ Challenge (eChallenge) is a student business planning competition run by the Entrepreneurship, Commercialisation and Innovation Centre (ECIC) at the University of Adelaide.\n\nParticipants engage in a stimulating education process including:\n_\tA series of specialised workshops conducted by experts in different fields\n_\tThe opportunity to work with dedicated business mentors\n_\tConnection with members of the business and academic community\n\nMany participants have gone on to found successful businesses, proving that the eChallenge can create genuine commercial prospects which help South Australia flourish.\n\nThe winner of the eChallenge gains exclusive entry to represent Australia in the Global Venture Labs Investment Competition (the 'Superbowl' of investment competitions in the USA) and with it a trip to Austin texas to compete. \n\n  University of Adelaide  +61 8 8313 7131Zrinka Tokic \N
77  2 Venture Dorm  \N  \N  \N  2013-09-10 03:13:32.273905  2013-09-10 03:13:32.330133  Flinders Partners Have a Business Idea and Need Support or Resources To Make Your Dream a Reality?\n\nVenture Dorm is a startup entrepreneurs education program set to commence in 2013 coming out of Flinders Universityâs commercialisation company, Flinders Partners. The emphasis will be very much on the practical, rather than the theoretical and will include a field trip to Texasâs start-up hub, Austin.\n \N  +61 8 8201 7743 \N  \N
78  4 Business SA Coaching and Mentoring Program  \N  \N  \N  2013-09-10 03:13:32.352676  2013-09-10 03:13:32.514651  SA Govt (DMITRE)  Are you looking for expertise on how to grow your business?  \n\nThe Business SA Coaching and Mentoring Program can help you do just that!\nBusiness SA in conjunction with the Department for Manufacturing, Innovation, Trade, Resources and Energy runs a ten month Coaching and Mentoring Program that provides you with access to expertise on how to grow your business and increase profitability._\nEntry to the program is competitive with a limited number of places available.\nTo be eligible for entry to the program you must:\n. be based in South Australia\n. be an established business in operation for at least two continuous years\n. have annual turnover greater than $300,000\n. be committed to improving and growing your business  Business SA +61 8 8300 0270\n \N  \N
80  4 ThincLab - Thebarton Business Incubator  \N  \N  \N  2013-09-10 03:13:32.782847  2013-11-08 05:14:01.434475  \N  Owned and operated by the University of Adelaide. \r\n\r\nThrough the Thebarton Business Incubator and Commercialisation Accelerator, ThIncLab provides comprehensive assistance to students and alumni to commercialise products, services and research. ThIncLab is located at the University's Thebarton Campus.\r\n\r\nWith a furnished office providing commercial space and business facilities conveniently located near ample parking and public transport, ThIncLab offers a stimulating business environment to springboard commercialisation.\r\n  University of Adelaide  +61 8 8313 4159 \N  \N
79  4 BioSA Incubator \N  \N  \N  2013-09-10 03:13:32.564767  2013-09-10 03:13:32.722686  SA Government The BioSA Incubator is Australiaâs first dedicated bioscience incubator.\n\nThe A$12 million incubator was opened in June 2008 to promote and accelerate the commercialisation of research and development in South Australia.\n\nThis state-of-the-art, purpose-built building provides modular office and laboratory space to accommodate early stage bioscience companies. The Incubator was fully funded by the South Australian Government and developed for BioSA by the Land Management Corporation.\n\nThe BioSA Incubator is located in the heart of the Thebarton Bioscience Precinct.\n  BioSA +61 8 8152 9300 Dr Jurgen Michaelis \N
81  4 ANZ Innovyz START \N  \N  \N  2013-09-10 03:13:32.860838  2013-09-10 03:13:33.099922  ANZ, ITEK and Adelaide City Council ANZ Innovyz START is a 13-week intensive accelerator program aimed at assisting prospective and existing small business owners to develop and grow their businesses for success.\n\nANZ Innovyz START looks for ten successful tech enterprises with potentially break-through ideas that are ready for accelerated growth. The program identifies the key elements to success that entrepreneurs need to know to get them âinvestor readyâ. The program includes mentoring by successful entrepreneurs, learning programs around growing a company, identification of target markets, working and reworking the companyâs plans, and a presentation to potential investors on the last day of the program.\n\nThe program provides a $20,000 stipend and ANZ will provide a $20,000 unsecured loan to each company chosen to participate. ANZ Innovyz START is one of 50 accelerators in the Global Accelerator Network that was created by TechStars. SME Growth Capital  +61 450 163 326 \N  \N
82  5 Majoran Distillery  \N  Level 2, 14 Grenfell Street Adelaide  2013-09-10 03:13:33.106327  2013-09-10 03:13:33.144177  Ninefold  Adelaideâs co-working space for digital entrepreneurs. The Majoran Distillery is a not-for-profit enterprise established in July 2012 with the intention of:\nâ¢\tproviding a co-working space to startups; and\nâ¢\tbringing Adelaideâs tech community together.\n\nWe are located Level 2,  14 Grenfell Street, Adelaide.\nThe Distilleryâs Vision is:\nâ¢\tpromote BIG thinking in Adelaide\nâ¢\tbe the birth place of digital giants\nâ¢\tgrow Adelaideâs start-up eco-system\nâ¢\tconnect Adelaide start-ups with the global stage\n\n Michael Reid, Chhai Thach and William Chau  +61 403 912 960 Michael Reid  \N
83  5 Hackerspace Adelaide  \N  \N  \N  2013-09-10 03:13:33.153681  2013-09-10 03:13:33.192843  ANZ Innovyz START We are a group of people with an interest in electronics and computing, who meet to share and work on our ideas. If you share this interest, youâre welcome to come along, and see what we do! You donât need to be skilled in technical matters - we have people attend whose skills range from textile art to designers of computer circuit boards.   Community \N  \N  \N
84  5 OFFICEGroove  \N  7 Divett St \n\n  Port Adelaide 2013-09-10 03:13:33.199515  2013-09-10 03:13:33.223742  \N  A local and business office networking community. We're into your business in a big way.\n\nOFFICEGroove is a friendly co-working space for professionals in the heart of Port Adelaide. If you are a business startup or making the transition from home office to full workplace for business growth, this solution is ideal. For one weekly rental fee we get you into the office groove with a simple serviced solution.  Ron Corso +61 424 644 624\n\n \N  \N
85  6 Commercialisation Australia \N  \N  \N  2013-09-10 03:13:33.263148  2013-09-10 03:13:33.302818  \N  Commercialisation Australia is an initiative of the Australian Government.\n_\tIt is a competitive, merit-based assistance program offering funding and resources to accelerate the business building process for Australian companies, entrepreneurs, researchers and inventors.\n_\tIt offers a range of funding options as well as multi-layered networking opportunities to help you achieve business success. \n_\tParticipants in the program work with dedicated Case Managers and benefit from our Volunteer Business Mentor Network. \n  Commonwealth Government 13 22 56  Doug Adamson  \N
87  6 Export Market Development Grants (EMDG) Scheme  \N  Level 5, 131-139 Grenfell Street  Adelaide  2013-09-10 03:13:33.341168  2013-11-08 05:06:31.468039  \N  The Export Market Development Grants (EMDG) scheme is a key Australian Government financial assistance program for aspiring and current exporters. Administered by Austrade, the scheme supports a wide range of industry sectors and products, including inbound tourism and the export of intellectual property and know-how outside Australia. To access the scheme for the first time, businesses need to have spent $20,000 over two years on eligible export marketing expenses.\r\n  Commonwealth Government +61 8 8202 7812 \N  \N
86  6 AusIndustry - R&D Tax Credits \N  Level 9, 63 Pirie Street  Adelaide  2013-09-10 03:13:33.309994  2013-09-10 03:13:33.334613  \N  The R&D Tax Incentive is a targeted, generous and easy to access entitlement program that helps businesses offset some of the costs of doing R&D. The Program aims to help more businesses do R&D and innovate. It is a broad-based entitlement program. This means that it is open to firms of all sizes in all sectors who are conducting eligible R&D.  It provides more generous support for businesses, especially small and medium-sized firms, than the R&D Tax Concession that it replaced.\nThe two core components are:\n_\ta 45 per cent refundable tax offset (equivalent to a 150 per cent deduction) to eligible entities with an aggregated turnover of less than $20 million per annum\n_\ta non-refundable 40 per cent tax offset (equivalent to 133 per cent deduction) to all other eligible entities\n  Commonwealth Government +61 8 8406 4700 \N  \N
89  7 SA Angels \N  \N  \N  2013-09-10 03:13:33.436551  2013-09-10 03:13:33.487447  \N  SA Angels Inc is an Adelaide (South Australia) based business angel group. We are a group of sophisticated investors interested in investing in early stage businesses based in South Australia in fields other than biotechnology. We conduct meetings on a monthly basis to consider such investment opportunities. Entrepreneurs can log on to the Angelsoft website to enter their opportunity to be considered by SA Angels.\nSA Angels comprises an array of different investor types with a diverse business background and varying personal requirements and criteria for investing. Since we are NOT a fund but a vehicle to facilitate bringing Entrepreneurs and Investors together, our ideal will vary from deal to deal and investor to investor.\nThere are however some constants that we look for in our deals, such as:\nâ¢\tUnique businesses which have the ability to scale.\nâ¢\tIP which can be protected to allow for market protection.\nâ¢\tBusinesses which are innovative and have barriers to entry for competitors.\nâ¢\tDeals that offer the investors meaningful equity in the business entity.\nâ¢\tDeals which allow the investor to contribute to the overall direction of the business.\nâ¢\tA clear understanding of the purpose and expenditure of the Angel funds invested.\n  \N  +61 401 125 436 Mike Richards \N
88  7 BioAngels   \N  PO Box 185  Hindmarsh 2013-09-10 03:13:33.368446  2013-11-08 05:13:15.448813  \N  BioAngels Inc is a not-for-profit association of business executives and entrepreneurs from a wide range of backgrounds. In 2010, the group has 20 active members and is looking to expand its membership. Australian business angels or angel investors are individuals who invest in small Australian companies helping them to grow and prosper.  Typically, angel investors invest because they have something more to offer than capital; thus BioAngels also invests time, knowledge, expertise and capital, born out of their own success and experience as entrepreneurs or business owners, in promising early stage Life Science companies. BioAngels looks to invest in the early stages of a developing company and operates predominately in the provision of seed funding and start up funding.  BioAngels Inc does not generally invest in pre-seed projects.\r\n  BioAngels Inc +61 8 8354 6144 David Saint \N
90  5 Fab Lab Adelaide  \N  Second Floor , Adelaide College of the Arts, 39 Light Square  Adelaide  2013-09-10 03:13:33.495169  2014-01-07 06:05:02.891954  SA Government (DFEEST)  Fab Lab (fabrication laboratory) is a fully kitted fabrication workshop which gives everyone in the community, from small children through to entrepreneurs and businesses, the capability to turn their ideas and concepts into reality. (Neil Gershenfeld, MIT). Fab Lab Adelaide is a community inventors workshop offering digital fabrication on a personal scale, in which new products and creative works can be made.  The lab is equipped with an array of flexible computer-controlled tools including 3D printers, a laser cutter and a milling machine, and is based at Adelaide College of the Arts on Light Square. The Fab Lab concept was originated by Massachusetts Institute of Technology (MIT), and there are now over 100 around the world. Fab Lab Adelaide is the first Australian-based participant in the international MIT Fab Lab network. The Lab offers classes, themed workshops, drop-in sessions, one-to-one tuition, a regional outreach program and âmaker sessions. Australian Network for Art and Technology (ANAT)  \N  Gavin Artz  \N
91  5 Hub Adelaide  \N  5 Peel Street Adelaide  2013-09-10 03:13:33.527336  2013-09-10 03:13:33.579933  City of Adelaide  Hub Adelaide is a coworking community driving innovation through collaboration.\nWhen you become a member of Hub Adelaide, you become part of a global network and a local community passionate about the innovation created from working with other individuals of diverse backgrounds.\n\nHub Adelaide is part of Hub Australia, which currently comprise of 700+ members from all sectors and over 50 disciplines through Hub Melbourne and Hub Sydney (coming May 2013). We are also be part of a global network of 35+ Hubs and about 6,000 members globally in cities like San Francisco, London, Sao Paulo and Tokyo.\n\nWe open our Clubhouse on Peel Street in September 2013. Come collaborate with us as we design and make our Clubhouse the most unique and inspiring place to work, create and play!  Hub Australia 1300 482 611  Brad Krauskopf  \N
92  5 Base64  \N   64 North Terrace Kent Town 2013-09-10 03:13:33.586393  2013-09-10 03:13:33.608592  \N  Base64 Pty Ltd is located at 64 North Terrace, Kent Town, Adelaide. It was founded in 2012 by Simon Hackett, and it is intended to become the home base for various new ventures over time. \n\nWe are currently in our bootstrap phase, setting up the site facilities and supervising site renovation/enhancement works. \n\nAt the completion of these works (expected to be late 2013) we intend to operate base64 as a multi-tenanted facility, offering facilities and support for a limited number of compatible technology related businesses. \n\nMore information will be provided once we're fully up and running and have figured those details out!  Simon Hackett +61 8 7324 5564 Simon Hackett \N
93  1 Adelaide Lean Startup Group \N  \N  \N  2013-09-10 03:13:33.646368  2013-09-10 03:13:33.665115  CC2 Adelaide Lean Startups has been started by an SA Angel Investor and Serial Entrepreneur looking for great investment ideas to apply the Lean Start Up and Business Model Canvas methodologies.\n\nHere we can help you build a successful startup by learning from the experience of other lean startups. We welcome Adelaide based entrepreneurs and investors.\n\nMeetups are held monthly at Majoran Distillery.\n\n* The Lean Startup is a trademark and service mark owned by Eric Ries.\n\n Community \N  Russell Colbourne \N
94  1 Collaborate to Innovate \N  \N  \N  2013-09-10 03:13:33.670756  2013-09-10 03:13:33.694259  Podio Collaborate to Innovate (C2I) is a community of people taking action on the things we care about.\n\nWe keep hearing is that the people that come along don't have anywhere else to have the conversations they have here - about taking action, setting out for themselves, working together on projects, making a difference in the world.\n\nWe don't sit back and accept the status quo, but go about following our passions and creating our visions.  This community can be the inspiration, the connections or the collaborators you need to make this possible.\n\nThe community is built on three simple goals - to connect, to learn, and to collaborate.\n\nThe Collaborate to Innovate community meets on the first Wednesday of every month. Join us.  Community \N  John Baxter \N
96  3 Western Region Enterprise Day \N  \N  \N  2013-09-10 03:13:33.761376  2013-09-28 05:02:27.49355 \N  The Western Region Enterprise Day (WRED) is run through the The University of Adelaide's University Engagement program to give both primary and secondary students the chance to learn about business and learn from people in business.  University of Adelaide  kerry.james@adelaide.edu.au Kerry James \N
95  2 Young Business Leaders Program  \N  c/- RSB, 254 Angas Street Adelaide  2013-09-10 03:13:33.699993  2013-11-08 05:07:02.210612  in-business South Australia The in-business Young Business Leaders SA (YBL) Program provides professional and personal leadership development through intensive training and practical application. The ten-month awards program is open to motivated individuals who are keen to challenge themselves, and gain invaluable experience, knowledge and skills. YBL Participants attend developmental workshops to acquire knowledge which is then applied practically through two projects (Business Improvement Project and Community Involvement Project).\r\n The Royal Society for the Blind +61 8 8417 5555 Heather McCulloch \N
99  8 Inner West Business Enterprise Centre \N  \N  \N  2013-09-10 03:13:33.876185  2013-09-10 03:13:33.884443  \N  \N  \N  8159 8700 Phil Dorman \N
102 8 Eastside Business Enterprise Centre \N  \N  \N  2013-09-10 03:13:33.996005  2013-09-28 04:53:58.732104  \N  The Eastside Business Enterprise Centre have been providing support and mentoring services to small businesses since 1995.  \N  8366 9335 Nick Truscott \N
101 4 Todd Street Co-working Hub  \N  \N  \N  2013-09-10 03:13:33.964934  2013-09-28 04:55:19.285547  \N  The Todd Street Co-working Hub provides a space for entrepreneurs at an affordable price. \N  8440 2440 Lynette Hay \N
100 8 Adelaide Business Hub \N  \N  \N  2013-09-10 03:13:33.923036  2013-09-28 04:56:15.802347  \N  The Adelaide Business Hub is located in Port Adelaide and provides incubation, coworking and business support services. \N  8440 2440 Lynette Hay \N
98  3 Centre for the Development of Entrepreneurs \N  UniSA City West Campus  \N  2013-09-10 03:13:33.84818 2013-09-28 04:57:29.739044  \N  The Centre for the Development of Entrepreneurs operates as a research and teaching group within the School of Management, University of South Australia (UniSA). The Centre is designed to provide relevant and practical education to entrepreneurs.  University of South Australia +61 8 830 20325   Peter Balan \N
114 6 Gateway Business Program  \N  \N  \N  2013-09-10 03:13:34.36793 2013-09-28 04:13:36.039958  \N  The Gateway Business Program is run by the South Australian Government. It is designed to assist small to medium-sized firms prepare for export, whereby the Government can meet eligible expenses incurred during the development of international markets. For more information, visit the links below: \N  \N  \N  \N
113 6 Innovation Voucher Program  \N  \N  \N  2013-09-10 03:13:34.356221  2013-09-28 04:16:25.324593  \N  The Innovation Voucher Program (IVP) is run through the State Government's Department for Manufacturing, Innovation, Trade, Resources and Energy. It is designed to foster collaboration between small-to-medium sized enterprises (SMEs) and research and development organisations. Vouchers are granted to R&D organisations to assist SMEs. For more information, visit the links below:  \N  \N  \N  \N
112 7 Blue Sky Private Equity \N  \N  \N  2013-09-10 03:13:34.341678  2013-09-28 04:23:09.676668  \N  Blue Sky Private Equity is a branch of Blue Sky Funds, an Australian-based diversified alternative asset manager. Blue Sky have expressed an openness to investing in startup businesses (The Australian Financial Review, September 5 2013). \N  \N  \N  \N
111 7 Terra Rosa Capital  \N  \N  \N  2013-09-10 03:13:34.328921  2013-09-28 04:26:15.041287  \N  Terra Rosa Capital is an Adelaide-based venture capital fund manager that seeks to invest in early-stage companies in the areas of bioscience, engineering and information/communications technology. \N  info@terrarossacapital.com  Dr Jurgen Michaelis \N
110 7 Acumen VC \N  \N  \N  2013-09-10 03:13:34.299471  2013-09-28 04:27:28.115107  \N  Acumen VC is an early-stage venture capital fund that invests in startups emerging from South East Asia and Australia.  \N  +61 401 095 999 Shane Cheek \N
109 6 Community Benefit SA Program  \N  \N  \N  2013-09-10 03:13:34.265514  2013-09-28 04:28:44.51219 \N  Community Benefit SA (CBSA) provides one-off project funding to incorporated, non-government, non-profit, charitable and social welfare organisations to develop and strengthen communities across the metropolitan, rural and remote regions of South Australia. Grants aim to improve the community participation, life management skills, well-being and quality of life of disadvantaged individuals, families and communities. SA Govt - Department for Communities and Social Inclusion 1300 650 985  \N  \N
108 6 The Australian Centre for Social Innovation \N  \N  \N  2013-09-10 03:13:34.217668  2013-09-28 04:34:51.165014  \N  The Australian Centre for Social Innovation (TACSI) was created to tackle the nation's tough social challenges. If you need support in the development of a social enterprise, this is the place to go. \N  \N  \N  \N
107 3 Workers Education Australia (WEA) \N  \N  \N  2013-09-10 03:13:34.204543  2013-09-28 04:37:12.259146  \N  The WEA offers courses on a variety of levels across a broad range of subjects, including starting your own business. \N  \N  \N  \N
106 3 TAFE Adelaide \N  \N  \N  2013-09-10 03:13:34.152982  2013-09-28 04:39:48.857498  \N  TAFE is the largest provider of vocational education and training (VET) in South Australia, including courses in business and marketing.  \N  \N  \N  \N
105 8 Northern Adelaide Business Enterprise Centre  \N  \N  \N  2013-09-10 03:13:34.127986  2013-09-28 04:49:13.257705  \N  The Northern Adelaide Business Enterprise Centre provides free or low-cost business advice to small business owners.  \N  0417 856 656  \N  \N
104 8 Tea Tree Gully Business Enterprise Centre \N  \N  \N  2013-09-10 03:13:34.114467  2013-09-28 04:50:55.290197  \N  The Tea Tree Gully Business Enterprise Centre provides people in business with the tools they need to succeed through training, events and business advice. \N  \N  \N  \N
103 8 Southern Success Business Enterprise Centre \N  \N  \N  2013-09-10 03:13:34.102162  2013-09-28 04:52:43.682968  \N  Southern Success Business Enterprise Centre provides low cost or free business advisory services to existing businesses or individuals interested in starting a new business. \N  \N  Alan Edmond \N
116 5 Co-West Coworking+Writing Studio  \N  129 Currie Street Adelaide  2013-09-10 03:13:34.399609  2013-11-08 05:08:40.013545  \N  Coworking and Writing space in Adelaide CBD. Coworking spaces are where people work independently together- sort of like having a fully-equipped office but no boss. They are places where you can write that draft, plan that project, tease out that article, sculpt that collection and finally wrap a routine around your craft. \r\nMembership plans ranges from purely casual to the well-entrenched. Spaces offered include a common, work-oriented Loft with formal desks, wi-fi and filtered power, a low-key Salon equipped with whiteboard, data projector, OHP and killer coffee and a ZenDen soft area to crash in- to re-read that draft or just loll around on the floor like kids do when they're pretending to do homework.  \N  0468 464 720  Rob de Kok  \N
120 5 Fifth Quarter \N  27 Fifth St   Bowden  2013-09-10 03:13:34.545536  2013-11-08 05:09:15.680407  \N  Carclew supports emerging South Australian artists to have the confidence, skills and knowledge to establish sustainable arts business. South Australia boasts a rich and supportive artistic environment. Fifth Quarter is a physical and intellectual space connecting artists, ideas and innovative governance and business models. It encourages collaboration and resource sharing to support enterprise development. Fifth Quarter offers a range of tailored packages and programs that will assist independent artists or groups of artists to develop their business. It's about independent and viable artistic careers which, in turn, feed the cultural and economic wealth of the state.  Carclew +61 8 8267 5111 Georgie Davill  \N
121 1 Social Startup 48 \N  \N  \N  2013-09-10 03:13:34.625169  2013-09-10 03:13:34.673741  \N  SS48 is a 48 hour gathering of amazing minds. You will spend a weekend building the model for an innovative business that creates social impact. You will be guided by specialist mentors and inspirational speakers, and you will pitch your idea to a panel of judges.  TACSI +61 433 681 501 \N  \N
123 5 The Mill  \N  \N  \N  2013-09-10 03:13:34.700185  2013-09-10 03:13:34.74775 \N  The Mill is a multi-disciplinary creative hub for young and emerging cultural practitioners and entrepreneurs. Its core goal is to be a cutting edge professional space that provides Adelaide's artists with an incubation environment and connections to wider industries.  \N  0421 154 239  \N  \N
122 5 CDW Studios \N  \N  \N  2013-09-10 03:13:34.678913  2013-09-28 02:49:46.542597  \N  CDW Studios is a school of visual effects and entertainment design. Located in the Myer Centre, CDW gives students and practitioners the chance to learn from world class industry artists in a realistic studio setting. If you want to break into this creative industry, CDW is your gateway.  \N  \N  \N  \N
119 5 The Workhouse \N   22-24 Corromandel Place  Adelaide  2013-09-10 03:13:34.519675  2013-09-28 02:58:10.66763 \N  A stone's throw from the crowds of Rundle mall is a small oasis, behind steely black doors, nestled amongst fifteen open plan artist studios is the home of Adelaide's newest open access print workshop. With public access, The Workhouse offers artists and printmakers a place to create. The Workhouse has a large open plan area that is perfect for running classes and workshops. \N  \N  \N  \N
118 5 Ontria Office \N  \N  \N  2013-09-10 03:13:34.490088  2013-09-28 03:02:14.435179  \N  South Australia's next coworking space. \r\n\r\nIf you are motivated to create anything of value, we want to provide you with a workspace for growing your ideas and getting things done. Ontria office is in concept phase. While coworking is now a worldwide phenomenon, it is still relatively new in Australia. We want to create a workspace that matches the needs and budget of future members, starting in South Australia. With that in mind, we would love to hear from people who want to work in a collaborative space in SA.  \N  0421 840 010  \N  \N
117 5 That Space  \N  157 The Parade  Norwood 2013-09-10 03:13:34.463382  2013-09-28 03:03:26.148953  \N  Work for yourself, not by yourself.\r\n\r\nThat Space is a flexible work space in the heart of Norwood Parade. We offer an awesome work environment that is perfect for entrepreneurs, freelancers and early stage businesses.\r\n\r\nThe Parade is a vibrant location that features some of the best shopping, cafes and restaurants that Adelaide has to offer. In addition, parking is free and easy meaning that you will save hundreds per month over what it would cost to work in the CBD  Nicholas Duncan+61 415 182 042  Nicholas Duncan \N
125 6 Business Development Initiative Grant (Biotech) \N  Level 15, 33 King William Street  Adelaide  2013-09-10 03:13:34.821427  2013-09-10 03:13:34.841125  Terra Rossa Capital This fund assists start-up and early stage South Australian bioscience companies to develop their business model.\n\n BDI grants of up to $250,000 can be used for activities such as business planning, marketing and crucial âproof of commercial conceptâ experiments.\n\nApplications can be submitted year-round and will be reviewed according to Merit Criteria which includes the feasibility and commercial viability of the activities and the commercial expertise and skill of the management team. BioInnovationSA +61 8 8217 6480 \N  \N
126 3 Business Growth Program for City Businesses \N  25 Pirie Street Adelaide  2013-09-10 03:13:34.848783  2013-09-10 03:13:34.918245  TAFE SA Enterprise Adelaide in conjunction with TAFE SA are offering you the chance to learn new skills and network with other small business operators.\n\nYou will develop the skills needed to increase your market share, create a social media profile, increase profits, grow your business and capitalise on opportunities, stand out from the crowd and attract customers to your business.\n\nThe program involves a series of workshops, online learning conducted by TAFE SA and mentoring provided by Enterprise Adelaide. Completion of the program will also earn you a Certificate IV in Small Business qualification.\n\nCost to you for the program is just $400 - a saving of over $3,000.  Enterprise Adelaide +61 8 8203 7815 \N  \N
128 6 New Enterprise Incentive Scheme (NEIS)  \N  \N  \N  2013-09-10 03:13:35.009046  2013-09-28 02:30:01.934644  \N  Are you a job seeker keen to start and run a small business? You may be eligible for practical small business training, mentoring and financial assistance from the Australian government. The New Enterprise Incentive Scheme (NEIS) is designed to give you personalised assistance to help you achieve your business goals. To find out more, click on the links below:  Commonwealth Government \N  \N  \N
127 1 Business SA \N  136 Greenhill Road  Unley 2013-09-10 03:13:34.928341  2013-09-28 02:34:38.287377  \N  Business SA is the voice of business in South Australia.\r\n\r\nWe assist organisations of all sizes to manage people and tackle the issues faced in todayâs competitive business environment. Our highly skilled professionals provide hands-on assistance to identify workplace challenges and drive growth at every stage of the business lifecycle.\r\n\r\nOur diverse membership base includes professional services, manufacturing, retail and emerging sectors. We get actively involved in every facet of industry and commerce across the State. Business SA +61 8 8300 0103 Nigel McBride \N
124 2 Digital360Lab \N  \N  \N  2013-09-10 03:13:34.753626  2013-11-08 05:07:43.438991  \N  Digital360Lab is designed to provide targeted professional development and project development support to South Australian drama, documentary and digital media content creators. The initiative aims to give SA-based teams a competitive industry advantage in light of shifting finance and distribution models, audience behaviours and technological advances in the screen industries. Presented by high calibre industry professionals working within the film, television and digital media industries in Australia and overseas, Digital360Lab will focus on audiences/users, transmedia story scoping, concept testing and developing nuanced financing, marketing, distribution and revenue models.  SA Film Corporation +61 8 8394 2024   Richard Harris  \N
\.


--
-- Name: nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wwojbfltraaycm
--

SELECT pg_catalog.setval('nodes_id_seq', 134, true);


--
-- Data for Name: nodes_targets; Type: TABLE DATA; Schema: public; Owner: wwojbfltraaycm
--

COPY nodes_targets (node_id, target_id) FROM stdin;
97  9
66  9
65  9
67  9
68  9
69  9
93  9
94  9
121 9
127 9
71  9
72  9
75  9
76  9
96  9
98  9
107 9
106 9
126 9
82  9
83  9
84  9
90  9
91  9
92  9
116 9
120 9
123 9
122 9
119 9
118 9
117 9
99  9
102 9
100 9
105 9
104 9
103 9
97  10
66  10
65  10
67  10
68  10
69  10
93  10
94  10
121 10
127 10
71  10
72  10
75  10
76  10
96  10
98  10
107 10
106 10
126 10
82  10
83  10
84  10
90  10
91  10
92  10
116 10
120 10
123 10
122 10
119 10
118 10
117 10
97  11
66  11
65  11
67  11
68  11
69  11
93  11
94  11
121 11
127 11
78  11
80  11
79  11
81  11
101 11
82  11
83  11
84  11
90  11
91  11
92  11
116 11
120 11
123 11
122 11
119 11
118 11
117 11
99  11
102 11
100 11
105 11
104 11
103 11
97  12
66  12
65  12
67  12
68  12
69  12
93  12
94  12
121 12
127 12
70  12
73  12
74  12
77  12
95  12
124 12
78  12
80  12
79  12
81  12
101 12
82  12
83  12
84  12
90  12
91  12
92  12
116 12
120 12
123 12
122 12
119 12
118 12
117 12
85  12
87  12
86  12
114 12
113 12
109 12
108 12
125 12
128 12
99  12
102 12
100 12
105 12
104 12
103 12
129 9
129 10
129 11
130 11
131 9
131 10
131 11
131 12
132 9
132 10
132 11
132 12
133 9
133 11
134 11
134 12
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: wwojbfltraaycm
--

COPY schema_migrations (version) FROM stdin;
20130809041353
20130809041605
20130809042141
20130809042147
20130809042148
20130811235534
20130811235904
20130812013524
20130818072123
20130908235307
20131003041414
20131003044607
20131107060228
20131108005850
20140409100404
20140409233101
20140604000544
20140604000918
20140604035603
\.


--
-- Data for Name: site_configurations; Type: TABLE DATA; Schema: public; Owner: wwojbfltraaycm
--

COPY site_configurations (id, key, value, form_type, form_collection_command, created_at, updated_at) FROM stdin;
1 twitter_url --- https://twitter.com/StartupADL\n...\n string    2013-11-08 02:37:08.419002  2013-11-08 02:37:08.432048
4 contact_email --- brandycontent@gmail.com\n...\n  string    2013-11-25 01:26:04.710179  2013-11-25 01:26:04.715153
5 site_name --- Startup Adelaide\n...\n string    2013-11-25 01:26:04.739975  2013-11-25 01:26:04.742443
\.


--
-- Name: site_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wwojbfltraaycm
--

SELECT pg_catalog.setval('site_configurations_id_seq', 5, true);


--
-- Data for Name: social_link_prefills; Type: TABLE DATA; Schema: public; Owner: wwojbfltraaycm
--

COPY social_link_prefills (id, name, created_at, updated_at) FROM stdin;
1 facebook  2013-09-28 02:16:31.467057  2013-09-28 02:16:31.467057
2 twitter 2013-09-28 02:16:31.612589  2013-09-28 02:16:31.612589
3 website 2013-09-28 02:16:31.62014 2013-09-28 02:16:31.62014
4 google-plus 2013-09-28 02:16:31.627218  2013-09-28 02:18:44.239487
5 youtube 2013-09-28 02:31:24.232955  2013-09-28 02:31:24.232955
6 linkedin  2013-09-28 02:39:05.735314  2013-09-28 02:39:05.735314
\.


--
-- Name: social_link_prefills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wwojbfltraaycm
--

SELECT pg_catalog.setval('social_link_prefills_id_seq', 6, true);


--
-- Data for Name: social_links; Type: TABLE DATA; Schema: public; Owner: wwojbfltraaycm
--

COPY social_links (id, link_url, social_key, node_id, created_at, updated_at) FROM stdin;
1 http://www.auscleantech.com.au/ACT_Adelaide_Cleantech_Network.html  website 1 2013-09-10 01:26:21.549662  2013-09-10 01:26:21.565238
2 http://www.adelaide.startupweekend.org/ website 3 2013-09-10 01:26:21.628542  2013-09-10 01:26:21.637709
3 http://www.facebook.com/thestartupclub  website 4 2013-09-10 01:26:21.669221  2013-09-10 01:26:21.677713
4 www.sayes.com.au  website 6 2013-09-10 01:26:21.742321  2013-09-10 01:26:21.751637
5 http://www.adelaide.edu.au/ecic website 7 2013-09-10 01:26:21.791571  2013-09-10 01:26:21.800358
6 http://www.ausfll.org website 8 2013-09-10 01:26:21.838162  2013-09-10 01:26:21.849821
7 www.mega.org.au website 9 2013-09-10 01:26:21.882423  2013-09-10 01:26:21.891723
8 http://www.cbb.com.au/consulting/the-social-enterprise-workshop website 10  2013-09-10 01:26:21.921485  2013-09-10 01:26:21.929782
9 http://ecic.adelaide.edu.au/industry/thinc/comm/  website 11  2013-09-10 01:26:21.96078 2013-09-10 01:26:21.969476
10  www.adelaide.edu.au/echallenge\n  website 12  2013-09-10 01:26:21.999611  2013-09-10 01:26:22.008368
11  http://venturedorm.com/ website 13  2013-09-10 01:26:22.042115  2013-09-10 01:26:22.051976
12  http://business-sa.com/coaching-and-mentoring-program website 14  2013-09-10 01:26:22.095193  2013-09-10 01:26:22.105551
13  http://www.bioinnovationsa.com.au/pages/biosa-incubator website 15  2013-09-10 01:26:22.141986  2013-09-10 01:26:22.154217
14  http://ecic.adelaide.edu.au/industry/thinc/ website 16  2013-09-10 01:26:22.196344  2013-09-10 01:26:22.208207
15  www.innovyzstart.com  website 17  2013-09-10 01:26:22.24414 2013-09-10 01:26:22.255243
16  http://majorandistillery.com  website 18  2013-09-10 01:26:22.302831  2013-09-10 01:26:22.31192
17  http://hackerspace-adelaide.org.au  website 19  2013-09-10 01:26:22.343827  2013-09-10 01:26:22.352689
18  http://officegroove.wordpress.com website 20  2013-09-10 01:26:22.383222  2013-09-10 01:26:22.392027
19  http://www.commercialisationaustralia.gov.au  website 21  2013-09-10 01:26:22.432936  2013-09-10 01:26:22.441542
20  http://www.ausindustry.gov.au/programs/innovation-rd/RD-TaxIncentive/Pages/default.aspx website 22  2013-09-10 01:26:22.490144  2013-09-10 01:26:22.500027
21  http://www.austrade.gov.au/What-is-EMDG website 23  2013-09-10 01:26:22.552344  2013-09-10 01:26:22.567114
22  http://www.bioangels.org  website 24  2013-09-10 01:26:22.624157  2013-09-10 01:26:22.633083
23  http://www.saangels.com.au  website 25  2013-09-10 01:26:22.675486  2013-09-10 01:26:22.684243
24  http://fablabadelaide.org.au  website 26  2013-09-10 01:26:22.773194  2013-09-10 01:26:22.78388
25  http://hubaustralia.com/spaces/adelaide/  website 27  2013-09-10 01:26:22.824885  2013-09-10 01:26:22.835016
26  http://www.base64.com.au  website 28  2013-09-10 01:26:22.877922  2013-09-10 01:26:22.892677
27  http://www.meetup.com/Adelaide-Lean-Start-Up/ website 29  2013-09-10 01:26:22.935883  2013-09-10 01:26:22.945507
28  http://www.meetup.com/C2IADL/ website 30  2013-09-10 01:26:22.976848  2013-09-10 01:26:22.985867
29  http://www.rsb.org.au/Young_Business_Leaders.aspx website 31  2013-09-10 01:26:23.029567  2013-09-10 01:26:23.040571
30  http://eoaccess.eonetwork.org/SouthAustralia/Pages/default.aspx website 33  2013-09-10 01:26:23.102086  2013-09-10 01:26:23.110769
31  www.unisa.edu.au/cde  website 34  2013-09-10 01:26:23.146351  2013-09-10 01:26:23.155617
32  http://adelaidebusinesshub.com.au website 36  2013-09-10 01:26:23.238255  2013-09-10 01:26:23.258743
33  http://adelaidebusinesshub.com.au website 37  2013-09-10 01:26:23.310473  2013-09-10 01:26:23.321501
34  http://www.eastsidebec.com.au website 38  2013-09-10 01:26:23.362486  2013-09-10 01:26:23.371869
35  http://www.nabec.com.au website 41  2013-09-10 01:26:23.452109  2013-09-10 01:26:23.461981
36  http://www.dcsi.sa.gov.au/pub/default.aspx?tabid=406  website 45  2013-09-10 01:26:23.563589  2013-09-10 01:26:23.575048
37  http://acumenvc.com website 46  2013-09-10 01:26:23.606782  2013-09-10 01:26:23.616207
38  http://www.adelaidecoworking.com.au   website 53  2013-09-10 01:26:23.922781  2013-09-10 01:26:23.932221
39  http://www.ontriaoffice.com   website 54  2013-09-10 01:26:23.990615  2013-09-10 01:26:24.00004
40  http://toothandnail.net.au/theworkhouse/  website 55  2013-09-10 01:26:24.063047  2013-09-10 01:26:24.072022
41  http://fifthquarter.org.au/ website 56  2013-09-10 01:26:24.10102 2013-09-10 01:26:24.109699
175 http://www.fathen.vc/ website 134 2015-01-30 01:57:45.074272  2015-01-30 01:57:45.074272
174 https://youtube.com/user/FatHenVC youtube 134 2015-01-30 01:57:45.071087  2015-01-30 02:01:59.589931
173 https://www.facebook.com/fathenvc facebook  134 2015-01-30 01:57:45.064068  2015-01-30 02:04:06.594749
42  http://ss48.org/adelaide/ website 57  2013-09-10 01:26:24.13904 2013-09-10 01:26:24.14904
43  themilladelaide.com website 59  2013-09-10 01:26:24.208067  2013-09-10 01:26:24.217195
44  http://www.safilm.com.au/Content.aspx?p=219 website 60  2013-09-10 01:26:24.248725  2013-09-10 01:26:24.258826
45  http://www.bioinnovationsa.com.au/pages/business-development-initiative-bdi-grant website 61  2013-09-10 01:26:24.290143  2013-09-10 01:26:24.302683
46  http://www.enterpriseadelaide.com.au/GrowingYourBusiness.aspx website 62  2013-09-10 01:26:24.335282  2013-09-10 01:26:24.344957
47  http://business-sa.com  website 63  2013-09-10 01:26:24.375007  2013-09-10 01:26:24.383561
48  http://www.auscleantech.com.au/ACT_Adelaide_Cleantech_Network.html  website 65  2013-09-10 03:13:30.831166  2013-09-10 03:13:30.843403
49  http://www.adelaide.startupweekend.org/ website 67  2013-09-10 03:13:30.935515  2013-09-10 03:13:30.975809
51  http://www.sayes.com.au website 70  2013-09-10 03:13:31.169561  2013-09-10 03:13:31.258913
52  http://www.adelaide.edu.au/ecic website 71  2013-09-10 03:13:31.331444  2013-09-10 03:13:31.379404
53  http://www.ausfll.org website 72  2013-09-10 03:13:31.402554  2013-09-10 03:13:31.503802
54  http://www.mega.org.au  website 73  2013-09-10 03:13:31.712709  2013-09-10 03:13:31.860775
55  http://www.cbb.com.au/consulting/the-social-enterprise-workshop website 74  2013-09-10 03:13:32.056738  2013-09-10 03:13:32.064101
56  http://ecic.adelaide.edu.au/industry/thinc/comm/  website 75  2013-09-10 03:13:32.120652  2013-09-10 03:13:32.16481
57  http://www.adelaide.edu.au/echallenge\n website 76  2013-09-10 03:13:32.202534  2013-09-10 03:13:32.212954
58  http://venturedorm.com/ website 77  2013-09-10 03:13:32.292157  2013-09-10 03:13:32.310434
59  http://business-sa.com/coaching-and-mentoring-program website 78  2013-09-10 03:13:32.390294  2013-09-10 03:13:32.457758
60  http://www.bioinnovationsa.com.au/pages/biosa-incubator website 79  2013-09-10 03:13:32.628989  2013-09-10 03:13:32.682156
61  http://ecic.adelaide.edu.au/industry/thinc/ website 80  2013-09-10 03:13:32.8151  2013-09-10 03:13:32.849002
62  http://www.innovyzstart.com website 81  2013-09-10 03:13:32.872123  2013-09-10 03:13:33.068889
63  http://majorandistillery.com  website 82  2013-09-10 03:13:33.130301  2013-09-10 03:13:33.137659
64  http://hackerspace-adelaide.org.au  website 83  2013-09-10 03:13:33.183465  2013-09-10 03:13:33.188498
65  http://officegroove.wordpress.com website 84  2013-09-10 03:13:33.212865  2013-09-10 03:13:33.218805
66  http://www.commercialisationaustralia.gov.au  website 85  2013-09-10 03:13:33.28997 2013-09-10 03:13:33.297612
67  http://www.ausindustry.gov.au/programs/innovation-rd/RD-TaxIncentive/Pages/default.aspx website 86  2013-09-10 03:13:33.321557  2013-09-10 03:13:33.330011
68  http://www.austrade.gov.au/What-is-EMDG website 87  2013-09-10 03:13:33.352058  2013-09-10 03:13:33.358108
69  http://www.bioangels.org  website 88  2013-09-10 03:13:33.38292 2013-09-10 03:13:33.392424
70  http://www.saangels.com.au  website 89  2013-09-10 03:13:33.447145  2013-09-10 03:13:33.482537
71  http://fablabadelaide.org.au  website 90  2013-09-10 03:13:33.50517 2013-09-10 03:13:33.510537
72  http://hubaustralia.com/spaces/adelaide/  website 91  2013-09-10 03:13:33.537826  2013-09-10 03:13:33.543862
73  http://www.base64.com.au  website 92  2013-09-10 03:13:33.59493 2013-09-10 03:13:33.60211
74  http://www.meetup.com/Adelaide-Lean-Start-Up/ website 93  2013-09-10 03:13:33.654522  2013-09-10 03:13:33.659802
75  http://www.meetup.com/C2IADL/ website 94  2013-09-10 03:13:33.682736  2013-09-10 03:13:33.688057
76  http://www.rsb.org.au/Young_Business_Leaders.aspx website 95  2013-09-10 03:13:33.738549  2013-09-10 03:13:33.74405
77  http://eoaccess.eonetwork.org/SouthAustralia/Pages/default.aspx website 97  2013-09-10 03:13:33.83015 2013-09-10 03:13:33.83603
78  http://www.unisa.edu.au/cde website 98  2013-09-10 03:13:33.857037  2013-09-10 03:13:33.864755
79  http://adelaidebusinesshub.com.au website 100 2013-09-10 03:13:33.936164  2013-09-10 03:13:33.950764
80  http://adelaidebusinesshub.com.au website 101 2013-09-10 03:13:33.97569 2013-09-10 03:13:33.982064
81  http://www.eastsidebec.com.au website 102 2013-09-10 03:13:34.006748  2013-09-10 03:13:34.05816
82  http://www.nabec.com.au website 105 2013-09-10 03:13:34.136686  2013-09-10 03:13:34.142304
84  http://acumenvc.com website 110 2013-09-10 03:13:34.306842  2013-09-10 03:13:34.315891
83  http://www.dcsi.sa.gov.au/services/grants-for-organisations/community-benefit-sa  website 109 2013-09-10 03:13:34.282472  2013-09-28 04:28:44.516655
50  http://www.facebook.com/thestartupclub  facebook  68  2013-09-10 03:13:31.017836  2013-09-28 05:09:30.380233
85  http://www.adelaidecoworking.com.au   website 117 2013-09-10 03:13:34.473169  2013-09-10 03:13:34.477956
86  http://www.ontriaoffice.com   website 118 2013-09-10 03:13:34.497237  2013-09-10 03:13:34.502129
87  http://toothandnail.net.au/theworkhouse/  website 119 2013-09-10 03:13:34.527139  2013-09-10 03:13:34.532424
88  http://fifthquarter.org.au/ website 120 2013-09-10 03:13:34.582407  2013-09-10 03:13:34.590915
89  http://ss48.org/adelaide/ website 121 2013-09-10 03:13:34.663336  2013-09-10 03:13:34.668866
90  themilladelaide.com website 123 2013-09-10 03:13:34.707553  2013-09-10 03:13:34.714144
91  http://www.safilm.com.au/Content.aspx?p=219 website 124 2013-09-10 03:13:34.765645  2013-09-10 03:13:34.774916
92  http://www.bioinnovationsa.com.au/pages/business-development-initiative-bdi-grant website 125 2013-09-10 03:13:34.828509  2013-09-10 03:13:34.836189
93  http://www.enterpriseadelaide.com.au/GrowingYourBusiness.aspx website 126 2013-09-10 03:13:34.860381  2013-09-10 03:13:34.869653
94  http://business-sa.com  website 127 2013-09-10 03:13:34.946863  2013-09-10 03:13:34.957148
95  http://deewr.gov.au/new-enterprise-incentive-scheme-neis  website 128 2013-09-28 02:28:58.190596  2013-09-28 02:28:58.190596
96  https://http://www.facebook.com/NEISgovau facebook  128 2013-09-28 02:28:58.204208  2013-09-28 02:28:58.204208
97  https://twitter.com/neisgovau twitter 128 2013-09-28 02:28:58.213094  2013-09-28 02:28:58.213094
98  https://plus.google.com/u/0/102497512848300401763/videos  google-plus 128 2013-09-28 02:28:58.22317 2013-09-28 02:28:58.22317
99  https://http://www.facebook.com/pages/Business-SA/141987795846694 facebook  127 2013-09-28 02:34:38.293038  2013-09-28 02:34:38.293038
100 https://twitter.com/Business_SA twitter 127 2013-09-28 02:34:38.299941  2013-09-28 02:34:38.299941
101 https://http://www.facebook.com/Digital360Lab?ref=hl  facebook  124 2013-09-28 02:37:21.273147  2013-09-28 02:37:21.273147
102 https://http://www.facebook.com/TheMillAdelaide facebook  123 2013-09-28 02:39:21.634319  2013-09-28 02:39:21.634319
103 https://twitter.com/TheMillAdelaide twitter 123 2013-09-28 02:39:21.683898  2013-09-28 02:39:21.683898
104 http://www.youtube.com/neisgovau  youtube 128 2013-09-28 02:40:22.969411  2013-09-28 02:40:22.969411
105 http://www.linkedin.com/company/business-sa linkedin  127 2013-09-28 02:41:54.266545  2013-09-28 02:41:54.266545
106 http://www.youtube.com/user/TheMillAdelaide youtube 123 2013-09-28 02:43:10.571586  2013-09-28 02:43:10.571586
107 https://http://www.facebook.com/pages/CDW-Studios facebook  122 2013-09-28 02:49:46.546635  2013-09-28 02:49:46.546635
108 https://twitter.com/CDWaustralia  twitter 122 2013-09-28 02:49:46.549808  2013-09-28 02:49:46.549808
109 https://http://www.facebook.com/socialstartup48 facebook  121 2013-09-28 02:51:54.143019  2013-09-28 02:51:54.143019
110 https://twitter.com/socialstartup48 twitter 121 2013-09-28 02:51:54.146309  2013-09-28 02:51:54.146309
111 http://www.youtube.com/socialstartup48  youtube 121 2013-09-28 02:51:54.150227  2013-09-28 02:51:54.150227
112 https://http://www.facebook.com/fifthquarterSA  facebook  120 2013-09-28 02:56:49.626313  2013-09-28 02:56:49.626313
113 https://twitter.com/fifthquartersa  twitter 120 2013-09-28 02:56:49.629685  2013-09-28 02:56:49.629685
114 https://http://www.facebook.com/pages/Tooth-and-Nail/301800913169545  facebook  119 2013-09-28 02:58:10.671075  2013-09-28 02:58:10.671075
115 https://twitter.com/ontria1 twitter 118 2013-09-28 03:02:14.461697  2013-09-28 03:02:14.461697
116 https://http://www.facebook.com/coworkingadelaide facebook  117 2013-09-28 03:03:26.177073  2013-09-28 03:03:26.177073
117 http://co-west.com.au/index.html  website 116 2013-09-28 03:05:32.77753 2013-09-28 03:05:32.77753
118 https://http://www.facebook.com/pages/Co-West-CoworkingWriting-Studio/415377391865349?ref=ts&fref=ts  facebook  116 2013-09-28 03:05:32.782047  2013-09-28 03:05:32.782047
119 https://twitter.com/robcowest twitter 116 2013-09-28 03:05:32.7851  2013-09-28 03:05:32.7851
120 http://www.dmitre.sa.gov.au/trade/gateway_business_program  website 114 2013-09-28 04:13:36.04306 2013-09-28 04:13:36.04306
121 http://www.dmitre.sa.gov.au/manufacturing_works/programs_and_initiatives/innovation_voucher_program website 113 2013-09-28 04:16:25.328386  2013-09-28 04:16:25.328386
122 http://blueskyfunds.com.au/ website 112 2013-09-28 04:23:09.680818  2013-09-28 04:23:09.680818
123 http://www.terrarossacapital.com/ website 111 2013-09-28 04:26:15.044675  2013-09-28 04:26:15.044675
124 http://www.tacsi.org.au/  website 108 2013-09-28 04:34:51.16872 2013-09-28 04:34:51.16872
125 https://twitter.com/OzInnovation  twitter 108 2013-09-28 04:34:51.171889  2013-09-28 04:34:51.171889
126 https://http://www.facebook.com/OzInnovation  facebook  108 2013-09-28 04:34:51.174982  2013-09-28 04:34:51.174982
127 http://www.wea-sa.com.au/ website 107 2013-09-28 04:37:12.262654  2013-09-28 04:37:12.262654
128 http://www.tafesa.edu.au/ website 106 2013-09-28 04:39:48.861766  2013-09-28 04:39:48.861766
129 https://http://www.facebook.com/tafesa  facebook  106 2013-09-28 04:39:48.865636  2013-09-28 04:39:48.865636
130 https://twitter.com/tafe_sa twitter 106 2013-09-28 04:39:48.870574  2013-09-28 04:39:48.870574
131 https://http://www.youtube.com/user/TAFESouthAustralia  youtube 106 2013-09-28 04:39:48.875143  2013-09-28 04:39:48.875143
132 http://bec.neda.asn.au/ website 104 2013-09-28 04:50:55.294272  2013-09-28 04:50:55.294272
133 http://www.ssbec.com.au/  website 103 2013-09-28 04:52:43.689744  2013-09-28 04:52:43.689744
134 https://http://www.adelaide.edu.au/community-engagement/wred/ website 96  2013-09-28 05:02:27.498311  2013-09-28 05:02:27.498311
135 http://www.mobilemonday.net/category/adelaide website 69  2013-09-28 05:08:51.362891  2013-09-28 05:08:51.362891
136 http://www.meetup.com/Silicon-Beach-Adelaide/ website 66  2013-09-28 05:10:15.974078  2013-09-28 05:10:15.974078
138   twitter 129 2013-11-27 02:11:49.276305  2013-11-27 02:11:49.276305
139   website 129 2013-11-27 02:11:49.27825 2013-11-27 02:11:49.27825
140   google-plus 129 2013-11-27 02:11:49.279964  2013-11-27 02:11:49.279964
141   youtube 129 2013-11-27 02:11:49.281615  2013-11-27 02:11:49.281615
142   linkedin  129 2013-11-27 02:11:49.283317  2013-11-27 02:11:49.283317
143 https://http://www.facebook.com/womeninglobalbusiness facebook  130 2013-11-27 02:13:18.697687  2013-11-27 02:13:18.697687
144   twitter 130 2013-11-27 02:13:18.703057  2013-11-27 02:13:18.703057
145   website 130 2013-11-27 02:13:18.721369  2013-11-27 02:13:18.721369
146   google-plus 130 2013-11-27 02:13:18.724066  2013-11-27 02:13:18.724066
147   youtube 130 2013-11-27 02:13:18.728191  2013-11-27 02:13:18.728191
148   linkedin  130 2013-11-27 02:13:18.730965  2013-11-27 02:13:18.730965
149 https://http://www.facebook.com/StartupGrind  facebook  131 2013-11-27 02:14:44.121705  2013-11-27 02:14:44.121705
150   twitter 131 2013-11-27 02:14:44.123589  2013-11-27 02:14:44.123589
151   website 131 2013-11-27 02:14:44.125341  2013-11-27 02:14:44.125341
152   google-plus 131 2013-11-27 02:14:44.127028  2013-11-27 02:14:44.127028
153   youtube 131 2013-11-27 02:14:44.128792  2013-11-27 02:14:44.128792
154   linkedin  131 2013-11-27 02:14:44.130429  2013-11-27 02:14:44.130429
155 https://http://www.facebook.com/groups/123393017744688/ facebook  132 2013-11-27 02:17:28.780085  2013-11-27 02:17:28.780085
156   twitter 132 2013-11-27 02:17:28.7822  2013-11-27 02:17:28.7822
157 http://eoaccess.eonetwork.org/SouthAustralia/Pages/default.aspx website 132 2013-11-27 02:17:28.784216  2013-11-27 02:17:28.784216
158   google-plus 132 2013-11-27 02:17:28.786046  2013-11-27 02:17:28.786046
159   youtube 132 2013-11-27 02:17:28.787733  2013-11-27 02:17:28.787733
160   linkedin  132 2013-11-27 02:17:28.789461  2013-11-27 02:17:28.789461
137 https://http://www.facebook.com/pages/South-Australia-in-business/25210706615 facebook  129 2013-11-27 02:11:49.269839  2013-11-27 02:34:28.880378
161 http://www.adelaidecitycouncil.com/city-business/starting-your-business website 133 2014-02-17 22:20:08.634471  2014-02-17 22:20:08.634471
162   twitter 133 2014-02-17 22:20:08.642871  2014-02-17 22:20:08.642871
163   website 133 2014-02-17 22:20:08.64499 2014-02-17 22:20:08.64499
164   google-plus 133 2014-02-17 22:20:08.646629  2014-02-17 22:20:08.646629
165   youtube 133 2014-02-17 22:20:08.648373  2014-02-17 22:20:08.648373
166   linkedin  133 2014-02-17 22:20:08.649994  2014-02-17 22:20:08.649994
\.


--
-- Name: social_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wwojbfltraaycm
--

SELECT pg_catalog.setval('social_links_id_seq', 175, true);


--
-- Data for Name: targets; Type: TABLE DATA; Schema: public; Owner: wwojbfltraaycm
--

COPY targets (id, name, cat_class, created_at, updated_at) FROM stdin;
9 newbies newbies 2013-11-08 02:37:50.193188  2013-11-08 02:37:50.193188
10  students  students  2013-11-08 02:37:50.200109  2013-11-08 02:37:50.200109
11  entrepreneurs entrepreneurs 2013-11-08 02:37:50.206393  2013-11-08 02:37:50.206393
12  startups  startups  2013-11-08 02:37:50.2127  2013-11-08 02:37:50.2127
\.


--
-- Name: targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wwojbfltraaycm
--

SELECT pg_catalog.setval('targets_id_seq', 12, true);


--
-- Data for Name: tweets; Type: TABLE DATA; Schema: public; Owner: wwojbfltraaycm
--

COPY tweets (id, text, user_screen_name, created_at, updated_at) FROM stdin;
33250 Happy Holidays! What's your favourite thing about this time of year? https://t.co/CWbtWEBhiy  StartupADL  2016-01-11 02:00:28.774625  2016-01-11 02:00:28.774625
33251 Startup Weekend Adelaide 2015 - Pitch 8: https://t.co/3DrXaMFNG7 via <a href='http://twitter.com/YouTube' target='_blank'>@YouTube</a>  StartupADL  2016-01-11 02:00:28.78581 2016-01-11 02:00:28.78581
33252 Startup Weekend Adelaide - Pitch 9: https://t.co/EcWyjN8v2I via <a href='http://twitter.com/YouTube' target='_blank'>@YouTube</a> StartupADL  2016-01-11 02:00:28.790652  2016-01-11 02:00:28.790652
33253 Startup Weekend Adelaide 2015 - Pitch 7: https://t.co/7Dzn0Ft28y via <a href='http://twitter.com/YouTube' target='_blank'>@YouTube</a>  StartupADL  2016-01-11 02:00:28.80042 2016-01-11 02:00:28.80042
33254 Startup Weekend Adelaide 2015 - Pitch 6: https://t.co/KiQ3mBGwbs via <a href='http://twitter.com/YouTube' target='_blank'>@YouTube</a>  StartupADL  2016-01-11 02:00:28.813859  2016-01-11 02:00:28.813859
33255 Startup Weekend Adelaide 2015 - Pitch 5: https://t.co/n65rmYjpxi via <a href='http://twitter.com/YouTube' target='_blank'>@YouTube</a>  StartupADL  2016-01-11 02:00:28.823575  2016-01-11 02:00:28.823575
33256 Startup Weekend Adelaide 2015 - Pitch 4: https://t.co/8p7wb7qzbI via <a href='http://twitter.com/YouTube' target='_blank'>@YouTube</a>  StartupADL  2016-01-11 02:00:28.831913  2016-01-11 02:00:28.831913
33257 Startup Weekend Adelaide 2015 - Pitch 3: https://t.co/1XMhK69rRa via <a href='http://twitter.com/YouTube' target='_blank'>@YouTube</a>  StartupADL  2016-01-11 02:00:28.837723  2016-01-11 02:00:28.837723
33258 Startup Weekend Adelaide 2015 - Pitch 1: https://t.co/f3RC6TxJ5u via <a href='http://twitter.com/YouTube' target='_blank'>@YouTube</a>  StartupADL  2016-01-11 02:00:28.844716  2016-01-11 02:00:28.844716
33259 11 Dec 2015 Nicola Lipscombe: https://t.co/9nlzBnC3hb via <a href='http://twitter.com/YouTube' target='_blank'>@YouTube</a> StartupADL  2016-01-11 02:00:28.849674  2016-01-11 02:00:28.849674
33260 Startup Weekend Adelaide 2015 - Beer Consumed: https://t.co/Vd4FNhuT6E via <a href='http://twitter.com/YouTube' target='_blank'>@YouTube</a>  StartupADL  2016-01-11 02:00:28.854433  2016-01-11 02:00:28.854433
33261 We're excited to announce that we are connecting with our users right now on location in Japan https://t.co/EWF2bvBdgX  StartupADL  2016-01-11 02:00:28.860337  2016-01-11 02:00:28.860337
33262 RT <a href='http://twitter.com/ashwy26:' target='_blank'>@ashwy26:</a> <a href='http://twitter.com/NVIFlinders' target='_blank'>@NVIFlinders</a> are taking an #Adelaide delegation to <a href='http://twitter.com/sxsw' target='_blank'>@sxsw</a> in March 2016! Broadcast on <a href='http://twitter.com/periscopeco' target='_blank'>@periscopeco</a> #sxsw2016 <a href='http://t.co/EfzgbE…' target='_blank'>http://t.co/EfzgbE…</a>  StartupADL  2016-01-11 02:00:28.865372  2016-01-11 02:00:28.865372
33263 RT <a href='http://twitter.com/NVIFlinders:' target='_blank'>@NVIFlinders:</a> Did u know <a href='http://twitter.com/NVIFlinders' target='_blank'>@NVIFlinders</a> have a co-working incubator space at <a href='http://twitter.com/TonsleySA?' target='_blank'>@TonsleySA?</a> Book your free trial <a href='http://t.co/rcoITICk2U' target='_blank'>http://t.co/rcoITICk2U</a> #adel…  StartupADL  2016-01-11 02:00:28.870485  2016-01-11 02:00:28.870485
33264 <a href='http://t.co/Rn8Xw1NgwO' target='_blank'>http://t.co/Rn8Xw1NgwO</a> StartupADL  2016-01-11 02:00:28.877955  2016-01-11 02:00:28.877955
33265 Business ideas - Mum’s birthday inspires startup to come up with the perfect Giftoid:... <a href='http://t.co/NoOM9ctJdD' target='_blank'>http://t.co/NoOM9ctJdD</a>  StartupADL  2016-01-11 02:00:28.883935  2016-01-11 02:00:28.883935
33266 Startup Weekend Adelaide #6 "Giftoid star of the show:"... <a href='http://t.co/hyZy5zNH8i' target='_blank'>http://t.co/hyZy5zNH8i</a>  StartupADL  2016-01-11 02:00:28.892612  2016-01-11 02:00:28.892612
33267 RT <a href='http://twitter.com/kristianlivolsi:' target='_blank'>@kristianlivolsi:</a> Time to get our game face on! Big hustle day today <a href='http://twitter.com/StartupWeekend' target='_blank'>@StartupWeekend</a> #startupadl <a href='http://t.co/SeaqTK5erx' target='_blank'>http://t.co/SeaqTK5erx</a> subscribe now! h… StartupADL  2016-01-11 02:00:28.898658  2016-01-11 02:00:28.898658
33268 RT <a href='http://twitter.com/kristianlivolsi:' target='_blank'>@kristianlivolsi:</a> BeerFo hit 500 likes on FB and 328 online subscriptions from an idea conceived at #startupadl <a href='http://twitter.com/StartupADL' target='_blank'>@StartupADL</a> <a href='http://twitter.com/StartupWeek…' target='_blank'>@StartupWeek…</a>  StartupADL  2016-01-11 02:00:28.903506  2016-01-11 02:00:28.903506
33269 RT <a href='http://twitter.com/genstandards:' target='_blank'>@genstandards:</a> Congratulations <a href='http://twitter.com/Giftoid' target='_blank'>@Giftoid</a> for winning <a href='http://twitter.com/StartupADL!' target='_blank'>@StartupADL!</a>  The perfect gift, everytime - love your work! #startuplawyers <a href='http://t…' target='_blank'>http://t…</a> StartupADL  2016-01-11 02:00:28.908382  2016-01-11 02:00:28.908382
33270 <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> DM me and we can chat about it :) RandomBlondeGuy 2016-01-11 02:00:28.913046  2016-01-11 02:00:28.913046
33271 <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> happy to check in on this! What email address did you write into us from? stripe  2016-01-11 02:00:28.917494  2016-01-11 02:00:28.917494
33272 Lunches back at it are a strong hiatus! <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> MnstrMnstr  2016-01-11 02:00:28.922 2016-01-11 02:00:28.922
33273 <a href='http://twitter.com/JessicaRanwyl' target='_blank'>@JessicaRanwyl</a>  This is the video I was referring to :) <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a>  JessicaRanwyl 2016-01-11 02:00:28.927174  2016-01-11 02:00:28.927174
33274 <a href='http://twitter.com/kublermdk' target='_blank'>@kublermdk</a> <a href='http://twitter.com/civocr' target='_blank'>@civocr</a> <a href='http://twitter.com/ChrisHooper87' target='_blank'>@ChrisHooper87</a> <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> <a href='http://twitter.com/PrincessPeachey' target='_blank'>@PrincessPeachey</a> hoping you had a good time the other week. Was keen until the cold hit :( flikdesign  2016-01-11 02:00:28.932723  2016-01-11 02:00:28.932723
33275 <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> wants to fix adelaide traffics problem <a href='http://twitter.com/southstartconf' target='_blank'>@southstartconf</a> #Hackfest <a href='http://t.co/3rKazzrXI7' target='_blank'>http://t.co/3rKazzrXI7</a>  gomultiplier  2016-01-11 02:00:28.937901  2016-01-11 02:00:28.937901
33276 <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> just presented a great tool for avoiding traffic using data from Twitter and the ACC roadworks dataset. #southstart ClearBusinessAU 2016-01-11 02:00:28.943213  2016-01-11 02:00:28.943213
33277 <a href='http://twitter.com/civocr' target='_blank'>@civocr</a> <a href='http://twitter.com/ChrisHooper87' target='_blank'>@ChrisHooper87</a> <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> <a href='http://twitter.com/PrincessPeachey' target='_blank'>@PrincessPeachey</a> I'm looking after my sick gf <a href='http://twitter.com/flikdesign' target='_blank'>@flikdesign</a>  kublermdk 2016-01-11 02:00:28.948346  2016-01-11 02:00:28.948346
33278 . <a href='http://twitter.com/ChrisHooper87' target='_blank'>@ChrisHooper87</a> <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> <a href='http://twitter.com/kublermdk' target='_blank'>@kublermdk</a> <a href='http://twitter.com/PrincessPeachey' target='_blank'>@PrincessPeachey</a> wish I was there! Things changed with my kids! #hacking in #spirit #hackfest  civocr  2016-01-11 02:00:28.953498  2016-01-11 02:00:28.953498
33279 Oi <a href='http://twitter.com/civocr' target='_blank'>@civocr</a> <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> <a href='http://twitter.com/kublermdk' target='_blank'>@kublermdk</a> <a href='http://twitter.com/PrincessPeachey' target='_blank'>@PrincessPeachey</a> get your asses to #SouthStart Hackfest slackers. <a href='http://t.co/cEyOx2R8fF' target='_blank'>http://t.co/cEyOx2R8fF</a> ChrisHooper87 2016-01-11 02:00:28.958528  2016-01-11 02:00:28.958528
33280 Personal stories were so inspiring!<a href='http://twitter.com/mlr___' target='_blank'>@mlr___</a> <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> <a href='http://twitter.com/majorandistil' target='_blank'>@majorandistil</a> #techiestour <a href='http://t.co/BI47u3k4iZ' target='_blank'>http://t.co/BI47u3k4iZ</a> HYPAWorks 2016-01-11 02:00:28.9638  2016-01-11 02:00:28.9638
33281 <a href='http://twitter.com/secretsofaFF' target='_blank'>@secretsofaFF</a> &amp; <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> entrepreneurs behind the creation of 1625. Congratulations and well done! <a href='http://t.co/ylRxkdZKYZ' target='_blank'>http://t.co/ylRxkdZKYZ</a>HYPAWorks  2016-01-11 02:00:28.969184  2016-01-11 02:00:28.969184
33282 <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> if you have something like the Signals or Boomerang ext installed. Try disabling those, refreshing, &amp; it should work for now  RadiumCRM 2016-01-11 02:00:28.975914  2016-01-11 02:00:28.975914
33283 <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> I know its bugging a few of us too, its high on the todo list. The problem is its conflicting with other extensions.  RadiumCRM 2016-01-11 02:00:28.980868  2016-01-11 02:00:28.980868
33284 <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> thanks for pointing that out Michael, we'll have someone look into thatRadiumCRM  2016-01-11 02:00:28.991137  2016-01-11 02:00:28.991137
33285 <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> useful as a starting point. cheekshane  2016-01-11 02:00:28.997453  2016-01-11 02:00:28.997453
33286 <a href='http://twitter.com/michaelpdawson' target='_blank'>@michaelpdawson</a> format less important than evidence that thought has been put into customers, distribution, economics, milestones etc.  cheekshane  2016-01-11 02:00:29.003218  2016-01-11 02:00:29.003218
\.


--
-- Name: tweets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: wwojbfltraaycm
--

SELECT pg_catalog.setval('tweets_id_seq', 33286, true);


--
-- Name: admin_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT admin_notes_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: blog_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

ALTER TABLE ONLY blog_posts
    ADD CONSTRAINT blog_posts_pkey PRIMARY KEY (id);


--
-- Name: bloggers_pkey; Type: CONSTRAINT; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

ALTER TABLE ONLY bloggers
    ADD CONSTRAINT bloggers_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: contact_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

ALTER TABLE ONLY contact_messages
    ADD CONSTRAINT contact_messages_pkey PRIMARY KEY (id);


--
-- Name: nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT nodes_pkey PRIMARY KEY (id);


--
-- Name: site_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

ALTER TABLE ONLY site_configurations
    ADD CONSTRAINT site_configurations_pkey PRIMARY KEY (id);


--
-- Name: social_link_prefills_pkey; Type: CONSTRAINT; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

ALTER TABLE ONLY social_link_prefills
    ADD CONSTRAINT social_link_prefills_pkey PRIMARY KEY (id);


--
-- Name: social_links_pkey; Type: CONSTRAINT; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

ALTER TABLE ONLY social_links
    ADD CONSTRAINT social_links_pkey PRIMARY KEY (id);


--
-- Name: targets_pkey; Type: CONSTRAINT; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

ALTER TABLE ONLY targets
    ADD CONSTRAINT targets_pkey PRIMARY KEY (id);


--
-- Name: tweets_pkey; Type: CONSTRAINT; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

ALTER TABLE ONLY tweets
    ADD CONSTRAINT tweets_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_admin_notes_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE INDEX index_admin_notes_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_blog_posts_on_admin_user_id; Type: INDEX; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE INDEX index_blog_posts_on_admin_user_id ON blog_posts USING btree (admin_user_id);


--
-- Name: index_blog_posts_on_blogger_id; Type: INDEX; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE INDEX index_blog_posts_on_blogger_id ON blog_posts USING btree (blogger_id);


--
-- Name: index_bloggers_on_email; Type: INDEX; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE UNIQUE INDEX index_bloggers_on_email ON bloggers USING btree (email);


--
-- Name: index_bloggers_on_reset_password_token; Type: INDEX; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE UNIQUE INDEX index_bloggers_on_reset_password_token ON bloggers USING btree (reset_password_token);


--
-- Name: index_nodes_targets_on_node_id_and_target_id; Type: INDEX; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE UNIQUE INDEX index_nodes_targets_on_node_id_and_target_id ON nodes_targets USING btree (node_id, target_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: wwojbfltraaycm; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--