require("BibliotecasOuClasses.hinos")
local composer = require( "composer" )
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local tecla = {}
local soma_X = 566
local pentagrama
local clave_sol
local clave_fa
local contador    
local soma_contadora = 5
jogador:setHino_escolhido(composer.getVariable("hino"))
local notas = {}
local figura = {}
local num_nota_ocorrente = 1
local pontuacao = {}
local retangulo
local notas_piano = {}
local voltar

local function mudar_notas()
  local b = 1
  for a=soma_contadora-4,soma_contadora do
    notas[b] = hinos[jogador:getHino_escolhido()][a]
    b = b+1
  end
end


  

local function posic_nota(nota)
  local y
  if(nota == "0si" or nota=="do" or nota=="do#" or nota=="0sib") then
    y = display.contentCenterY+14
  elseif(nota == "re" or nota=="re#" or nota=="reb") then
    y = display.contentCenterY+2
  elseif(nota=="mi" or nota=="mib") then
    y = display.contentCenterY-9
  elseif(nota=="fa" or nota=="fa#") then
    y = display.contentCenterY-20
  elseif(nota=="sol" or nota=="sol#" or nota=="solb") then
    y = display.contentCenterY-30
  elseif(nota=="la" or nota=="la#" or nota=="lab") then
    y = display.contentCenterY-41
  elseif(nota=="si" or nota=="sib") then
    y = display.contentCenterY-50
  elseif(nota == "1do" or nota == "1do#" or nota=="1do") then
    y = display.contentCenterY-61
  elseif(nota == "1re" or nota == "1re#" or nota=="1reb") then
    y = display.contentCenterY-72
  elseif(nota == "1mi" or nota=="1mib") then
    y = display.contentCenterY-82
  elseif(nota == "1fa") then
    y = display.contentCenterY-92
  end
  return y
end

local function posc_fig()
  mudar_notas()
  for cont=1,5 do
    figura[cont].y = posic_nota(notas[cont])
    if(notas[cont] == "0si" or notas[cont] == "0sib" or notas[cont] == "do" or notas[cont] == "do#") then
      figura[cont].linha1.alpha = 1
      if(notas[cont] == "do" or notas[cont] == "do#") then
        figura[cont].linha1.alpha = 0
        figura[cont].linha2.alpha = 1
      end
    else
      figura[cont].linha1.alpha = 0
      figura[cont].linha2.alpha = 0
    end
  end
  
end

local function esta_certo(nota)

  if(grupo_nota(nota) == grupo_nota(hinos[jogador:getHino_escolhido()][num_nota_ocorrente] )) then
    num_nota_ocorrente = num_nota_ocorrente+1
    return true
  else
    return false
  end
end

local function encerrar_game()

  transition.to( retangulo, { time=500, x = figura[1].x } )
  pontuacao.text = "Pontuação  ".. jogador:getPontuacao()
  retangulo.fig = 1
  soma_X = 566
  soma_contadora = 5
  jogador:setHino_escolhido(1)
  num_nota_ocorrente = 1
  posc_fig()
  composer.setVariable( "pontuacao", jogador:getPontuacao() )
  composer.gotoScene("highscore", { time=800, effect="crossFade" })
end


local function transf_nt(nota)
  local transf_nt = nota
  local nt_transf
  if(transf_nt == "0sib") then
    nt_transf = "la#"
    return nt_transf
  elseif(transf_nt == "reb") then
    nt_transf = "do#"
    return nt_transf
  elseif(transf_nt == "mib") then
    nt_transf = "re#"
    return nt_transf
  elseif (transf_nt == "solb") then
    nt_transf = "la#"
    return nt_transf
  elseif (transf_nt == "lab") then
    nt_transf = "sol#"
    return nt_transf
  elseif (transf_nt == "sib") then
    nt_transf = "la#"
    return nt_transf
  elseif (transf_nt == "1reb") then
    nt_transf = "1do#"
    return nt_transf
  elseif (transf_nt == "1mib") then
    nt_transf = "1re#"
    return nt_transf
  elseif (transf_nt == "1solb") then
    nt_transf = "1fa#"
    return nt_transf
  elseif (transf_nt == "1lab") then
    nt_transf = "1sol#"
    return nt_transf
  elseif (transf_nt == "1sib") then
    nt_transf = "1la#"
    return nt_transf
  end
  return transf_nt
end

