# PD QR Code Gen

Easily generate pre-rendered QR codes for your Playdate game from the Simulator
with this little application.

## How to Use

1. Clone the repo or download the source
2. Compile the program with `pdc`
3. Launch the Playdate Simulator
4. Open it in the Simulator
5. Open the Lua console in the Simulator
6. Type in `!msg https://example.com`

The QR code will be generated. When it's done, it gets saved on your computer
at `~/qrcode.png` and displayed in the Simulator for testing.

Be sure to move `~/qrcode.png` before generating another one!
