# Case 1 — Laminar Flow Over a Circular Cylinder (Re = 100)

## 1. Overview
This case investigates 2D incompressible laminar flow over a circular cylinder of diameter \( D = 0.25 \ \mathrm{m} \) at a Reynolds number of \( Re = 100 \). The simulation is performed using **OpenFOAM**’s `icoFoam` solver with a high-quality structured mesh generated in **Gmsh**. Post-processing is done in **ParaView** and **Python**.

**Simulation parameters:**
| Parameter       | Value       |
|-----------------|-------------|
| Reynolds Number \( Re \) | 100 |
| \( U_\infty \) (m/s)      | 0.00604 |
| Fluid density \( \rho \) (kg/m³) | 1.225 |
| Kinematic viscosity \( \nu \) (m²/s) | \( 1.51 \times 10^{-5} \) |
| Solver          | icoFoam |
| Time step \( \Delta t \)  | 0.05 s |
| End time        | 7000 s |
| Mean CFL        | 0.01772 |
| Max CFL         | 0.0622 |

The primary aim here is **baseline validation** of the solver and setup against published laminar cylinder flow data before proceeding to higher Reynolds numbers.

---

## 2. Flow Physics at Re = 100
At this Reynolds number, the flow is fully laminar, and vortex shedding occurs, producing a **von Kármán vortex street** in the wake. The separation points remain relatively steady, and the wake is periodic in time.

The flow is governed by the incompressible Navier–Stokes equations:

$$
\nabla \cdot \mathbf{u} = 0
$$

$$
\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u} = -\frac{1}{\rho} \nabla p + \nu \nabla^2 \mathbf{u}
$$

where:
- \( \mathbf{u} \) = velocity vector  
- \( p \) = pressure  
- \( \rho \) = density  
- \( \nu \) = kinematic viscosity  

---
