# Taskhive
Taskhive is a decentralized, p2p freelancer marketplace looking to improve many people's lives. For marketing and feature details, check out the website: taskhive.io

## Instructions
Currently Taskhive isn't completely operational as it's being actively developed and changed on its core backend code and interface. Therefore, it is recommended to wait until it's released as a finished beta. However, if you still wish to check out its functionalities and help extend the code, here is how you can do it:

Taskhive uses PyQt5 for its Desktop UI so you will need to download it with:

`pip install PyQt5`

You also need to make sure you have *at least* Qt 5.8 running on your computer, as Taskhive has yet to released on a pre-compiled version. 

As for python packages, please make sure you have base64, xmlrpc, psutil and xml. You can also get them through using `pip install` . 

## What you need to know about the backend

..* Taskhive uses Bitcoin's - specifically electron wallet's - encryption module to generate "taskhive keys" as a temporary replacement for its own keys.

..* Taskhive Client leverages Bitmessage's network as a bus to communicate between each other. Therefore, it will rely on its stability and security. It specifically uses XMLRPC to connect to the Bitmessage port.

## Disclaimer

Most of the testing has been done in Windows, Debian, and some light testing in Tails, so if you find any bugs specific to a platform, please open up an issue and let us know.

This project is still under heavy development.
