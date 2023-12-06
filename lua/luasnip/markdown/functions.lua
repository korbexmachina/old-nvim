local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s({trig="pw", snippetType="autosnippet"},
    fmta(
      [[
\begin{cases} 
    <> & <> \\
    <> & <> \\
    <> & <> 
\end{cases}

    ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
        i(5),
        i(6),
      }
    )
  ),
}
