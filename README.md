# Opensource-CFD
This project demonstrates the simulation of incompressible flow over a circular cylinder using fully open-source tools on a personal computing device, without the need for high-performance computing (HPC).

# 🌀 CFD Simulation of Flow Over a Circular Cylinder using OpenFOAM

This repository contains a Computational Fluid Dynamics (CFD) project focused on simulating the **2D incompressible flow over a circular cylinder** across a range of Reynolds numbers. The entire workflow is developed using **open-source software** and executed on a **personal computing device** (without HPC resources).

---

## 📌 Objective

- Perform CFD simulations using a complete open-source stack.
- Demonstrate the feasibility of accurate CFD on personal hardware (laptop) without HPC or cloud computing.
- Study laminar to turbulent flow regimes over a canonical geometry (cylinder).
- Use different OpenFOAM solvers for varying flow conditions.
- Validate results against published literature; analyze deviations and their causes.
- Emphasize accessibility, reproducibility, and cost-effectiveness in CFD research.

---

## 🛠️ Tools & Technologies

| Tool         | Purpose                         |
|--------------|----------------------------------|
| **OpenFOAM** | CFD simulation (solvers: `icoFoam`, `simpleFoam`, etc.) |
| **Gmsh**     | Geometry creation and mesh generation |
| **ParaView** | Post-processing and flow visualization |
| **Python** / **Gnuplot** | Data analysis and plotting |
| **Ubuntu**   | Operating system for the full workflow |

---

## 🔬 Problem Definition

- **Geometry**: Circular cylinder with diameter **0.25 m** (approx. size of a basketball)
- **Domain size**: 6 m × 3 m (L × H), extruded in Z-direction (0.05 m) for 2D effect
- **Flow Type**: Incompressible, steady/unsteady based on Reynolds number
- **Simulation Type**: 2D with appropriate boundary and initial conditions
- **Boundary Conditions**:
  - **Inlet**: Fixed velocity (`U∞`)
  - **Outlet**: Zero-gradient
  - **Top/Bottom**: Symmetry
  - **Cylinder**: No-slip wall
  - **Front/Back**: Empty (2D)

---

## 📊 Test Cases

| Case | Reynolds Number | U∞ (m/s) | Flow Regime | Solver       |
|------|------------------|-----------|--------------|---------------|
| 1    | 100              | 0.00604   | Laminar      | `icoFoam`     |
| 2    | 200              | 0.01208   | Laminar      | `icoFoam`     |
| 3    | 500              | 0.0302    | Transitional | `icoFoam` / `pimpleFoam` |
| 4    | 10,000           | 0.604     | Turbulent    | To be explored |
| 5    | 100,000          | 6.04      | Turbulent    | To be explored|
| 6–8  | Higher Re cases  | Up to 302 | Turbulent    | To be explored |

---

## 📈 Mesh Details for Laminar Simulation

- Mesh generated using **Gmsh**
- Element type: **Hexahedra only**
- Cells: **49,342**
- Mesh quality:
  - **Max Aspect Ratio**: 3.99
  - **Max Non-Orthogonality**: 43.9°
  - **Max Skewness**: 0.46
  - **SICN**: 0.6467 (avg)
  - **SIGE**: 0.9879 (avg)
  - **Gamma**: 0 (not applicable — hex-only mesh)

---

## 💻 System Configuration

- **OS**: Ubuntu (x86_64)
- **CPU**: Intel® Core™ i5-7200U @ 2.50 GHz (2 Cores / 4 Threads)
- **RAM**: 16 GB DDR4 @ 2133 MT/s
- **GPU**: Intel HD Graphics 620 + NVIDIA GeForce 940MX (2 GB VRAM)
- No HPC resources used.

- ---

## License

- **Code, case files, and scripts**: Licensed under the [MIT License](./LICENSE)
- **Documentation, slides, and reports**: Licensed under [CC BY 4.0](./LICENSE-docs)


---

## 🙋 Acknowledgements

- OpenFOAM Foundation
- Gmsh and ParaView development teams
- Open-source community contributors
- Reference literature for validation cases

---

## 📬 Contact

**Author**: Ahmed Mushtaq Nilikkar  
Feel free to open issues, submit PRs, or reach out via GitHub for collaboration or feedback.



---


