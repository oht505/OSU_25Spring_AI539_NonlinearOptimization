# Nonlinear Systems – Assignments Overview

This repository contains my assignments for the course **Nonlinear Systems**, taken in Spring 2025 at Oregon State University.

> This course focuses on solving optimization problems where the objective function or constraints are nonlinear. It includes classical optimization theory, descent algorithms, and constrained optimization techniques.

The assignments involve both theoretical analysis and simulation using MATLAB.

---

## Course Overview for New Visitors

- Goal: Understand and apply nonlinear optimization methods in both theory and practice.
- Tools: MATLAB, gradient-descent algorithms, convexity theory, and numerical experiments
- Deliverables: Analytical proofs, MATLAB code implmentations, and convergence analysis for various methods. 

---

## Assignment Summaries

### HW1 – Preliminaries

- Proved the formula for orthogonal projection onto a vector subspace and showed that the residual is orthogonal to the subspace
- Analyzed topological properties of sets (open, closed, compact) and clarified concepts like interior, boundary, and closure.
- Explored matrix norms and eigenvalue relationships, including how positive semidefiniteness affects constrained optimization problems.

Main file: !["HW1/AI539_Nonlinear_Optimization_HW1_Hyuntaek_Oh_250416_005937.pdf"]  

---

### HW2 – Analytical Properties of Optimization Solutions

- Reformulated and minimized quadratic loss functions in terms of polynomial approximation and orthogonality in function space.
- Applied 

📄 Main file: `HW2/AI539_Nonlinear_Optimization_HW2_Hyuntaek_Oh.pdf`  
📷 Sample Result:  
![Phase Plot HW2](./images/hw2_phase_plane.png)

---

### 🔹 HW3 – Lyapunov Stability

- Use Lyapunov candidate functions to prove stability
- Simulate system response over time
- Discuss conditions for global vs local stability

📄 Main file: `HW3/lyapunov_test.m`  
📷 Sample Result:  
![Lyapunov HW3](./images/hw3_lyapunov_surface.png)

---

### 🔹 HW4 – Limit Cycles & Bifurcation

- Explore limit cycles using the van der Pol oscillator
- Vary parameters to observe bifurcation
- Simulate transition from periodic to chaotic behavior

📄 Main file: `HW4/vanderpol_sim.m`  
📷 Sample Result:  
![Van der Pol HW4](./images/hw4_vdp_cycle.png)

---

## 🧠 What I Learned

- How to visualize and analyze nonlinear behavior beyond equations
- The power of Lyapunov methods in verifying system stability
- How real-world systems exhibit limit cycles and bifurcations

---

## 🛠️ Tools Used

- MATLAB (for simulations and plotting)
- Symbolic Math Toolbox
- Numerical ODE Solvers (`ode45`, `ode23`)

---

## 📁 Folder Structure

