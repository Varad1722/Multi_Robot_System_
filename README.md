
# 🚒 Multi-Robot Dynamic Fire Response System  
**6 UGVs · Dynamic Fire Hotspots · Potential Fields · LiDAR Mapping · Collision Avoidance**

This project is a **graduate-level Multi-Robot Systems (MRS)** simulation in MATLAB.  
A team of ground robots explores a 2D environment, detects **fire hotspots**, cooperatively **orbits** them to “extinguish” them, and then moves on to **new fires** that spawn dynamically.  
Robots use LiDAR, potential fields, collision avoidance, and coordination policies.

---

# 📂 1. Repository Structure

---

# 🎯 2. Project Goals

1. Multi-robot **UGV fire-response** simulation.
2. **Potential field** navigation toward hotspots.
3. **Dynamic fires**: extinguish + respawn.
4. **Robot pairing** for coordinated tasks.
5. **LiDAR-based** wall avoidance + mapping.
6. **Collision-free** movement between robots.
7. **Orbit controller** around fires.
8. Sequential **spawning** (one robot every 3 seconds).
9. Parallel **LiDAR point-cloud map** figure.

---

# 📘 3. Syllabus Concepts Implemented

### ✔ Mathematical Modeling  
- Single integrator dynamics  
- Multi-affine potential fields  
- Gaussian heat fields  
- Inter-robot repulsion  
- Wall repulsion  

### ✔ Navigation & Planning  
- Gradient descent  
- Orbit controller  
- LiDAR-based open space detection  
- 90° wall bounce maneuver  

### ✔ Coordination  
- Fixed robot pairing  
- Shared fire assignment  
- Distributed decision logic  

### ✔ Dynamic Task Allocation  
- Fire cooling  
- Fire extinguish after 3 orbits  
- Respawn logic  
- Reallocation of robots  

### ✔ Estimation & Mapping  
- Simulated LiDAR sensing  
- Point-cloud map accumulation  

### ✔ Collision Avoidance  
- Safety circle  
- Repulsive potentials  
- LiDAR-based local avoidance  

### ✔ Simulation Framework  
- MultiRobotEnv  
- Occupancy maps  
- Multiple visualization windows  

---

# 🚗 4. Behavior Flow

### EXPLORE  
- Seek open space  
- Seek fires  
- Avoid walls + robots  

### GOTO_FIRE  
- Move toward assigned hotspot  
- Transition once at orbit radius  

### ORBIT  
- Tangential + radial control  
- Accumulate orbit time  
- Cool fire until extinguished  

### EXTINGUISH & RESPAWN  
- Fire disappears after 3 orbits  
- New fire spawned elsewhere  
- Robots return to EXPLORE mode  

---

# 🔥 5. Fire Model

Each fire has:
- Center: `c_j`  
- Gaussian potential field:  
  \[
  \phi_j(x) = heatLevel_j \cdot e^{-\|x-c_j\|^2/2\sigma^2}
  \]
- heatLevel decays as robots orbit  
- Fire extinguished after ~3 orbits  
- New fire respawns at a free random location  

---

# 🧮 6. Robot Control Law

### Velocity components:
- **Heat attraction**  
- **Wall repulsion**  
- **Robot repulsion**  
- **Open space direction**  
- **Forward bias**

Combined velocity:
\[
v_i = w_h v_{heat} + w_w v_{wall} + w_r v_{repulsion}
    + w_o v_{open} + w_f v_{forward}
\]

Heading updated with max turn rate.  
Robot moves with nominal speed `v_nom`.

---

# 🧱 7. Collision Avoidance

### Walls  
- LiDAR senses short distances  
- Strong short-range repulsion  
- Bounce if step enters a wall cell  

### Robots  
- Safety radius enforced  
- Repulsive vector between agents  
- Steps rejected if too close  

---

# 🛰 8. LiDAR Sensing & Mapping

### virtualLidar  
- Generates ranges for beams  
- Uses occupancy map raycasting  

### Mapping  
- Convert LiDAR hits:  
  `hit = p + r*[cos, sin]`  
- Append to point-cloud array  
- Display in right-side map window  

### No LiDAR beams drawn in main window  
(removed for clarity)

---

# 👥 9. Robot Pairing Strategy

Pairs:  
- (1,4)  
- (2,5)  
- (3,6)

Any robot entering a fire’s orbit radius:  
- Assign both robots in the pair  
- They extinguish the fire together  

---

# 🕒 10. Robot Spawning

Robots spawn one-by-one:
- Robot 1 at t = 0  
- Robot 2 at t = 3  
- Robot 3 at t = 6  
- … until all 6 are active  

All spawn from same entry doorway.

---

# 🧪 11. Running the Simulation

### Requirements  
- MATLAB  
- MultiRobotEnv  
- All `.m` files in working directory  

### Run  

### Outputs  
- **Left window**: environment + heat field + robots  
- **Right window**: LiDAR point-cloud visualization  

---

# 📜 12. Code Structure Explanation (Trial6.m)

### Sections:

1. **Parameters**  
   - Robot count, fire count, speeds, weights  
2. **Environment Setup**  
   - Load map, set bounds  
3. **Hotspot Initialization**  
4. **State Initialization**  
5. **Heat Field Background Mesh**  
6. **LiDAR Map Figure Setup**  
7. **Main Loop**  
   - Fire cooling  
   - Robot pairing  
   - Controller computation  
   - Collision avoidance  
   - Orbit logic  
   - Fire respawn  
   - Visualization  
8. **LiDAR Map Update**  

Helper functions are in separate files:
- `virtualLidar.m`  
- `lidarWallRepulsion.m`  
- `safeStepRelative.m`  
- `wrapToPi_local.m`  

---

# 📈 13. Mathematical Models Used

### Potential Fields  
- Heat attraction (Gaussian)  
- Wall repulsion (LiDAR-based)  
- Robot repulsion (inverse-distance)  

### Orbit Controller  
\[
v = t_\theta - k (r - R_{orbit}) r_\theta
\]

### Collision Safety  
\[
d_{ij} > safetyCircle
\]

### Overall Dynamics  
\[
\dot{p}_i = v_{\max} \, u_i
\]

---

# 🏆 14. Why This Project Meets the Rubric

### ✔ Mathematical Model  
Clear definitions + multi-affine potential fields.

### ✔ Theoretical Concepts  
Orbit convergence, safety constraints, collision avoidance.

### ✔ Controller Design  
Hybrid controller: explore → approach → orbit → re-explore.

### ✔ Simulation  
Full MATLAB simulation + LiDAR mapping.

### ✔ Coordination  
Pair assignment + dynamic task allocation.

### ✔ Disaster Response  
Fires, extinguishing behavior, dynamic environment.

---



---

# 🎉 End of README  
This file fully documents the project and is ready for GitHub.


