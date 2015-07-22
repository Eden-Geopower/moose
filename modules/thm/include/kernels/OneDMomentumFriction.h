#ifndef ONEDMOMENTUMFRICTION_H
#define ONEDMOMENTUMFRICTION_H

#include "Kernel.h"

// Forward Declarations
class OneDMomentumFriction;

template<>
InputParameters validParams<OneDMomentumFriction>();

/**
 * Contribution due to wall friction
 */
class OneDMomentumFriction : public Kernel
{
public:
  OneDMomentumFriction(const InputParameters & parameters);
  virtual ~OneDMomentumFriction();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  VariableValue & _area;
  VariableValue & _u_vel;
  VariableValue & _rhoA;
  const MaterialProperty<Real> & _Cw;
  const MaterialProperty<Real> & _dCw_drhoA;
  const MaterialProperty<Real> & _dCw_drhouA;
  const MaterialProperty<Real> & _dCw_drhoEA;

  unsigned int _rhoA_var_number;
  unsigned int _rhouA_var_number;
  unsigned int _rhoEA_var_number;
};

#endif
