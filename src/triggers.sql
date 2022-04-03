CREATE OR REPLACE FUNCTION auditlogfunc() RETURNS TRIGGER AS $dummy_table$
	DECLARE affected integer;
   BEGIN
   		IF(TG_OP='DELETE') THEN 
			affected := old.id; 
		ELSE 
			affected := new.id; 
		END IF;
		INSERT INTO logs(row_id,table_name,operation,user_name, operation_date) 
		VALUES (affected,TG_TABLE_NAME,TG_OP,user, current_timestamp);
		RETURN null;
   END;
$dummy_table$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER employee_audit_trigger AFTER INSERT OR UPDATE OR DELETE ON employees FOR EACH ROW EXECUTE PROCEDURE auditlogfunc();
CREATE OR REPLACE TRIGGER employee_information_audit_trigger AFTER INSERT OR UPDATE OR DELETE ON employees_information FOR EACH ROW EXECUTE PROCEDURE auditlogfunc();
CREATE OR REPLACE TRIGGER languages_audit_trigger AFTER INSERT OR UPDATE OR DELETE ON languages FOR EACH ROW EXECUTE PROCEDURE auditlogfunc();
