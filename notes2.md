# transacties 

    start transaction; sql code; commit;
    start transaction; sql code; rollback;

    start transaction; sql code; savepoint s1; sql code; rollback work to s1; commit;
    savepoint s1
    rollback work to savepoint s1

    set transaction isolation level read uncommitted;
    SHOW transaction_isolation;
     READ UNCOMMITTED
    | READ COMMITTED
    | REPEATABLE READ
    | SNAPSHOT
    | SERIALIZABLE
    SHOW default_transaction_isolation;

* dirty read: gebruiker leest data die nooit gecommit is
* nonreapeatable read:  de gebruiker leest andere data voor en na een commit (gegevens veranderd)
* phantom read: de gebruiker leest andere data voor en na een commit (gegevens toegevoegd)
* lost update: de gegevens van een gebruiker worden overschreven door een andere gebruiker
* serialisation anomaly: Het resultaat van het succesvol vastlegen van een volgorde van een groep van transacties is inconsistent met het één voor één uitvoeren van de transacties

=> transacties serieel verwerken, maar veel transacties moeten parrallel anders te veel wachten. 

=> table locking: een bepaalde tabel word gelocked, opgepast voor deadlocking( 2 transacties die op elkaar wachten), dan word één transactie afgebroken.

isolatie levels -> zie powerpoint.


