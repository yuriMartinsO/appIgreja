-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local Usuario = require("BibliotecasOuClasses.Usuario")

math.randomseed(os.time())

jogador = {}
jogador = Usuario:new()
--deve ir para menu, mas para teste foi para game
composer.gotoScene("menu")