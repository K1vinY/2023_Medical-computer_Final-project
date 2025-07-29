# 2023_Medical-computer_Final-project

# 🚗 2023_Medical-computer_Final-project  
**License Plate Detection & Recognition using MATLAB GUI**

This project implements a GUI-based license plate detection and character recognition system in MATLAB. It was completed as the final project for the Medical Computer course in 2023.

---

## 📌 Overview

The goal of this project is to automatically detect the license plate region from a car image, segment the characters, and recognize the plate number using template matching. The system uses traditional image processing techniques such as edge detection, thresholding, morphological operations, and ROI extraction. It includes a graphical user interface (GUI) built with MATLAB GUIDE.

---

## 🛠️ Features

- MATLAB GUI (via `.fig` and `.m` files)
- Vertical edge detection for plate localization
- Thresholding and morphological operations for plate segmentation
- Character segmentation via pixel summation
- Template matching for character recognition
- Real-time output display on GUI

---

## 📂 Project Structure

```text
.
├── Gui_0108.m                # Main GUI code
├── Gui_0108.fig              # GUI layout (loadable in MATLAB)
├── templates/                # Folder containing character templates (.png)
├── test_images/              # Folder with sample car plate images
