::generate private key
nrfutil keys generate priv.pem
::generate public key related with private key: priv.pem
nrfutil keys display --key pk --format code priv.pem --out_file dfu_public_key.c
pause