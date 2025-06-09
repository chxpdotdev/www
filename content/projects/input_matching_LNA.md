+++
date = '2025-06-03T11:04:59-05:00'
draft = true
title = 'Input Matching Network for LNA with the Smith Chart Utility'
author = 'Gokul Swami'
+++

## Background and Purpose

A low noise amplifer (LNA) amplifies weak radio signals while minimizing the addition of noise. They have a low noise figure, which is the measurement of the amount of noise the amplifier adds to the signal.

To maximize power transfer and minimize noise, we need to match the input and output impedances of the LNA as they usually have different impedances compared to the source or termination impedances of a network. To match, we can design a separate input network and output network. The purpose of this project was to design an input matching network with the Smith Chart Utility on Keysight ADS.

The source impedance of our network will obviously be \(50+j \cdot 0 \text{ } \Omega\).

## Source and Load Impedance of the Input Matching Network

The source impedance of the input matching network is the same as the source impedance of the full network. This is the source termination impedance, which is \(50 \text{ } \Omega\).

The load impedance of the input matching network is the same as the source impedance of the LNA.