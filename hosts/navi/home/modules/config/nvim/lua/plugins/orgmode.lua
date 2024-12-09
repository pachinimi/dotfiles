return {
{
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/Storage/Personal/Notes/Org-Mode/**/*',
      org_default_notes_file = '~/Storage/Personal/Notes/Org-Mode/refile.org',
    })
  end,
}
}
