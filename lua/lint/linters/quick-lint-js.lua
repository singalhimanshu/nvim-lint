local pattern = [[([^:]*):(%d*):(%d*): (%w+): (.*)]]
local groups = { 'file', 'line', 'start_col', 'severity', 'message' }

local severity_map = {
  ['error'] = vim.lsp.protocol.DiagnosticSeverity.Error,
  ['warning'] = vim.lsp.protocol.DiagnosticSeverity.Warning,
  ['note'] = vim.lsp.protocol.DiagnosticSeverity.Information,
}

return {
  cmd = 'quick-lint-js',
  stdin = true,
  ignore_exitcode = true,
  stream = 'stdout',
  parser = require('lint.parser').from_pattern(pattern, groups, severity_map, { ['source'] = 'quick-lint-js' }),
}