--0la# 0si do do# re re# mi fa fa# sol sol# la la# si 1do 1do# 1re 1re# 1mi 1fa 

local function carregar_sons()
  
  notas_piano[1] = audio.loadSound( "piano/39185__jobro__piano-ff-038.wav" ) --0la#
  notas_piano[2] = audio.loadSound( "piano/39186__jobro__piano-ff-039.wav" ) --0si
  notas_piano[3] = audio.loadSound( "piano/39187__jobro__piano-ff-040.wav" ) --do
  notas_piano[4] = audio.loadSound( "piano/39188__jobro__piano-ff-041.wav" ) --do#
  notas_piano[5] = audio.loadSound( "piano/39189__jobro__piano-ff-042.wav" ) --re
  notas_piano[6] = audio.loadSound( "piano/39190__jobro__piano-ff-043.wav" ) --re#
  notas_piano[7] = audio.loadSound( "piano/39191__jobro__piano-ff-044.wav" ) --mi
  notas_piano[8] = audio.loadSound( "piano/39193__jobro__piano-ff-045.wav" ) --fa
  notas_piano[9] = audio.loadSound( "piano/39194__jobro__piano-ff-046.wav" ) --fa#
  notas_piano[10] = audio.loadSound( "piano/39195__jobro__piano-ff-047.wav" ) --sol
  notas_piano[11] = audio.loadSound( "piano/39196__jobro__piano-ff-048.wav" ) --sol#
  notas_piano[12] = audio.loadSound( "piano/39197__jobro__piano-ff-049.wav" ) --la
  notas_piano[13] = audio.loadSound( "piano/39198__jobro__piano-ff-050.wav" ) --la#
  notas_piano[14] = audio.loadSound( "piano/39199__jobro__piano-ff-051.wav" ) -- si
  notas_piano[15] = audio.loadSound( "piano/39200__jobro__piano-ff-052.wav" ) --1do
  notas_piano[16] = audio.loadSound( "piano/39201__jobro__piano-ff-053.wav" ) --1do#
  notas_piano[17] = audio.loadSound( "piano/39202__jobro__piano-ff-054.wav" ) --1re
  notas_piano[18] = audio.loadSound( "piano/39203__jobro__piano-ff-055.wav" ) --1re#
  notas_piano[19] = audio.loadSound( "piano/39204__jobro__piano-ff-056.wav" ) --1mi
  notas_piano[20] = audio.loadSound( "piano/39205__jobro__piano-ff-057.wav" ) --1fa
  notas_piano[21] = audio.loadSound( "piano/39206__jobro__piano-ff-058.wav" ) --1fa#
  
end


local function tocar_nota(nota)
  local tocar_nota = transf_nt(nota)

  
  if(tocar_nota == "0la#") then
    return 1
  elseif(tocar_nota == "0si") then
    return 2
  elseif(tocar_nota == "do") then
    return 3
  elseif(tocar_nota == "do#") then
    return 4
  elseif(tocar_nota == "re") then
    return 5
  elseif(tocar_nota == "re#") then
    return 6
  elseif(tocar_nota == "mi") then
    return 7
  elseif(tocar_nota == "fa") then
    return 8
  elseif(tocar_nota == "fa#") then
    return 9
  elseif(tocar_nota == "sol") then
    return 10
  elseif(tocar_nota == "sol#") then
    return 11
  elseif(tocar_nota == "la") then
    return 12
  elseif(tocar_nota == "la#") then
    return 13
  elseif(tocar_nota == "si") then
    return 14
  elseif(tocar_nota == "1do") then
    return 15
  elseif(tocar_nota == "1do#") then
    return 16
  elseif(tocar_nota == "1re") then
    return 17
  elseif(tocar_nota == "1re#") then
    return 18
  elseif(tocar_nota == "1mi") then
    return 19
  elseif(tocar_nota == "1fa") then
    return 20
  elseif(tocar_nota == "1fa#") then
    return 21
  end
  
end

