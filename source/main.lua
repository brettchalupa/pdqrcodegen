-- Makes it easy to generate a pre-rendered QR code to display in your Playdate
-- game via the Simulator.
--
-- Send a message via the Lua console with !msg https://example.com
-- to generate a QR code and save it at ~/qrcode.png on your computer's
-- filesystem

import "CoreLibs/qrcode"
import "CoreLibs/timer"

local gfx <const> = playdate.graphics
local qrImage = nil
local qrString = nil
local genTimer = nil

function playdate.update()
	playdate.timer.updateTimers()

	gfx.clear()

	gfx.drawText("*Generate QR Code*", 12, 12)
	gfx.drawText("*Use !msg in the Simulator console to send string*", 12, 42)

	if qrImage then
		qrImage:draw(12, 72)

		gfx.drawText("*Image saved on your computer at ~/qrcode.png*", 12, 194)
	end

	if qrString then
		gfx.drawText("*" .. qrString .. "*", 12, 170)
	end

	if genTimer and genTimer.timeLeft > 0 then
		gfx.drawText("*Generating QR code...*", 12, 84)
	end
end

function genQRCode(str)
	qrString = str
	qrImage = nil
	genTimer = gfx.generateQRCode(str, nil, setQRCode)
end

function setQRCode(image, errorMessage)
	genTimer = nil

	if errorMessage then
		print("ERROR: " .. errorMessage)

		return
	end

	qrImage = image

	playdate.simulator.writeToFile(qrImage, "~/qrcode.png")
end

function playdate.serialMessageReceived(message)
	print("Received message: " .. message)
	genQRCode(message)
end
