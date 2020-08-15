local composer = require( "composer" )
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local mensagem
local pontuacaoTitulo
local pontuacao
local menu
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
  composer.setVariable("clave", jogador:getClave())
  
	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
  local background = display.newImageRect("imagem/background_escolher_hino.jpg",480,320)
  background.x = display.contentCenterX
  background.y = display.contentCenterY
  sceneGroup:insert(background)
  
  mensagem = display.newText( "Você perdeu! Não deixe sua pontuação chegar à 0 !", display.contentCenterX, display.contentCenterY-90, native.systemFontBold, 15 )
  mensagem:setFillColor(1,0,0)
  mensagem.alpha = 0
  sceneGroup:insert(mensagem)
  
  pontuacaoTitulo = display.newText( "Pontuação", display.contentCenterX, display.contentCenterY-50, native.systemFontBold, 50 )
  pontuacaoTitulo:setFillColor(0,0,0)
  sceneGroup:insert(pontuacaoTitulo)
  
  pontuacao = display.newText( composer.getVariable( "pontuacao" ), display.contentCenterX, display.contentCenterY-10, native.systemFontBold, 40 )
  pontuacao:setFillColor(0,0,0)
  sceneGroup:insert(pontuacao)
  
  menu = display.newText( "Menu", display.contentCenterX+100, display.contentCenterY+60, native.systemFontBold, 40 )
  menu:setFillColor(0,0,0.5)
  menu:addEventListener("tap", function() composer.gotoScene("menu",  { time=800, effect="crossFade" }) end)
  sceneGroup:insert(menu)
  
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
    if(composer.getVariable( "pontuacao" ) < 0) then
      composer.setVariable( "pontuacao", 0)
      mensagem.alpha = 1
    else
      mensagem.alpha = 0
    end
    
    pontuacao.text = composer.getVariable( "pontuacao" )
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

-- -----------------------------------------------------------------------------------

return scene

