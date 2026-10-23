BEGIN
    FOR FILA_V IN FN_LISTAR_REGIONES(SELECT * FROM TABLE(FN_LISTAR_REGIONES())) 
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Código: ' || FILA_V.CODIGO_REGION ||
            ' - Nombre: ' || FILA_V.NOMBRE
        );
    END LOOP;
END;
/
