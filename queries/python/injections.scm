; extends

; SQL string injections
(expression_statement
  (call
    function: (attribute
      attribute: (identifier)
        @_method (#any-of? @_method
          "execute"
          "executemany"
          "mogrify"
          "read_sql"))

    arguments: (argument_list
      (string
        (string_content) @injection.content (#set! injection.language "sql")))))

(expression_statement
  (call
    function:
      (attribute
        object: (identifier)
        attribute: (identifier)
          @_method (#match? @_method "read_sql.*"))

    arguments: (argument_list
      (string
        (string_content) @injection.content (#set! injection.language "sql")))))

(expression_statement
  (assignment
    left: (identifier) @_name (#match? @_name ".*sql|query.*")
    right: (string
      (string_content) @injection.content (#set! injection.language "sql"))))
