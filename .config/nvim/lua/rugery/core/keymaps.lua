local opts = { noremap = true, silent = true }

-- Code Actions
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Diagnostics Keymaps
-- Next Diagnostic
vim.api.nvim_set_keymap(
	"n",
	"<leader>dn",
	":lua vim.diagnostic.goto_next({ float = false })<CR>",
	{ noremap = true, silent = true, desc = "Next Error" }
)
-- Previous Diagnostic
vim.api.nvim_set_keymap(
	"n",
	"<leader>dp",
	":lua vim.diagnostic.goto_prev({ float = false })<CR>",
	{ noremap = true, silent = true, desc = "Prev Error" }
)

-- Move Lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

-- Oil 
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>")

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "split windows equal width & height" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "close current split window" }) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- Press jk fast to exit insert mode
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- commenting
vim.keymap.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
vim.keymap.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- Save File
vim.api.nvim_set_keymap("n", "<C-s>", ":lua SaveFile()<CR>", { noremap = true, silent = true })

function SaveFile()
	-- Check if a buffer with a file is open
	if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
		vim.notify("No file to save", vim.log.levels.WARN)
		return
	end

	local filename = vim.fn.expand("%:t") -- Get only the filename
	local success, err = pcall(function()
		vim.cmd("silent! write") -- Try to save the file without showing the default message
	end)

	if success then
		vim.notify(filename .. " Saved!") -- Show only the custom message if successful
	else
		vim.notify("Error: " .. err, vim.log.levels.ERROR) -- Show the error message if it fails
	end
end

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP')

-- Code Runner
vim.keymap.set("n", "<leader>rr", ":RunCode<CR>", { desc = "Run code", noremap = true, silent = false })

-- Execute actual file
vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { desc = "Run current file", noremap = true, silent = false })

-- Execute actual file in a new tab
vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { desc = "Run file in tab", noremap = true, silent = false })

-- Ejecuta el proyecto completo (si tienes definido uno)
vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { desc = "Run project", noremap = true, silent = false })

-- Cierra la terminal donde se ejecutó el código
vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { desc = "Close runner", noremap = true, silent = false })

-- Muestra los tipos de archivos soportados (según config)
vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { desc = "Show filetypes", noremap = true, silent = false })

-- Muestra los proyectos definidos (si usas `.code-runner.json`)
vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { desc = "Show projects", noremap = true, silent = false })
