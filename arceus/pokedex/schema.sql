-- Content Packs
DROP TABLE IF EXISTS data_origins
CREATE TABLE data_origins
(
	origin_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255) NOT NULL
);

-- Types?


-- Naturewalk
DROP TABLE IF EXISTS dex_naturewalk;
CREATE TABLE dex_naturewalk
(
	naturewalk_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(32) NOT NULL,
	origin_id INT
);

-- Capabilities
DROP TABLE IF EXISTS dex_capabilities;
CREATE TABLE dex_capabilities
(
	capability_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(64),
	rules VARCHAR,
	origin_id INT
);

-- Egg Groups
DROP TABLE IF EXISTS dex_egg_groups;
CREATE TABLE dex_egg_groups
(
	egg_group_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(32),
	origin_id INT
);

-- Abilities
DROP TABLE IF EXISTS dex_abilities;
CREATE TABLE dex_abilities
(
	ability_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR NOT NULL,
	frequency VARCHAR NOT NULL,
	effect VARCHAR NOT NULL,
	trigger_text VARCHAR,
	target VARCHAR,
	keywords JSONB,
	origin_id INT
);

-- Edges  SORT OUT CATEGORY
DROP TYPE IF EXISTS E_POKEEDGECAT;
CREATE TYPE E_POKEEDGECAT as ENUM
(
	'Stat/Skill',
	'Abilitiy/Move',
	'Capability'
);
DROP TABLE IF EXISTS dex_pokeedges;
CREATE TABLE dex_pokeedges
(
	pokeedge_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(128) NOT NULL,
	effect VARCHAR NOT NULL,
	prerequisites JSONB,
	cost SMALLINT,
	category E_POKEEDGECAT,
	origin_id INT
);

DROP TYPE IF EXISTS E_EDGECAT;
CREATE TYPE E_EDGECAT AS ENUM
(
	'Skill Edges',
	'Crafting Edges',
	'Pokémon Training Edges',
	'Combat Edges',
	'Other Edges',
	'Extra Edges'
);
DROP TABLE IF EXISTS dex_edges;
CREATE TABLE dex_edges
(
	edge_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(128) NOT NULL,
	effect VARCHAR NOT NULL,
	prerequisites JSONB,
	category E_EDGECAT,
	origin_id INT
);

-- Features
DROP TYPE IF EXISTS E_FEATURECAT;
CREATE TYPE E_FEATURECAT AS ENUM
(
	'General',
	'Pokémon Training & Orders',
	'Combat',
	'Class',
	'Other'
);
DROP TABLE IF EXISTS dex_features;
CREATE TABLE dex_features
(
	feature_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(128) NOT NULL,
	frequency VARCHAR,
	effect VARCHAR NOT NULL,
	prerequisites JSONB,
	category E_FEATURECAT,
	owning_class_id INT,
	tags JSONB,
	origin_id INT
);

DROP TYPE IF EXISTS E_FEATURETAGCAT;
CREATE TYPE E_FEATURETAGCAT AS ENUM
(
	'Class',
	'Stat',
	'Other'
);
DROP TABLE IF EXISTS dex_feature_tags
(
	feature_tag_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR NOT NULL,
	effect VARCHAR,
	category E_FEATURETAGCAT,
	origin_id INT
);

-- Natures
DROP TYPE IF EXISTS E_POKESTAT;
CREATE TYPE E_POKESTAT AS ENUM
(
	'HP',
	'Attack',
	'Defense',
	'Special Attack',
	'Special Defense',
	'Speed',
	'None'
);
DROP TYPE IF EXISTS E_FLAVOR;
CREATE TYPE E_FLAVOR AS ENUM
(
	'Salty',
	'Spicy',
	'Sour',
	'Dry',
	'Bitter',
	'Sweet',
	'None'
);
DROP TABLE IF EXISTS dex_natures;
CREATE TABLE dex_natures
(
	nature_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(32) NOT NULL,
	raise_stat E_POKESTAT,
	lower_stat E_POKESTAT,
	likes_flavor E_FLAVOR,
	dislikes_flavor E_FLAVOR,
	origin_id INT
);

