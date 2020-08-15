
local Usuario = {}

function Usuario:new()
  return setmetatable({pontuacao = 30,hino_escolhido = hino_escolhido,vidas = vidas,som = true,clave = "sol"},{__index = self})
end

---------------------------------------------------------
------------------------Encapsulamento-------------------
---------------------------------------------------------

function Usuario:getPontuacao()
  return self.pontuacao
end

function Usuario:setPontuacao(pontos)
  self.pontuacao = pontos
end
function Usuario:getHino_escolhido()
  return self.hino_escolhido
end

function Usuario:setHino_escolhido(hino)
  self.hino_escolhido = hino
end
function Usuario:getVidas()
  return self.vidas
end

function Usuario:setVidas(vida)
  self.vidas = vida
end
function Usuario:getNota_teclada()
  return self.nota_teclada
end

function Usuario:setNota_teclada(nota)
  self.nota_teclada = nota
end
function Usuario:getSom()
  return self.som
end
function Usuario:setSom(sim_nao)
  self.som = sim_nao
end
function Usuario:getClave()
  return self.clave
end
function Usuario:setClave(clave_escolhida)
  self.clave = clave_escolhida
end
---------------------------------------------------------
------------------------Funcao---------------------------
---------------------------------------------------------


return Usuario


