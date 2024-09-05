# Sub-Synchronous Resonance (SSR) Modal Analysis Tool

![Static Badge](https://img.shields.io/badge/Hamed-Najafi-blue)
![Static Badge](https://img.shields.io/badge/MATLAB%C2%AE-HamedNajafi-blue?style=plastic&logo=MATLAB)



This repository contains a **Sub-Synchronous Resonance (SSR) Modal Analysis Tool** designed for engineers and researchers working in power systems and electrical/mechanical engineering. The function automatically performs modal analysis on a shaft system, computing **state matrix**, **eigenvalues**, and **eigenvectors** based on user input for **inertia constants** and **spring stiffness** of the rotating masses.

The tool identifies critical **torsional modes** and provides visualizations of these modes, helping users understand potential resonance issues and the dynamic behavior of shaft systems under sub-synchronous conditions. This tool is ideal for studies on turbine-generators, electrical machines, and coupled mechanical systems where SSR is a concern.

## 🔑 Key Features
- **Automatic Modal Analysis**: Computes state matrices, eigenvalues, and eigenvectors with minimal user input.
- **Torsional Mode Identification**: Identifies critical torsional modes of the shaft system, including sub-synchronous modes.
- **Visual Mode Plots**: Generates visual plots of torsional modes for clear and easy analysis.
- **Customizable Inputs**: Flexible inputs for the inertia constants of rotating masses and spring stiffness between masses.
- **Optimized for Engineers**: Tailored for mechanical and electrical engineers dealing with shaft system analysis in power systems or rotating machinery.

## 🚀 Usage
The main function takes two primary inputs:
- **Inertia Constants (H)**: The inertia constants of rotating masses on the shaft (in seconds).
- **Spring Stiffness (stiffness)**: The spring stiffness between the rotating masses (in pu [torque/rad]).

### Example Code:
```matlab
% Define inertia constants of rotating masses (H) and spring stiffness (K)
fb = 60;%(Hz)
H = [0.124 , 0.232, 1.155, 1.192, 0.855]; %(s)
stiffness = [21.8, 48.4, 75.6,  62.3,  1.98]; %(pu [torque]/[elec. rad])

torsional_analysis(fb,H,stiffness)
```

### Outputs:
- **Eigenvalues**: The natural frequencies of the system.
- **Eigenvectors**: Corresponding mode shapes of the rotating masses.
- **Plots**: Visual representation of the identified torsional mode shapes.

## 🛠️ Dependencies
- MATLAB

## 🖼️ Visualizations
The tool provides the following visualizations:
- **Mode Shapes**: Graphical representations of the torsional modes.

Example Plot:

![plot](./html/main_06.svg)



## 📊 Keywords and Tags
- Sub-Synchronous Resonance
- SSR Analysis
- Torsional Mode Analysis
- State Matrix Computation
- Modal Analysis MATLAB
- Power Systems Dynamics
- Turbine-Generator SSR
- Shaft System Modal Analysis
- Eigenvalues and Eigenvectors
- MATLAB Visualization
- Mechanical Shaft Dynamics
- Rotating Mass Inertia

---

Feel free to edit specific details such as the repository name, image paths, or add/remove keywords based on your personal setup.

For tags and SEO, I used keywords that are relevant to SSR, modal analysis, MATLAB, and engineering, ensuring that people searching for such tools or concepts will find your repository more easily.

