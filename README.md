# Facial Recognition using Singular Value Decomposition (SVD)

![MATLAB](https://img.shields.io/badge/MATLAB-R2020b%2B-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Topic](https://img.shields.io/badge/Topic-Computer%20Vision%20%7C%20Linear%20Algebra-orange.svg)

An efficient implementation of facial recognition leveraging **Singular Value Decomposition (SVD)** in **MATLAB** for dimensionality reduction, feature extraction, and image classification.

---

## 📌 Table of Contents
- [Overview](#-overview)
- [How SVD Works in Face Recognition](#-how-svd-works-in-face-recognition)
- [Features](#-features)
- [Directory Structure](#-directory-structure)
- [Prerequisites & Setup](#-prerequisites--setup)
- [Usage](#-usage)
- [Results & Performance](#-results--performance)
- [License](#-license)

---

## 🧠 Overview

Facial recognition often requires handling high-dimensional image data. Using **Singular Value Decomposition (SVD)**, we decompose the image matrix into singular vectors and singular values to extract the most dominant features (eigenfaces). 

By projecting face images into a lower-dimensional subspace using MATLAB's optimized matrix computations, the algorithm drastically reduces computational complexity while maintaining high recognition accuracy.

---

## 📐 How SVD Works in Face Recognition

Given a matrix $A$ representing flattened training face vectors:
$$A = U \cdot \Sigma \cdot V^T$$

1. **$U$ (Left Singular Vectors):** Represents the eigenfaces / spatial basis vectors.
2. **$\Sigma$ (Singular Values):** Represents the feature importance/weight of each singular vector.
3. **$V^T$ (Right Singular Vectors):** Represents the weight coefficient for each training image.

By retaining only the top $k$ singular values, we project image vectors into a reduced subspace and classify query images using Euclidean distance (or Cosine Similarity) against the dataset.

---

## ✨ Features

- **Built-in SVD Optimization:** Uses MATLAB's native `svd()` and `svds()` functions for fast matrix factorization.
- **Dimensionality Reduction:** Compresses facial datasets without losing key features.
- **Customizable $k$ Energy/Singular Values:** Tune the number of retained singular values for custom accuracy/performance trade-offs.
- **Eigenface Visualization:** Easily plot and view reconstructed basis faces using MATLAB’s `imshow` / `imagesc`.

---

## 📁 Directory Structure

```text
Facial-recognition-svd/
├── dataset/               # Image datasets (Training and Testing sets)
├── functions/
│   ├── preprocess.m       # Image reading, grayscale conversion, and vectorization
│   ├── trainSVD.m         # Computes SVD and feature projection space
│   └── recognizeFace.m    # Matches test image against database
├── main.m                 # Main execution script
└── README.md              # Documentation