--[[
  Link inline function calls in prose to their documentation.

  Quarto's `code-link: true` links function calls inside executed code chunks.
  This filter does the same for inline code in the text, so that `mutate()` in
  a sentence is a link as well as `mutate()` in a chunk.

  The URL map is written by R/build_function_links.R as a pre-render step.
  Anything not in the map - example functions defined in the book,
  placeholders - is left as plain code.
]]

local url_map = nil

local function load_map()
  if url_map ~= nil then
    return url_map
  end
  url_map = {}
  local ok, tbl = pcall(dofile, "_function_links.lua")
  if ok and type(tbl) == "table" then
    url_map = tbl
  else
    io.stderr:write(
      "link-functions.lua: _function_links.lua not found, " ..
      "inline function links are disabled.\n"
    )
  end
  return url_map
end

-- Only HTML gets links; other formats keep plain code.
local function Code(el)
  if not FORMAT:match("html") then
    return nil
  end
  local url = load_map()[el.text]
  if url == nil then
    return nil
  end
  return pandoc.Link(el, url, "Documentation for " .. el.text)
end

-- Pandoc walks bottom-up, so the Code handler above has already run by the
-- time a surrounding Link is visited. Unwrap any link we created inside an
-- existing link: nested links are invalid HTML.
local function Link(el)
  el.content = el.content:walk({
    Link = function(inner)
      return inner.content
    end,
  })
  return el
end

return { { Code = Code }, { Link = Link } }
