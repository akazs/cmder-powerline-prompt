-- origin of this piece of code unknown
-- edited by Akaz 2019/11/08

local clink_path_lua_file = clink.get_env('CMDER_ROOT')..'\\vendor\\clink-completions\\modules\\path.lua'
exports = dofile(clink_path_lua_file)

function get_virtual_env(env_var)
    env_path = clink.get_env(env_var)
    if env_path then
        basen = exports.basename(env_path)
        return basen
    end
    return false
end

---
 -- add virtual env name 
---
function venv_prompt_filter()
    -- add in virtual env name
    local venv = get_virtual_env('VIRTUAL_ENV')
    if venv then
        clink.prompt.value = string.gsub(clink.prompt.value, "λ", "("..venv..") λ")
    end
end

clink.prompt.register_filter(venv_prompt_filter, 100)
