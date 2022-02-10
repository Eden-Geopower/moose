//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "Action.h"

/**
 * Action to trigger the check of control data integrity
 */
class ControlDataIntegrityCheckAction : public Action
{
public:
  ControlDataIntegrityCheckAction(InputParameters parameters);

  virtual void act();

public:
  static InputParameters validParams();
};
