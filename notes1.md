# Databank Connectie: 
register>server > server (dns>ip) op een poort (het luisterende proces) met authenticatie (gebruiker en wachtwoord)
# SSL=Secure Sockets Layer 
Die beveiliging bestaat uit het versleutelen van de gegevens die worden verzonden tussen een website en een browser, of tussen twee servers. Deze versleuteling voorkomt dat hackers de verzonden informatie, waaronder mogelijk persoonlijke of financiële gegevens, kunnen bekijken of stelen.

# herhaling erd
* nut: Uitnormaliseren, Redundantie Vermijden, Consistentie Bewaken
* lagen: conceptueel, logisch, fysisch

# herhaling Sql
SQL=Structured Query Language

Lezen van gegevens

    SELECT
    FROM table1 INNER JOIN table2 t using(id) left outer join table3 t3 on t.id = t3.key
    WHERE
    GROUP BY
    HAVING
    ORDER BY


Muteren van gegevens example

    INSERT INTO bezoeken (reisnr,volgnr,objectnaam verblijfsduur) VALUES (34,4,'maan',2)

    UPDATE reizen
    SET vertrekdatum ='2030-12-31',reisduur = 30, prijs =1.23
    WHERE reisnr = 33;

    DELETE FROM  hemelobjecten
    WHERE objectnaam = 'Pluto';

Bepalen structuur voor gegevens example

    CREATE TABLE bezoeken (
        reisnr numeric(4,0) NOT NULL,
        objectnaam character varying(10) NOT NULL,
        volgnr numeric(2,0) NOT NULL,
        verblijfsduur numeric(4,0) NOT NULL,
        CONSTRAINT bezoeken_pkey PRIMARY KEY (reisnr, volgnr),
        CONSTRAINT bezoeken_objectnaam_fkey
        FOREIGN KEY (objectnaam)REFERENCES hemelobjecten (objectnaam),
        CONSTRAINT bezoeken_reisnr_fkey
        FOREIGN KEY (reisnr)REFERENCES reizen (reisnr)
    );

    GRANT SELECT,USAGE
    ON TABLE bezoeken
    TO student;

case example

    CASE
        WHEN satellietvan IS NULL THEN 'Zon'
        WHEN satellietvan = 'Zon' THEN 'Planeet'
        ELSE 'Satelliet'
    END

Aggregatiefuncties

    COUNT()
    MAX( )
    MIN( )
    SUM( )
    AVG( )
    STDDEV( )
