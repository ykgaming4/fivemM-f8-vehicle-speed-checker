# fivemM-f8-vehicle-speed-checker
A robust performance monitoring tool designed for FiveM server administrators to track, log, and analyze player and vehicle speeds in real-time. This tool is essential for maintaining server balance and identifying potential physics-based exploits or speed-related anomalies.

📝 Description
The F8 Speed Checker provides a clean and efficient way to monitor velocities across your server. By utilizing client-side detection and server-side logging, it allows staff to see exactly how fast entities are moving. Whether you are debugging vehicle handling files or monitoring for suspicious behavior, this script provides the data you need directly through the F8 console and server logs.

✨ Key Features
Real-time Velocity Tracking: Monitors vehicle and player speeds with high precision.
Threshold Alerts: Automatically flags or logs instances where players exceed a predefined speed limit.
Resource Efficient: Built with performance in mind using optimized loops and thread management to ensure 0.01ms idle usage.
F8 Integration: Outputs formatted data directly to the client console for quick debugging.
Exploit Prevention: Helps identify players using torque multipliers or speed hacks by comparing actual velocity against vehicle limits.

🛠️ Installation
Download the repository files.

Extract the folder f8_speed_checker into your FiveM resources directory.

Rename the folder (optional).

Add ensure f8_speed_checker to your server.cfg.

Restart your server or start the resource via txAdmin.

🚀 Usage
Once installed, the script runs automatically in the background. Authorized users can monitor speed data through the console or specific chat commands (if configured).

Note: This tool is intended for administrative and debugging purposes to help maintain a fair environment on your community server.
