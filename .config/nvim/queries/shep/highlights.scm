(ERROR) @comment.error

(use_keyword)    @keyword.import
(struct_keyword) @keyword.type
(union_keyword)  @keyword.type
(enum_keyword)   @keyword.type
(mut_keyword)    @keyword
(for_keyword)    @keyword
(loop_keyword)   @keyword.repeat
"in"             @keyword
(try_keyword)    @keyword.exception
(catch_keyword)  @keyword.exception

(function_keyword) @keyword.function
(let_keyword) @keyword
(return_keyword) @keyword.return
(comment) @comment
(string) @string
(integer) @number
(rational) @number.float

(numeric_primitive) @keyword

[
  "+"
  "-"
  "*"
  "/"
  "%"
  "&"
  "|"
  "?"
] @operator

(ref_op) @operator

"," @punctuation.delimiter

[
 "[" "]"
 "(" ")"
] @punctuation.bracket

(block_start) @punctuation.bracket
(block_end) @punctuation.bracket

(type (identifier) @type)
(reference_type (ref_op) @operator)

(struct_definition
  (identifier) @type
  (struct_body
    (struct_member_list
      (struct_member
        (identifier) @variable.member
      )
    )
  )
)

(struct_impl
  (impl_keyword) @keyword
  (identifier) @type)

(trait_impl
  (impl_keyword) @keyword
  (identifier) @type
  (identifier) @type)

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
      (identifier) @variable.parameter))
  (block) @block)

(for_capture
  (identifier) @variable.parameter)
