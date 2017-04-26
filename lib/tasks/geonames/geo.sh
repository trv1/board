#!/bin/bash
#===============================================================================
#
# FILE: getgeo.sh
#
# USAGE: ./getgeo.sh
#
# DESCRIPTION: run the script so that the geodata will be downloaded and inserted into your
# database
#
# OPTIONS: ---
# REQUIREMENTS: ---
# BUGS: ---
# NOTES: ---
# AUTHOR: Andreas (aka Harpagophyt )
# COMPANY: <a href="http://forum.geonames.org/gforum/posts/list/926.page" target="_blank" rel="nofollow">http://forum.geonames.org/gforum/posts/list/926.page</a>
# VERSION: 1.3
# CREATED: 07/06/2008
# REVISION: 1.1 2008-06-07 replace COPY continentCodes through INSERT statements.
# 1.2 2008-11-25 Adjusted by Bastiaan Wakkie in order to not unnessisarily
# download.
# 1.3 2011-08-07 Updated script with tree changes. Removes 2 obsolete records from "countryinfo" dump image,
#                updated timeZones table with raw_offset and updated postalcode to varchar(20).
#===============================================================================
#!/bin/bash

WORKPATH="${HOME}/tmp/geodata"
TMPPATH="tmp"
PCPATH="pc"
PREFIX="_"
DBHOST="localhost"
DBPORT="5432"
DBUSER="roman"
FILES="allCountries.zip alternateNames.zip admin1CodesASCII.txt admin2Codes.txt countryInfo.txt featureCodes_ru.txt iso-languagecodes.txt timeZones.txt hierarchy.txt cities1000.zip"
#FILES="cities1000.zip"
PGPASSWORD=123456 psql -U $DBUSER -h $DBHOST -p $DBPORT board <<EOT
DROP TABLE IF EXISTS geoname CASCADE;
CREATE TABLE geoname (
    geonameid      INT PRIMARY KEY,
    name           VARCHAR(200),
    asciiname      VARCHAR(200),
    alternatenames TEXT,
    latitude       FLOAT,
    longitude      FLOAT,
    fclass         CHAR(1),
    fcode          VARCHAR(10),
    country        VARCHAR(2),
    cc2            VARCHAR(100),
    admin1         VARCHAR(20),
    admin2         VARCHAR(80),
    admin3         VARCHAR(20),
    admin4         VARCHAR(20),
    population     BIGINT,
    elevation      INT,
    gtopo30        INT,
    timezone       VARCHAR(40),
    moddate        DATE
);
DROP TABLE IF EXISTS alternatename;
CREATE TABLE alternatename (
    alternatenameId INT PRIMARY KEY,
    geonameid       INT,
    isoLanguage     VARCHAR(7),
    alternateName   VARCHAR(300),
    isPreferredName BOOLEAN,
    isShortName     BOOLEAN,
    isColloquial    BOOLEAN,
    isHistoric      BOOLEAN
);
DROP TABLE IF EXISTS countryinfo;
CREATE TABLE "countryinfo" (
    iso_alpha2           CHAR(2) PRIMARY KEY,
    iso_alpha3           CHAR(3),
    iso_numeric          INTEGER,
    fips_code            CHARACTER VARYING(3),
    country              CHARACTER VARYING(200),
    capital              CHARACTER VARYING(200),
    areainsqkm           DOUBLE PRECISION,
    population           INTEGER,
    continent            CHAR(2),
    tld                  CHAR(10),
    currency_code        CHAR(3),
    currency_name        CHAR(15),
    phone                CHARACTER VARYING(20),
    postal               CHARACTER VARYING(60),
    postalRegex          CHARACTER VARYING(200),
    languages            CHARACTER VARYING(200),
    geonameId            INT,
    neighbours           CHARACTER VARYING(50),
    equivalent_fips_code CHARACTER VARYING(3)
);
DROP TABLE IF EXISTS iso_languagecodes;
CREATE TABLE iso_languagecodes(
    iso_639_3     CHAR(4) PRIMARY KEY,
    iso_639_2     VARCHAR(50),
    iso_639_1     VARCHAR(50),
    language_name VARCHAR(200)
);
DROP TABLE IF EXISTS admin1CodesAscii;
CREATE TABLE admin1CodesAscii (
    code      CHAR(20),
    name      TEXT,
    nameAscii TEXT,
    geonameid INT PRIMARY KEY
);
DROP TABLE IF EXISTS admin2CodesAscii;
CREATE TABLE admin2CodesAscii (
    code      CHAR(80),
    name      TEXT,
    nameAscii TEXT,
    geonameid INT PRIMARY KEY
);
DROP TABLE IF EXISTS featureCodes;
CREATE TABLE featureCodes (
    code        CHAR(7),
    name        VARCHAR(200),
    description TEXT
);
CREATE INDEX ON featureCodes (code);
DROP TABLE IF EXISTS timeZones;
CREATE TABLE timeZones (
    country    VARCHAR(2),
    timeZoneId VARCHAR(200),
    GMT_offset NUMERIC(3,1),
    DST_offset NUMERIC(3,1),
    raw_offset NUMERIC(3,1)
);
DROP TABLE IF EXISTS continentCodes;
CREATE TABLE continentCodes (
    code      CHAR(2),
    name      VARCHAR(20),
    geonameid INT PRIMARY KEY
);
DROP TABLE IF EXISTS postalcodes;
CREATE TABLE postalcodes (
    countrycode CHAR(2),
    postalcode  VARCHAR(20),
    placename   VARCHAR(180),
    admin1name  VARCHAR(100),
    admin1code  VARCHAR(20),
    admin2name  VARCHAR(100),
    admin2code  VARCHAR(20),
    admin3name  VARCHAR(100),
    admin3code  VARCHAR(20),
    latitude    FLOAT,
    longitude   FLOAT,
    accuracy    SMALLINT
);
DROP TABLE IF EXISTS hierarchy;
CREATE TABLE IF NOT EXISTS hierarchy (
  parentId INT,
  childId INT,
  type VARCHAR(50),
  PRIMARY KEY (parentId, childId)
);
DROP TABLE IF EXISTS cities;
CREATE TABLE IF NOT EXISTS cities (
  geonameid int PRIMARY KEY,
  name varchar(200) DEFAULT NULL,
  asciiname varchar(200) DEFAULT NULL,
  alternatenames varchar(4000) DEFAULT NULL,
  latitude float DEFAULT NULL,
  longitude float DEFAULT NULL,
  fclass char(1) DEFAULT NULL,
  fcode varchar(10) DEFAULT NULL,
  country varchar(2) DEFAULT NULL,
  cc2 varchar(100) DEFAULT NULL,
  admin1 varchar(20) DEFAULT NULL,
  admin2 varchar(80) DEFAULT NULL,
  admin3 varchar(20) DEFAULT NULL,
  admin4 varchar(20) DEFAULT NULL,
  population int DEFAULT NULL,
  elevation int DEFAULT NULL,
  gtopo30 int DEFAULT NULL,
  timezone varchar(40) DEFAULT NULL,
  moddate date DEFAULT NULL
);
ALTER TABLE ONLY countryinfo
    ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geoname(geonameid);
