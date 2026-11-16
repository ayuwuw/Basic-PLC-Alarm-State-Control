## Overview
A simple alarm and system control function block created in **Siemens TIA Portal** using Structured Text (SCL).

This project demonstrates basic PLC programming concepts, including:
- State machine logic
- Start and Stop control
- Fault detection
- Alarm indication
- Rising-edge acknowledgement

## System States

The function block uses three operating states:

| State | Name | Description |
|---|---|---|
| `0` | STOP | System is stopped and the flashing light is off. |
| `10` | RUN | System is running and the flashing light is off. |
| `50` | ALARM | System is stopped and the flashing light blinks at 0.5 Hz. |

## Inputs

| Variable | Description |
|---|---|
| `xEmergencyStop` | Emergency stop signal. |
| `xThermalOverload` | Thermal overload fault signal. |
| `xStartButton` | Starts the system. |
| `xStopButton` | Stops the system. |
| `xAckButton` | Acknowledges an active alarm. |
| `xClockPulse_0_5Hz` | Clock signal used for alarm flashing. |

## Outputs

| Variable | Description |
|---|---|
| `xSystemRunning` | Indicates whether the system is running. |
| `xFlashingLight` | Controls the flashing alarm light. |

## How It Works

1. **STOP:** The system waits for a start command. If a fault is detected, it enters ALARM.
2. **RUN:** The system operates until the stop button is pressed or a fault occurs.
3. **ALARM:** The system stops and the alarm light flashes. Once the fault is cleared and the acknowledgement button is pressed, the system returns to STOP.

## Fault Handling

A fault becomes active if either:
- The emergency stop signal is lost.
- A thermal overload is detected.

The alarm can only be reset when the fault is cleared and a rising edge is detected on the acknowledgement button.

## Learning Goals

This project is intended as a small exercise in:
- PLC state machines
- Boolean logic
- Rising-edge detection (`R_TRIG`)
- Fault handling and alarm acknowledgement
- Basic industrial automation concepts
