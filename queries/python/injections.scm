; extends

(
    [
        (string_content)
    ] @injection.content
    (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE|CREATE|DROP|ALTER|TRUNCATE|MERGE).+(FROM|INTO|VALUES|SET|TABLE|SCHEMA|COLUMN|INDEX|USING).*(WHERE|GROUP BY|ORDER BY|ON)?")
    (#set! injection.combined)
    (#set! injection.language "sql")
);
