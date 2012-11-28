#ifndef GAPCONDUCTANCE_H
#define GAPCONDUCTANCE_H

#include "Material.h"

/**
 * Generic gap heat transfer model, with h_gap =  h_conduction + h_contact + h_radiation
 */
class GapConductance :
  public Material
{
public:

  GapConductance(const std::string & name, InputParameters parameters);

  virtual ~GapConductance(){}

  static Real gapLength(Real distance, Real min_gap, Real max_gap);

protected:

  virtual void computeQpProperties();

  /**
   * Override this to compute the conductance at _qp
   */
  virtual void computeQpConductance();


  virtual Real h_conduction();
  virtual Real dh_conduction();
  virtual Real gapK();

  void computeGapTempAndDistance();

  const std::string _appended_property_name;

  bool _quadrature;

  Real _gap_temp;
  Real _gap_distance;

  bool _has_info;

  const VariableValue & _gap_distance_value;
  const VariableValue & _gap_temp_value;
  MaterialProperty<Real> & _gap_conductance;
  MaterialProperty<Real> & _gap_conductance_dT;

  const Real _gap_conductivity;

  Real _min_gap;
  Real _max_gap;

  MooseVariable * _temp_var;
  PenetrationLocator * _penetration_locator;
  MooseMesh * _current_mesh;
  const NumericVector<Number> * * _serialized_solution;
  DofMap * _dof_map;
  const bool _warnings;
};

template<>
InputParameters validParams<GapConductance>();

#endif //GAPCONDUCTANCE_H
