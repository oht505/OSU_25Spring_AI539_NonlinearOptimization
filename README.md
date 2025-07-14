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

[view HW1 Report](./HW1/AI539_Nonlinear_Optimization_HW1_Hyuntaek_Oh_250416_005937.pdf)  

---

### HW2 – Analytical Properties of Optimization Solutions

- Reformulated and minimized quadratic loss functions in terms of polynomial approximation and orthogonality in function space
- Applied first-order necessary conditions to analyze optimality under inequality constraints using directional derivatives
- Used gradient and Hessian analysis to prove local and global optimality of a multivariable quadratic function

[view HW2 Report](./HW2/AI539_Nonlinear_Optimization_HW2_Hyuntaek_Oh.pdf)  

---

### HW3 – Global Convergence Theorem and Gradient Descent on Quadratic Functions

- Proved that the gradient descent algorithm satisfies the conditions of the Global Convergence Theorem for unconstrained quadratic optimization
- Derived the sufficient condition for a fixed step size 𝛼 to guarantee decrease in objective value, and justified algorithmic closedness
- Implemented MATLAB simulation showing exponential convergence behavior when minimizing a quadratic function with an appropriate step size

[view HW3 Report](./HW3/AI539_Nonlinear_Optimization_HW3_Hyuntaek_Oh.pdf) 

<img width="840" height="630" alt="error norm" src="https://github.com/user-attachments/assets/37c5b95d-87ff-419f-ad44-3d2ae07a1030" />

---

### HW4 – Gradient Descent Method with Armijo Line Search

- Studied and proved the Global Convergence Theorem for iterative optimization algorithms under descent conditions
- Demonstrated theoretical and numerical validation of closedness and continuity properties in limited-range line search mappings
- Implemented Gradient Descent to solve a non-linear optimization problem and verified convergence through function value, gradient norm plots, and Hessian matrix analysis

<p float="left"> ![function value](https://github.com/user-attachments/assets/a6e61546-74bd-478d-b3ba-7adf4a8b9ea4)
![grad_norm](https://github.com/user-attachments/assets/41fdb18d-379d-4ebc-9cff-19f39aa7d4e9) </p>

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

