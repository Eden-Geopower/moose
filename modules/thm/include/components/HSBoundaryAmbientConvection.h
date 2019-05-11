#pragma once

#include "BoundaryBase.h"
#include "HSBoundaryInterface.h"

class HSBoundaryAmbientConvection;

template <>
InputParameters validParams<HSBoundaryAmbientConvection>();

/**
 * Boundary condition for heat transfer between heat structure and ambient environment
 */
class HSBoundaryAmbientConvection : public BoundaryBase, public HSBoundaryInterface
{
public:
  HSBoundaryAmbientConvection(const InputParameters & params);

  virtual void check() const override;
  virtual void addMooseObjects() override;

protected:
  /// The value of ambient temperature
  const Real & _T_ambient;
  /// The value of convective heat transfer coefficient
  const Real & _htc_ambient;
};
