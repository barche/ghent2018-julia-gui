using QML
using Observables

v = Observable(rand())

function update()
  global v
  v[] = rand()
end

@qmlfunction update

load(joinpath(@__DIR__, "qml", "test01", "main.qml"), juliaValue = v)

exec()