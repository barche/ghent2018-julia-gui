using QML

# Julia Fruit model item. Each field is automatically a role, by default
mutable struct Fruit
  name::String
  cost::Float64
  attributes::ListModel
end

# Attributes must have a description and are nested model items
mutable struct Attribute
  description::String
end

# Construct using attributes from an array of QVariantMap, as in the append call in QML
function Fruit(name, cost, attributes::Array)
  return Fruit(name, cost, ListModel([Attribute(a["description"]) for a in attributes]))
end

# Our initial data
fruitlist = [
  Fruit("Apple", 2.45, ListModel([Attribute("Core"), Attribute("Deciduous")])),
  Fruit("Banana", 1.95, ListModel([Attribute("Tropical"), Attribute("Seedless")])),
  Fruit("Cumquat", 3.25, ListModel([Attribute("Citrus")])),
  Fruit("Durian", 9.95, ListModel([Attribute("Tropical"), Attribute("Smelly")]))]

println("Your original fruits:")
for f in fruitlist
  println("  $(f.name), \$$(f.cost)")
end

# Load QML after setting context properties, to avoid errors on initialization
qmlfile = joinpath(@__DIR__, "qml", "dynamiclist.qml")
load(qmlfile, fruitModel=ListModel(fruitlist))

# Run the application
exec()

# Show that the Julia fruitlist was modified
println("Your modified fruits:")
for f in fruitlist
  println("  $(f.name), \$$(f.cost)")
end
