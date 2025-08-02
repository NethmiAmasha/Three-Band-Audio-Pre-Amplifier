# Three-Band Audio Pre-Amplifier with Subwoofer Output

This repository contains the design files, simulation data, and documentation for a three-band audio pre-amplifier circuit. This project was completed as part of the EN2111 - Electronic Circuit Design course at the University of Moratuwa.

## Project Overview

This project is a comprehensive analog circuit design for a three-band audio pre-amplifier. It features a split output for subwoofer systems and incorporates filters, feedback, and amplification stages. The pre-amplifier serves as a front-end signal conditioner, enhancing audio quality before the signal is sent to a power amplifier. The system amplifies low-level signals from sources like mobile phones or PCs and provides equalization controls.

### Key Features

*   **Three-Band Equalizer:** Independent control over bass, mid, and treble frequencies.
*   **Subwoofer Output:** A dedicated output for low-frequency signals to drive a subwoofer.
*   **Active Filters:** Utilizes active filters for precise frequency control.
*   **Impedance Matching:** An input buffer stage prevents loading effects and ensures proper impedance matching with the audio source.
*   **Detailed Tone Control:** Potentiometers allow users to boost or cut the bass, mid, and treble bands.

## Circuit Design

The pre-amplifier circuit is divided into several key stages:

*   **Input Buffer:** A unity-gain buffer using a TL072 op-amp is placed at the input.
*   **Filter Bank (Equalizer Section):** The incoming signal is split into three bands using active filters.
    *   **Low-Pass Filter (Bass/Subwoofer):**
        *   **Topology:** Multiple Feedback (MFB)
        *   **Cutoff Frequency:** Approximately 211 Hz
        *   **Gain:** Configured for ~13 dB
    *   **Mid-Band Filter:**
        *   **Topology:** Cascaded High-Pass and Low-Pass Sallen-Key filters.
        *   **HPF Cutoff:** Approximately 420 Hz
        *   **LPF Cutoff:** Approximately 2.3 kHz
        *   **Gain:** Approximately 1.586
    *   **High-Pass Filter (Treble):**
        *   **Topology:** Sallen-Key
        *   **Cutoff Frequency:** Approximately 3.3 kHz - 4 kHz

## Performance and Results

The design was validated through both simulation and real-world measurements. The results from both were closely aligned, confirming the effectiveness of the design and implementation.

*   **Bass (Low-Pass Filter):** The simulated cutoff frequency of ~211 Hz matched the real-world response, with a clear 40 dB/decade roll-off.
*   **Mid (Band-Pass Filter):** The cascaded filters produced a clean mid-band centered between approximately 800 Hz and 1.6 kHz with a gain of +3.6 dB.
*   **Treble (High-Pass Filter):** The treble stage demonstrated consistent behavior between simulation and real measurements, with the gain rising around 3.5-4 kHz and flattening at +2.7 dB beyond 10 kHz.

Minor differences observed are attributed to component tolerances, breadboard layout effects, and op-amp limitations at higher frequencies.
