CREATE OR REPLACE FUNCTION Fibonacci (n INT)
RETURNS INT AS $$
DECLARE
    a INT := 0; -- aktualna pozycja w ciągu
    n1 INT := 0; -- pierwszy element
    n2 INT := 1; -- drugi element
    i INT := 2;
BEGIN
    IF n = 0 THEN
        RETURN n1;
    ELSEIF n = 1 THEN
        RETURN n2;
    ELSE
        WHILE i <= n LOOP
            a := n1 + n2;
            n1 := n2;
            n2 := a;
            i := i + 1;
        END LOOP;
        RETURN a;
    END IF;
    RETURN 0;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE ShowFibonacci(n INT) AS $$
DECLARE
    i INT := 0;
BEGIN
    RAISE NOTICE 'Ciąg Fibonacciego dla % elementów:', n;
    WHILE i < n LOOP
        RAISE NOTICE '% ', Fibonacci(i);
        i := i + 1;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

CALL ShowFibonacci(11);

