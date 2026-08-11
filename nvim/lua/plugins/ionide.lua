return {
  "ionide/Ionide-vim",
  ft = { "fsharp", "fsharp_project" },
  init = function()
    vim.g["fsharp#backend"] = "nvim"
    vim.g["fsharp#fsautocomplete_command"] = { "fsautocomplete" }
    vim.g["fsharp#lsp_auto_setup"] = 1
    vim.g["fsharp#lsp_codelens"] = 1
    vim.g["fsharp#linter"] = 1
    vim.g["fsharp#unused_opens_analyzer"] = 1
    vim.g["fsharp#unused_declarations_analyzer"] = 1
    vim.g["fsharp#automatic_workspace_init"] = 1
    vim.g["fsharp#automatic_reload_workspace"] = 1
  end,
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      pattern = { "*.fs", "*.fsi", "*.fsx" },
      callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>cf", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end,
    })
  end,
}
