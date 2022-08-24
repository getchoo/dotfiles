--
-- config for lsp server
--
local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local M = {}

vim.g.coq_settings = { auto_start = "shut-up" }

local sources = {
  lsp_servers = { "rust_analyzer", "pyright", "bashls" },
  null_ls = {
    diagnostics.alex,
    diagnostics.codespell,
    diagnostics.flake8,
    formatting.black,
    formatting.codespell,
    formatting.prettier,
    formatting.rustfmt,
    formatting.stylua,
  },
  mason = {
    "alex",
    "black",
    "codespell",
    "flake8",
    "prettier",
    "stylua",
  },
}

-- configure lsp servers
local all_config = {}
local servers = {}
for _, server in ipairs(sources.lsp_servers) do
  servers[server] = all_config
end

servers["sumneko_lua"] = {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

M.lsp_servers = servers

-- only use null-ls for formatting

--- for neovim >= 8
--- local lsp_formatting = function(bufnr)
--- 	vim.lsp.buf.format({
--- 		filter = function(client)
--- 			return client.name == "null-ls"
--- 		end,
--- 		bufnr = bufnr,
--- 	})
--- end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        local params = require("vim.lsp.util").make_formatting_params({})
        client.request("textDocument/formatting", params, nil, bufnr)
        -- lsp_formatting(bufnr) -- neovim >= 8
      end,
    })
  end
end

M.null_ls = {
  on_attach = on_attach,
  sources = sources.null_ls,
}

M.mason_tool_installer = {
  ensure_installed = sources.mason,
}

M.mason_lsp = {
  automatic_installation = true,
}

-- etc plugins
M.bufferline = {
  options = {
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    always_show_bufferline = false,
  },
}
M.tree = {}
M.treesitter = {
  auto_install = true,
}
M.trouble = {}

return M
