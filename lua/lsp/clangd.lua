local nvim_lsp = require 'lspconfig'
return {
  root_dir = nvim_lsp.util.root_pattern 'CMakeLists.txt',
  single_file_support = true,
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { 'utf-16' },
  },
  on_new_config = function(new_config)
    local status, cmake = pcall(require, 'cmake-tools')
    if status then
      cmake.clangd_on_new_config(new_config)
    end
  end,
  cmd = {
    'clangd',
    '--clang-tidy',
    '--query-driver=' .. require('televic').build_scripts_path .. '/toolchains/' .. require('televic').toolchainfile .. '/bin/i686-linux-g++',
  },
}
