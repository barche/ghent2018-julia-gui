using QML

function editmatrix!(A::AbstractArray{<:Number,N}) where {N}
  @assert N == 1 || N == 2
  lineararray = collect(reshape(A',length(A)))
  model = ListModel(lineararray)

  function valuesetter(array, value, index)
    if isempty(value)
      return
    end
    array[index] = parse(eltype(A),value)
  end
  addrole(model, "arrayValue", x -> x, valuesetter)

  qmlfile = joinpath(@__DIR__, "qml", "editmatrix.qml")
  load(qmlfile, arrayModel=model, cols=length(A)/size(A,1))
  exec()
  A .= reshape(lineararray, reverse(size(A)))'
end
