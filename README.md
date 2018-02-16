IBM Index 2018 Introduction to Elixir Workshop Resources
========================================================

The files in this repository are source documents for the 
*Introduction to Elixir* workshop at the IBM Index Conference 2018

The `chat_bots` directory is a mix project with a very simple example of using
the `Supervisor` OTP module.  The `Supervisor_schematic.pdf` file is a diagram
of the Supervisor/Worker structure built by the appilcation.

The `transcripts` directory contains a set of files that walk through some
tutorial material about Elixir.  Generally speaking copying and pasting one
line at a time from those files will walk through the live demo portion of
the presentation.

The file `counter.ex` is a simple module with functions that implement a basic 
process that maintains a simple counter.  The example is used to demonstrate how
to write a process that receives multiple messages and maintains state.

The files `counter_genserver_1.ex` and `counter_genserver_2.ex` implement the
same counter as an OTP GenServer.  The second file is largely the same as the
first one, but adds a set of functions that provide a convenience API for the 
counter.

`echo.ex` is a really simple module with a single, recursive function that 
implements a process receive loop.

The `modules.ex` file demonstrates the syntax for creating module.

Inside `workshop.ex` and `workshop.sh` are really simple functions that get 
added to the `iex` REPL and Bash shell at the beginning of the presentation.  
They are just utility functions that help drive the presentation and give it
visual interest.  The very beginning of the transcript compiles `workshop.ex`
into a BEAM file that is imported by the `.iex.exs` file and the `workshop.sh` 
file is sourced into the shell.
