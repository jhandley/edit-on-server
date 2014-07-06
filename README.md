# EditOnServer

Simple browser based text/code editor that lets you create/edit files in a directory on the webserver.
The @files_path attribute in EditOnServer.Controllers.Files is the path to the directory on 
the server that contains the files that can be edited.

Uses the excellent [Ace](http://ace.c9.io/#nav=howto) editor for the client code and
the [Phoenix] (https://github.com/phoenixframework/phoenix) web framework on the server.

## Prerequisites:
 * Erlang
 * Elixir

## Setup
 1. cd to project directory
 2. Install dependencies with `mix deps.get`
 3. Start server with `mix phoenix.start`

Now you can visit `localhost:4000` from your browser.


## Notes

* If you choose to change the application's structure, you could manually start the router from your code like this `EditOnServer.Router.start`
