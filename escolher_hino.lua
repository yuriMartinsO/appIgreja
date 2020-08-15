require("BibliotecasOuClasses.hinos")
local composer = require( "composer" )
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local play
local seta_direita
local seta_esquerda
local caixa_hino
local hino
local num
local background

function seta_esq() 
  if(num > 1) then
    num = num-1
  else
    num = #lista_hinos
  end
  hino = lista_hinos[num] 
  caixa_hino.text = hino 
end
function seta_dir() 
  if(num < #lista_hinos) then
    num = num+1
  else 
    num = 1
  end
  hino = lista_hinos[num] 
  caixa_hino.text = hino
end



local function goTogame()
  composer.setVariable( "hino", hino)
  composer.gotoScene("game", { time=300, effect="crossFade" })
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
  local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
  num = 1
  hino = lista_hinos[num] 
  
  background = display.newImageRect("imagem/background_escolher_hino.jpg",639,428)
  background.x = display.contentCenterX
  background.y = display.contentCenterY
  sceneGroup:insert(background)
  
  seta_direita = display.newImageRect("imagem/botoes/seta_right.png",104/2,103/2)
  seta_direita.x = display.contentCenterX+70
  seta_direita.y = display.contentCenterY
  sceneGroup:insert(seta_direita)
  seta_direita.alpha = 0.65
  seta_direita:addEventListener("tap",seta_dir)
  
  
  seta_esquerda = display.newImageRect("imagem/botoes/seta_left.png",104/2,103/2)
  seta_esquerda.x = display.contentCenterX-70
  seta_esquerda.y = display.contentCenterY
  sceneGroup:insert(seta_esquerda)
  seta_esquerda.alpha = 0.65
  seta_esquerda:addEventListener("tap",seta_esq)
  
  caixa_hino = display.newText( hino, display.contentCenterX, display.contentCenterY-70, native.systemFontBold, 45 )
  caixa_hino:setFillColor(0,0,0)
  sceneGroup:insert(caixa_hino)
  
  play = display.newImageRect("imagem/botoes/play.png",152/2,145/2)
  play.x = display.contentCenterX+130
  play.y = display.contentCenterY+40
  sceneGroup:insert(play)
  
  play:addEventListener("tap",goTogame)
  
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
  local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

  
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
