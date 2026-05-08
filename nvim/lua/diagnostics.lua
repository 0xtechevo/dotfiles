vim.diagnostic.config({
  virtual_text = true, -- Shows error text next to the line
  signs = true,        -- Shows icons (E, W, etc.) in the gutter
  update_in_insert = false, -- Don't show errors while you are typing
  underline = true,    -- Underline problematic code
  float = { border = "rounded" },
})
