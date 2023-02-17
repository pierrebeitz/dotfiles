require("telescope").setup {
  pickers = {
    find_files = {
      on_input_filter_cb = function(prompt)
        return { prompt = prompt:gsub("%s", "") }
      end,
    },
    live_grep = {
      on_input_filter_cb = function(prompt)
        return { prompt = prompt:gsub("%s", ".*") }
      end,
    },
  }
}
