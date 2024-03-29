require('clipboard-image').setup {
  -- Default configuration for all filetype
  default = {
    img_dir = "images",
    img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end, -- Example result: "2021-04-13-10-04-18"
    affix = "<\n  %s\n>" -- Multi lines affix
  },
  -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
  -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
  -- Missing options from `markdown` field will be replaced by options from `default` field
  markdown = {
    img_name = function ()
      --local date = os.date('_%Y-%m-%d-%H-%M-%S')
      local name = nil
      vim.ui.input({prompt = "Name: ", default = ""}, function(input)
        name = input
      end)
        if (name == "") then
          name = os.date('_%Y-%m-%d-%H-%M-%S')
        end
      return name
    end,
    img_dir = {"img"}, -- Use table for nested dir (New feature form PR #20)
    img_dir_txt = "/img",
    img_handler = function(img) -- New feature from PR #22
      local script = string.format('optipng "%s"', img.path)
      os.execute(script)
     end,
  }
}
