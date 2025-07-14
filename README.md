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

[view HW4 Report](./HW4/AI539_Nonlinear_Optimization_HW4_Hyuntaek_Oh.pdf) 

![function value](https://github.com/user-attachments/assets/b1b34796-9094-42e7-bb44-e9a6de01f1b9)

![grad_norm](https://github.com/user-attachments/assets/3adbae11-8826-4b67-b808-045a801acd67)

---

### HW5 – Comparing Line Search and Modified Newton's Method for Nonlinear Optimization

- Implemented and compared Gradient Descent with Backtracking and Goldstein Line Search on a non-convex function, analyzing their convergence behaviors through norm and function value plots
- Verified local optimality by checking gradient vanishing and positive definiteness of the Hessian, confirming strict local minima in both methods
- Applied a Modified Newton’s Method with eigenvalue correction and Armijo-style backtracking to ensure global convergence, achieving rapid quadratic convergence in final iterations

[view HW5 Report](./HW5/AI539_Nonlinear_Optimization_HW5_Hyuntaek_Oh.pdf) 

![backtracking_grad_norms](https://github.com/user-attachments/assets/d6e28b1c-31e1-41a7-8fa3-ecdbb9b6be8c)

![Goldstein_grad_norms](https://github.com/user-attachments/assets/87b4c2f6-a433-4554-a22e-bb171bf5c928)

![Newton_bt_grad_norms](https://github.com/user-attachments/assets/595925e1-bc6f-4063-860f-0db8c171236b)

---

### HW6 – Conjugate Gradient and PARTAN Methods for Large-Scale Quadratic Optimization

- Derived and analyzed the convergence rate of the Conjugate Gradient Method, showing its exponential improvement over Gradient Descent using Chebyshev polynomial bounds
- Implemented Gradient Descent with Backtracking Line Search and observed its performance on ill-conditioned problems depending on penalty parameter µ (slow convergence when µ = 1000)
- Developed and tested the PARTAN algorithm, demonstrating significantly faster convergence and greater efficiency than standard Gradient Descent, especially under high-penalty conditions

[view HW6 Report](./HW6/AI539_Nonlinear_Optimization_HW6_Hyuntaek_Oh.pdf) 

![Q2_b_mu1_grad](https://github.com/user-attachments/assets/ff94dc51-19b7-4fc2-868b-8953889ff3da)

![Q2_b_mu1000_grad](https://github.com/user-attachments/assets/ae77483d-7667-4997-8e33-578ce421393e)

![Q2_c_mu1_grad](https://github.com/user-attachments/assets/3c4efa3a-4f0d-44f7-9d7e-82e580d3a702)

![Q2_c_mu1000_grad](https://github.com/user-attachments/assets/c17c6007-5c36-4ac7-80da-96190ae60214)

---

### Midterm – Theoretical Foundations of Descent Algorithms

- Proved that Gradient Descent with Armijo Backtracking satisfies the Global Convergence Theorem for continuously differentiable functions
- Analyzed the Gauss-Southwell Coordinate Descent Algorithm, showing how greedy coordinate selection affects descent behavior and convergence
- Applied convexity theory to prove that for a composite function f(x)=g(Ax+b), convexity of f is guaranteed when g is convex and A is linear

![midterm_Q2_grad_norms](https://github.com/user-attachments/assets/94fef628-9db5-4eb1-8abd-c96f3185ebee)

![midterm_Q3_gradient_norms](https://github.com/user-attachments/assets/048cbd40-e162-4e58-9770-399f38fcea47)

---

### Final – KKT conditions and Penalty Method

- KKT Condition Verification:
Proved and applied the Karush-Kuhn-Tucker (KKT) conditions using multiplier existence, constraint activity, and matrix-based formulation. Derived a closed-form solution for multipliers when the constraint Jacobian has full row rank

- Penalty Method Implementation:
Developed and implemented a penalty-based optimization algorithm using a quadratic penalty function to handle both equality and inequality constraints. Demonstrated convergence behavior through code and plots

- Second-Order Optimality Check:
Verified that the final solution satisfies both the second-order necessary and sufficient conditions by projecting the Lagrangian Hessian onto the tangent subspace at the active set

<img width="840" height="630" alt="f_vals" src="https://github.com/user-attachments/assets/46b55bac-e7bc-40d9-877f-954c4f96e5ee" />

<img width="840" height="630" alt="P_vals" src="https://github.com/user-attachments/assets/def8bd98-b765-483a-b50f-836f944b7ba9" />

<img width="840" height="630" alt="penalty_term_vals" src="https://github.com/user-attachments/assets/2288ebf6-46ad-4e7a-ab9d-9343003f9245" />

---

## Tools Used

- MATLAB (for simulations and plotting)

---
