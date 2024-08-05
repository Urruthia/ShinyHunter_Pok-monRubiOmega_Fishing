#include<ImageSearch2015.au3>
#include <Misc.au3>
#include<AutoItConstants.au3>
Global $Contador=0;
Global $ContadorScreen=0;
Global $hunting = True
Global $encuentro = True
Global $fishing = True
Global $tirar = True

Global Const $fishingx1 = 969
Global Const $fishingy1 = 918
Global Const $fishingx2 = 1029
Global Const $fishingy2 = 978
Global Const $huirx1 = 893
Global Const $huiry1 = 915
Global Const $huirx2 = 1009
Global Const $huiry2 = 969
Global Const $noPicox1 = 607
Global Const $noPicoy1 = 408
Global Const $noPicox2 = 708
Global Const $noPicoy2 = 453
Global Const $picox1 = 918
Global Const $picoy1 = 219
Global Const $picox2 = 996
Global Const $picoy2 = 282
Global Const $tardadox1 = 603
Global Const $tardadoy1 = 399
Global Const $tardadox2 = 690
Global Const $tardadoy2 = 453
Global Const $encuentrox1 = 732
Global Const $encuentroy1 = 522
Global Const $encuentrox2 = 1275
Global Const $encuentroy2 = 750
Global Const $fishingimg= "walk.png"
Global Const $huir = "huir.png"
Global Const $noPico = "noPico.png"
Global Const $pico = "pico.png"
Global Const $tardado= "tardado.png"
Global Const $encuentroimg= "encuentro.png"
Global $returnx = 0
Global $returny= 0
Global $hDLL = DllOpen("user32.dll")
Sleep(3000)
Func mecanicaEncuentro()
While $encuentro
	$colorMagikarp = PixelSearch(962, 289, 1002, 329, 0xf07653 )
	$colorTentacool = PixelSearch(941,266,961,286, 0x9FD2F1)
	$Contador+=1
	ConsoleWrite($Contador & @CRLF)
			If IsArray($colorTentacool) or IsArray($colorMagikarp) Then
				_ScreenCapture_Capture(@MyDocumentsDir & "\Screenshots\screen" & $ContadorScreen & ".jpg", 579, 54, 1350, 519)
				$ContadorScreen+=1
				$result7 = _ImageSearchArea($huir,1,$huirx1,$huiry1,$huirx2,$huiry2,$returnx,$returny,0,0)
			while $result7 = 0
				$result7 = _ImageSearchArea($huir,1,$huirx1,$huiry1,$huirx2,$huiry2,$returnx,$returny,0,0)
			If $result7=1 Then

				send("{NUMPADADD down}")
				send("{LEFT down}")
				Sleep(150)
				send("{LEFT up}")
				send("{RIGHT down}")
				Sleep(150)
				send("{RIGHT up}")
				send("{a down}")
				Sleep(150)
				send("{a up}")
				send("{NUMPADADD up}")
				$encuentro= False
				$Contador=0


			EndIf

			Wend

			ElseIf $Contador >= 150 then
			_ScreenCapture_Capture(@MyDocumentsDir & "\Screenshots\screen" & $ContadorScreen & ".jpg", 579, 54, 1350, 519)
			 $ContadorScreen+=1
			send("{NUMPADADD down}")
			Sleep(250)
			send("{NUMPADADD up}")
			$hunting= False
			$encuentro= False
			MsgBox($MB_OK,"Encontrado!!!!!","Se encontro un shiny")
			EndIf

WEnd
EndFunc

