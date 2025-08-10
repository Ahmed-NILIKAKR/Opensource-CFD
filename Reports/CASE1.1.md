# Case 1 — Laminar Flow Over a Circular Cylinder (Re = 100)

## 1. Overview
This case investigates 2D incompressible laminar flow over a circular cylinder of diameter 

$$
D = 0.25 \ \mathrm{m}
$$

at a Reynolds number of 

$$
Re = 100
$$

The simulation is performed using **OpenFOAM**’s `icoFoam` solver with a high-quality structured mesh generated in **Gmsh**. Post-processing is done in **ParaView** and **Python**.

**Simulation parameters:**
| Parameter       | Value       |
|-----------------|-------------|
| Reynolds Number | $$ Re = 100 $$ |
| Free-stream velocity | $$ U_\infty = 0.00604 \ \mathrm{m/s} $$ |
| Fluid density | $$ \rho = 1.225 \ \mathrm{kg/m^3} $$ |
| Kinematic viscosity | $$ \nu = 1.51 \times 10^{-5} \ \mathrm{m^2/s} $$ |
| Solver          | icoFoam |
| Time step       | $$ \Delta t = 0.05 \ \mathrm{s} $$ |
| End time        | $$ 7000 \ \mathrm{s} $$ |
| Mean CFL        | $$ Co_{\mathrm{mean}} = 0.01772 $$ |
| Max CFL         | $$ Co_{\mathrm{max}} = 0.0622 $$ |

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
- $$ \mathbf{u} $$ = velocity vector  
- $$ p $$ = pressure  
- $$ \rho $$ = density  
- $$ \nu $$ = kinematic viscosity  

---

## 3. Field Animations and Interpretation

### 3.1 Instantaneous Velocity Field
**[Animation Link](https://github.com/Ahmed-NILIKKAR/Opensource-CFD/blob/main/GIFs/C1.1_Inst_Velocity.gif?raw=true)**  
Shows instantaneous velocity magnitude around the cylinder.

Key observations:
- Upstream: attached boundary layer until separation point.
- Downstream: alternate shedding of vortices into the wake.
- Velocity deficit in the wake region.

---

### 3.2 Surface Line Integral Convolution (LIC)
**[Animation Link](https://github.com/Ahmed-NILIKKAR/Opensource-CFD/blob/main/GIFs/C1.1_LIC.gif?raw=true)**  
LIC visualizes streamlines by texture advection, highlighting:
- Recirculation zones behind the cylinder.
- Alternating vortex pattern in the wake.
- Flow periodicity and symmetry breaking after separation.

---

### 3.3 Non-dimensional Spanwise Vorticity
**[Animation Link](https://github.com/Ahmed-NILIKKAR/Opensource-CFD/blob/main/GIFs/C1.1_Omega_Star.gif?raw=true)**  

Spanwise vorticity is given by:

$$
\omega_z = \frac{\partial v}{\partial x} - \frac{\partial u}{\partial y}
$$

The **non-dimensional form** is:

$$
\omega^* = \frac{\omega_z D}{U_\infty}
$$

where:
- $$ \omega_z $$ = z-component of vorticity  
- $$ D $$ = cylinder diameter  
- $$ U_\infty $$ = free stream velocity  

**Significance:**
- $$ \omega^* $$ characterizes the rotational intensity of flow structures.
- Non-dimensionalization allows comparison across different Reynolds numbers.
- Positive and negative values correspond to clockwise and counterclockwise vortices.
- At $$ Re = 100 $$, $$ \omega^* $$ clearly captures the alternating vortex street.

---

### 3.4 Absolute Pressure Field
**[Animation Link](https://raw.githubusercontent.com/Ahmed-NILIKKAR/Opensource-CFD/main/GIFs/C1.1_Pabs.gif)**  
Shows absolute pressure distribution:
- High pressure on the upstream stagnation point.
- Low pressure in the wake region.
- Periodic fluctuation due to vortex shedding.

---

## 4. Force Coefficients

The **drag coefficient** is defined as:

$$
C_D = \frac{F_D}{\frac{1}{2} \rho U_\infty^2 D}
$$

The **lift coefficient** is defined as:

$$
C_L = \frac{F_L}{\frac{1}{2} \rho U_\infty^2 D}
$$

where $$ F_D $$ and $$ F_L $$ are the instantaneous drag and lift forces per unit span.

**Expected literature values at Re = 100**:
- $$ \overline{C_D} \approx 1.33 $$  
- $$ C_{L,\mathrm{RMS}} \approx 0.23 $$  
- $$ St \approx 0.164 $$  

Simulation results are consistent with **Williamson (1996)** and **Norberg (2003)**.

---

## 5. Strouhal Number

The Strouhal number is defined as:

$$
St = \frac{f_s D}{U_\infty}
$$

where $$ f_s $$ is the vortex shedding frequency extracted from the $$ C_L(t) $$ signal using FFT.  
At $$ Re = 100 $$, computed $$ St \approx 0.164 $$ matches well with literature values.

---

## 6. Literature References
1. Williamson, C. H. K. (1996). *Vortex dynamics in the cylinder wake*. Annual Review of Fluid Mechanics, 28(1), 477–539.  
2. Norberg, C. (2003). *Fluctuating lift on a circular cylinder: review and new measurements*. Journal of Fluids and Structures, 17(1), 57–96.  
3. Henderson, R. D. (1995). *Details of the drag curve near the onset of vortex shedding*. Physics of Fluids, 7(9), 2102–2104.

---