local function nota_foi_teclada(nota)
  if esta_certo(nota) then
    
    audio.play(notas_piano[tocar_nota(hinos[jogador:getHino_escolhido()][num_nota_ocorrente-1])])
    
    jogador:setPontuacao( jogador:getPontuacao() + 10 )
    pontuacao.text = "Pontuação  ".. jogador:getPontuacao()
    
    if (retangulo.fig == 5) then
      retangulo.fig = 0
    end
    transition.to( retangulo, { time=500, x = figura[retangulo.fig+1].x } )
    retangulo.fig = retangulo.fig+1
  
    
    if(retangulo.fig == 1) then
      soma_contadora = soma_contadora+5
      posc_fig()
    end
    if(num_nota_ocorrente >= #hinos[jogador:getHino_escolhido()]+1 ) then
      encerrar_game()
    end
  else
    jogador:setPontuacao( jogador:getPontuacao() - 10 )
    pontuacao:setFillColor( 1, 0, 0 )
    pontuacao.size = 16
    pontuacao.text = "Pontuação  -".. jogador:getPontuacao()
    local func = 
      function() 
        pontuacao:setFillColor( 0, 0, 0 )
        pontuacao.size = 13
        pontuacao.text = "Pontuação  ".. jogador:getPontuacao()
      end
    timer.performWithDelay( 800, func ) 
    
    if(jogador:getPontuacao() < 0) then
      composer.setVariable( "pontuacao", jogador:getPontuacao() )
      composer.gotoScene("highscore", { time=800, effect="crossFade" })
    end
    
   
  end
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------


-- create()
function scene:create( event )
  
  local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
  display.setDefault( "background", 1, 1, 1 )
  
  tecla.Do = display.newImageRect("imagem/tecla.png",60,116)
  sceneGroup:insert(tecla.Do)
  tecla.Re = display.newImageRect("imagem/tecla.png",60,116)
  sceneGroup:insert(tecla.Re)
  tecla.Mi = display.newImageRect("imagem/tecla.png",60,116)
  sceneGroup:insert(tecla.Mi)
  tecla.Fa = display.newImageRect("imagem/tecla.png",60,116)
  sceneGroup:insert(tecla.Fa)
  tecla.Sol = display.newImageRect("imagem/tecla.png",60,116)
  sceneGroup:insert(tecla.Sol)
  tecla.La = display.newImageRect("imagem/tecla.png",60,116)
  sceneGroup:insert(tecla.La)
  tecla.Si = display.newImageRect("imagem/tecla.png",60,116)
  sceneGroup:insert(tecla.Si)



  tecla.Do.x = display.contentCenterX+385 - soma_X
  tecla.Do.y = display.contentCenterY+100
  tecla.Do.texto = display.newText("DÓ",tecla.Do.x,tecla.Do.y, native.systemFontBold, 20)
  tecla.Do.texto:setFillColor(1,0,0)
  sceneGroup:insert(tecla.Do.texto)
  tecla.Do.func = 
  function()
    if(jogador:getClave() == "sol") then
      nota_foi_teclada("do")
    else
      nota_foi_teclada("la")
    end
  end
  tecla.Do:addEventListener("tap",tecla.Do.func)
  
  soma_X = soma_X - 60
    
  tecla.Re.x = display.contentCenterX+385 - soma_X
  tecla.Re.y = display.contentCenterY+100
  tecla.Re.texto = {}
  tecla.Re.texto = display.newText("RÉ",tecla.Re.x,tecla.Re.y, native.systemFontBold, 20)
  tecla.Re.texto:setFillColor(1,0,0)
  sceneGroup:insert(tecla.Re.texto)
  tecla.Re.func = 
  function() 
    if(jogador:getClave() == "sol") then
      nota_foi_teclada("re")
    else
      nota_foi_teclada("si")
    end
  end
  tecla.Re:addEventListener("tap",tecla.Re.func)

  soma_X = soma_X - 60  

  tecla.Mi.x = display.contentCenterX+385 - soma_X
  tecla.Mi.y = display.contentCenterY+100
  tecla.Mi.texto = display.newText("MI",tecla.Mi.x,tecla.Mi.y, native.systemFontBold, 20)
  tecla.Mi.texto:setFillColor(1,0,0)
  sceneGroup:insert(tecla.Mi.texto)
  tecla.Mi.func = 
  function()
    if(jogador:getClave() == "sol") then
      nota_foi_teclada("mi")
    else
      nota_foi_teclada("do")
    end
  end
  tecla.Mi:addEventListener("tap",tecla.Mi.func)
  
  soma_X = soma_X - 60   

  tecla.Fa.x = display.contentCenterX+385 - soma_X
  tecla.Fa.y = display.contentCenterY+100
  tecla.Fa.texto = display.newText("FÁ",tecla.Fa.x,tecla.Fa.y, native.systemFontBold, 20)
  tecla.Fa.texto:setFillColor(1,0,0)
  sceneGroup:insert(tecla.Fa.texto)
  tecla.Fa.func = 
  function() 
    if(jogador:getClave() == "sol") then
      nota_foi_teclada("fa")
    else
      nota_foi_teclada("re")
    end
  end
  tecla.Fa:addEventListener("tap",tecla.Fa.func)
  
  soma_X = soma_X - 60   

  tecla.Sol.x = display.contentCenterX+385 - soma_X
  tecla.Sol.y = display.contentCenterY+100
  tecla.Sol.texto = {}
  tecla.Sol.texto = display.newText("SOL",tecla.Sol.x,tecla.Sol.y, native.systemFontBold, 20)
  tecla.Sol.texto:setFillColor(1,0,0)
  sceneGroup:insert(tecla.Sol.texto)
  tecla.Sol.func = 
  function() 
    if(jogador:getClave() == "sol") then
      nota_foi_teclada("sol") 
    else
      nota_foi_teclada("mi")
    end
  end
  tecla.Sol:addEventListener("tap",tecla.Sol.func)
  
  soma_X = soma_X - 60   

  tecla.La.x = display.contentCenterX+385 - soma_X
  tecla.La.y = display.contentCenterY+100
  tecla.La.texto = {}
  tecla.La.texto = display.newText("LÁ",tecla.La.x,tecla.La.y, native.systemFontBold, 20)
  tecla.La.texto:setFillColor(1,0,0)
  sceneGroup:insert(tecla.La.texto)
  tecla.La.func = 
  function() 
    if(jogador:getClave() == "sol") then
      nota_foi_teclada("la")
    else
      nota_foi_teclada("fa")
    end
  end
  tecla.La:addEventListener("tap",tecla.La.func)
  
  soma_X = soma_X - 60   

  tecla.Si.x = display.contentCenterX+385 - soma_X
  tecla.Si.y = display.contentCenterY+100
  tecla.Si.texto = {}
  tecla.Si.texto = display.newText("SI",tecla.Si.x,tecla.Si.y, native.systemFontBold, 20)
  tecla.Si.texto:setFillColor(1,0,0)
  sceneGroup:insert(tecla.Si.texto)
  tecla.Si.func = 
  function() 
    if(jogador:getClave() == "sol") then
      nota_foi_teclada("si") 
    else
      nota_foi_teclada("sol")
    end
  end
  tecla.Si:addEventListener("tap",tecla.Si.func)

  pentagrama = display.newImageRect("imagem/pentagrama.jpg",1200,90)
  pentagrama.x = display.contentCenterX
  pentagrama.y = display.contentCenterY-50
  sceneGroup:insert(pentagrama)


  clave_sol = display.newImageRect("imagem/clave_sol.png",43,117)
  clave_sol.x = display.contentCenterX-220
  clave_sol.y = display.contentCenterY-45
  sceneGroup:insert(clave_sol)
 
 
  clave_fa = display.newImageRect("imagem/clave_fa.png",67,92)
  clave_fa.x = display.contentCenterX-210
  clave_fa.y = display.contentCenterY-63
  sceneGroup:insert(clave_fa)
  

  
  figura[1] = display.newImageRect("imagem/semibreve.png",38,27)
  figura[1].x = display.contentCenterX-150
  figura[1].y = display.contentCenterY
  figura[1].linha1 = display.newImageRect("imagem/linha.png",38,5)
  figura[1].linha1.x = display.contentCenterX-150
  figura[1].linha1.y = display.contentCenterY+2
  figura[1].linha2 = display.newImageRect("imagem/linha.png",38,5)
  figura[1].linha2.x = display.contentCenterX-150
  figura[1].linha2.y = display.contentCenterY+14
  figura[1].linha1.alpha = 0
  figura[1].linha2.alpha = 0
  sceneGroup:insert(figura[1].linha1)
  sceneGroup:insert(figura[1].linha2)
  sceneGroup:insert(figura[1])
  
  figura[2] = display.newImageRect("imagem/semibreve.png",38,27)
  figura[2].x = display.contentCenterX-80
  figura[2].y = display.contentCenterY
  figura[2].linha1 = display.newImageRect("imagem/linha.png",38,5)
  figura[2].linha1.x = display.contentCenterX-80
  figura[2].linha1.y = display.contentCenterY+2
  figura[2].linha2 = display.newImageRect("imagem/linha.png",38,5)
  figura[2].linha2.x = display.contentCenterX-80
  figura[2].linha2.y = display.contentCenterY+14
  figura[2].linha1.alpha = 0
  figura[2].linha2.alpha = 0
  sceneGroup:insert(figura[2].linha1)
  sceneGroup:insert(figura[2].linha2)
  sceneGroup:insert(figura[2])
  
  figura[3] = display.newImageRect("imagem/semibreve.png",38,27)
  figura[3].x = display.contentCenterX-10
  figura[3].y = display.contentCenterY
  figura[3].linha1 = display.newImageRect("imagem/linha.png",38,5)
  figura[3].linha1.x = display.contentCenterX-10
  figura[3].linha1.y = display.contentCenterY+2
  figura[3].linha2 = display.newImageRect("imagem/linha.png",38,5)
  figura[3].linha2.x = display.contentCenterX-10
  figura[3].linha2.y = display.contentCenterY+14
  figura[3].linha1.alpha = 0
  figura[3].linha2.alpha = 0
  sceneGroup:insert(figura[3].linha1)
  sceneGroup:insert(figura[3].linha2)
  sceneGroup:insert(figura[3])
  
  figura[4] = display.newImageRect("imagem/semibreve.png",38,27)
  figura[4].x = display.contentCenterX+60
  figura[4].y = display.contentCenterY
  figura[4].linha1 = display.newImageRect("imagem/linha.png",38,5)
  figura[4].linha1.x = display.contentCenterX+60
  figura[4].linha1.y = display.contentCenterY+2
  figura[4].linha2 = display.newImageRect("imagem/linha.png",38,5)
  figura[4].linha2.x = display.contentCenterX+60
  figura[4].linha2.y = display.contentCenterY+14
  figura[4].linha1.alpha = 0
  figura[4].linha2.alpha = 0
  sceneGroup:insert(figura[4].linha1)
  sceneGroup:insert(figura[4].linha2)
  sceneGroup:insert(figura[4])
  
  figura[5] = display.newImageRect("imagem/semibreve.png",38,27)
  figura[5].x = display.contentCenterX+130
  figura[5].y = display.contentCenterY
  figura[5].linha1 = display.newImageRect("imagem/linha.png",38,5)
  figura[5].linha1.x = display.contentCenterX+130
  figura[5].linha1.y = display.contentCenterY+2
  figura[5].linha2 = display.newImageRect("imagem/linha.png",38,5)
  figura[5].linha2.x = display.contentCenterX+130
  figura[5].linha2.y = display.contentCenterY+14
  figura[5].linha1.alpha = 0
  figura[5].linha2.alpha = 0
  sceneGroup:insert(figura[5].linha1)
  sceneGroup:insert(figura[5].linha2)
  sceneGroup:insert(figura[5])
  
  posc_fig()
  
  pontuacao = display.newText( "Pontuação  " .. jogador:getPontuacao(), 410, 35, native.systemFontBold, 13)
  pontuacao:setFillColor( 0, 0, 0 )
  sceneGroup:insert(pontuacao)
  
  retangulo = display.newRect( display.contentCenterX, display.contentCenterY-60, 50, 200 )
  retangulo.x = display.contentCenterX-150
  retangulo.fig = 1
  retangulo:setFillColor(0,0,1)
  retangulo.alpha = 0.26
  sceneGroup:insert(retangulo)
  
  carregar_sons()
  
  voltar = display.newText( "Voltar ", 30, 45, native.systemFontBold, 13)
  voltar:setFillColor( 0, 0, 0 )
  voltar:addEventListener("tap", encerrar_game)
  sceneGroup:insert(voltar)
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
  transition.to( retangulo, { time=500, x = figura[1].x } )
  jogador:setPontuacao(100)
  pontuacao.text = "Pontuação  ".. jogador:getPontuacao()
  retangulo.fig = 1
  soma_X = 566
  soma_contadora = 5
  jogador:setHino_escolhido(composer.getVariable("hino"))
  jogador:setClave(composer.getVariable("clave"))
  num_nota_ocorrente = 1
  posc_fig()
  
  
  if jogador.clave == "sol" then
    clave_fa.alpha = 0
    clave_sol.alpha = 1
  elseif jogador.clave == "fa" then
    clave_sol.alpha = 0
    clave_fa.alpha = 1
  end
  
	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
    
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene