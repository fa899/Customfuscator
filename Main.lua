local SHA = require("SHA.lua") or loadstring(game:HttpGet("https://raw.githubusercontent.com/fa899/Luafuscator/main/SHA.lua"))()
local OBFUSCATE = function(SOURCE, MEMESTRINGS, FAKE_CONSTANTS)
	local cringe = "ABCDEFGHIJKLMNOPQRSTWVXYZ" -- QWERTY based

	local randomjunkifier = function(amnt)
		local c = {}
		for i = 1, amnt do
			local TYPES = {"structure", "function", "tablememestrings"}
			local TYPE = TYPES[math.random(#TYPES)]
			if TYPE == "structure" then
				local i = SHA:Encrypt(tostring(math.random(100000000, 500000000)))
				table.insert(c, "_"..tostring(i).."={};for _=1,25 do _"..i.."[_+2*5+("..math.random(5, 10).."/0.00"..math.random(1, 5)..")]={};return("..math.random(25,100).."*"..math.random(25, 100).."+("..math.random(25,100).."*5/0.001));end;_"..i.."(pcall, true, false)")
			elseif TYPE == "function" then
				local BYTE_1 = SHA:Encrypt(tostring(math.random(100000000, 500000000)))
				local BYTE_2 = SHA:Encrypt(tostring(math.random(200, 500)))
				table.insert(c, "function _"..SHA:Encrypt(math.random(100000, 999999).."\\\\a\\\\b\\\\c\\\\d").."(a,b,c)_"..BYTE_2.."=0;a=nil;while(a)==(nil)do a=("..math.random(25, 100).."*"..math.random(25, 100).."/"..math.random(25, 100)..")break;end;b=(getfenv(1) or getfenv(2)).warn;_"..BYTE_1.."='"..SHA:Encrypt(tostring(math.random(100000000, 500000000))).."';while(_"..BYTE_2..")==(0)do _"..BYTE_2.."=_"..BYTE_2.."+"..math.random(25, 100).."*(5/0.004)".." end;end")
			elseif TYPE == "tablememestrings" then
				local BYTE_1 = SHA:Encrypt(tostring(math.random(25000, 50000)))
				table.insert(
					c,
					"_"..SHA:Encrypt(tostring(math.random(100000000, 500000000))..tostring(math.random(100000000, 500000000))).."={["..math.random(500,1000).."]='"..MEMESTRINGS[math.random(#MEMESTRINGS)].."';["..math.random(500,1000).."]="..math.random(500, 1000).." / (#'"..MEMESTRINGS[math.random(#MEMESTRINGS)].."' + 1) + 5 * 10 / 5;["..math.random(500,1000).."]=#'"..MEMESTRINGS[math.random(#MEMESTRINGS)].."';["..math.random(500,1000).."]=#'"..BYTE_1.."'/0.00"..math.random(1, 5).."*(math.pow("..math.random(2, 5)..", "..math.random(6, 10)..")-5-2/.1)}"
                                      -- ↑ uses math.pow 
				)
			end
		end
		return table.concat(c, " ")
	end
	
	cringe = SHA:Encrypt(cringe)
	local byte = SHA:Encrypt(SOURCE)
	-- make code obfuscation realistic meanwhile its an simulation
	local SRC = "(function() local A,B,C,D,E,F,G; do A = 'X' B = 'e' end end)();\n\n"..SOURCE.."\n\n\n\n\n\n\n\n\n\n\nfunction() a='';b='';c='';d='';e='' end"
	local WATERMARK = "Luafuscator"
	-- obfuscator SRC
	local f = 
		[[
		(function(a,b,c)
		d="]]..WATERMARK..[[";
		if (d) and (#d>=]]..#WATERMARK..[[) then 
			while (true) do end;
		end;
		local i = 1;
		e=]].."[[LF|"..SHA:Encrypt(cringe..cringe..cringe..cringe..cringe..cringe..cringe..cringe..cringe..cringe..cringe).."]]"..[[;
		f=81864841664268865098;
		g=4887;
		while(#d<=]]..#WATERMARK..[[)do break end; x="]]..SHA:Encrypt()..[["
		i=b(i);
		]]..randomjunkifier(5)..[[
		j={
			[]]..math.random(100, 5000)..[[]={
				]].."["..math.random(100,5000).."]=[["..MEMESTRINGS[math.random(#MEMESTRINGS)].."]],"..[[
			},
		};
		k=]].."[["..SHA:Encrypt(FAKE_CONSTANTS[math.random(#FAKE_CONSTANTS)]).."]];"..[[
		if(d)~=(]]..WATERMARK..[[)then
			while(true)do end;
		end;
		end)(string.byte,getfenv,'LF|]]..SHA:Encrypt(math.random(10000, 50000)..math.random(10000, 50000)..math.random(10000, 50000)..math.random(10000, 50000))..[[')]]
	f = tostring(f):gsub("\n", "")
	f = tostring(f):gsub("	", "")
	return f
end

return OBFUSCATE
