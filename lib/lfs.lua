local fs = require'filesystem'

local function dir(path)
  return fs.list(path)
end

local function attributes(path, mode)
  if mode == "mode" then
    return fs.isDirectory(path) and "directory" or nil
  end
end

return {dir=dir, attributes=attributes,mkdir=fs.makeDirectory}