-- Items
DROP TYPE IF EXISTS E_ITEMCAT;
CREATE TYPE E_ITEMCAT AS ENUM
(
	'Medicine',
	'Ball',
	'Poké',
	'Food',
	'Equipment',
	'TM',
	'HM',
	'Key',
	'Other'
);
DROP TABLE IF EXISTS dex_items;
CREATE TABLE dex_items
(
	item_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR NOT NULL,
	category E_ITEMCAT,
	move_id INT,
	cost INT,
	effect VARCHAR,
	origin_id INT
);

-- Moves
DROP TYPE IF EXISTS E_MOVECAT;
CREATE TYPE E_MOVECAT AS ENUM
(
	'Physical',
	'Special',
	'Status'
);
DROP TYPE IF EXISTS E_CONTESTTYPE;
CREATE TYPE E_CONTESTTYPE AS ENUM
(
	'Cool',
	'Tough',
	'Beauty',
	'Smart',
	'Cute',
	'None'
);
DROP TABLE IF EXISTS dex_moves
CREATE TABLE dex_moves
(
	move_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR,
	type_id INT NOT NULL,
	category E_MOVECAT NOT NULL,
	base_damage SMALLINT,
	accuracy SMALLINT,
	move_range VARCHAR NOT NULL,
	frequency VARCHAR,
	effect VARCHAR,
	contest_type E_CONTESTTYPE,
	contest_effect_id INT,
	move_flags INT,
	origin_id INT
);

DROP TABLE IF EXISTS dex_contest_effects;
CREATE TABLE dex_contest_effects
(
	contest_effect_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR NOT NULL,
	effect VARCHAR NOT NULL,
	origin_id INT
);

DROP TABLE IF EXISTS dex_weather;
CREATE TABLE dex_weather
(
	weather_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR NOT NULL,
	effect VARCHAR,
	origin_id INT
);

DROP TABLE IF EXISTS dex_statusfx;
CREATE TABLE dex_statusfx
(
	statusfx_id INT GENERATED ALWAYS AS IDENTITY,
	name VARHCAR NOT NULL,
	volatile BOOLEAN NOT NULL,
	effect VARCHAR,
	origin_id INT
);

-- Regional Dexes
DROP TABLE IF EXISTS dex_regions;
CREATE TABLE dex_regions
(
	region_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR,
	pokedex JSONB,
	origin_id INT,
);

-- The big bois
DROP TABLE IF EXISTS pokedex;
CREATE TABLE pokedex 
(
	poke_id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(32) NOT NULL,
	national_dex_num INT,
	generation SMALLINT,

	type_main INT NOT NULL,
	type_sub INT,
	stats_hp SMALLINT NOT NULL,
	stats_atk SMALLINT NOT NULL,
	stats_def SMALLINT NOT NULL,
	stats_spatk SMALLINT NOT NULL,
	stats_spdef SMALLINT NOT NULL,
	stats_spd SMALLINT NOT NULL,

	family JSONB,
	formes JSONB,

	ability_basic_a INT NOT NULL,
	ability_basic_b INT NOT NULL,
	ability_advanced_a INT NOT NULL,
	ability_advanced_b INT NOT NULL,
	ability_high INT NOT NULL,

	skill_overland SMALLINT NOT NULL,
	skill_sky SMALLINT NOT NULL,
	skill_swim SMALLINT NOT NULL,
	skill_levitate SMALLINT NOT NULL,
	skill_burrow SMALLINT NOT NULL,
	skill_high_jump SMALLINT NOT NULL,
	skill_long_jump SMALLINT NOT NULL,
	skill_power SMALLINT NOT NULL,
	capabilities JSONB,
	skills JSONB,
	naturewalks JSONB,

	moves_lvl JSONB,
	moves_tm JSONB,
	moves_egg JSONB,
	moves_tutor JSONB,

	egg_group_a_id INT,
	egg_group_b_id INT,
	gender_ratio REAL,
	hatch_rate SMALLINT,

	size REAL,
	weight REAL,
	
	origin_id INT
);