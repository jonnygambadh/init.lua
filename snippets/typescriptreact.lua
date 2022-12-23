local ls = require("luasnip")
local t = ls.text_node
local postfix = require("luasnip.extras.postfix").postfix
local f = ls.function_node
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local s = ls.snippet

return {
  s({ trig = "className", snippetType = "autosnippet" }, {
    t('className="'),
    i(0),
    t('"')
  }),
  postfix({ trig = "#res", snippetType = "autosnippet" }, {
    f(function(_, parent)
      local name = parent.snippet.env.POSTFIX_MATCH
      local capitalized = (name:gsub("^%l", string.upper))
      return "const [" .. name .. ", set" .. capitalized .. "] = "
    end, {}),
    c(1, {
      sn(nil, { t("React."), i(1) }),
      t("")
    }),
    t("useState"),
    c(2, {
      sn(nil, { t "<", i(1), t ">" }),
      t("")
    }),
    t("("),
    i(3),
    t({ ")", "" }),
    i(0)
  }),

}
