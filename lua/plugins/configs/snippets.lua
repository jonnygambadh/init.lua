local ls = require('luasnip')
local rep = require("luasnip.extras").rep

ls.config.set_config({
  enable_autosnippets = true,
  updateevents = "TextChanged,TextChangedI"
})

local t = ls.text_node
local f = ls.function_node
local s = ls.snippet
local i = ls.insert_node
local postfix = require("luasnip.extras.postfix").postfix


ls.add_snippets("all", {
  postfix({ trig = ".log", snippetType = 'autosnippet' }, {
    t("console.log("),
    f(function(_, parent)
      return parent.snippet.env.POSTFIX_MATCH
    end, {}),
    t(", '"),
    f(function(_, parent)
      return parent.snippet.env.POSTFIX_MATCH
    end, {}),
    t("')"),
  }),
  s(".filter", {
    t(".filter("), i(1, 'item'), t({ ")=> {", "" }), i(0, rep(1)), t({ "", "})" })
  }),
  s(",,", {
    t('('),
    i(1),
    t(') => '),
    i(0)
  })
})