ALTER TABLE ONLY alternatename
    ADD CONSTRAINT fk_geonameid FOREIGN KEY (geonameid) REFERENCES geoname(geonameid);
EOT

# check if needed directories do already exsist
if [ -d "$WORKPATH" ]; then
    echo "$WORKPATH exists..."
    sleep 0
else
    echo "$WORKPATH and subdirectories will be created..."
    mkdir -p $WORKPATH/{$TMPPATH,$PCPATH}
    echo "created $WORKPATH"
fi

echo
echo ",---- STARTING (downloading, unpacking and preparing)"
cd $WORKPATH/$TMPPATH
for i in $FILES
do
    wget -N -q "http://download.geonames.org/export/dump/$i" # get newer files
    if [ $i -nt $PREFIX$i ] || [ ! -e $PREFIX$i ] ; then
        cp -p $i $PREFIX$i
        unzip -u -q $i

        case "$i" in
            iso-languagecodes.txt)
                tail -n +2 iso-languagecodes.txt > iso-languagecodes.txt.tmp;
                ;;
            countryInfo.txt)
                grep -v '^#' countryInfo.txt | head -n -2 > countryInfo.txt.tmp;
                ;;
            timeZones.txt)
                tail -n +2 timeZones.txt > timeZones.txt.tmp;
                ;;
        esac
        echo "| $1 has been downloaded";
    else        echo "| $i is already the latest version"
    fi
