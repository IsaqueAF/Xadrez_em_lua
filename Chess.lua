local Torre = {}

function Torre.novoB(y, x)
	local objetoT = {
	vivo = true,
	ide = "T",
	tim = "Brancas",
	coor = {y, x},
	Move = {
		{1, 0},
		{0, 1},
		{-1, 0},
		{0, -1}
	}
	}
	
	function objetoT:VerificarMove(Coor, Ides)
		self.Moves = {}
		for _, v in ipairs(self.Move) do
		local y, x = v[1], v[2]
		local Y, X = y, x
			while true do
				local finish = false
				local valy = self.coor[1] + y
				local valx = self.coor[2] + x
				if valy >= 9 or valy <= 0 or valx >= 9 or valx <= 0 then
					break
				else
					self.Moves[#self.Moves + 1] = {valy, valx, false}
				end
				for k in ipairs(Ides) do
					if self.tim == "Brancas" then
						Id = string.lower(Ides[k])
					else
						Id = Ides[k]
					end
					if Coor[valy][valx] == Id then
						self.Moves[#self.Moves + 1] = {valy, valx, true}
						finish = true
					elseif Coor[valy][valx] ~= " " then
						finish = true
					end
				end
				y, x = y + Y, x + X
				if finish then break end
			end
		end
	end
	
	function objetoT:Mover(y, x, Coor, Ides)
		for _, v in pairs(self.Moves) do
			if v[1] == y and v[2] == x then
				if  Coor[y][x] == " " then
					Coor[self.coor[1]][self.coor[2]] = " "
					self.coor = {y, x}
					Coor[y][x] = self.ide
					return true
				else
					print("Voce nao pode atacar uma peca sua.")
					return false
				end
			end
		end
		print("A peca nao poder ir para coordenada desejada.")
		return false
	end
	
	function objetoT:Morrer()
		self.vivo = false
	end
	
	return objetoT
end

function Torre.novoP(y, x)
	local objetot = Torre.novoB(y, x)
	objetot.ide = "t"
	objetot.tim = "Pretas"
	return objetot
end



local Bispo = {}

function Bispo.novoB(y, x)
	local objetoB = {
	vivo = true,
	ide = "B",
	tim = "Brancas",
	coor = {y, x},
	Move = {
		{1, 1},
		{-1, 1},
		{-1, -1},
		{1, -1}
	}
	}
	
	function objetoB:VerificarMove(Coor, Ides)
		self.Moves = {}
		for _, v in ipairs(self.Move) do
		local y, x = v[1], v[2]
		local Y, X = y, x
			while true do
				local finish = false
				local valy = self.coor[1] + y
				local valx = self.coor[2] + x
				if valy >= 9 or valy <= 0 or valx >= 9 or valx <= 0 then
					break
				else
					self.Moves[#self.Moves + 1] = {valy, valx, false}
				end
				for k in ipairs(Ides) do
					if self.tim == "Brancas" then
						Id = string.lower(Ides[k])
					else
						Id = Ides[k]
					end
					if Coor[valy][valx] == Id then
						self.Moves[#self.Moves + 1] = {valy, valx, true}
						finish = true
					elseif Coor[valy][valx] ~= " " then
						finish = true
					end
				end
				y, x = y + Y, x + X
				if finish then break end
			end
		end
	end
	
	function objetoB:Mover(y, x, Coor, Ides)
		for _, v in pairs(self.Moves) do
			if v[1] == y and v[2] == x then
				if  Coor[y][x] == " " then
					Coor[self.coor[1]][self.coor[2]] = " "
					self.coor = {y, x}
					Coor[y][x] = self.ide
					return true
				else
					print("Voce nao pode atacar uma peca sua.")
					return false
				end
			end
		end
		print("A peca nao poder ir para coordenada desejada.")
		return false
	end
	
	function objetoB:Morrer()
		self.vivo = false
	end
	
	return objetoB
end

function Bispo.novoP(y, x)
	local objetob = Bispo.novoB(y, x)
	objetob.ide = "d"
	objetob.tim = "Pretas"
	return objetob
end


local Cavalo = {}

function Cavalo.novoB(y, x)
	local objetoC = {
	vivo = true,
	ide = "C",
	tim = "Brancas",
	coor = {y, x},
	Move = {
		{2, 1},
		{2, -1},
		{-2, 1},
		{-2, -1},
		{1, 2},
		{-1, 2},
		{1, -2},
		{-1, -2}
	}
	}
	
	function objetoC:VerificarMove(Coor, Ides)
		self.Moves = {}
		for _, v in ipairs(self.Move) do
			continue = true
			local y, x = v[1], v[2]
			local valy = self.coor[1] + y
			local valx = self.coor[2] + x
			if valy >= 9 or valy <= 0 or valx >= 9 or valx <= 0 then
				continue = false
			elseif continue then
				if Coor[valy][valx] == " " then
					self.Moves[#self.Moves + 1] = {valy, valx, false}
				else
					for k in ipairs(Ides) do
						if self.tim == "Brancas" then
							Id = string.lower(Ides[k])
						else
							Id = Ides[k]
						end
						if Coor[valy][valx] == Id then
							self.Moves[#self.Moves + 1] = {valy, valx, true}
						end
					end
				end
			end
		end
	end
	
	function objetoC:Mover(y, x, Coor, Ides)
		for _, v in pairs(self.Moves) do
			if v[1] == y and v[2] == x then
				if  Coor[y][x] == " " then
					Coor[self.coor[1]][self.coor[2]] = " "
					self.coor = {y, x}
					Coor[y][x] = self.ide
					return true
				else
					print("Voce nao pode atacar uma peca sua.")
					return false
				end
			end
		end
		print("A peca nao poder ir para coordenada desejada.")
		return false
	end
	
	function objetoC:Morrer()
		self.vivo = false
	end
	
	return objetoC
end

function Cavalo.novoP(y, x)
	local objetoc = Cavalo.novoB(y, x)
	objetoc.ide = "c"
	objetoc.tim = "Pretas"
	return objetoc
end


local Dama = {}

function Dama.novoB(y, x)
	local objetoD = {
	vivo = true,
	ide = "D",
	tim = "Brancas",
	coor = {y, x},
	Move = {
		{1, 1},
		{-1, 1},
		{-1, -1},
		{1, -1},
		{1, 0},
		{0, 1},
		{-1, 0},
		{0, -1}
	}
	}
	
	function objetoD:VerificarMove(Coor, Ides)
		self.Moves = {}
		for _, v in ipairs(self.Move) do
		local y, x = v[1], v[2]
		local Y, X = y, x
			while true do
				local finish = false
				local valy = self.coor[1] + y
				local valx = self.coor[2] + x
				if valy >= 9 or valy <= 0 or valx >= 9 or valx <= 0 then
					break
				else
					self.Moves[#self.Moves + 1] = {valy, valx, false}
				end
				for k in ipairs(Ides) do
					if self.tim == "Brancas" then
						Id = string.lower(Ides[k])
					else
						Id = Ides[k]
					end
					if Coor[valy][valx] == Id then
						self.Moves[#self.Moves + 1] = {valy, valx, true}
						finish = true
					elseif Coor[valy][valx] ~= " " then
						finish = true
					end
				end
				y, x = y + Y, x + X
				if finish then break end
			end
		end
	end
	
	function objetoD:Mover(y, x, Coor, Ides)
		for _, v in pairs(self.Moves) do
			if v[1] == y and v[2] == x then
				if  Coor[y][x] == " " then
					Coor[self.coor[1]][self.coor[2]] = " "
					self.coor = {y, x}
					Coor[y][x] = self.ide
					return true
				else
					print("Voce nao pode atacar uma peca sua.")
					return false
				end
			end
		end
		print("A peca nao poder ir para coordenada desejada.")
		return false
	end
	
	function objetoD:Morrer()
		self.vivo = false
	end
	
	return objetoD
end

function Dama.novoP(y, x)
	local objetod = Dama.novoB(y, x)
	objetod.ide = "b"
	objetod.tim = "Pretas"
	return objetod
end

local Peao = {}

function Peao.novoB(y, x)
	local objetoP = {
	vivo = true,
	ide = "P",
	tim = "Brancas",
	desh = false,
	coor = {y, x},
	Moved = false,
	Move = {
		{1, 0, "move", "Brancas"},
		{1, -1, "eat", "Brancas"},
		{1, 1, "eat", "Brancas"},
		{2, 0, "desh", "Brancas"},
		{-1, 0, "move", "Pretas"},
		{-1, -1, "eat", "Pretas"},
		{-1, 1, "eat", "Pretas"},
		{-2, 0, "desh", "Pretas"}
	}
	}
	
	function objetoP:VerificarMove(Coor, Ides)
		self.Moves = {}
		for _, v in ipairs(self.Move) do
			continue = true
			local y, x = v[1], v[2]
			local valy = self.coor[1] + y
			local valx = self.coor[2] + x
			if valy >= 9 or valy <= 0 or valx >= 9 or valx <= 0 then
			continue = false
			elseif continue then 
				if v[4] == self.tim and v[3] == "move" then
					self.Moves[#self.Moves + 1] = {valy, valx, false}
				elseif v[4] == self.tim and v[3] == "desh" and not self.Moved then
					self.Moves[#self.Moves + 1] = {valy, valx, false}
				else
					for k in ipairs(Ides) do
						if self.tim == "Brancas" then
							Id = string.lower(Ides[k])
						else
							Id = Ides[k]
						end
						if Coor[valy][valx] == Id and v[3] == "eat" then
							self.Moves[#self.Moves + 1] = {valy, valx, true}
						end
					end
				end
			end
		end
	end
	
	function objetoP:Mover(y, x, Coor, Ides)
		for _, v in pairs(self.Moves) do
			if v[1] == y and v[2] == x then
				if  Coor[y][x] == " " then
					Coor[self.coor[1]][self.coor[2]] = " "
					self.coor = {y, x}
					Coor[y][x] = self.ide
					self.Moved = true
					return true
				else
					print("Voce nao pode atacar uma peca sua.")
					return false
				end
			end
		end
		print("A peca nao poder ir para coordenada desejada.")
		return false
	end
	
	function objetoP:Morrer()
		self.vivo = false
	end
	
	return objetoP
end

function Peao.novoP(y, x)
	local objetop = Peao.novoB(y, x)
	objetop.ide = "p"
	objetop.tim = "Pretas"
	return objetop
end

local Rei = {}

function Rei.novoB(y, x)
	local objetoR = {
	vivo = true,
	ide = "R",
	tim = "Brancas",
	coor = {y, x},
	Move = {
		{1, 1},
		{-1, 1},
		{-1, -1},
		{1, -1},
		{1, 0},
		{0, 1},
		{-1, 0},
		{0, -1}
	}
	}
	
	function objetoR:VerificarMove(Coor, Ides)
		self.Moves = {}
		for _, v in ipairs(self.Move) do
			continue = true
			local y, x = v[1], v[2]
			local valy = self.coor[1] + y
			local valx = self.coor[2] + x
			if valy >= 9 or valy <= 0 or valx >= 9 or valx <= 0 then
				continue = false
			elseif continue then
				if Coor[valy][valx] == " " then
					self.Moves[#self.Moves + 1] = {valy, valx, false}
				else
					for k in ipairs(Ides) do
						if self.tim == "Brancas" then
							Id = string.lower(Ides[k])
						else
							Id = Ides[k]
						end
						if Coor[valy][valx] == Id then
							self.Moves[#self.Moves + 1] = {valy, valx, true}
						end
					end
				end
			end
		end
	end
	
	function objetoR:Mover(y, x, Coor, Ides)
		for _, v in pairs(self.Moves) do
			if v[1] == y and v[2] == x then
				if  Coor[y][x] == " " then
					Coor[self.coor[1]][self.coor[2]] = " "
					self.coor = {y, x}
					Coor[y][x] = self.ide
					return true
				else
					print("Voce nao pode atacar uma peca sua.")
					return false
				end
			end
		end
		print("A peca nao poder ir para coordenada desejada.")
		return false
	end
	
	function objetoR:Morrer()
		self.vivo = false
	end
	
	return objetoR
end

function Rei.novoP(y, x)
	local objetor = Rei.novoB(y, x)
	objetor.ide = "r"
	objetor.tim = "Pretas"
	return objetor
end



--Váriaveis, funções e tables

local tim = "Brancas"

local Coor = {}

for i = 8, 1, -1 do
	Coor[i] = {" ", " ", " ", " ", " ", " ", " ", " "}
end


function TabuleiroB() -- Impressão do tabuleiro para o jogador/jogadores
	
	cabecario = [[
      +---+---+---+---+---+---+---+---+
        '   '   '   '   '   '   '   '
        A   B   C   D   E   F   G   H
        ]]
	print("")
	for i = 8, 1, -1 do
		print("      +---+---+---+---+---+---+---+---+")
		print("  "..i.." - | "..Coor[i][1].." | "..Coor[i][2].." | "..Coor[i][3].." | "..Coor[i][4].." | "..Coor[i][5].." | "..Coor[i][6].." | "..Coor[i][7].." | "..Coor[i][8].." |")
	end
	print(cabecario)
end

function TabuleiroP() -- Impressão do tabuleiro para o jogador/jogadores
	
	cabecario = [[
      +---+---+---+---+---+---+---+---+
        '   '   '   '   '   '   '   '
        H   G   F   E   D   C   B   A
        ]]
	print("")
	for i = 1, 8 do
		print("      +---+---+---+---+---+---+---+---+")
		print("  "..i.." - | "..Coor[i][8].." | "..Coor[i][7].." | "..Coor[i][6].." | "..Coor[i][5].." | "..Coor[i][4].." | "..Coor[i][3].." | "..Coor[i][2].." | "..Coor[i][1].." |")
	end
	print(cabecario)
end

local Escolhas= {
	{"A"},
	{"B"},
	{"C"},
	{"D"},
	{"E"},
	{"F"},
	{"G"},
	{"H"}
}


for k, v in ipairs(Escolhas) do
	for i = 1,8 do
		Escolhas[k][#v + 1] = {tostring(Escolhas[k][1]..i), tostring(string.lower(Escolhas[k][1])..i), tostring(k..i)}
	end
end

local function VerificarCoor(r)
	for k, _ in ipairs(Escolhas) do
		for i = 2,9 do
			for I = 1,3 do
				if r == Escolhas[k][i][I] then
					local resul = Escolhas[k][i][3]
					local x, y = string.sub(resul, 1, 1), string.sub(resul, 2, 2)
					local x, y = tonumber(x), tonumber(y)
					return x, y
				end
			end
		end
	end
	return nil, nil
end

local Pecas = { -- coloque as peças que vão no tabuleiro aqui
	torre1 = Torre.novoB(1, 1),
	torre2 = Torre.novoB(1, 8),
	torre3 = Torre.novoP(8, 8),
	torre4 = Torre.novoP(8, 1),
	Bispo1 = Bispo.novoB(1, 3),
	Bispo2 = Bispo.novoB(1, 6),
	Bispo3 = Bispo.novoP(8, 3),
	--[[Bispo4 = Bispo.novoP(8, 6),
	Dama1 = Dama.novoB(1, 4),
	Dama2 = Dama.novoP(8, 4),
	Cavalo1 = Cavalo.novoB(1, 2),
	Cavalo2 = Cavalo.novoB(1, 7),
	Cavalo3 = Cavalo.novoP(8, 2),
	Cavalo4 = Cavalo.novoP(8, 7),
	Peao1 = Peao.novoB(2, 1),
	Peao2 = Peao.novoB(2, 2),
	Peao3 = Peao.novoB(2, 3),
	Peao4 = Peao.novoB(2, 4),
	Peao5 = Peao.novoB(2, 5),
	Peao6 = Peao.novoB(2, 6),
	Peao7 = Peao.novoB(2, 7),
	Peao8 = Peao.novoB(2, 8),
	Peao9 = Peao.novoP(7, 1),
	Peao10 = Peao.novoP(7, 2),
	Peao11 = Peao.novoP(7, 3),
	Peao12 = Peao.novoP(7, 4),
	Peao13 = Peao.novoP(7, 5),
	Peao14 = Peao.novoP(7, 6),
	Peao15 = Peao.novoP(7, 7),
	Peao16 = Peao.novoP(7, 8),]]
	Rei1 = Rei.novoB(1, 5),
	Rei2 = Rei.novoB(8, 5)
}

local Ides = {"R","D","P","B","C","T"}

for _, v in pairs(Pecas) do
	Coor[v.coor[1]][v.coor[2]] = v.ide
end

local function VerificarPeca(x, y, perm)
	for k, v in pairs(Pecas) do
		if v.coor[1] == y and v.coor[2] == x and v.vivo then
			if v.tim == tim or perm then
				peca = k
				return peca
			else
				if not perm then
					print("Voce nao pode escolher pecas de seu adversario.")
					return nil
				end
			end
		end
	end
	print("A casa que voce escolheu esta vazia.")
	return nil
end

local function VerificarCheckeMate()
	for _, v in pairs(Pecas) do
		if v.ide == "R" or v.ide == "r" then
			if not v.vivo then
				print("Check Mate!")
				return true
			end
		end
	end
	return false
end

local function VerificacoesGerais()
	for k in pairs(Pecas) do
		Pecas[k]:VerificarMove(Coor, Ides)
		if VerificarCheckeMate() then
			return true
		end
	end
	return false
end

local function VerificarAtaque(peca, y, x)
	local peca = Pecas[peca]
	for _, v in pairs(peca.Moves) do
		if v[1] == y and v[2] == x and v[3] then
			p = VerificarPeca(v[2], v[1], true)
			t = Pecas[p].tim
			if t ~= tim then
				Pecas[p]:Morrer()
				Coor[y][x] = " "
				return
			else
				print("Voce nao pode atacar uma peca sua")
			end
		end
	end
end

------------------------------------------------------------------------

VerificacoesGerais()

print[[
		 ----------
		 * XADREZ *
		 ----------
]]


while true do
	
	if tim == "Brancas" then
		TabuleiroB()
	else
		TabuleiroP()
	end
	
	print("Vez de "..tim..".\n")
	
	::Erro::
	
	io.write("escolha uma coordenada: ")
	local res = io.read()-- Seleciona peça
	
	local x, y = VerificarCoor(res) -- Veerifica qual a coordenada passada e tranforma em uma forma que o computador possa enterder
	if x == nil or y == nil then
		print("escolha as coordenadas do quadriculado que esta a peca a qual voce quer escolher.")
		goto Erro
	end
	
	local peca = VerificarPeca(x, y, false) -- Verifica qual é a peça que está na coordenada passada(caso seja um quadriculado vazio ou com adversário retorna nil) 
	if peca == nil then
		goto Erro
	end
	
	::erro::
	
	io.write("Escolha agora para aonde voce quer mover: ")
	
	local resp = io.read()-- Move a peça
	
	if resp == "r" or resp == "R" or resp == "Reset" or resp == "reset" then
		goto Erro
	end
	
	local x, y = VerificarCoor(resp) -- Veerifica novamente a coordenada passada mas agora para segunda resposta
	if x == nil or y == nil then
		print("escolha as coordenadas do quadriculado a qual voce quer mover sua peca.")
		goto erro
	end
	
	VerificarAtaque(peca, y, x)
	
	if not Pecas[peca]:Mover(y, x, Coor, Ides) then -- move a peça
		goto erro
	end 
	
	if tim == "Brancas" then tim = "Pretas" else tim = "Brancas" end
	
	if VerificacoesGerais() then
		goto Fim
	end
	
end

::Fim::

print("Obrigado por ter jogado!!")
