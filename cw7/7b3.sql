CREATE OR REPLACE FUNCTION tax_rate_monitoring()
RETURNS TRIGGER AS $$
DECLARE
    old_tax_rate NUMERIC;
    new_tax_rate NUMERIC;
    max_change NUMERIC;
BEGIN
    old_tax_rate := OLD.TaxRate;
    new_tax_rate := NEW.TaxRate;
    

    max_change := old_tax_rate * 0.3;
   
    IF ABS(old_tax_rate - new_tax_rate) > max_change THEN
        RAISE EXCEPTION 'Zmiana wartości w polu TaxRate o więcej niż 30% jest zabroniona';
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tax_rate_monitoring_trigger
BEFORE UPDATE OF TaxRate ON sales.salestaxrate 
FOR EACH ROW
EXECUTE FUNCTION tax_rate_monitoring();


UPDATE Sales.SalesTaxRate
SET TaxRate = TaxRate * 1.33
WHERE TaxRate = '8';
