#!/usr/bin/env python3
# Credit for address_generation.py: Daniel Wilczynski (Daunus), Scott King (Lvl4Sword)
# Distributed under the MIT/X11 software license (http://www.opensource.org/licenses/mit-license.php)
import os
import binascii
import hashlib
import ecdsa

B58_ALPHABET = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
KEY_LENGTH = 256
#type of Bitcoin address 0x00 is P2PKH mainnet (string type)
VERSION_BYTE = '00'
#'80' if mainnet, 'ef' if testnet
WIF_VERSION_BYTE = '80'
#'01' if key corresponds to commpressed public key, empty otherwise
TYPE_PUB = ''


# Range of valid private keys is governed by the secp256k1 ECDSA standard used by Bitcoin:
# any 256-bit number from 0x1 to
# 0xFFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFE BAAE DCE6 AF48 A03B BFD2 5E8C D036 4140
# is a valid private key.
def generate_key():
    return make_private_key_hex(os.urandom(int(KEY_LENGTH/8)))

def make_private_key_hex(private_key):
    hex_key = binascii.hexlify(private_key)
    return hex_key.decode('utf-8')

def private_to_public(private_key):
    private_key = binascii.unhexlify(private_key)
    sk = ecdsa.SigningKey.from_string(private_key, curve=ecdsa.SECP256k1)
    return ('04' + binascii.hexlify(sk.verifying_key.to_string()).decode('utf-8'))

#IMPORTANT any implmentation must make sure 00 bytes on front are not clipped here when encoding or getting hash!
#IMPORTANT Hash result should be bigEndian?
def address_from_public(public_key, VERSION_BYTE):
    hash_object = hashlib.new('ripemd160')
    hash_object.update(hashlib.sha256(binascii.unhexlify(public_key)).digest())
    address = (VERSION_BYTE + hash_object.hexdigest())
    address = address + get_checksum(address)
    return address

#get 4 byte double sha256 checksum of hex string
def get_checksum(astring):
    doublehash = hashlib.sha256(hashlib.sha256(binascii.unhexlify(astring.encode())).digest()).hexdigest()
    return doublehash[0:8]

def private_to_wif(astring, WIF_VERSION_BYTE, TYPE_PUB):
    wif = WIF_VERSION_BYTE + astring + TYPE_PUB
    wif = wif + get_checksum(wif)
    return base58_check_encoding(wif)

# def wifToRawKey(astring):
    #todo

#IMPORTANT any implmentation must make sure 00 bytes on front are not clipped here when encoding or getting hash!
def base58_check_encoding(astring):
    leading_zeros = count_leading_zero(astring)
    n = int(astring, 16)
    output = []
    while n > 0 :
        n, reminder = divmod (n, 58)
        output.append(B58_ALPHABET[reminder])
    count = 0
    while count < leading_zeros:
        output.append(B58_ALPHABET[0])
        count += 1
    output = ''.join(output[::-1])
    return output

def count_leading_zero(astring):
    char_to_count = '0'
    count = 0
    for achar in astring:
        if achar != char_to_count:
            break
        count += 1
    return (count//2)
