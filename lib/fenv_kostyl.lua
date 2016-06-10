--getfenv и setfenv юзаются только один раз, можно особо не заморачиватся
local tablo={} --Окружение
local envtablo -- над этой таблицей будут проводится издевательства
local function setfenv(func,argtablo)
  envtablo=argtablo
  local metatablo ={__index=envtablo,__newindex=envtablo}
  setmetatable(tablo,metatablo)
  return func
end
local function getfenv()
  return envtablo
end
local function prepare(func)
  setfenv(nil,_ENV)
  return func
end
return {setfenv=setfenv,getfenv=getfenv,prepare=prepare,tablo=tablo}