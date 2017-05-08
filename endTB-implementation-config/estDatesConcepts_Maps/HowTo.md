cd $directoryName

mysqldump -u<user> -p<password> --delimiter="//" dbName < pih_concept_reference_map.sql

mysqldump -u<user> -p<password> --delimiter="//" dbName < pih_concept_reference_term.sql

mysql -u <user> -p < est_dates_concept_reference_term.sql

mysql -u <user> -p < est_dates_ref_maps.sql 
