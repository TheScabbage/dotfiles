(ERROR) @comment.error

(struct_keyword) @keyword.type
(union_keyword) @keyword.type
(enum_keyword) @keyword.type
(mut_keyword) @keyword

(function_keyword) @keyword.function
(let_keyword) @keyword
(return_keyword) @keyword.return
(comment) @comment
(string) @string
(integer) @number
(rational) @number.float


[
  "+"
  "-"
  "*"
  "/"
  "%"
  "&"
  "|"
  "^"
  "?"
] @operator

"," @punctuation.delimiter

[
 "[" "]"
] @punctuation.bracket

(block_start) @punctuation.bracket
(block_end) @punctuation.bracket

(type(identifier) @type)

(struct_definition
  (identifier) @type
  (struct_body
    (struct_member_list
      (struct_member
    (identifier) @variable.member
    ))
  )
)

(enum_definition
  (identifier) @type
  (enum_body
    (identifier) @type
  )
)

(function_definition
  (function_keyword) @keyword
  (identifier) @function
  (param_list
    (parameter
      (identifier) @variable.parameter
      (type) @type))
  (type) @type
  (block) @block)
