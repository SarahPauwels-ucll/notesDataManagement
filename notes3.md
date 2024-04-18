# prepared statments
is beter voor security omdat geen andere query's kunnen uitgevoerd worden

### prepare statment maakt functie
prepare statmentnaam(varchar(20), date, otherdatatype)
as insert into clanten values($1,$2,$3);

### prepare statment uitgevoerd
execute statmentnaam("text", now(), "otherstring");

### verwijdered prepare statment
deallocate add_customer;

deallocate all

## embedded in een andere taal
vb. in java
PreparedStatment statmentnaam=c.preparedstatement("inset into klanten values(?,?,?)");
