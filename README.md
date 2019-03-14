# ekke

EKKE IS CURRENTLY WIP AND NOT PRODUCTION READY (this readme serves me for taking notes for later...)

Ekke is an application framework for building cross platform GUI apps that run both locally and on the web. The general purpose is to allow for each application to be developed by writing stricly its actual functionality. Ekke will take care of all annoying chores for you: installation, deployment, configuration, logging, user auth, reusable frontend components like powerful fuzzy search/command bar, ... Write nothing but your actual functionality.

If all you want to do is write a CLI application, you probably don't want to bother using the ekke framework. If you want cross platform GUI and deploy to phone, desktop and web at once, Ekke should save you alot of time.

When writing an application with ekke, you are locked in:

- writing a frontend with web technologies:
  1. structure: html
  2. styling  : css/scss/less/sass...
  3. logic    : webassembly/javascript/typescript/elm/purescript...

- Separating your frontend and backend in 2 components
- Components in ekke must communicate in ekkespeak (CBOR encoded messages)
- Require the ekke server to run alongside your application

Ekke will provide you with the following advantages:

- all your backend has to do is connect to a socket and understand ekkespeak. You need not worry about any low level stuff like setting up http etc...
- you can use any programming language for your backend. You can choose any database for your backend.
- ekke can be compiled into your program as a library, or you can deploy your program for people already running ekke through package management.
- reusable frontend components for consistent user experience (powerful instant search bar that can also send commands to your backend,...)
- ekke will take care of repetitive chores like installation/deployment/configuration/logging/user auth/...
- if you develop in rust you have additional benefits, you can compile agains the ekke libs to have acces to all structs and traits directly, so you don't have to implement ekkespeak, nor socket connection. All











- reusblility of functionality (do as little as possible in apps)
- be careful not to lock apps in xxx
-

