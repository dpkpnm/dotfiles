let g:any_jump_grouping_enabled = 1 
let g:any_jump_max_search_results = 100
let g:any_jump_preview_lines_count = 1
let g:any_jump_window_height_ratio = 0.8
let g:any_jump_window_top_offset   = 2 
let g:any_jump_window_width_ratio  = 0.8
let g:compe = {}
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.documentation = v:true
let g:compe.enabled = v:true
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.source = {}
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.path = v:true
let g:compe.source.vsnip = v:true
let g:compe.source_timeout = 200
let g:compe.throttle_time = 80
let g:move_key_modifier='c'
let g:netrw_banner=0
let g:netrw_chgwin=1
let g:netrw_fastbrowse = 0
let g:netrw_list_hide='.*\.swp$'
let g:notes_directories = ['~/dev/notes']
let g:notes_suffix = '.txt'
let g:notes_word_boundaries = 1
let g:session_autoload='yes'
let g:session_autosave='yes'
let gprettier#autoformat = 0
let mapleader = " "

let g:lualine = {
    \'options' : {
    \  'theme' : 'gruvbox',
    \  'section_separators' : ['', ''],
    \  'component_separators' : ['', ''],
    \  'icons_enabled' : v:true,
    \},
    \'sections' : {
    \  'lualine_a' : [ ['mode', {'upper': v:true,},], ],
    \  'lualine_b' : [ ['branch', {'icon': '',}, ], ],
    \  'lualine_c' : [ ['filename', {'file_status': v:true,},], ],
    \  'lualine_x' : [ 'filetype' ],
    \  'lualine_y' : [ 'progress' ],
    \  'lualine_z' : [ 'location'  ],
    \},
    \'inactive_sections' : {
    \  'lualine_a' : [  ],
    \  'lualine_b' : [  ],
    \  'lualine_c' : [ 'filename' ],
    \  'lualine_x' : [ 'location' ],
    \  'lualine_y' : [  ],
    \  'lualine_z' : [  ],
    \},
    \'extensions' : [ 'fzf' ],
    \}
