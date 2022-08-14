
require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_prefix = "🔍 ",
    },
    extensions = {
        project = {
            base_dirs = {
            },
            hidden_files = false, -- default: false
            theme = "dropdown"
        },

    }
}

require'telescope'.load_extension('project')
