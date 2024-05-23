//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "ComponentAction.h"
#include "InputParameters.h"
#include "MooseTypes.h"
#include "PhysicsBase.h"

/**
 * Helper class to help creating an entire physics
 * TODO: Should this be an Interface rather than a Helper?
 * Note: Trying out virtual inheritance
 */
class PhysicsComponentHelper : public virtual ComponentAction
{
public:
  static InputParameters validParams();

  PhysicsComponentHelper(const InputParameters & params);

  /// Get the Physics from the Component
  std::vector<PhysicsBase *> getPhysics() const { return _physics; }

protected:
  /// Whether the physics exists with the requested type and name
  template <typename T>
  bool physicsExists(const PhysicsName & name);

  virtual void addPhysics() override { initComponentPhysics(); }
  virtual void initComponentPhysics() = 0;

  /// Names of the Physics defined on the component
  std::vector<PhysicsName> _physics_names;
  /// Pointers to the Physics defined on the component
  std::vector<PhysicsBase *> _physics;
};

template <typename T>
bool
PhysicsComponentHelper::physicsExists(const PhysicsName & name)
{
  const auto physics = _awh.getPhysics<T>();
  for (const auto phys : physics)
    if (phys->name() == name)
      return true;
  return false;
}
