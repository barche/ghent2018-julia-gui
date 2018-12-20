using QML
using Observables

const current_display = Observable{AbstractDisplay}(popdisplay())
pushdisplay(current_display[])

on(current_display) do d
  popdisplay()
  pushdisplay(d)
end

function qmldisplaylist(n::Integer)
  qmlfile = joinpath(@__DIR__, "qml", "display.qml")
  load(qmlfile, display=current_display, ndisplays=n)
  exec_async()
end

# Include from the REPL, and then add plotting commands, e.g:
# using GR
# GR.inline()
# plot(rand(10,2))