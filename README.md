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
- Real-time result display in the GUI

---

## 📂 Project Structure

```text
.
├── Gui_0108.m                # Main GUI code
├── Gui_0108.fig              # GUI layout (loadable in MATLAB)
├── templates/                # Folder containing character templates (.png)
├── test_images/              # Folder with sample car plate images
```

---

## 🚀 How to Run

This project includes a MATLAB GUI built with GUIDE.

To use the license plate recognition system:

1. Open MATLAB.
2. Navigate to the project folder:
   ```matlab
   cd('path/to/project')
   ```
3. Launch the GUI:
   ```matlab
   Gui_0108
   ```
4. In the GUI, click the popup menu and select a test image (e.g., from `test_images/`).
5. The GUI will:
   - Display the original car image
   - Detect and crop the license plate
   - Segment and recognize the characters
   - Display the final license plate result above the image

---

## ⚠️ Limitations

- The character templates are designed for **Texas license plate fonts** only.
- License plates from other countries (e.g., Taiwan) may lead to misrecognition due to font mismatch.
- The system works best on **front-facing, high-resolution** license plate images.
- **Threshold value** for edge detection and segmentation may require **manual adjustment** for different inputs.

---

## 📚 References

- Pre-Processing: 
1.	https://www.itread01.com/content/1547963846.html
2.	https://www.geeksforgeeks.org/matlab-image-edgedetection-using-sobel-operator-from-scratch/
3.	https://codertw.com/%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80/32213/
4.	https://ww2.mathworks.cn/help/images/ref/bwlabel.html
5.	https://ww2.mathworks.cn/help/images/ref/imclose.html
6.	https://codertw.com/%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80/446247/
7.	https://iter01.com/90662.html 
8.	https://zh.wikipedia.org/wiki/%E7%B4%A2%E8%B2%9D%E7%88%BE%E7%AE%97%E5%AD%90
-	Plate license recognition: 
1. https://angoratutor.com/license-plate-recognition-with-matlab 

---

## 👥 Contributors

- 游向前  
- 陳柏睿  
- 李縉丞  

---

## 🗓️ Timeline

- **Originally Completed:** January 2023  
