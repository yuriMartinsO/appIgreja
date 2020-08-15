local composer = require( "composer" )
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local clave_fa
local clave_sol

local function escolher_hino()
  composer.gotoScene("escolher_hino",  { time=800, effect="crossFade" })
end

local function clave_s()
  clave_fa:setFillColor(0,0,0)
  clave_sol:setFillColor(0,0,1)
  jogador:setClave("sol")
  composer.setVariable("clave", jogador:getClave())
end

local function clave_f()
  clave_sol:setFillColor(0,0,0)
  clave_fa:setFillColor(0,0,1)
  jogador:setClave("fa")
  composer.setVariable("clave", jogador:getClave())
end

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
  
  local play = display.newText( "PLAY", display.contentCenterX, display.contentCenterY-50, native.systemFontBold, 45 )
  play:setFillColor(0,0,0)
  play:addEventListener("tap", escolher_hino)
  sceneGroup:insert(play)
  
  clave_sol = display.newText( "Clave de sol", display.contentCenterX-70, display.contentCenterY+20, native.systemFontBold, 20 )
  clave_sol:setFillColor(0,0,1)
  clave_sol:addEventListener("tap", clave_s)
  sceneGroup:insert(clave_sol)
  
  clave_fa = display.newText( "Clave de fá", display.contentCenterX+70, display.contentCenterY+20, native.systemFontBold, 20 )
  clave_fa:setFillColor(0,0,0)
  clave_fa:addEventListener("tap", clave_f)
  sceneGroup:insert(clave_fa)
  
  
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
    print(composer.getVariable( "money" ))
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


