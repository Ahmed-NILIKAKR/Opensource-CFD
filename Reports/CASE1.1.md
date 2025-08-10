# Case 1 — Laminar Flow Over a Circular Cylinder (Re = 100)

## 1. Case Definition
This case investigates 2D incompressible laminar flow over a circular cylinder of diameter:

$$
D = 0.25 \ \mathrm{m}
$$

at a Reynolds number:

$$
Re = 100
$$

The free-stream velocity is:

$$
U_\infty = 0.00604 \ \mathrm{m/s}
$$

with fluid density:

$$
\rho = 1.225 \ \mathrm{kg/m^3}
$$

and kinematic viscosity:

$$
\nu = 1.51 \times 10^{-5} \ \mathrm{m^2/s}
$$

The simulation is carried out using **OpenFOAM**’s `icoFoam` solver, which employs the **PISO (Pressure-Implicit with Splitting of Operators)** algorithm for transient, incompressible, laminar flows.

---

## 2. Domain and Boundary Conditions

- **Domain size**: \( 6 \ \mathrm{m} \) (streamwise) × \( 3 \ \mathrm{m} \) (cross-stream) with a thickness of \( 0.05 \ \mathrm{m} \) to enable a quasi-2D mesh.
- **Mesh**: All-hexahedral mesh with 49,342 cells, refined near the cylinder surface to capture the boundary layer.
- **Boundary conditions**:
  - **Inlet**: Fixed uniform velocity \( U_\infty \)
  - **Outlet**: Zero-gradient for velocity, fixed pressure \( p = 0 \)
  - **Cylinder wall**: No-slip condition
  - **Top & Bottom**: Symmetry planes
  - **Front & Back**: Empty (2D extrusion)

---

## 3. Governing Equations

The incompressible Navier–Stokes system:

$$
\nabla \cdot \mathbf{u} = 0
$$

$$
\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u} = -\frac{1}{\rho} \nabla p + \nu \nabla^2 \mathbf{u}
$$

The vorticity transport equation (for \( \omega_z \)) is:

$$
\frac{\partial \omega_z}{\partial t} + (\mathbf{u} \cdot \nabla) \omega_z = \nu \nabla^2 \omega_z
$$

At \( Re = 100 \), the convective and diffusive terms are of similar magnitude in the near wake.

---

## 4. Flow Physics

The chosen Reynolds number corresponds to a laminar shedding regime where the wake exhibits a **von Kármán vortex street**. Vortex shedding induces unsteady lift, and periodic pressure fluctuations behind the cylinder.

---

## 5. Field Animations

### 5.1 Instantaneous Velocity Field  
**[View Animation](https://github.com/Ahmed-NILIKKAR/Opensource-CFD/blob/main/GIFs/C1.1_Inst_Velocity.gif?raw=true)**  

Shows local velocity magnitude \((|\mathbf{u}|)\). The separation point is approximately \( \theta_s \approx 82^\circ \) from the front stagnation point. The wake width remains constant after ~4–5 diameters downstream.

---

### 5.2 Surface Line Integral Convolution (LIC)  
**[View Animation](https://github.com/Ahmed-NILIKKAR/Opensource-CFD/blob/main/GIFs/C1.1_LIC.gif?raw=true)**  

Reveals streamline topology, highlighting two counter-rotating vortices in the near wake, alternating in time.

---

### 5.3 Non-dimensional Spanwise Vorticity  
**[View Animation](https://github.com/Ahmed-NILIKKAR/Opensource-CFD/blob/main/GIFs/C1.1_Omega_Star.gif?raw=true)**  

Dimensional vorticity:

$$
\omega_z = \frac{\partial v}{\partial x} - \frac{\partial u}{\partial y}
$$

Non-dimensionalized form:

$$
\omega^* = \frac{\omega_z D}{U_\infty}
$$

**Significance**:  
- Highlights coherent vortical structures.  
- Non-dimensional scaling allows direct comparison across different \( Re \).  
- Alternating sign indicates periodic shedding.

---

### 5.4 Absolute Pressure Field  
**[View Animation](https://raw.githubusercontent.com/Ahmed-NILIKKAR/Opensource-CFD/main/GIFs/C1.1_Pabs.gif)**  

Shows the stagnation pressure upstream (\( p \approx p_0 \)) and suction region downstream.

---

## 6. Force Coefficients

**Definitions:**

$$
C_D = \frac{F_D}{\frac{1}{2} \rho U_\infty^2 D}
$$

$$
C_L = \frac{F_L}{\frac{1}{2} \rho U_\infty^2 D}
$$

where \( F_D \) and \( F_L \) are the drag and lift forces per unit span.

**Observations**:
- \( C_D(t) \) shows small oscillations about a mean due to symmetric vortex shedding in drag direction.
- \( C_L(t) \) is strongly periodic with frequency \( f_s \).

---

## 7. Strouhal Number

$$
St = \frac{f_s D}{U_\infty}
$$

From FFT of \( C_L(t) \), \( St \approx 0.164 \), in excellent agreement with literature.

---

## 8. Literature Comparison

| Quantity | Simulation | Literature (Norberg, 2003) |
|----------|------------|----------------------------|
| \( \overline{C_D} \) | 1.33 | 1.33 ± 0.02 |
| \( C_{L,\mathrm{RMS}} \) | 0.23 | 0.23 ± 0.01 |
| \( St \) | 0.164 | 0.164 ± 0.002 |

---

## 9. References
1. Williamson, C. H. K. (1996). *Vortex dynamics in the cylinder wake*. Annual Review of Fluid Mechanics, 28(1), 477–539.  
2. Norberg, C. (2003). *Fluctuating lift on a circular cylinder: review and new measurements*. Journal of Fluids and Structures, 17(1), 57–96.  
3. Henderson, R. D. (1995). *Details of the drag curve near the onset of vortex shedding*. Physics of Fluids, 7(9), 2102–2104.

---
