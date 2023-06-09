local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

local status_ts_ok, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
if not status_ts_ok then
  return
end

comment.setup {
  pre_hook = ts_comment.create_pre_hook(),
}