While $hunting

	$result = _ImageSearchArea($fishingimg,1,$fishingx1,$fishingy1,$fishingx2,$fishingy2,$returnx,$returny,0,0)
		if $result=1 Then
		send("{x down}")
		Sleep(100)
		send("{x up}")
		if $encuentro=False or $fishing= False or $tirar= False then
		$encuentro= True
		$fishing = True
		$tirar = True
		EndIf
		Else
		While $fishing
			ConsoleWrite("Entra" & @CRLF)
		$result1 = _ImageSearchArea($noPico,1,$noPicox1,$noPicoy1,$noPicox2,$noPicoy2,$returnx,$returny,100,0)
		$result2 = _ImageSearchArea($pico,1,$picox1,$picoy1,$picox2,$picoy2,$returnx,$returny,100,0)

		If $result1 = 1 Then
		ConsoleWrite("No pico" & @CRLF)
		Sleep(250)
		send("{a down}")
		Sleep(100)
		send("{a up}")
		$fishing = false

		ElseIf $result2 = 1 Then
			$fishing = false
			While $tirar
		ConsoleWrite("tirando" & @CRLF)
		send("{a down}")
		Sleep(100)
		send("{a up}")
		send("{a down}")
		Sleep(100)
		send("{a up}")

		$result3 = _ImageSearchArea($tardado,1,$tardadox1,$tardadoy1,$tardadox2,$tardadoy2,$returnx,$returny,100,0)
		$result4 = _ImageSearchArea($encuentroimg,1,$encuentrox1,$encuentroy1,$encuentrox2,$encuentroy2,$returnx,$returny,100,0)
			IF $result3 = 1 Then
		ConsoleWrite("Se escapo" & @CRLF)
		send("{a down}")
		Sleep(100)
		send("{a up}")
		$tirar = False
			ElseIf $result4 = 1 Then
		$tirar = False
		mecanicaEncuentro()
			EndIf

			WEnd
		EndIf
		WEnd
		EndIf
		#cs

	if $result=1 Then
		send("{x}")
		if $encuentro=False or $fishing= False then
		$encuentro= True
		$fishing = True
		EndIf
		Else
	While $fishing
		$result1 = _ImageSearchArea($noPico,1,$noPicox1,$noPicoy1,$noPicox2,$noPicoy2,$returnx,$returny,0,0)
		$result2 = _ImageSearchArea($pico,1,$picox1,$picoy1,$picox2,$picoy2,$returnx,$returny,0,0)
		If $result1 = 1 Then
			send("{a}")
			 $fishing = false
		ElseIf $result2 = 1 Then
			 While $result2 = 1
				 $result2 = _ImageSearchArea($pico,1,$picox1,$picoy1,$picox2,$picoy2,$returnx,$returny,0,0)
			send("{a}")
			send("{a}")
			send("{a}")
			$result3 = _ImageSearchArea($tardado,1,$tardadox1,$tardadoy1,$tardadox2,$tardadoy2,$returnx,$returny,0,0)
			$result4 = _ImageSearchArea($encuentro,1,$encuentrox1,$encuentroy1,$encuentrox2,$encuentroy2,$returnx,$returny,0,0)
			If $result3= 1 Then
			$jalando = False
			$fishing = false
			send("{a}")
			send("{a}")
			send("{a}")
			ElseIf $result4=1 Then

			ElseIf $result3=0 Then
			send("{a}")
			send("{a}")
			send("{a}")
			EndIf


		while $encuentro

		$Contador+=1

		If  Then
			_ScreenCapture_Capture(@MyDocumentsDir & "\Screenshots\screen" & $ContadorScreen & ".jpg", 579, 54, 1350, 519)
			$ContadorScreen+=1
			$result7 = _ImageSearchArea($huir,1,$huirx1,$huiry1,$huirx2,$huiry2,$returnx,$returny,0,0)
			while $result7 = 0
				$result7 = _ImageSearchArea($huir,1,$huirx1,$huiry1,$huirx2,$huiry2,$returnx,$returny,0,0)
			If $result7=1 Then

				send("{NUMPADADD down}")
				send("{LEFT down}")
				Sleep(150)
				send("{LEFT up}")
				send("{RIGHT down}")
				Sleep(150)
				send("{RIGHT up}")
				send("{a down}")
				Sleep(150)
				send("{a up}")
				send("{NUMPADADD up}")
				$encuentro= False
				$Contador=0


			EndIf

			Wend
			ElseIf $Contador >= 65 then
			_ScreenCapture_Capture(@MyDocumentsDir & "\Screenshots\screen" & $ContadorScreen & ".jpg", 579, 54, 1350, 519)
			send("{NUMPADADD down}")
			Sleep(250)
			send("{NUMPADADD up}")
			$hunting= False
			$encuentro= False
			MsgBox($MB_OK,"Encontrado!!!!!","Se encontro un shiny")
			EndIf


			 WEnd

		WEnd
			 EndIf
		WEnd
			endif
			 #ce
	if _IsPressed("1B", $hDLL) Then
	$hunting=False
	MsgBox($MB_OK,"Fueraaaaaaaaaaaa","Fuera del Programa")
	EndIf


WEnd