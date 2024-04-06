local M = {}

function M.desc(t)
    return function(desc)
        local result = vim.deepcopy(t)
        result["desc"] = desc
        return result
    end
end

return M
