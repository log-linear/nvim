; Tree-sitter query for extracting embedded Python code from SQL user-defined functions
; This query matches CREATE FUNCTION statements with LANGUAGE PYTHON and captures
; the Python code body between AS $$ and $$;

; Match CREATE [OR REPLACE] FUNCTION with LANGUAGE PYTHON
(
  (create_function_statement
    ; Optional language clause must be PYTHON
    language: (keyword_language)? @_language
    ; Capture the function body
    as: (keyword_as)
    ; The actual Python code is in a dollar-quoted string body
    (dollar_quote_string
      ; Dollar quote delimiter (e.g., $$)
      (dollar_quote) @_start_delimiter
      ; The content between the delimiters
      (dollar_quote_string_content) @injection.content
      ; Closing delimiter
      (dollar_quote) @_end_delimiter
    )
  )
  ; Only inject Python if LANGUAGE PYTHON is specified
  (#match? @_language "(?i)python")
  (#set! injection.language "python")
)

; Alternative pattern for when tree-sitter-sql doesn't parse the structure exactly as above
; This is a more flexible fallback that looks for dollar-quoted strings following LANGUAGE PYTHON

(
  (create_function_statement) @function
  (#match? @function "(?i)LANGUAGE\\s+PYTHON")
)

; Simpler pattern that just looks for dollar-quoted content after AS keyword
; in any CREATE FUNCTION with LANGUAGE PYTHON somewhere in the statement

(
  (create_function_statement
    (dollar_quote_string
      (dollar_quote_string_content) @injection.content
    )
  ) @_function
  (#match? @_function "(?i)LANGUAGE\\s+PYTHON")
  (#set! injection.language "python")
)