done

# download the postalcodes. You must know yourself the url
cd $WORKPATH/$PCPATH
#wget -q -N "http://download.geonames.org/export/zip/allCountries.zip"

if [ $WORKPATH/$PCPATH/allCountries.zip -nt $WORKPATH/$PCPATH/allCountries$PREFIX.zip ] || [ ! -e $WORKPATH/$PCPATH/allCountries.zip ]; then
    echo "Attempt to unzip $WORKPATH/$PCPATH/allCountries.zip file..."
    unzip -u -q $WORKPATH/$PCPATH/allCountries.zip
    cp -p $WORKPATH/$PCPATH/allCountries.zip $WORKPATH/$PCPATH/allCountries$PREFIX.zip
    echo "| ....zip has been downloaded"
else
    echo "| ....zip is already the latest version"
fi

echo "+---- FILL DATABASE ( this takes 2 days on my machine )"

PGPASSWORD=123456 psql -e -U $DBUSER -h $DBHOST -p $DBPORT board <<EOT
copy geoname (geonameid,name,asciiname,alternatenames,latitude,longitude,fclass,fcode,country,cc2,admin1,admin2,admin3,admin4,population,elevation,gtopo30,timezone,moddate) from '${WORKPATH}/${TMPPATH}/allCountries.txt' null as '';
copy postalcodes (countrycode,postalcode,placename,admin1name,admin1code,admin2name,admin2code,admin3name,admin3code,latitude,longitude,accuracy) from '${WORKPATH}/${PCPATH}/allCountries.txt' null as '';
copy timeZones (country,timeZoneId,GMT_offset,DST_offset,raw_offset) from '${WORKPATH}/${TMPPATH}/timeZones.txt.tmp' null as '';
copy featureCodes (code,name,description) from '${WORKPATH}/${TMPPATH}/featureCodes_ru.txt' null as '';
copy admin1CodesAscii (code,name,nameAscii,geonameid) from '${WORKPATH}/${TMPPATH}/admin1CodesASCII.txt' null as '';
copy admin2CodesAscii (code,name,nameAscii,geonameid) from '${WORKPATH}/${TMPPATH}/admin2Codes.txt' null as '';
copy iso_languagecodes (iso_639_3,iso_639_2,iso_639_1,language_name) from '${WORKPATH}/${TMPPATH}/iso-languagecodes.txt.tmp' null as '';
copy countryInfo (iso_alpha2,iso_alpha3,iso_numeric,fips_code,country,capital,areainsqkm,population,continent,tld,currency_code,currency_name,phone,postal,postalRegex,languages,geonameid,neighbours,equivalent_fips_code) from '${WORKPATH}/${TMPPATH}/countryInfo.txt.tmp' null as '';
copy alternatename (alternatenameid,geonameid,isoLanguage,alternateName,isPreferredName,isShortName,isColloquial,isHistoric) from '${WORKPATH}/${TMPPATH}/alternateNames.txt' null as '';
copy cities (geonameid,name,asciiname,alternatenames,latitude,longitude,fclass,fcode,country,cc2,admin1,admin2,admin3,admin4,population,elevation,gtopo30,timezone,moddate) from '${WORKPATH}/${TMPPATH}/cities1000.txt' null as '';

INSERT INTO continentCodes VALUES ('AF', 'Africa', 6255146);
INSERT INTO continentCodes VALUES ('AS', 'Asia', 6255147);
INSERT INTO continentCodes VALUES ('EU', 'Europe', 6255148);
INSERT INTO continentCodes VALUES ('NA', 'North America', 6255149);
INSERT INTO continentCodes VALUES ('OC', 'Oceania', 6255150);
INSERT INTO continentCodes VALUES ('SA', 'South America', 6255151);
INSERT INTO continentCodes VALUES ('AN', 'Antarctica', 6255152);
CREATE INDEX index_countryinfo_geonameid ON countryinfo USING hash (geonameid);
CREATE INDEX index_alternatename_geonameid ON alternatename USING hash (geonameid);
EOT
echo "'----- DONE ( have fun... )"