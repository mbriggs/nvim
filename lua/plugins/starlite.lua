return {
	"ironhouzi/starlite-nvim",
	keys = {
		{ "*", "<Cmd>lua require'starlite'.star()<CR>", desc = "Star this code" },
		{ "g*", "<Cmd>lua require'starlite'.g_star()<CR>", desc = "Star this code" },
		{ "#", "<Cmd>lua require'starlite'.hash()<CR>", desc = "Star this code" },
		{ "g#", "<Cmd>lua require'starlite'.g_hash()<CR>", desc = "Star this code" },
	},
}

-- nnoremap <silent> * :lua require'starlite'.star()<cr>
-- nnoremap <silent> g* :lua require'starlite'.g_star()<cr>
-- nnoremap <silent> # :lua require'starlite'.hash()<cr>
-- nnoremap <silent> g# :lua require'starlite'.g_hash()<cr>
