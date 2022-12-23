local ls = require("luasnip")
local f = ls.function_node
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local postfix = require("luasnip.extras.postfix").postfix

return {
  s('imp', {
    t('import '),
    i(0),
    t(' from "'),
    i(1),
    t('"')
  }),
  postfix({ trig = "#dob", snippetType = "autosnippet" }, {
    t("const { "),
    i(0),
    t(" } = "),
    f(function(_, parent)
      return parent.snippet.env.POSTFIX_MATCH
    end, {}),
    i(1)
  }),
  postfix({ trig = "#dar", snippetType = "autosnippet" }, {
    t("const [ "),
    i(0),
    t(" ] = "),
    f(function(_, parent)
      return parent.snippet.env.POSTFIX_MATCH
    end, {}),
    i(1)
  }),
  s({ trig = ",,", snippetType = "autosnippet" }, {
    t('('),
    i(1),
    t(') => '),
    i(0)
  })
}
