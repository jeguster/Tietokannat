-- SQliteä varten muokattu versio

CREATE TABLE tuoteryhma (
                tuoteryhma TEXT PRIMARY KEY
);


CREATE TABLE tuote (
                yksilointikoodi INTEGER PRIMARY KEY,
                tuoteryhma TEXT NOT NULL,
                nimike TEXT NOT NULL,
                merkki TEXT NOT NULL,
                Malli TEXT  NOT NULL,
                paivavuokra FLOAT NOT NULL,
                FOREIGN KEY (tuoteryhma) REFERENCES tuoteryhma (tuoteryhma)
);


CREATE TABLE yhteystyyppi (
                yhteystyyppi TEXT PRIMARY KEY
);
-- COMMENT ON COLUMN yhteystyyppi.yhteystyyppi IS 'Taulu on luotu vain käyttöliittymää varten. Se estää käyttäjää syöttämästä Yhteyshenkilö-tauluun muita kuin ennalta määrättyjä arvoja.';


CREATE TABLE asiakas (
                asiakasnumero INTEGER PRIMARY KEY,
                yritys TEXT NOT NULL,
                laskutusosoite TEXT NOT NULL,
                postinumero TEXT NOT NULL,
                postitoimipaikka TEXT NOT NULL
);
--COMMENT ON COLUMN asiakas.laskutusosoite IS 'Yrityksen laskujen katu- tai PL-osoite';

CREATE TABLE yhteyshenkilo (
                yhteyshenkilo_id INTEGER PRIMARY KEY,
                yhteystyyppi TEXT NOT NULL,
                etunimi TEXT NOT NULL,
                sukunimi TEXT NOT NULL,
                puhelin TEXT,
                sahkoposti TEXT NOT NULL,
                asiakasnumero INTEGER NOT NULL,
                FOREIGN KEY (yhteystyyppi) REFERENCES yhteystyyppi (yhteystyyppi),
                FOREIGN KEY (asiakasnumero) REFERENCES asiakasnumero (asiakasnumero)
);
--COMMENT ON COLUMN yhteyshenkilo.yhteyshenkilo_id IS 'Dummy perusavain. Tulevaisuuden tarpeita varten';
--COMMENT ON COLUMN yhteyshenkilo.yhteystyyppi IS 'Taulu on luotu vain käyttöliittymää varten. Se estää käyttäjää syöttämästä Yhteyshenkilö-tauluun muita kuin ennalta määrättyjä arvoja.';

CREATE TABLE vuokraus (
                tapahtumaid INTEGER PRIMARY KEY,
                asiakasnumero INTEGER NOT NULL,
                yksilointikoodi INTEGER NOT NULL,
                alkamispaiva DATE NOT NULL,
                paattymispaiva DATE NOT NULL,
                FOREIGN KEY (asiakasnumero) REFERENCES asiakas (asiakasnumero),
                FOREIGN KEY (yksilointikoodi) REFERENCES tuote (yksilointikoodi)
);
--COMMENT ON COLUMN vuokraus.tapahtumaid IS 'Dummy id tulevia käyttötarkoituksia varten';