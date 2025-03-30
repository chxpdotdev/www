+++
date = '2025-03-29T02:46:42-07:00'
draft = false
title = 'CMOS Inverter Design and Layout'
description = "Designing the layout of a matched CMOS inverter with Cadence Virtuoso" 
author = 'Gokul Swami'
+++

Implemented with TSMC's 0.4-micron process.

## Background and Purpose

An inverter in digital logic is essentially a NOT gate. It inverts the input signal. Here is the truth table for it:

| Input | Output |
| --- | --- |
| 0 | 1 |
| 1 | 0 |

CMOS technology is considered to be excellent when implementing any inverting logic, like NOT gates, due to its lower power usage, scalability, and high noise immunity.

This project is about a *matched* CMOS inverter, meaning that the pull-up (PMOS) and pull-down (NMOS) transistors are sized and designed to have similar electrical characteristics to ensure a balanced performance and equal propogation delays for both low-to-high and high-to-low transitions.

## Schematic

The following is the schematic for the matched inverter. Using the fact that we want a *r* value of 1, we can use the circuit parameter *k* from each transistor that was found when simulating a minimally sized inverter to find our sizing requirements. We find that the PMOS needs to have a width 3.4 times the original to compensate, hence 2 micrometers. 

![matched CMOS inverter schematic](/images/virtuoso/matched_inverter_schematic.png?width=600)

## Layout

The following is the layout for the matched inverter. Both DRC and LVS were successful.

![matched CMOS inverter layout](/images/virtuoso/matched_inverter_layout.png?width=600)