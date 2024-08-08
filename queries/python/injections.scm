; extends

(
    [
        (string_content)
    ] @injection.content
    (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE|CREATE|DROP|ALTER).+(FROM|INTO|VALUES|SET|TABLE|SCHEMA|COLUMN|INDEX).*(WHERE|GROUP BY|ORDER BY)?")
    (#set! injection.language "sql")
)
