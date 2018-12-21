using QML
using Observables

const x = Observable(0.0)
const y = Observable(0.0)

const x_array = Float64[]
const y_array = Float64[]

function update_position(::Any)
  global x_array, y_array
  if isempty(x_array) || last(x_array) != x[] || last(y_array) != y[]
    push!(x_array,x[])
    push!(y_array, y[])
  end
end

on(update_position, x)
on(update_position, y)

function sketch()
  global x_array, y_array
  empty!(x_array)
  empty!(y_array)

  qmlfile = joinpath(@__DIR__, "qml", "sketch.qml")

  posmap = QQmlPropertyMap()
  posmap["x"] = x
  posmap["y"] = y

  load(qmlfile, position=posmap)
  exec()

  return deepcopy(x_array), deepcopy(y_array)
end



