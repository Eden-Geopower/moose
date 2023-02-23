[Mesh]
  [./left]
    type = GeneratedMeshGenerator
    dim = 2
    nx = 3
    ny = 3
    xmin = -3
    xmax = 0
    ymin = -5
    ymax = 5
    output = false
    nemesis = true
    save_the_mesh = 'left'
  [../]
  [./right]
    type = GeneratedMeshGenerator
    dim = 2
    nx = 3
    ny = 3
    xmin = 3
    xmax = 6
    ymin = -5
    ymax = 5
    save_the_mesh = 'right'
  [../]

  [./left_and_right]
    type = MeshCollectionGenerator
    inputs = 'left right'
  [../]
[]

[Outputs]
  exodus = true
[]

